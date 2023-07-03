<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5328a908e33989a48140557c21e7bf3b"></script>
<style>
.section {
 	border-bottom:1px solid black;
 } 
p {
	padding: 30px 0 0 0;
}
.content{padding:10px 0 0 0; overflow:hidden; }
.container {
	display:flex; padding:10px 0 0 0;
}
.kakaoMap {
flex:1;
}

.storeInfo {
flex:1;
}
</style>
</head>
<body>
	<div class="section">
		<p>사장님 한마디</p>
	</div>
	<div class="content" style="height:80px;">
		${store.content}
	</div>
	<div class="section"> 
		<p>업체 정보</p>
	</div>
	<div class="container">
		<div class="kakaoMap">	
			<!-- 지도를 표시할 div 입니다 -->
			<div id="map" style="width:300px;height:200px;"></div>
		</div>
		<div class="storeInfo">
			<table align="left">
				<tr>
					<td>상호명: ${store.storeName}</td>
				</tr>
				<tr>
					<td>영업시간: 오전${store.openTime}-오후${store.closeTime}</td>
				</tr>
				<tr>
					<td>휴무일: ${store.dayOff}</td>
				</tr>
				<tr>
					<td>전화번호: ${store.phone}</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="section">
		<p>사업자 정보</p>
	</div> 
	<table>
	<div class="content">
		상호명: ${store.storeName}<br>
		사업자 주소: ${store.address}
	</div>
	<script>
	let latitude = 0;
	let hardness = 0;

	if(${store.storeNo}==1) {	// 달시루 분식 좌표
		latitude = 37.5342;
		hardness = 126.9021;
	} else if(${store.storeNo}==2) {	// 바른 분식 좌표
		latitude = 37.5468;
		hardness = 126.8747;
	} else if(${store.storeNo}==3) {	// 당산 김밥 좌표
		latitude = 37.9117;
		hardness = 127.7328;
	}
	
	setTimeout(function(){
		
		var container = document.getElementById('map');	// 지도를 표시할 div 
		
		var options = {
			center: new kakao.maps.LatLng(latitude, hardness), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};
		
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(container, options);	// (지도크기, 지도중심좌표)로 지도생성
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);

		});
	}, 2000);	//delay 미입력시 지도 깨짐현상 발생.
	</script>
</body>
</html>