<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewForm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewStar.css">
<jsp:include page="/WEB-INF/views/common/main.jsp" />

<div id="ediv">
	<jsp:include page="/WEB-INF/views/common/mypage.jsp" />
		<div id="fdiv">
			<div id="gdiv">리뷰작성</div>
      			<div id="hdiv">
      				    <form class="mb-3" name="myform" id="myform" method="post">
      				    <span class="text-bold">아이디:</span>
      				    <input type="text" name="userId" required>
						      <fieldset>
						        <span class="text-bold">별점을 선택해주세요</span>
						        <input type="radio" name="rating" value="5" id="rate1" /><label for="rate1">★</label>
						        <input type="radio" name="rating" value="4" id="rate2" /><label for="rate2">★</label>
						        <input type="radio" name="rating" value="3" id="rate3" /><label for="rate3">★</label>
						        <input type="radio" name="rating" value="2" id="rate4" /><label for="rate4">★</label>
						        <input type="radio" name="rating" value="1" id="rate5" /><label for="rate5">★</label>
						      </fieldset>
						      <div>
						        <textarea class="col-auto form-control" id="content" placeholder="리뷰이벤트 따위 없습니다 !!"></textarea>
						      </div>
						      <br>
						      <button type="submit">리뷰 작성</button>
						    </form>
      			</div>
		</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />