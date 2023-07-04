<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/main.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewHistory.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pagination.css" />
<div id="ediv">
    <jsp:include page="/WEB-INF/views/common/mypage.jsp" />
    <div id="fdiv">
        <div id="gdiv">리뷰내역</div>
        <div id="hdiv">
                <c:forEach items="${reviewList}" var="list">
                    <table>
                        <tr>
                            <td colspan="4">작성일 : ${list.write}</td>
                        </tr>
                        <tr>
                            <td>리뷰번호</td>
                            <td>${list.reviewNo}</td>
                            <td>주문번호</td>
                            <td>${list.orderNo}</td>
                        </tr>
                        <tr>
                            <td colspan="4">평점 : ${list.rating}</td>
                        </tr>
                        <tr>
                            <td colspan="4">리뷰내용</td>
                        </tr>
                        <tr>
                            <td colspan="4" height="150px"><pre>${list.content}</pre></td>
                        <tr/>
                    </table>
                </c:forEach>
                <ul class="pagination">
                    <c:if test="${pi.nowPage ne 1}">
                        <li>
                            <a href="${pageContext.request.contextPath}/review/reviewHistory.me?nowPage=${pi.nowPage-1}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                        <c:choose>
                            <c:when test="${p eq pi.nowPage}">
                                <li class="active">
                                    <a href="${pageContext.request.contextPath}/review/reviewHistory.me?nowPage=${p}">${p}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="${pageContext.request.contextPath}/review/reviewHistory.me?nowPage=${p}">${p}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pi.nowPage ne pi.totalPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/review/reviewHistory.me?nowPage=${pi.nowPage+1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
