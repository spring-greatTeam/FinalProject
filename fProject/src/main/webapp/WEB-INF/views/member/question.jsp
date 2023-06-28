<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/main.jsp" />

<!-- 밑에서 부터 본문 내용 -->
<!-- 1. 첫번째 div id="ediv" 하나 생성 후 그 안에 mypage.jsp를 include하기 
     2. 첫번째 div 속성값 width: 100%; display: flex; 주기
     3. 첫번째 div 안에 mypage.jsp include한곳 바로 밑에
     div 하나 생성 후 width: 800px; height: 500px; margin-top: 10%; 속성값 주면 본문내용
     
     테스트용
-->

<div id="ediv">
  <jsp:include page="/WEB-INF/views/common/mypage.jsp" />
  <div id="fdiv">
    <div id="idiv">자주 묻는 질문</div>
    <div style="border: 1px solid">
      <div id="hdiv">자주 묻는 질문 슬라이드</div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
