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
</body>
</html>