<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
  #adiv {
    border: 2px solid;
    margin-top: 20px;
    width: 700px;
    border-radius: 15px;
    float: left;
  }
  #title {
    text-align: center;
    border-radius: 15px;
    font-size: 30px;
    font-weight: 700;
    height: 40px;
    text-align: center;
    justify-content: center;
    background-color: beige;
  }
  .outListdiv {
    border-bottom: 1px solid grey;
  }
  .Listdiv {
    position: relative;
    display: flex;
    height: 250px;
    width: 100%;
    flex-direction: column;
    align-content: flex-start;
    align-items: flex-end;
    flex-wrap: nowrap;
    justify-content: space-between;
    margin-top: 0 auto;
    padding-top: 10px;
  }
  .deletebtn {
    width: fit-content;
    position: absolute;
    margin-right: 5px;
    margin-top: 5px;
    outline: none;
    border: none;
  }
  .Listdiv li {
    padding-top: 3px;
    margin-left: 5px;
  }
  .opchange {
    margin-top: 10px;
    margin-bottom: 20px;
    text-align: center;
    padding: 0;
  }
  .quantity {
    width: 30px;
    text-align: center;
    border: none;
  }
.minusbtn{
 margin-left: 5px;
}
.quantitybtn{
  margin-bottom: 10px;
}
.plusbtn {
  margin-left: 5px;
}
</style>
<div id="adiv">
  <div id="title">Cart List </div>
  
  <c:if test="${empty CartList}">
  <div><p style="text-align: center;">현재 주문 내역이 없습니다.</p></div>
  </c:if>
  <c:forEach items="${CartList}" var="cart">
    <div class="outListdiv">
      <ul style="padding: 0">
        <div class="Listdiv">
          <li style="font-size: 30px">매장명 : ${cart.storeName} </li>

          <li>메뉴 이름 : ${cart.menuName}</li>
          <li>수량 : ${cart.quantity}</li>
          <li>옵션 : ${cart.opName} </li>
          <li>가격 : ${cart.totalPrice}원</li>
          <div class="quantitybtn">수량 <button type="button" class="minusbtn">-</button><input class="quantity" name="quantity" value="1" readonly>개<button type="button" class="plusbtn">+</button></div>

          <div class="deletebtn"><button class="can" data-cart-id="${cart.cartNo}">✖️</button></div>
        </div>
      </ul>
    </div>
  </c:forEach>
  
  
</div>
<div style="width: 350px; border: 1px solid; float: right; margin-top: 20px;margin-right: 50px;">
  <div style="border: 1px solid; text-align: center;">결제</div>
    <ul>
      <li>매장명</li>
      <li>배달비</li>
      <li>주문수량</li>
      <li>총금액</li>
      <div>전체취소</div>
      <div>주문하기</div>
    </ul>
</div>
<script>
$(".can").on('click', function(){
	var cartNo = $(this).data('cart-id');
	var $outListDiv = $(this).closest('.outListdiv');
	$.ajax({
	    url: "cartDelete.me",
	    type: "POST",
	    data: { cartNo: cartNo },
	    success: function(result){
	      console.log("성공");
	      $outListDiv.remove();
	      location.reload();
	    },
	    error: function(){
	      console.log("실패");
	    }
	  });
	});
</script>