<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/main.jsp" />

<div id="ediv">
  <jsp:include page="/WEB-INF/views/common/mypage.jsp" />
  <div id="fdiv">
    <div id="pwddiv">
    <div id ="idiv">회원탈퇴</div>
      <div>비밀번호 확인</div>
      <div id="hdiv">
        <form action="#" method="post">
          <input type="password" placeholder="비밀번호를 입력해주세요" />
          <button type="submit">확인</button>
        </form>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
