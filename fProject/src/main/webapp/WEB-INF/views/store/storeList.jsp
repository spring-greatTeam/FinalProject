<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.title{text-align:center; padding: 10px 0 0 0; font-size:50px;}
	.storeList {
		padding: 80px 0 0 0;
		width:700px;
	}
	.storeList td {
		text-align:center;
		height:100px;	
	}
	.storeList a {
		font-size: 30px;	
		border:1px solid black;
		border-radius:30px;
		padding: 10px 30px;
		display: inline-block; /* a 태그를 inline-block 요소로 설정 */
		transition: transform 0.3s ease;
	}
	.storeList a:hover{
		transform: scale(1.3);
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<h2>카테고리 넘어온 값 : ${category}</h2>
	<div style="border: 1px solid; height: 600px; margin-top: 40px">
	<div class="title">여기요</div>
	
	<div style="height:500px; width:800px;">
	  <table class="storeList"> <!-- 테이블 태그 추가 -->
	    <c:forEach items="${storeList}" var="store" varStatus="status">
	      <c:if test="${category == store.category}">
	        <c:if test="${status.index % 2 == 0}">	<!-- 인덱스가 짝수인지 확인해서 짝수이면 <tr>연다. -->
	          <tr>
	        </c:if>
	        <td><a href="${pageContext.request.contextPath}/store/storeDetail.me?storeNo=${store.storeNo}">${store.storeName}</a></td>
	        <c:if test="${status.index % 2 != 0}">	<!-- 인덱스가 홀수인지 확인해서 홀수이면 <tr>닫는다. -->
	          </tr>
	        </c:if>
	      </c:if>
	    </c:forEach>
	  </table> 
	</div>
	</div>
</body>
</html>