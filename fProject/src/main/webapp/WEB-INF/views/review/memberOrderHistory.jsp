<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/main.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberOrderHistory.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pagination.css" />

<div id="ediv">
  <jsp:include page="/WEB-INF/views/common/mypage.jsp" />
  <div id="fdiv">
    <div>${userName} 님 환영합니다.</div>
    <div>
      <div id="gdiv">주문내역</div>
      <div id="hdiv">
          <table border="1px solid" class="order-table">
            <c:forEach items="${ordersList}" var="list">
              <tr>
                <td colspan="2"><h2>주문번호: ${list.orderNo}</h2></td>
              </tr>
              <tr>
                <td>주소:</td>
                <td>${list.ordAddress}</td>
              </tr>
              <tr>
                <td>가게명:</td>
                <td>${list.storeName}</td>
              </tr>
              <tr>
                <td>주문음식:</td>
                <td>${list.menuName}</td>
              </tr>
              <tr>
                <td>가격:</td>
                <td>${list.price}</td>
              </tr>
              <tr>
                <td>총 금액:</td>
                <td>${list.totalPrice}</td>
              </tr>
              <tr>
                <td colspan="2">
                  <form action="${pageContext.request.contextPath}/review/review.me" method="get">
                    <input type="hidden" name="orderNo" value="${list.orderNo}">
                    <button type="submit" class="review-button" name="reviewFrm">리뷰작성</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
          </table>
        </div>
        <br>
        <ul class="pagination">
          <c:if test="${pi.nowPage ne 1}">
            <li>
              <a class="page-link" href="${pageContext.request.contextPath}/review/memberOrderHistory.me?nowPage=${pi.nowPage-1}">Previous</a>
            </li>
          </c:if>

          <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
            <c:choose>
              <c:when test="${p eq pi.nowPage}">
                <li class="active">
                  <a class="page-link" href="${pageContext.request.contextPath}/review/memberOrderHistory.me?nowPage=${p}">${p}</a>
                </li>
              </c:when>
              <c:otherwise>
                <li>
                  <a class="page-link" href="${pageContext.request.contextPath}/review/memberOrderHistory.me?nowPage=${p}">${p}</a>
                </li>
              </c:otherwise>
            </c:choose>
          </c:forEach>

          <c:if test="${pi.nowPage ne pi.totalPage}">
            <li>
              <a class="page-link" href="${pageContext.request.contextPath}/review/memberOrderHistory.me?nowPage=${pi.nowPage+1}">Next</a>
            </li>
          </c:if>
        </ul>
      </div>
    </div>
  </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
