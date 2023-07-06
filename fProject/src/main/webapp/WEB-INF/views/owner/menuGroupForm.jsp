<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/owner/menuGroupSubmit.me">
		<table>
			<tr>
				<td>가게 번호</td>
				<td><input type="number" name="storeNo" value=""></td>
			</tr>
			<tr>
				<td>카테고리 이름</td>
				<td><input name="groupName"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>