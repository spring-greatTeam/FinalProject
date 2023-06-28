<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div style="border: 1px solid; height: 800px; margin-top: 40px">
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
					<td>${menu.menuName }</td>
					<td>${menu.price}</td>
				</c:if>
			</tr>
			</c:forEach>
		
	</c:forEach>
		
		
	
	
	<!-- Scrollable modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  Launch static backdrop modal
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>

</table>
</div>
