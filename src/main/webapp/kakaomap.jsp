<%@page import="model.TsDTO"%>
<%@page import="model.TsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소로 장소 표시하기</title>

</head>
<body>
<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<div id="map" style="width: 100%; height: 600px;"></div>

	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68878d404fd6bd8eed85265e5a08e807&libraries=services"></script>
	
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

 
<%TsDAO ts = new TsDAO();
ArrayList<TsDTO> list = ts.tsAddress();
for(int i = 0; i < list.size(); i++) {
	
String tempAddress = list.get(i).getTs_add();
String holy = "'";
String resultAddress = holy+tempAddress+holy;

String temptext = list.get(i).getTs_name();
String resulttext = holy+temptext+holy;

String temptel = list.get(i).getTs_tel();
String resulttel = holy+temptel+holy;

String temptime = list.get(i).getTs_time();
String resulttime = holy+temptime+holy;

String tempimg = list.get(i).getTs_img();
String resultimg = holy+tempimg+holy;
%>
var positions = [
	{
		address: <%= resultAddress%>,
		text:<%=resulttext%>,
		tel:<%=resulttel%>,
		time:<%=resulttime%>,
		img:<%=resultimg%>
	}
]
<%}%>
var len = <%=list.size()%>

for (let i = 0; i < len; i++){
	console.log(len)
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(positions[i].address, function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[i].y, result[i].x);
        console.log(coords)
        let lat = result[i].y // 위도
        console.log(lat)
        let lon = result[i].x // 경도
        console.log(lon)
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+positions[i].text+'<br>'+positions[i].address+'<br>'+positions[i].tel+'<br>'+positions[i].time+'</div>'
        });
        infowindow.open(map, marker);
		//kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		//kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        
        map.setCenter(coords);
    } 
});    
}


</script>
</body>
</html>