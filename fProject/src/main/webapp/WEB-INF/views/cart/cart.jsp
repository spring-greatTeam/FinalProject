<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
장바구니 페이지

<c:forEach items="${cartList}" var="cart2">
<ul>
	<li>${cart2.memberId}</li>
	<li>${cart2.storeName}</li>
	<li>${cart2.storeNo}</li>
	<li>${cart2.menuName}</li>
	<li>${cart2.totalPrice}</li>
	<li>${cart2.quantity}</li>
	<li>${cart2.opTitle}</li>
	<li>${cart2.opName}</li>
</ul>
</c:forEach>