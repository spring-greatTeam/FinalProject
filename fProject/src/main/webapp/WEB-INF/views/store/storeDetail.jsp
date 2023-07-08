<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.title{text-align:center; padding: 10px 0 0 0; font-size:50px;}
	.top{display:flex; padding: 10px 0 0 0;}
	.img{margin-left:auto; margin-right:0; padding: 0 50px 0 0;}
	.sideInfo{margin-right:auto; margin-left:0;}
    .tab_kind{position:relative;}
    .tab_kind .list{   display: flex; padding-left:0; justify-content: center;
					  width: 600px; height: 50px; margin-top:30px;}
    .tab_kind .list li{ display: flex; align-items: center; width:20%; border:1px solid; }
    .tab_kind .list li.is_on .btn{font-weight:bold; color:green;}
    .tab_kind .list .btn{font-size:30px;}
    .tab_kind .cont_area{margin-top:10px; width:800px; height:450px;}
    .tab_kind .cont_area .cont{display:none; background:#f9f7e8; color:black;width:800px; height:550px;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div style="border: 1px solid; height: 950px; margin-top: 40px">
<div class="title">여기요</div>

<div class="top">
<div class="img">
<c:choose>
	<c:when test="${store.storeNo==1}">
		<img src="${pageContext.request.contextPath}/resources/upload/store/달시루_배경X.jpg" style="width:200px;height:200px;vertical-align:middle;"/>
	</c:when>
	<c:when test="${store.storeNo==2}">
		<img src="${pageContext.request.contextPath}/resources/upload/store/바른김밥_배경X.jpg" style="width:200px;height:200px;vertical-align:middle;"/>
	</c:when>
	<c:otherwise>
		<img src="${pageContext.request.contextPath}/resources/upload/store/당산김밥_배경X.jpg" style="width:200px;height:200px;vertical-align:middle;"/>
	</c:otherwise>
</c:choose>
</div>

<div class="sideInfo">
<table>
	<tr>
		<td>${store.storeName}</td>
	</tr>
    <td>최소주문금액: ${store.minPrice}</td>
  <tr>
    <td></td>
  </tr>
</table>
</div> 
</div>
  <div class="tab_kind">
    <ul class="list">
      <li class="is_on">
        <a href="#tabMenu" class="btn">메뉴</a>
      </li>
      <li>
        <a href="#tabReview" class="btn">리뷰</a>
      </li>	
      <li>
        <a href="#tabInfo" class="btn">정보</a>
      </li>
    </ul>
    
    <div class="cont_area">
      <div id="tabMenu" class="cont">
        <%@ include file="tabContent/TabMenu.jsp" %>
      </div>
      <div id="tabReview" class="cont">
        <%@ include file="tabContent/TabReview.jsp" %>
      </div>
      <div id="tabInfo" class="cont">
        <%@ include file="tabContent/TabInfo.jsp" %>
      </div>
    </div>
  </div>
</div>
  
  <script>
    const tabList = document.querySelectorAll('.tab_kind .list li');
    const contents = document.querySelectorAll('.tab_kind .cont_area .cont')
    let activeCont = '#tabMenu'; // 현재 활성화 된 컨텐츠 (기본:#tabMenu 활성화)
    document.querySelector(activeCont).style.display = 'block';

    for(var i = 0; i < tabList.length; i++){
      tabList[i].querySelector('.btn').addEventListener('click', function(e){
        e.preventDefault();
        for(var j = 0; j < tabList.length; j++){
          // 나머지 버튼 클래스 제거
          tabList[j].classList.remove('is_on');
  
          // 나머지 컨텐츠 display:none 처리
          contents[j].style.display = 'none';
        }
  
        // 버튼 관련 이벤트
        this.parentNode.classList.add('is_on');
  
        // 버튼 클릭시 컨텐츠 전환
        activeCont = this.getAttribute('href');
        document.querySelector(activeCont).style.display = 'block';
      });
    }
  </script>
</body>
</html>