<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />    
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />

<!-- DB관련 redirect이후에 플래시 속성: alert창 띄우기 -->
<c:if test="${not empty msg }">
	<script type="text/javascript">
		alert('${msg}');
	</script>
</c:if>
   
  </head>
  <body>
    <header >
      <div class="hdiv" >
        <div>
          <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/img/logo2-removebg.png"/></a>
        </div>
        <div class="address">
          <input type="text" placeholder="주소를 검색해주세요" />
          <button>검색</button>
        </div>
      </div>
      
        <div id="member" >
          <c:if test="${empty loginMember}">
            <div class="login" id="login">
               <a href="${pageContext.request.contextPath}/member/login.me"
		      		data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
              <span>|</span>
             <a href="${pageContext.request.contextPath}/member/memberEnroll.me">회원가입</a>
            </div>
          </c:if>
          
          <c:if test="${not empty loginMember}">
            <div class="login">
              <ul id="user">
              <a href="${pageContext.request.contextPath}/member/memberMyPage.me">
                <span class="material-symbols-outlined custom-size" >
                person
                </span><br>
                ${loginMember.memberName}님
                <li>마이페이지</li></a>
                <li>
                  <a href="${pageContext.request.contextPath}/member/memberLogout.me">로그아웃</a>
                </li>
              </ul>

		<!-- 로그인 모달창 -->
		<div class="modal" tabindex="-1" id="loginModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">로그인</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      
		      <form action="${pageContext.request.contextPath }/member/login.me" method="post">
			      <div class="modal-body">
					<div class="mb-3 row">
						<label for="name" class="col-sm-2 col-form-label">아이디</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="memberId" required>
						</div>
					</div>
						<div class="mb-3 row">
							<label for="career" class="col-sm-2 col-form-label">비밀번호</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="memeberPwd" required>
							</div>
						</div>
			      </div>
			      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">로그인</button>
		      </div>
		      </form>
		    </div>
		  </div>
		</div>

              <ul id="user" >
                <span class="material-symbols-outlined custom-size"> shopping_cart </span>
                <br>
                장바구니
              </ul>
            </div>
          </c:if>
        </header>
      </div>
    </div>
   
