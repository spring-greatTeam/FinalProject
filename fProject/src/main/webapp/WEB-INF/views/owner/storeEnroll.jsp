<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.title{text-align:center; padding: 10px 0 0 0; font-size:50px;}
td{padding:10px;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div style="border: 1px solid; height: 800px; margin-top: 40px">
<div class="title">여기요</div>
<div>
	<c:if test="${not empty loginOwner}">
		<form action="${pageContext.request.contextPath}/owner/storeEnroll.me" method="post">
			<table style="border: 1px solid;">
				<tr>
					<td>가게 번호</td>
					<td><input name="storeNo" value="${loginOwner.storeNo}" required></td>
				</tr>
				<tr>
					<td>사업자 번호</td>
					<td><input name="businessNumber" value="${loginOwner.businessNumber}" required></td>
				</tr>
			 	<tr>
					<td>메뉴 카테고리</td>
					<td><input type="number" name="category" required></td>
				</tr>
				<tr>
					<td>상호명</td>
					<td><input name="storeName" required></td>
				</tr>
	
				<tr>
					<td>사업자 주소</td>
					<td><input name="address"></td>
				</tr>
				
				<!-- <tr>
					<td>사업자 주소</td>
					<td><input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="address" placeholder="주소합친거" required>
						<input type="hidden" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"><br>
					<span id="guide" style="color:#999;display:none"></span>
						<input type="hidden" id="sample4_detailAddress" placeholder="상세주소">
						<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"></td>
				</tr> -->
				<tr>
					<td>전화번호</td>
					<td><input name="phone" required></td>
				</tr>
				<tr>
					<td>영업 시작 시간</td>
					<td><input type="number" name="openTime" required></td>
				</tr>
				<tr>
					<td>영업 종료 시간</td>
					<td><input type="number" name="closeTime" required></td>
				</tr>
				<tr>
					<td>최소 주문 가격</td>
					<td><input type="number" name="minPrice" required></td>
				</tr>
				<tr>
					<td>휴무일</td>
					<td><input name="dayOff" required></td>
				</tr>
				<tr>
					<td>사장님 한마디</td>
					<td><input name="content" required></td>
				</tr>
				<tr>
					<td><input type="submit" value="등록" required></td>
				</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${empty loginOwner}">
			로그인해주세요.
	</c:if>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {	
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                document.getElementById("address").value=data.zonecode+roadAddr+data.jibunAddress;
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</body>
</html>