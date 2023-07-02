<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/main.jsp" />

<div id="ediv">
	<jsp:include page="/WEB-INF/views/common/mypage.jsp" />
		<div id="fdiv">
			<div id="gdiv">리뷰내역</div>
			<div id="hdiv">
      		<div class="order-container">
      		<c:forEach items="${reviewList}" var="list">
      			<div>${list.reviewNo}</div>
      			<div>${list.orderNo}</div>
      			<div>${list.rating}</div>
      			<div>${list.content}</div>
      		</c:forEach>
			</div>
			</div>
		</div>
</div>








<jsp:include page="/WEB-INF/views/common/footer.jsp" />