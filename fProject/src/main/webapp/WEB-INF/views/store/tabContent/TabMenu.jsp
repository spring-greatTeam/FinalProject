<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 모달 -->
<!DOCTYPE html>
<html>
<head>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
  crossorigin="anonymous"
/>
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
  crossorigin="anonymous"
></script>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/resources/css/store_modal.css"
/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/resources/css/header.css"
/>

<!-- swal -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css"
/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.js"></script>


<style>
  .groupName {
    margin-top: 20px;
    width: 100%;
    background-color: bisque;
	padding-left: 20px;
  }
  #menudiv {
    overflow: auto;
    clear: both;
  }

  #mpdiv {
    float: left;
    width: 600px;
  }

  #imgdiv {
    float: right;
    text-align: right;
    padding-right: 10px;
	width: 180px;
	height: 80px;
	margin-right: 10px;
	font-size: 20px;
  }
  #menuprice {
	font-size: 20px;
	padding-left: 15px;
  }
</style>
</head>

<div style=" height: 100%;">
  <div id="t1">
    <c:forEach items="${groupList}" var="group">
    	<div class="groupName">${group.groupName}</div>
		<div>
      	<c:forEach items="${menuList}" var="menu">
        	<div class="menuList">	
				<div id="menudiv">
					<div id="mpdiv"style="width: 600px;">
          				<c:if test="${group.groupNo eq menu.categoryNo}">
              				<button style="font-size: 20px;"
                				type="button"
                				class="btn btn-primary"
                				data-bs-toggle="modal"
                				data-bs-target="#staticBackdrop"
                				id="${menu.menuNo}"
                				data-store-no="${store.storeNo}"
                				data-member-userid="${sessionScope.userName}"
                				data-store-name="${store.storeName}"
                				data-menu-name="${menu.menuName}"
                				data-menu-price="${menu.price}"
                				data-menu-no="${menu.menuNo}">
                					${menu.menuName}
              				</button>
            				<div id="menuprice">${menu.price} 원</div>
            			</c:if>
					</div>
            		<div id="imgdiv">이미지</div>
            	</div>
			</div>
        </c:forEach>
        </div>
      </c:forEach>
  </div>
</div>

<!-- Modal -->
<form action="${pageContext.request.contextPath}/cart/cart.me" method="Post">
  <div
    class="modal fade"
    id="staticBackdrop"
    data-bs-backdrop="static"
    data-bs-keyboard="false"
    tabindex="-1"
    aria-labelledby="staticBackdropLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content" style="height: 900px">
        <div class="modal-header" style="width: 100%">
          <h1 class="modal-title fs-5" id="staticBackdropLabel">
            메뉴이름 작성하는곳
          </h1>
        </div>
        <div style="border: 1px solid; height: 250px; width: 400px">
          이미지 넣는곳
        </div>
        <div class="modal-body" style="width: 100%; height: 20%">
          <p id="output"></p>
        </div>
        <div id="quantitybtn">
          수량 <button type="button" id="minusbtn">-</button
          ><input id="quantity" name="quantity" value="1" readonly />개<button
            type="button"
            id="plusbtn"
          >
            +
          </button>
        </div>
        <div>
          총 금액 :
          <input
            id="totalPrice"
            readonly
            value=""
            name="totalPrice"
            style="border: none; outline: none"
          />
        </div>
        <div class="modal-footer" style="width: 500px">
          <button
            type="button"
            class="btn btn-secondary addcart"
            data-bs-dismiss="modal"
          >
            닫기
          </button>
          <button type="submit" class="btn btn-primary addcart" id="addcart">
            장바구니 담기
          </button>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" id="menuprice" name="menuprice" value="0" />
  <input type="hidden" id="storeName" name="storeName" value="" />
  <input type="hidden" id="menuName" name="menuName" value="" />
  <input type="hidden" id="memberId" name="memberId" value="" />
  <input type="hidden" id="storeNo" name="storeNo" value="" />
  <input type="hidden" id="opTitle" name="opTitle" value="" />
  <input type="hidden" id="opName" name="opName" value="" />
  <input type="hidden" id="oprbtn" name="oprbtn" value="" />
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
  	    	var menuprice = parseInt($("#menuprice").val());
  	        var quantity = parseInt($("#quantity").val());
  	        var totalPrice = menuprice;
  	    	var rbtn = "";
  	    	  $("input[name='rbtn']:checked").each(function() {
  	    		var checkprice = parseInt($(this).val());
  	    		totalPrice += checkprice ;
  	    		$("#totalPrice").val(totalPrice);
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
</script>
</html>
