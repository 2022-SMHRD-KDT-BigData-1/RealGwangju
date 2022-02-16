<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./assets/js/jquery-3.6.0.min.js"></script>
</head>
<body>


	<script src="jquery-3.6.0.min.js"></script>
	<div id="map" style="width: 100%; height: 600px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68878d404fd6bd8eed85265e5a08e807&libraries=services"></script>
	<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.14991, 126.91984), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	<%boolean flag = true;%>


	var mapBounds = map.getBounds();
	
	var posistions = [];
	var holy = new Array();
	var listData = [ ['광주광역시 북구 무등로 1514-35','ㄱㅇㅇㄴ'], ['광주광역시 광산구 하남대로248-10','ㅇㅅㅈ']];
	
		
	$.ajax({
		url : "mapCon",
		dataType : "json", // dataType 넘겨받을 때의 데이터 타입을 약속
		success:function(result){
			// json 형식의 문자열로 넘어가짐
			// >>객체 타입으로 바꾸어 줘야함!!
			//alert("성공");
			console.log("불러오기 성공");
			// 받아온 데이터를 테이블에 추가해주세요!
			for(let i = 0; i<result.length; i++){
				// 현재 배열의 원소를 사용가능한 객체로 바꿔준다음에
				var data = JSON.parse(result[i]);	
				//posistions[i] = [data.ts_add, data.ts_name, data.ts_tel, data.ts_time, data.ts_img];
				posistions.push([data.ts_add, data.ts_name, data.ts_tel, data.ts_time, data.ts_img]);
				console.log(posistions[i]);
			}
		},
		error : function(){
			console.log("불러오기 실패");
		}
	});

	
		// 주소로 좌표를 검색합니다
	// foreach loop
	//posistions.forEach(function(addr, index) {
		geocoder.addressSearch('수등로123번길21', function(result, status) {
			if (status === daum.maps.services.Status.OK) {
				var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				var marker = new daum.maps.Marker({
					position: coords,
					clickable: true
				});

				// 마커를 지도에 표시합니다.
				marker.setMap(map);

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content: '<div style="width:150px;text-align:center;padding:6px 0;">' + addr[1] + '</div>',
					removable : true
				});

				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function() {
					// 마커 위에 인포윈도우를 표시합니다
					infowindow.open(map, marker);
				});
			}
		});
	//});

	
	

	
	</script>
	
	
	

	
	
</body>
</html>