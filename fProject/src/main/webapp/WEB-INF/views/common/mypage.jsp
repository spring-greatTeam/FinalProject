<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/resources/css/mypage.css"
/>

<!-- 테스트 -->

<div id="adiv">
  <div id="bdiv">
    <div>
      <div id="cdiv">My Page</div>
      <ul>
        주문 내역 조회
        <a href="${pageContext.request.contextPath}/member/memberOrderHistory.me"><li>주문 내역</li></a>
      </ul>
      <ul>
        회원정보
        <a href="${pageContext.request.contextPath}/member/memberUpdate.me"><li>회원정보 수정</li></a>
        <a href="${pageContext.request.contextPath}/member/memberDelete.me"><li>회원 탈퇴</li></a>
      </ul>
      <ul>
        고객센터
        <a href="${pageContext.request.contextPath}/member/question.me"><li>자주 묻는 질문</li></a>
      </ul>
    </div>
  </div>
</div>
