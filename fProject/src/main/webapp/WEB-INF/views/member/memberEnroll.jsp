<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/resources/css/memEnroll.css"
/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<jsp:include page="/WEB-INF/views/common/main.jsp" />
<div id="container">
  <h2 id="enrollTitle">회원가입</h2>
  <form
    action="${pageContext.request.contextPath}/member/memberEnroll.me"
    method="post"
    name="enrollfrm"
  >
    <table class="table">
      <tr>
        <th scope="col">아이디</th>
        <td scope="col">
          <input
            name="memberId"
            placeholder="영문,숫자 4글자 이상"
            id="memberId"
            required
          />
          <span class="guide ok">멋진 아이디네요!</span>
          <span class="guide error"
            >이미 사용중이거나 탈퇴한 아이디입니다.</span
          >
          <span class="guide limit">형식이 맞지 않습니다.</span>
        </td>
      </tr>
      <tr>
        <th scope="col">비밀번호</th>
        <td scope="col">
          <input
            type="password"
            name="memberPwd"
            id="memberPwd"
            placeholder="영문+숫자+특수문자 8~16글자"
            required
          />
          <span id="pwdLimit"></span>
        </td>
      </tr>
      <tr>
        <th scope="col">비밀번호 확인</th>
        <td scope="col">
          <input type="password" name="pwdCheck" id="pwdCheck" required />
          <span id="pwdRe"></span>
        </td>
      </tr>
      <tr>
        <th scope="col">이름</th>
        <td scope="col">
          <input name="memberName" required />
        </td>
      </tr>
      <tr>
        <th scope="col">생년월일</th>
        <td scope="col">
          <input type="date" name="memberBirthday" required />
        </td>
      </tr>
      <tr>
        <th scope="col">전화번호</th>
        <td scope="col">
          <input
            name="phone"
            id="phoneCkeck"
            placeholder="'-'문자 포함"
            required
          />
          <span id="phoneLimit"></span>
        </td>
      </tr>
      <tr>
        <th scope="col">주소</th>
        <td scope="col">
          <input name="address" id="addr" placeholder="주소" required />
          <input name="detailAddress" placeholder="상세주소" id="detailAddr" />
          <input
            type="button"
            name="serchAddr"
            id="serchAddr"
            value="주소 찾기"
            onclick="findAddr();"
          />
        </td>
      </tr>
      <tr>
        <th scope="col">닉네임</th>
        <td scope="col">
          <input name="nickname" required />
        </td>
      </tr>
      <tr>
        <th scope="col">회원등급</th>
        <td scope="col">
          <input name="grade" value="일반회원" readonly />
        </td>
      </tr>
    </table>
    <button
      class="btn btn-outline-success"
      type="submit"
      id="enrollBtn"
      onclick="inputCheck();"
    >
      회원가입 완료
    </button>
  </form>
</div>
<br />
<br />

<script type="text/javascript">
  /* 아이디 중복 체크, 표현식 제한 */
  //ID입력받고 정규표현식, 조건에 안맞으면 오류
  //조건에 맞으면 DB검색
  
  document.querySelector("#memberId").addEventListener("keyup", (e) => {
    const ok = document.querySelector(".ok"); //통과
    const error = document.querySelector(".error"); //사용중
    const limit = document.querySelector(".limit"); //형식X
    const memberId = e.target;

  //만약 ID가 조건에 안맞으면 형식X
   if (memberId.value.length < 4 || !/^[a-zA-Z0-9]+$/.test(memberId.value)) {
      ok.style.display = "none";
      error.style.display = "none";
      limit.style.display = "inline";
      return;
    } 
  $("#memberId").focusout(function () {
    $.ajax({
      url: "${pageContext.request.contextPath}/member/checkId.do",
      data: { memberId: memberId.value },
      type: "POST",
      dataType: "json",
      success(result) {
        console.log(result);
        const { userId, available } = result;

        if (available) {
          ok.style.display = "inline";
          error.style.display = "none";
        } else {
          ok.style.display = "none";
          error.style.display = "inline";
        }
      },
      error: function () {
        console.log("실패");
      },
    });
  });

  /* 비밀번호 정규식 */
  $("#memberPwd").blur(function () {
    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

    if ($("#memberPwd").val() == "") {
      $("#pwdLimit").css("color", "red");
      $("#pwdLimit").text("비밀번호를 입력하세요.");
      $("#memberPwd").focus();
    } else if (!pwdCheck.test($("#memberPwd").val())) {
      $("#pwdLimit").css("color", "red");
      $("#pwdLimit").text(
        "비밀번호는 영문+숫자+특수문자 포함 8~16자리 입니다."
      );
      $("#memberPwd").focus();
    } else {
      $("#pwdLimit").css("color", "green");
      $("#pwdLimit").text("안전한 비밀번호 입니다!");
    }
  });
  /* 비밀번호 재확인 */
  $("#pwdCheck").blur(function () {
    if ($("#pwdCheck").val() == "") {
      $("#pwdRe").css("color", "red");
      $("#pwdRe").text("비밀번호 재확인이 필요합니다.");
    } else if ($("#pwdCheck").val() == $("#memberPwd").val()) {
      $("#pwdRe").css("color", "green");
      $("#pwdRe").text("비밀번호가 일치합니다!");
    } else {
      $("#pwdRe").css("color", "red");
      $("#pwdRe").text("비밀번호가 일치하지 않습니다.");
      $("#pwdCheck").focus();
    }
  });
  /* 전화번호에 '-'가 포함되지 않은 경우'*/
  $("#phoneCkeck").blur(function () {
    let regex = /^\d{2,3}-\d{3,4}-\d{4}$/;
    if (!regex.test($("#phoneCkeck").val())) {
      $("#phoneLimit").css("color", "red");
      $("#phoneLimit").text("'-'문자를 포함하여 입력하세요.");
      $("#phoneCkeck").focus();
    } else {
      $("#phoneLimit").hide();
    }
  });
  /* 주소 API */
  function findAddr() {
    new daum.Postcode({
      oncomplete: function (data) {
        let roadAddr = data.roadAddress; //도로명 주소 변수
        let homeAddr = data.jibunAddress; //지번 주소 변수
        let extraAddr = ""; //도로명과 지번 모두 합친 변수
        if (data.userSelectedType == "R") {
          //사용자가 선택한 주소의 타입 R==도로명주소
          if (roadAddr != "") {
            if (data.bname != "") {
              //동,리주소가 있으면
              extraAddr += data.bname;
            }
            if (data.buildingName != "") {
              //건물명이 있으면
              extraAddr +=
                extraAddr != "" ? ", " + data.buildingName : data.buildingName;
            }
            roadAddr += extraAddr != "" ? "(" + extraAddr + ")" : "";
            document.getElementById("addr").value = roadAddr;
          }
        } else if (data.userSelectedType == "J") {
          document.getElementById("addr").value = jibunAddr;
        }
        document.getElementById("detailAddr").focus();
      },
    }).open();
  }
  /* form에 입력한 값이 없으면 회원가입 되지 않게 하기 */
  function inputCheck() {
    if (enrollfrm.memberId.value == "") {
      alert("아이디를 입력해주세요");
      enrollfrm.memberId.focus();
      return;
    }
    if (enrollfrm.memberPwd.value == "") {
      alert("비밀번호를 입력해주세요");
      enrollfrm.memberPwd.focus();
      return;
    }
    if (enrollfrm.pwdCheck.value == "") {
      alert("비밀번호를 확인해주세요");
      enrollfrm.pwdCheck.focus();
      return;
    }
    if (enrollfrm.memberPwd.value != enrollfrm.pwdCheck.value) {
      alert("비밀번호가 일치하지 않습니다");
      enrollfrm.memberPwd.value = "";
      enrollfrm.memberPwd.focus();
      return;
    }
    if (enrollfrm.memberName.value == "") {
      alert("이름을 입력해주세요");
      enrollfrm.memberName.focus();
      return;
    }
    if (enrollfrm.address.value == "") {
      alert("주소를 입력해주세요");
      enrollfrm.address.focus();
      return;
    }
    if (enrollfrm.detailAddress.value == "") {
      alert("상세주소를 입력해주세요");
      enrollfrm.detailAddress.focus();
      return;
    }
    if (enrollfrm.nickname.value == "") {
      alert("닉네임을 입력해주세요");
      enrollfrm.nickname.focus();
      return;
    }
    enrollfrm.submit();
  }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
