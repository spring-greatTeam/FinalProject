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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    
    <style>
 
</style>

  <body>
    <div id="topdiv">
      <div id="logo">
        <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/img/logo2-removebg.png" alt="이미지없음"></a>
      </div>
      <form action="${pageContext.request.contextPath}/member/memberlogin.me" method="GET">
      <div>
      <div>
	      <div>
	        <div id="iddiv">
	        <input class="login" id="id" name="id"placeholder="아이디">
	        <button type="button" id="resetbtn" style="background-color: white;">✖️</button>
	      </div>
	      </div>
	      <div>
	        <input class="login" type="password" id="pwd" placeholder="비밀번호">
	      </div>
	    </div>
	      <div>
	        <button type="submit" id="loginbtn">로그인</button>
	      </div>
   
      <div id="bottom">
        <a href="${pageContext.request.contextPath}/member/memberFind.me">아이디/비밀번호찾기</a>
        <a>|</a>
        <a href="${pageContext.request.contextPath}/member/memberEnroll.me">회원가입</a>
      </div>
      </div>
       </form>
    </div>
    
  </body>
</html>
<script src="${pageContext.request.contextPath}/resources/js/login.js" ></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

