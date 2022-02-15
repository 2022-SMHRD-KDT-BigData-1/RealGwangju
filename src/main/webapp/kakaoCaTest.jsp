<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.customoverlay {position:relative;bottom:50px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#111;text-align:center;border-radius:6px;font-size:14px;font-weight:500;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:500;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
 
<div id="map" style="width:100%;height:450px;"></div>
 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68878d404fd6bd8eed85265e5a08e807"></script>

</head>
<body>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.8773582, 128.6042956), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.8755582, 128.6053956); 
 
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});
 
// 마커가 지도 위에 표시되도록 설정합니다
//marker.setMap(map);
 
// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    content : "<div style='position: absolute; left: 0px; top: 0px;'><div style='width:140px;padding:1px;text-align:center;'>칠성종합시장</div></div>" 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
//infowindow.open(map, marker); 
 
var imageSrc = 'marker01.png';                              // 마커이미지 주소
    imageSize = new kakao.maps.Size(34, 36);                // 마커이미지의 크기
    imageOption = {offset: new kakao.maps.Point(17, 36)};   // 마커의 좌표와 일치시킬 이미지 안에서의 좌표설정
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
 
 
var arr = new Array();
arr[0] = ["칠성시장북편 노상공영주차장",35.8780671960342,128.60320927213, "대구 북구 칠성동1가 275-3","1980287267"];
arr[1] = ["칠성시장방범초소 노상공영주차장",35.8794483127273,128.602329365994, "대구 북구 칠성동2가 409-24","1438742395"];
arr[2] = ["신천둔치주차장",35.8767253660639,128.605336577613, "대구 북구 칠성동1가 276-1","10068807"];
arr[3] = ["칠성시장서편 노상공영주차장",35.8771714863247,128.601464917779, "대구 북구 칠성동1가 236-1","27154726"];
arr[4] = ["칠성공영주차장",35.8761081400681,128.601660859567, "대구 북구 칠성남로 196","20587860"];
arr[5] = ["신천교고가도로밑 노상공영주차장",35.875440484078,128.607219820583, "대구 북구 칠성동1가 279-1","842394951"];
 
 
var markerTmp;      // 마커
var customOverlay;  // 오버레이
var contentStr;
 
for (var i=0;i<arr.length;i++) {
    markerTmp = new daum.maps.Marker({
        position: new daum.maps.LatLng(arr[i][1],arr[i][2]),
        title: arr[i][0],
        image: markerImage,
        map:map
    });
 
    contentStr = "<div class='customoverlay'><a href='https://map.kakao.com/link/map/"+ arr[i][4] +"' target='_blank'><span class='title'>"+ arr[i][0] +"</span></a></div>";
 
    customOverlay = new kakao.maps.CustomOverlay({
        map: map,
        position: new daum.maps.LatLng(arr[i][1],arr[i][2]),
        content: contentStr,
        yAnchor: 1 
    });
}
 
 
// 지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new kakao.maps.MapTypeControl();
 
// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);    
 
// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new kakao.maps.ZoomControl();
 
// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
 
// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>

</body>
</html>