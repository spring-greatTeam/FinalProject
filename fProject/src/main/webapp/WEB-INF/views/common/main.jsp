<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />

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
               <a href="${pageContext.request.contextPath}/member/login.me">로그인</a>
              <span>|</span>
             <a href="${pageContext.request.contextPath}/member/memberEnroll.me">회원가입</a>
            </div>
          </c:if>
          
          <c:if test="${not empty loginMember}">
            <div class="login">
              <ul id="user">
                <span class="material-symbols-outlined custom-size" >
                person
                </span><br>
                ${loginMember.memberName}님
                <li><a href="${pageContext.request.contextPath}/member/memberMyPage.me">마이페이지</a></li>
                <li>
                  <a href="${pageContext.request.contextPath}/member/memberLogout.me">로그아웃</a>
                </li>
              </ul>

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
