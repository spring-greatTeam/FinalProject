<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memInfo.css" />

<jsp:include page="/WEB-INF/views/common/main.jsp" />

<div id="ediv">
  <jsp:include page="/WEB-INF/views/common/mypage.jsp" />
  <div id="pwdfrmdiv">
		<form action="${pageContext.request.contextPath}/member/updatePwd.me" method="post" name="pwdFrm" id="pwdFrm">
			<table class="tbl" border="1">
				<input type="hidden" name="memberId" value="${loginMember.memberId }">
				<tr>
					<th scope="col">새 비밀번호</th>
					<td scope="col">
						<input type="password" name="memberPwd" id="memberPwd" placeholder="영문+숫자+특수문자 8~16글자"><br/>
						<span id="pwdLimit"></span>
					</td>
				</tr>
				<tr>
					<th scope="col">새 비밀번호 확인</th>
					<td scope="col">
						<input type="password" name="pwdCheck" id="pwdCheck"><br/>
						<span id="pwdRe"></span>
					</td>
				</tr>
			</table>
			<button class="btn btn-outline-success" type="submit" id="updateBtn" onclick="updateCheck();" >수정 완료</button>
		</form>
	</div>
</div>

<script type="text/javascript">

/*비밀번호 정규표현식*/
$("#memberPwd").blur(function() {
    let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
    if (!pwdCheck.test($("#memberPwd").val())) {
        $("#pwdLimit").css("color", "red");
		$("#pwdLimit").text("비밀번호는 영문+숫자+특수문자 포함 8~16자리 입니다.");
     } else {
        $("#pwdLimit").css("color", "green");
        $("#pwdLimit").text("안전한 비밀번호 입니다!");
     }
});

/* 비밀번호 재확인 */
$("#pwdCheck").blur(function() {
	if($("#pwdCheck").val() == "" && $("#memberPwd").val() != "" ) {
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

/*수정 완료 버튼 click시 alert창*/
function updateCheck() {
	alert("비밀번호를 수정하시겠습니까?");
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />