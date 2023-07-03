<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/main.jsp" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewHistory.css">
<div id="ediv">
	<jsp:include page="/WEB-INF/views/common/mypage.jsp" />
		<div id="fdiv">
			<div id="gdiv">리뷰내역</div>
			<div id="hdiv">
      		<div class="order-container">
      		<c:forEach items="${reviewList}" var="list">
      		<div>작성일 : ${list.write}</div>
      			<div>리뷰번호 : ${list.reviewNo}</div>
      			<div>주문번호 : ${list.orderNo}</div>
      			<div>별점 : ${list.rating}</div>
      			<div>리뷰내용 : ${list.content}</div>
      		</c:forEach>
			</div>
			</div>
		</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />