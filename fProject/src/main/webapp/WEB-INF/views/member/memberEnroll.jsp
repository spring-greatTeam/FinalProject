<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="../../../resources/js/enroll.js"></script>

<style>
/* 회원가입 폼 스타일 */
#container {
  margin: 20px;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

/* 회원가입 제목 스타일 */
#enrollTitle {
  font-size: 50px;
  margin-bottom: 80px;
  text-align: center;
}

/* 테이블 스타일 */
.table {
  width: 50%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

/* 테이블 셀 스타일 */
th, td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #ccc;
}

/* 입력 필드 스타일 */
input {
  width: 100%;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 3px;
  margin-bottom: 5px;
}

/* 가이드 메시지 스타일 */
.guide {
  display: none;
  font-size: 12px;
  color: green;
  margin-left: 10px;
}

/* 사용 가능한 아이디 메시지 스타일 */
.ok {
  color: green;
}

/* 사용 불가능한 아이디 메시지 스타일 */
.error {
  color: red;
}

/* 회원가입 완료 버튼 스타일 */
#enrollBtn {
  display: block;
  padding: 10px 70px;
  margin-top: 60px;
  margin-bottom: 40px;
  font-size: 30px;
  background-color: #FEFBB8;
  border: 1px solid #ccc;
  border-radius: 5px;
  cursor: pointer;
}

/* 회원가입 완료 버튼 호버 스타일 */
#enrollBtn:hover {
  background-color: #E36509;
}  
</style>

<jsp:include page="/WEB-INF/views/common/main.jsp" />
	<div id="container">
		<h2 id="enrollTitle" >회원가입</h2>
		<form action="${pageContext.request.contextPath}/member/memberEnroll.me" method="post" name="enrollfrm">
			<table class="table">
				<tr>
					<th scope="col">아이디</th>
					<td scope="col">
						<input name="memberId" placeholder="영문,숫자 4글자 이상" id="memeberId" required>
						<span class="guide ok">멋진 아이디네요!</span>
						<span class="guide error">이미 사용중이거나 탈퇴한 아이디입니다.</span>
					</td>
				</tr>
				<tr>
					<th scope="col">비밀번호</th>
					<td scope="col">
						<input type="password" name="memberPwd" placeholder="영문,숫자,특수문자 10글자 이상" required>
					</td>
				</tr>
				<tr>
					<th scope="col">비밀번호 확인</th>
					<td scope="col">
						<input type="password" name="pwdCheck" required>
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
						<input type="date" name="memberBirthday" placeholder="생년월일 8자리(YYYYMMDD)" required>
					</td>
				</tr>
					<tr>
					<th scope="col">전화번호</th>
					<td scope="col">
						<input name="phone" placeholder="'-'문자 포함" required>
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
	/* 아이디 중복 체크 */
document.querySelector("#memberId").addEventListener("keyup",(e) => { 
    const ok = document.querySelector(".ok");
    const error = document.querySelector(".error");
    const memberId = e.target;
    
    if(memberId.value.length < 4) {
        ok.style.display = "none";
        error.style.display = "inline";
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
            } else {
                ok.style.display = "none";
                error.style.display = "inline";
            }
        },
        error : console.log
    });
}); 
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />