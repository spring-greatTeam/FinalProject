<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />    
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"rel="stylesheet"/>
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
      
      <c:if test="${empty loginMember}">
	      <nav>
		      <ul class="nav">
		      	<li><a href="#">로그인</a>
		      		<ul class="submenu">
		      			<li><a href="${pageContext.request.contextPath}/member/login.me">고객님 로그인</a></li> 
		      			<li><a href="${pageContext.request.contextPath}/owner/login.me">사장님 로그인</a></li>
		      		</ul>
		      	</li>
		      	
		      	<li><a href="#">회원가입</a>
		      		<ul class="submenu">
		      			<li><a href="${pageContext.request.contextPath}/member/memberEnroll.me">고객 회원가입</a></li>
		      			<li><a href="${pageContext.request.contextPath}/owner/ownerMemberEnroll.me">사장님 회원가입</a></li>
		      		</ul>
		      	</li>
		      </ul>
	      </nav>
      </c:if>
        <%-- <div id="member" >
          <c:if test="${empty loginMember}">
            <div class="login" id="login">
               <a href="${pageContext.request.contextPath}/member/login.me">로그인</a>
                 <span>|</span>
              <a href="${pageContext.request.contextPath}/owner/login.me">사장님 로그인</a>
              <span>|</span>
             <a href="${pageContext.request.contextPath}/member/memberEnroll.me">회원가입</a>
              <span>|</span>
             <a href="${pageContext.request.contextPath}/owner/ownerMemberEnroll.me">사장님 회원가입</a>
            </div>
          </c:if> --%>
          
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
                <a href="${pageContext.request.contextPath}/cart/cartList.me"><span class="material-symbols-outlined custom-size"> shopping_cart </span></a>
                <br>
                장바구니
              </ul>
            </div>
          </c:if>
        </header>
      </div>
    </div>
</body>
</html>
<script src="${pageContext.request.contextPath}/resources/js/main.js" ></script>
