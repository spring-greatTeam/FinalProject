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
td{padding:10px;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div style="border: 1px solid; height: 800px; margin-top: 40px">
<div class="title">여기요</div>

	<c:if test="${not empty loginOwner}">
		<form action="${pageContext.request.contextPath}/owner/menuGroupSubmit.me">
			<table border="1"; style="border-collapse:collapse;">
				<tr>
					<td>가게 번호</td>
					<td><input type="number" name="storeNo" value="${loginOwner.storeNo}" required></td>
				</tr>
				<tr>
					<td>카테고리 이름</td>
					<td><input name="groupName" required></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;"><input type="submit" value="다음 페이지"></td>
					</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${empty loginOwner}">
			로그인해주세요.
	</c:if>
</body>
</html>