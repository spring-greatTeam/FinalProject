<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memEnroll.css"/>

<jsp:include page="/WEB-INF/views/common/main.jsp" />
	<div id="container">
		<h2 id="enrollTitle" >회원가입</h2>
		<form action="${pageContext.request.contextPath}/member/memberEnroll.me" method="post" name="enrollfrm">
			<table class="table">
				<tr>
					<th scope="col">아이디</th>
					<td scope="col">
						<input name="memberId" placeholder="영문,숫자 4글자 이상" id="memberId" required>
						<span class="guide ok">멋진 아이디네요!</span>
						<span class="guide error">이미 사용중이거나 탈퇴한 아이디입니다.</span>
						<span class="guide limit">형식이 맞지 않습니다.</span>
					</td>
				</tr>
				<tr>
					<th scope="col">비밀번호</th>
					<td scope="col">
						<input type="password" name="memberPwd" id="memberPwd" placeholder="영문+숫자+특수문자 8~16글자" required>
						<span id="pwdLimit"></span>
					</td>
				</tr>
				<tr>
					<th scope="col">비밀번호 확인</th>
					<td scope="col">
						<input type="password" name="pwdCheck" id="pwdCheck" required>
						<span id="pwdRe"></span>
					</td>
				</tr>
					<tr>
					<th scope="col">이름</th>
					<td scope="col">
						<input name="memberName" required>
					</td>
				</tr>
					<tr>
					<th scope="col">생년월일</th>
					<td scope="col">
						<input type="date" name="memberBirthday" required>
					</td>
				</tr>
					<tr>
					<th scope="col">전화번호</th>
					<td scope="col">
						<input name="phone" id="phoneCkeck" placeholder="'-'문자 포함" required>
						<span id="phoneLimit"></span>
					</td>
				</tr>
					<tr>
					<th scope="col">주소</th>
					<td scope="col">
						<input name="address" required>
					</td>
				</tr>
					<tr>
					<th scope="col">닉네임</th>
					<td scope="col">
						<input name="nickname" required>
					</td>
				</tr>
					<tr>
					<th scope="col">회원등급</th>
					<td scope="col">
						<input name="grade" value="일반회원" readonly>
					</td>
				</tr>
			</table>
			<button class="btn btn-outline-success" type="submit" id="enrollBtn" >회원가입 완료</button>
		</form>
	</div>
	<br/>
	<br/>
	
<script type="text/javascript">
	/* 아이디 중복 체크, 표현식 제한 */
document.querySelector("#memberId").addEventListener("keyup",(e) => { 
    $("#memberId").focus();
    const ok = document.querySelector(".ok");
    const error = document.querySelector(".error");
    const limit = document.querySelector(".limit");
    const memberId = e.target;
    
    
    if(memberId.value.length < 4 || !/^[a-zA-Z0-9]+$/.test(memberId.value) ) {
        ok.style.display = "none";
        error.style.display = "none";
        limit.style.display = "inline";
        $("#memberId").focus();
        return;
    }
    
    $.ajax({
        url : "${pageContext.request.contextPath}/member/checkId.do",
        data : {memberId : memberId.value},
        dataType : "json",
        success(result) {
            console.log(result);
            const {memberId, available} = result; 
            
            if(available) {
                ok.style.display = "inline";
                error.style.display = "none";
                limit.style.display = "none";
            } else {
                ok.style.display = "none";
                error.style.display = "inline";
                limit.style.display = "none";
                $("#memberId").focus();
            }
        },
        error : console.log
    });
});

/* 비밀번호 정규식 */
$("#memberPwd").blur(function() {
    let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
    
    if ($("#memberPwd").val() == "") {
        $("#pwdLimit").css("color", "red");
        $("#pwdLimit").text("비밀번호를 입력하세요.");
        $("#memberPwd").focus();
     } else if (!pwdCheck.test($("#memberPwd").val())) {
        $("#pwdLimit").css("color", "red");
		$("#pwdLimit").text("비밀번호는 영문+숫자+특수문자 포함 8~16자리 입니다.");
		$("#memberPwd").focus();
     } else {
        $("#pwdLimit").css("color", "green");
        $("#pwdLimit").text("안전한 비밀번호 입니다!");
     }
});

/* 비밀번호 재확인 */
$("#pwdCheck").blur(function() {
	if($("#pwdCheck").val() == "") {
		$("#pwdRe").css("color", "red");
		$("#pwdRe").text("비밀번호 재확인이 필요합니다.");
	} else if ($("#pwdCheck").val() == $("#memberPwd").val()) {
		$("#pwdRe").css("color", "green");
		$("#pwdRe").text("비밀번호가 일치합니다!")
	} else {
		$("#pwdRe").css("color", "red");
		$("#pwdRe").text("비밀번호가 일치하지 않습니다.")
		$("#pwdCheck").focus();
	}	
});

/* 전화번호에 '-'가 포함되지 않은 경우'*/
$("#phoneCkeck").blur(function() {
	let regex = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if(!regex.test($("#phoneCkeck").val())) {
		$("#phoneLimit").css("color", "red");
		$("#phoneLimit").text("'-'문자를 포함하여 입력하세요.");
		$("#phoneCkeck").focus();
	} else {
		$("#phoneLimit").hide();
	}
});
	
/* form에 입력한 값이 없으면 회원가입 되지 않게 하기 */
	
	

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />