<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
    <c:forEach items="${groupList}" var="group">
        <tr>
            <td colspan="2">${group.groupName}</td>
        </tr>
        <c:forEach items="${menuList}" var="menu">
            <tr>
                <c:if test="${group.groupNo eq menu.categoryNo}">
                    <td>${menu.menuName}</td>
                    <td>${menu.price}</td>
                </c:if>
            </tr>
        </c:forEach>
    </c:forEach>
</table>
</body>
</html>