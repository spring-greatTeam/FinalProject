<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="menuFormSubmit.me">
		<table>
			<tr>
				<td>가게번호</td>
				<td><input type="number" name="storeNo" value="${loginMember.storeNo}"></td>
			</tr>
			<tr>
				<td>카테고리 번호</td>
				<td><input type="number" name="categoryNo" value="${group.groupNo}"></td>
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
				<td><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>