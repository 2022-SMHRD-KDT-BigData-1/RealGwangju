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
<script src="./assets/js/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div id="map" style="width: 100%; height: 600px;"></div>

	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68878d404fd6bd8eed85265e5a08e807&libraries=services"></script>
	
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.14991, 126.91984), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  
// 카카오 33.450701, 126.570667 

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

 
<%TsDAO ts = new TsDAO();
ArrayList<TsDTO> list = ts.tsAddress();

for(int i = 0; i < list.size(); i++) {
	
String tempAddress = list.get(i).getTs_add();
String holy = "'";
String resultAddress = holy+tempAddress+holy;

String tempText = list.get(i).getTs_name();
String resultText = holy+tempText+holy;

String tempTel = list.get(i).getTs_tel();
String resultTel = holy+tempTel+holy;

String tempTime = list.get(i).getTs_time();
String resultTime = holy+tempTime+holy;

String tempImg = list.get(i).getTs_img();
String resultImg = holy+tempImg+holy;
%>


var positions = [
	[<%=resultAddress%>],
	[<%=resultText%>],
	[<%=resultTel%>],
	[<%=resultTime%>],
	[<%=resultImg%>]
]

var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
var marker = null;
var infowindow = null;
geocoder.addressSearch(positions[0], function(result, status) {
 // 정상적으로 검색이 완료됐으면 
  if (status === kakao.maps.services.Status.OK) {
     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
     // 결과값으로 받은 위치를 마커로 표시합니다
	 <%if(resultText.contains("광주")){%>
		 marker = new kakao.maps.Marker({
	         map: map,
	         position: coords
	     });
	     
	    	 infowindow = new kakao.maps.InfoWindow({
	             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + <%=resultText%>+'<br>'+ '주소 : '+<%=resultAddress%>+'<br>'+'전화번호 : ' + <%=resultTel%>+'<br>'+'영업시간 : ' + <%=resultTime%>+ '</div>'
	    	 });
	 <%}%>
     
    	
   
     (function(marker, infowindow){
     kakao.maps.event.addListener(marker, 'mouseover' , function(){
    	 infowindow.open(map, marker);
    });
     
     kakao.maps.event.addListener(marker, 'mouseout' , function(){
    	 infowindow.close();
    });
     })(marker,infowindow);

     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
     
     //map.setCenter(coords);
 } 
});    
<%}%>




</script>
</body>
</html>