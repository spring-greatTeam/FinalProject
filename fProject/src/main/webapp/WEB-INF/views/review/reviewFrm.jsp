<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewForm.css">
<jsp:include page="/WEB-INF/views/common/main.jsp" />

<div id="ediv">
	<jsp:include page="/WEB-INF/views/common/mypage.jsp" />
		<div id="fdiv">
			<div id="gdiv">리뷰작성</div>
      			<div id="hdiv">
      				
      				<form class="review-form" action="review.me" method="post">
					  <label for="name">아이디:</label>
					  <input type="text" id="userId" name="name" required>

					  <label for="rating">평점:</label>
					  <select id="rating" name="rating" required>
					    <option value="">선택하세요</option>
					    <option value="5">5점</option>
					    <option value="4">4점</option>
					    <option value="3">3점</option>
					    <option value="2">2점</option>
					    <option value="1">1점</option>
					  </select>
					
					  <label for="review">리뷰:</label>
					  <textarea id="review" name="content" rows="4" required></textarea>
						<br>
						<input type="hidden" name="orderNo" value="1">
					  <button type="submit">리뷰 작성</button>
					</form>
      				
      				
      			</div>
		</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />