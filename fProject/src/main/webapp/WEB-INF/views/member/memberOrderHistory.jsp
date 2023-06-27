<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/main.jsp" />

<div id="ediv">
  <jsp:include page="/WEB-INF/views/common/mypage.jsp" />
  <div id="fdiv">
    <div>${userName} 님 환영합니다.</div>
    <div>
      <div id="gdiv">주문내역</div>
      <div id="hdiv">주문내역 리스트</div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
