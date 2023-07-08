<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memInfo.css" />

<jsp:include page="/WEB-INF/views/common/main.jsp" />

<div id="ediv">
  <jsp:include page="/WEB-INF/views/common/mypage.jsp" />
  <div id="frmdiv">
		<h2 id="infoTitle" >${loginMember.nickname }님의 회원정보</h2>
		<form action="${pageContext.request.contextPath}/member/memberUpdate.me" method="post" name="infoFrm" id="infoFrm">
			<table class="table" border="1">
				<tr>
					<th scope="col">아이디</th>
						<td><input name="memberId" id="memberId" value="${loginMember.memberId}" readonly></td>
				</tr>
				<tr>
					<th scope="col">비밀번호</th>
					<td scope="col">
						<input type="password" name="memberPwd" id="memberPwd" value="${loginMember.memberPwd }">
						<button type="button" id="editBtn" onclick="location.href='${pageContext.request.contextPath}/member/updatePwd.me'">비밀번호 수정</button>
						<span id="pwdLimit"></span>
					</td>
				</tr>
				<tr>
					<th scope="col">이름</th>
						<td><input name="memberName" value="${loginMember.memberName}" readonly></td>
				</tr>
				<tr>
					<th scope="col">생년월일</th>
						<td><input type="date" name="memberBirthday" value="${loginMember.memberBirthday}" readonly></td>
				</tr>
				<tr>
					<th scope="col">전화번호</th>
						<td><input name="phone" id="phoneCheck" value="${loginMember.phone}" >
							<span id="phoneLimit"></span>
						</td>
						<!-- value 값 지정해줘도 서버에 수정한 값이 들어감 -->
				</tr>
				<tr>
					<th scope="col">주소</th>
						<td><input name="address" id="addr" value="${loginMember.address}">
							<input name="detailAddress" placeholder="상세주소" id="detailAddr">
							<input type="button" name="serchAddr" id="serchAddr" value="주소 찾기" onclick="findAddr();"> 
							<span id="edit3"></span></td>
				</tr>
				<tr>
					<th scope="col">닉네임</th>
						<td><input name="nickname" value="${loginMember.nickname}" readonly></td>
				</tr>
				<tr>
					<th scope="col">회원등급</th>
						<td><input name="grade" value="${loginMember.grade}" readonly></td>
				</tr>
			</table>
			<button class="btn btn-outline-success" type="submit" id="updateBtn" onclick="updateCheck();" >수정 완료</button>
		</form>
	</div>
</div>

<script type="text/javascript">

/*수정하고 싶은 정보는 input 보이기*/
$(document).ready(function() {
	$("#edit1").hide();
	$("#edit2").hide();
	$("#edit3").hide();
});

/* 전화번호 정규식*/
$("#phoneCheck").blur(function() {
    let regex = /^\d{2,3}-\d{3,4}-\d{4}$/;
    if (!regex.test($(this).val())) {
        $("#phoneLimit").css("color", "red");
        $("#phoneLimit").text("'-'문자를 포함하여 입력하세요.");
        $(this).focus();
    } else {
        $("#phoneLimit").hide();
    }
});

/* 주소 직접 입력 불가하도록 박스 클릭시 alert */
$(document).ready(function() {
	$("#addr").click(function () {
		alert("주소찾기를 통해 주소를 입력하세요.");
		$(this).prop("readonly", true);
		//prop: html요소의 속성 값을 가져오거나 설정함

	});

	$("#serchAddr").click(function() {
		$("#addr").prop("readonlly", false);
	})
});

/* 주소 API */
function findAddr() {
    new daum.Postcode({
        oncomplete: function(data) { 
			let roadAddr = data.roadAddress; //도로명 주소 변수
			let homeAddr = data.jibunAddress; //지번 주소 변수 
			let extraAddr = ''; //도로명과 지번 모두 합친 변수

			if(data.userSelectedType == 'R') { //사용자가 선택한 주소의 타입 R==도로명주소
				if(roadAddr != '') {
					if(data.bname != '') { //동,리주소가 있으면
						extraAddr += data.bname;
					}
					if(data.buildingName != '') { //건물명이 있으면
						extraAddr += extraAddr != '' ? ', ' + data.buildingName : data.buildingName
					}
					roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
					document.getElementById("addr").value = roadAddr;
				} 
			} else if(data.userSelectedType == 'J') {
				document.getElementById("addr").value = jibunAddr;
			}
			document.getElementById("detailAddr").focus();
		}
	
	}).open();
}

/*수정 완료 버튼 click시 alert창*/
function updateCheck() {
	alert("입력한 정보들을 수정하시겠습니까?");
}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
