<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/owner/menuFormSubmit.me">
		<table border="1"; style="border-collapse:collapse;">
			<tr>
				<td>가게번호</td>
				<td><input type="number" name="storeNo" value="${loginOwner.storeNo}"></td>
			</tr>
			<tr>
				<td>카테고리 번호</td>
				<td><input type="number" name="categoryNo"><br>
					<div class="categoryNo">1: 대표메뉴, 2: 기본메뉴</div></td>
			</tr>
			<tr>
				<td>메뉴명</td>
				<td><input name="menuName"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" name="price"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>