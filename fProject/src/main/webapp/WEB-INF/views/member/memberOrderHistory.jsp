<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/main.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberOrderHistory.css" />

<div id="ediv">
  <jsp:include page="/WEB-INF/views/common/mypage.jsp" />
  <div id="fdiv">
    <div>${userName} 님 환영합니다.</div>
    <div>
      <div id="gdiv">주문내역</div>
      	<div id="hdiv">
      		<div class="order-container">
      		<%-- <c:forEach items="${ordersList}" var="list">
		      <h2>주문번호: ${list.orderNo}</h2>
		      <div class="order-item">주소: ${list.ordAddress }</div>
		      <div class="order-item">가게명: ${list.storeName }</div>
		      <div class="order-item">주문음식: ${list.menuName }</div>
		      <div class="order-item">가격: ${list.price}</div>
		      <div class="order-item">총 금액: ${list.totalPrice}</div>
		      
		      <form action="${pageContext.request.contextPath}/member/review.me" method="get">
  				<input type="hidden" name="orderNo" value="${list.orderNo}">
  				<button type="submit" class="review-button" name="reviewFrm">리뷰작성</button>
			  </form>
		      </c:forEach> --%>
		      
		      <c:forEach items="${ordersList}" var="list" >
		      <h2>주문번호: ${list.orderNo}</h2>
		      <div class="order-item">주소: ${list.ordAddress }</div>
		      <div class="order-item">가게명: ${list.storeName }</div>
		      <div class="order-item">주문음식: ${list.menuName }</div>
		      <div class="order-item">가격: ${list.price}</div>
		      <div class="order-item">총 금액: ${list.totalPrice}</div>
		      
		      <form action="${pageContext.request.contextPath}/member/review.me" method="get">
  				<input type="hidden" name="orderNo" value="${list.orderNo}">
  				<button type="submit" class="review-button" name="reviewFrm">리뷰작성</button>
			  </form>
		      </c:forEach>
		      
		    </div>
		    
		    <br>
		    
		    <div class="order-container">
		      <h2>주문번호: ORDER_NO(SEQ_ORDER)</h2>
		      <div class="order-item">가게명: STORE_NO</div>
		      <div class="order-item">주문음식: STORE_NAME</div>
		      <div class="order-item">가격: PRICE</div>
		      <div class="order-item">수량: QUANTITY</div>
		      <button class="review-button">리뷰작성</button>
		    </div>
      	</div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
