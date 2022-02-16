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
var geocoder = new kakao.maps.services.Geocoder();
var addressArray = [];
var wishList = $('./controller/kakaomapCon');

for(var i = 0; i < wishList.length; i++){
	addressArray.push({
		'address' : $("input[name='address']").eq(i).val()
	});
}

$.ajax({
	url: "./controller/kakaomapCon",
	dataType:"",
	type:"",
	contentType: "",
	data: ,
	success: function(result){
		
	},
	error:function(){
		
	}
});


for (var key in positions) {
    // Javascript의 for-in문을 사용해 key를 뽑아낼 수 있다.
    // key 변수에는 obj가 가진 key가 하나씩 들어온다.
    
    // 가져온 key를 이용해 value를 추출하자.
    // 두 가지 형식이 존재한다.
    //     1. obj.a
    //     2. obj[a]
    console.log(positions[key]);
}
for (var i = 0; i < <%=list.size()%>; i++){
	
//주소로 좌표를 검색합니다
geocoder.addressSearch(addressArray[i], function(result, status) {
 // 정상적으로 검색이 완료됐으면 
  if (status === kakao.maps.services.Status.OK) {
     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
     // 결과값으로 받은 위치를 마커로 표시합니다
		 var marker = new kakao.maps.Marker({
	         map: map,
	         position: coords
	     });
	     
	    	 var infowindow = new kakao.maps.InfoWindow({
	             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + positions.text+'<br>'+ '주소 : '+positions.address+'<br>'+'전화번호 : ' + positions.tel+'<br>'+'영업시간 : ' + positions.time+ '</div>'
	    	 });
	    	 
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

}

</script>
</body>
</html>