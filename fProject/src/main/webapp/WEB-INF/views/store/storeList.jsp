<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<h2>카테고리 넘어온 값 : ${category}</h2>
<div style="border: 1px solid; height: 800px; margin-top: 40px">
  <table> <!-- 테이블 태그 추가 -->
    <c:forEach items="${storeList}" var="store">
      <c:if test="${category == store.category}">
        <tr>
          <td><a href="${pageContext.request.contextPath}/store/storeDetail.me?storeNo=${store.storeNo}">${store.storeName}</a></td>
        </tr>
      </c:if>
    </c:forEach>
  </table> 
</div>
