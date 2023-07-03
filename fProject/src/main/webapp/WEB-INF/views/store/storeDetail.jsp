<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 모달 -->
<%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store_modal.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- swal -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.js"></script> --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
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
    let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tabMenu 활성화)
  
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
 
<!-- Modal -->
<%-- <form action="${pageContext.request.contextPath}/cart/cart.me" method="Post" >
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content" style="height: 900px">
      <div class="modal-header" style="width: 100%;">
        <h1 class="modal-title fs-5" id="staticBackdropLabel" >메뉴이름 작성하는곳</h1>
      </div>
	  <div style="border: 1px solid; height: 250px; width: 400px">이미지 넣는곳</div>
      <div class="modal-body" style=" width: 100%; height: 20%;">
      <p id="output" ></p>
      </div>
	  <div id="quantitybtn">수량 <button type="button" id="minusbtn">-</button><input id="quantity" name="quantity" value="1" readonly>개<button type="button" id="plusbtn">+</button></div>
      <div >총 금액 : <input id="totalPrice" readonly value="" name="totalPrice" style="border: none; outline: none"></div>
      <div class="modal-footer" style="width: 500px">
        <button type="button" class="btn btn-secondary addcart" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary addcart" id="addcart">장바구니 담기</button>
      </div>
    </div>
  </div>
</div>
<input type="hidden" id="menuprice" name="menuprice"value="0">
<input type="hidden" id="storeName" name="storeName" value="">
<input type="hidden" id="menuName" name="menuName" value="">
<input type="hidden" id="memberId" name="memberId" value="">
<input type="hidden" id="storeNo" name="storeNo" value="">
<input type="hidden" id="opTitle" name="opTitle" value="">
<input type="hidden" id="opName" name="opName" value="">
<input type="hidden" id="oprbtn" name="oprbtn" value="">
</form>


<script>
$(document).on('click', '.btn-primary', function() {
	  var menuNo = $(this).data('menu-no');
	  var menuName = $(this).data('menu-name');
	  console.log(menuNo);
	  var menuprice = $(this).data('menu-price');
	  var storeName = $(this).data('store-name');
	  var memberId = $(this).data('member-userid');
	  var storeNo = $(this).data('store-no');
	  quantity = 1;
	  $.ajax({
	    url: "test.me",
	    data: {menuNo:menuNo},
	    type: "GET",
	    success: function(response) {
	     var quantity = $('#quantity').val();
	     var value = '';
	     var totalPrice = menuprice;
	     var opTitle = [];
	      for (var i = 0; i < response.optionList.length; i++) {
	          var options = response.optionList[i].opName.split(',');
	          var optionprice = response.optionList[i].opPrice.split(',');
	          value += "<ul class='opt'>" +
	            "<li>" + response.optionList[i].opTitle + "</li>";
	            
	            opTitle.push(response.optionList[i].opTitle);
	            
	          if (response.optionList[i].opType == 'Y') {
	            for (var j = 0; j < options.length; j++) {
	              value += "<li>" + "<input type='radio' name='rbtn' value='" + optionprice[j]+"'>&emsp;" + options[j]+"<span class='oprice'>&emsp;"+"+"+optionprice[j]+"</span>"+ "</li>";
	            }
	          } else {
	            for (var j = 0; j < options.length; j++) {
	              value += "<li>" + "<input type='checkbox' name='option' value='" + optionprice[j]+"'>&emsp;" + options[j] +"<span class='oprice'>&emsp;"+"+"+optionprice[j]+"</span>"+ "</li>";
	              
	            }
	          }
	          value += "</ul>";
	        }
	      $("#staticBackdropLabel").text(menuName);
	      $("#output").html(value);
	      $("#totalPrice").val(totalPrice);
	      $("#menuprice").val(menuprice);
	      $("#storeName").val(storeName);
	      $("#menuName").val(menuName);
	      $("#memberId").val(memberId);
	      $("#storeNo").val(storeNo);
	      $("#opTitle").val(opTitle);
	      
	      $("input[name='option']").on('change', function(){
	    	  var menuprice = parseInt($("#menuprice").val());
	    	  var quantity = parseInt($("#quantity").val());
	    	  var totalPrice = menuprice * quantity;

	    	  
	    	  // 체크박스 반복문 ( 체크된것들 곱해서 수량합을 토탈에 더하기)
	    	  var test =[];	//체크한 옵션값 넘기기
	    	  
	    	  $("input[name='option']:checked").each(function() {
	    	    var checkprice = parseInt($(this).val());
	    	    
	    	    totalPrice += (checkprice * quantity);
	    	    test.push($(this).parent().text().trim().replace(/\+\d+/g, ''));
	    	    console.log(test);
	    	    $("#opName").val(test);
	    	  });
	    	  $("#totalPrice").val(totalPrice);
	    	});
	      
	      $("input[name='rbtn']").on('change', function(){
	    	  var rbtn = "";
	    	  $("input[name='rbtn']:checked").each(function() {
	    	    
	    	  });
	    	  rbtn += $(this).parent().text().trim().replace(/\+\d+/g, '');
	    	  console.log(rbtn);
	    	  $("#oprbtn").val(rbtn);
	    	});
	      
	    },    
	    error: function() {
	      console.log("실패");
	    }
	  });
	});
	
//수량 금액 초기값 설정 (0이하 체크 x)
	var quantity = $("#quantity").val();	
$(document).on('click', '#plusbtn', function(){
		++quantity;
		$("#quantity").val(quantity);
		
		// + 클릭시 금액 변경
		var menuprice = parseInt($("#menuprice").val());
		var totalPrice = $("#totalPrice").val();
		
		
		// 옵션 체크 한 것 있는지 검사!
		if ($("input[name='option']:checked").length > 0) {
    var optiontotalPrice = 0;
    $("input[name='option']:checked").each(function(){
        var checkprice = parseInt($(this).val());
        optiontotalPrice += checkprice; 
    });
    totalPrice =(menuprice + optiontotalPrice) * quantity; 
} else {
    totalPrice = menuprice * quantity;
}
	    $("#totalPrice").val(totalPrice);
});

	// - 버튼 클릭 시 실행
$(document).on('click', '#minusbtn', function(){
	if(quantity > 1){
	
	--quantity;
	$("#quantity").val(quantity);
	
	var menuprice = parseInt($("#menuprice").val());
	var totalPrice = $("#totalPrice").val();	
	
	// 옵션 체크되어 있는지 확인
	if ($("input[name='option']:checked").length > 0) {
	    var optiontotalPrice = 0;
	    
	    //체크 된것만 반복
	    $("input[name='option']:checked").each(function(){
	        var checkprice = parseInt($(this).val());
	        optiontotalPrice += checkprice; 
	    });
	    totalPrice =(menuprice + optiontotalPrice) * quantity; 
	} else {
	    totalPrice = menuprice * quantity;
	}
	 $("#totalPrice").val(totalPrice);
		
	}else{
	// 1개 이하 클릭시 초기값
		Swal.fire({
  		text : '0개 이하는 주문하실수 없습니다.'});
	
		$("#quantity").val(1);
		
		var menuprice = parseInt($("#menuprice").val());
	    var totalPrice = $("#totalPrice").val();
		if ($("input[name='option']:checked").length > 0) {
		    var optiontotalPrice = 0;
		    //체크 된것만 반복
		    $("input[name='option']:checked").each(function(){
		        var checkprice = parseInt($(this).val());
		        optiontotalPrice += checkprice; 
		    });
		    totalPrice =(menuprice + optiontotalPrice) *quantity; 
		} else {
		    totalPrice = menuprice *quantity;
		}
		 $("#totalPrice").val(totalPrice);
	}
	
});

		// 장바구니 담은 후 이전페이지
  $(document).ready(function() {
    <c:if test="${not empty successMessage}">
      Swal.fire({
        icon: 'success',
        text: "${successMessage}"
      });
    </c:if>
  });
		
	//모달창 리셋
  $(document).ready(function() {
      $('#staticBackdrop').on('hidden.bs.modal', function() {
        $('#quantity').val('1');
        $('input[name="option"]').prop('checked', false);
      });
    });
</script> --%>