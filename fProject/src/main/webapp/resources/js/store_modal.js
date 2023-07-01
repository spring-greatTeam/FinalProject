
$(document).on('click', '.btn-primary', function() {
	  var menuNo = $(this).data('menu-no');
	  var menuName = $(this).data('menu-name');
	  var menuprice = $(this).data('menu-price');
	  var storeName = $(this).data('store-name');
	  var memberId = $(this).data('member-userid');
	  var storeNo = $(this).data('store-no');
	  quantity = 1;
	  $.ajax({
	    url: "test.me",
	    data: {menuNo: menuNo},
	    dataType: 'json',
	    type: "GET",
	    success: function(response) {
	     var quantity = $('#quantity').val();
	     var value = '';
	     var totalPrice = menuprice;
	     
	     
	     
	      for (var i = 0; i < response.optionList.length; i++) {
	          var options = response.optionList[i].opName.split(',');
	          var optionprice = response.optionList[i].opPrice.split(',');
	          value += "<ul class='opt'>" +
	            "<li>" + response.optionList[i].opTitle + "</li>";
	            
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
	      
	      $("input[name='option']").on('change', function(){
	    	  var menuprice = parseInt($("#menuprice").val());
	    	  var quantity = parseInt($("#quantity").val());
	    	  var totalPrice = menuprice * quantity;

	    	  // 체크박스 반복문 ( 체크된것들 곱해서 수량합을 토탈에 더하기)
	    	  $("input[name='option']:checked").each(function() {
	    	    var checkprice = parseInt($(this).val());
	    	    totalPrice += (checkprice * quantity);
	    	    console.log("체크금액:"+totalPrice);
	    	  });

	    	  $("#totalPrice").val(totalPrice);
	    	});

	    },    
	    error: function() {
	      console.log("실패");
	    }
	  });
	});
	
//수량 초기값 설정 (0이하 체크 x)
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


		
	//모달창 리셋
  $(document).ready(function() {
      $('#staticBackdrop').on('hidden.bs.modal', function() {
        $('#quantity').val('1');
        $('input[name="option"]').prop('checked', false);
      });
    });
