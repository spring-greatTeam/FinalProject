<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- swal -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<div style="border: 1px solid; height: 800px; margin-top: 40px;">
<table>
	<tr>
		<td>${store.storeName}</td>
		
	</tr>
	
		<c:forEach items="${groupList}" var="group">
	<tr><td colspan="2">${group.groupName }<td>
		
	</tr>
			 <c:forEach items="${menuList}" var="menu"> 
			<tr>
				<c:if test="${group.groupNo eq menu.categoryNo}">
					<td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="${menu.menuNo }" 
					data-menu-name="${menu.menuName}" data-menu-no="${menu.menuNo}">${menu.menuName}</button></td>
					<td>${menu.price}</td>
				</c:if> 
			</tr>
			 </c:forEach>
	</c:forEach> 

 
 

 
 <!-- Modal -->
<!-- Button trigger modal -->
 <!-- <button type="button" class="btn-modal" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="color: black; background-color: white;border: none;">
  Launch static backdrop modal
</button> -->
<style>

.modal {
    --bs-modal-width: 800px;
}
.output {
border: 1px solid;
}
.opt .oprice {
border: 1px solid;
float: right;
}
.opt>li {
	border: 1px solid;
}
</style>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content" style="height: 900px">
      <div class="modal-header" style="width: 100%;">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">메뉴이름 작성하는곳</h1>
      </div>
	  <div style="border: 1px solid; height: 250px;">이미지 넣는곳</div>
      <div class="modal-body" style="border: 1px solid red; width: 100%; height: 20%;">
      <p id="output" style="border: 1px solid; height: 350px;"></p>
      </div>
      
      <div class="modal-footer" style="border: 1px solid;">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>


</table>
</div>

<script>
$(document).on('click', '.btn-primary', function() {
	  var menuNo = $(this).data('menu-no');
	  var menuName = $(this).data('menu-name');
	  $.ajax({
	    url: "test.me",
	    data: {menuNo: menuNo},
	    dataType: 'json',
	    type: "GET",
	    success: function(response) {
	     console.log(response);
	     var value = '';
	     
	      for (var i = 0; i < response.optionList.length; i++) {
	          var options = response.optionList[i].opName.split(',');
	          var optionprice = response.optionList[i].opPrice.split(',');
	          value += "<ul class='opt'>" +
	            "<li>" + response.optionList[i].opTitle + "</li>";
	            
	          if (response.optionList[i].opType == 'Y') {
	            for (var j = 0; j < options.length; j++) {
	              value += "<li>" + "<input type='radio' name='rbtn' value='" + options[j].trim() + optionprice[j].trim() +"'>" + options[j].trim() +"<span class='oprice'>&emsp;"+"+"+optionprice[j].trim()+"</span>"+ "</li>";
	            }
	          } else {
	            for (var j = 0; j < options.length; j++) {
	              value += "<li>" + "<input type='checkbox' name='option' value='" + options[j].trim() + optionprice[j].trim()+"'>" + options[j].trim() +"<span class='oprice'>&emsp;"+"+"+optionprice[j].trim()+"</span>"+ "</li>";
	            }
	          }
	          
	          value += "</ul>";
	        }
	      $("#staticBackdropLabel").text(menuName);
	      $("#output").html(value);
	    },
	    
	    error: function() {
	      // AJAX 요청 실패 시 실행될 동작
	      console.log("통신 실패");
	    }
	  });
	});
</script>
 