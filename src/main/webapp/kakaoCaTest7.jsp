<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./assets/js/jquery-3.6.0.min.js"></script>

<style>
	.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap {position:relative;width:100%;height:800px;}
	#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
	#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
	#category li.on {background: #eee;}
	#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
	#category li:last-child{margin-right:0;border-right:0;}
	#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
	#category li .category_bg {background:url(img/mapCat/places_category3.png) no-repeat;}
	#category li .ts {background-position: -10px 0;}
	#category li .res {background-position: -10px -36px;}
	#category li .cafe {background-position: -10px -72px;}
	#category li .accom {background-position: -10px -108px;}
	#category li .p {background-position: -10px -144px;}
/* 	#category li .store {background-position: -10px -180px;} */
	#category li.on .category_bg {background-position-x:-46px;}
	.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
	.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
	.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
	.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
	.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.placeinfo .tel {color:#0f7833;}
	.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
</style>
</head>
<body>
<div class="map_wrap">
	<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <ul id="category">
        <li id="BK9" data-order="0"> 
            <span class="category_bg ts"></span>
            관광지
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg res"></span>
            식당
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg accom"></span>
            숙박
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg p"></span>
            주차장
        </li>  
<!--         <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            편의점
        </li>  -->     
    </ul>
</div> 

<div id="map" style="width: 100%; height: 50px;"></div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddfd7b8a2d630988678cbd6eb719178f&libraries=services"></script>
<script type="text/javascript">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   mapOption = {
       center: new kakao.maps.LatLng(35.14991, 126.91984), // 지도의 중심좌표
       level: 3 // 지도의 확대 레벨
   };

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
<%boolean flag = true;%>


var mapBounds = map.getBounds();
var info = [];
var Posistions = [];
var markers = [];

//tsMarker();

$("#category li .ts").click(function(){
    console.log("관광지 클릭");
    console.log(mapBounds);
    removeMarker();
    posistions = [];   
    tsMarker();
});

$("#category li .res").click(function(){
    console.log("식당 클릭");
    console.log(mapBounds);
    removeMarker();
    posistions = [];
    resMarker();
	
    
});
$("#category li .cafe").click(function(){
    console.log("카페 클릭");
    console.log(mapBounds);
    removeMarker();
    posistions = [];
    cfMarker();

});
$("#category li .accom").click(function(){
    console.log("숙박 클릭");
    console.log(mapBounds);
    removeMarker();
    posistions = [];
    accMarker();

    
});
$("#category li .p").click(function(){
    console.log("주차장 클릭");
    console.log(mapBounds);
    removeMarker();
    posistions = [];
    pMarker();

    
});

setDraggable(false);
setZoomable(false);
// 관광지 마커
function tsMarker(){
	
	$.ajax({
		url : "mapCon",
		dataType : "json", 
		success:function(result){
			console.log("관광 불러오기 성공");
			for(let i = 0; i<result.length; i++){
				var data = JSON.parse(result[i]);	
				posistions.push([data.ts_add, data.ts_name, data.ts_tel, data.ts_time, data.ts_img, data.ts_ct, data.ts_loc, data.ts_views]);
				info.push([data.ts_info]);
			}
			for(let i = 0; i<posistions.length; i++){
			geocoder.addressSearch(posistions[i], function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

						var marker = new kakao.maps.Marker({
							position: coords,
						});
						var infowindow = new kakao.maps.InfoWindow({
				             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + posistions[i][1]+'<br>'+ '주소 : ' +posistions[i][0]+'<br>'+'전화번호 : ' +posistions[i][2] + '<br>'+'영업시간 : ' +posistions[i][3] + '</div>'
				    	 });
						(function(marker, infowindow){
						    kakao.maps.event.addListener(marker, 'mouseover' , function(){
						   	 infowindow.open(map, marker);
						   });
						    
						    kakao.maps.event.addListener(marker, 'mouseout' , function(){
						   	 infowindow.close();
						   });
						    })(marker,infowindow);
					
					// 마커를 지도에 표시합니다.
					marker.setMap(map);
					markers.push(marker);
					console.log(posistions[i].slice(1,2), coords);
					$("#start").append("<tr>"
							+ "<td>" + i + "</td>"
							+ "<td>" + posistions[i].slice(1,2) + "</td>"
							+ "<td>" + posistions[i].slice(2,3) + "</td>"
							+ "<td>" + posistions[i].slice(3,4) + "</td>"
							+ "<td>" + posistions[i].slice(5,6) + "</td>"
							+ "<td>" + posistions[i].slice(0,1) + "</td>"
							+ "<td>" + posistions[i].slice(6,7) + "</td>"
							+ "<td>" + posistions[i].slice(4,5) + "</td>"
							+ "<td>" + posistions[i].slice(7,8) + "</td>"
							+ "<td>" + coords.Ma + "</td>"
							+ "<td>" + coords.La + "</td>"
							+ "<td>" + info[i].slice(0,1) + "</td>"
							+ "</tr>");
					
				}
			});
			}
			
		},
		error : function(){
			console.log("관광 불러오기 실패");
		}
	});

}

// 식당 마커
function resMarker(){
	
	$.ajax({
		url : "mapResCon",
		dataType : "json", 
		success:function(result){
			console.log("식당 불러오기 성공");
			for(let i = 0; i<result.length; i++){
				var data = JSON.parse(result[i]);	
				posistions.push([data.res_add, data.res_name, data.res_tel, data.res_time, data.res_img, data.res_ct, data.res_loc, data.res_views]);
				info.push([data.res_info]);
			}
			for(let i = 0; i<posistions.length; i++){
			geocoder.addressSearch(posistions[i], function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
						var marker = new kakao.maps.Marker({
							position: coords,
						});
						var infowindow = new kakao.maps.InfoWindow({
				             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + posistions[i][1]+'<br>'+ '주소 : ' +posistions[i][0]+'<br>'+'전화번호 : ' +posistions[i][2] + '<br>'+'영업시간 : ' +posistions[i][3] + '</div>'
				    	 });
						(function(marker, infowindow){
						    kakao.maps.event.addListener(marker, 'mouseover' , function(){
						   	 infowindow.open(map, marker);
						   });
						    
						    kakao.maps.event.addListener(marker, 'mouseout' , function(){
						   	 infowindow.close();
						   });
						    })(marker,infowindow);
					
					// 마커를 지도에 표시합니다.
					marker.setMap(map);
					markers.push(marker);
					console.log(data.res_name, coords);
					$("#start").append("<tr>"
							+ "<td>" + i + "</td>"
							+ "<td>" + posistions[i].slice(1,2) + "</td>"
							+ "<td>" + posistions[i].slice(2,3) + "</td>"
							+ "<td>" + posistions[i].slice(3,4) + "</td>"
							+ "<td>" + posistions[i].slice(5,6) + "</td>"
							+ "<td>" + posistions[i].slice(0,1) + "</td>"
							+ "<td>" + posistions[i].slice(6,7) + "</td>"
							+ "<td>" + posistions[i].slice(4,5) + "</td>"
							+ "<td>" + posistions[i].slice(7,8) + "</td>"
							+ "<td>" + coords.Ma + "</td>"
							+ "<td>" + coords.La + "</td>"
							+ "<td>" +  + "</td>"
							+ "</tr>");
					
				}
			});
			}
			
		},
		error : function(){
			console.log("식당 불러오기 실패");
		}
	});
	
}


// 카페 마커
function cfMarker(){
	$.ajax({
		url : "mapCfCon",
		dataType : "json", 
		success:function(result){
			console.log("불러오기 성공");
			for(let i = 0; i<result.length; i++){
				var data = JSON.parse(result[i]);	
				posistions.push([data.cf_add, data.cf_name, data.cf_tel, data.cf_time, data.cf_img, data.cf_ct, data.cf_loc, data.cf_views]);
			}
			for(let i = 0; i<posistions.length; i++){
			geocoder.addressSearch(posistions[i], function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

						var marker = new kakao.maps.Marker({
							position: coords,
						});
						var infowindow = new kakao.maps.InfoWindow({
				             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + posistions[i][1]+'<br>'+ '주소 : ' +posistions[i][0]+'<br>'+'전화번호 : ' +posistions[i][2] + '<br>'+'영업시간 : ' +posistions[i][3] + '</div>'
				    	 });
						(function(marker, infowindow){
						    kakao.maps.event.addListener(marker, 'mouseover' , function(){
						   	 infowindow.open(map, marker);
						   });
						    
						    kakao.maps.event.addListener(marker, 'mouseout' , function(){
						   	 infowindow.close();
						   });
						    })(marker,infowindow);
					
					// 마커를 지도에 표시합니다.
					marker.setMap(map);
					markers.push(marker);
					console.log(posistions[i].slice(1,2), coords);
					$("#start").append("<tr>" 
							+ "<td>" + i + "</td>"
							+ "<td>" + posistions[i].slice(1,2) + "</td>"
							+ "<td>" + posistions[i].slice(2,3) + "</td>"
							+ "<td>" + posistions[i].slice(3,4) + "</td>"
							+ "<td>" + posistions[i].slice(5,6) + "</td>"
							+ "<td>" + posistions[i].slice(0,1) + "</td>"
							+ "<td>" + posistions[i].slice(6,7) + "</td>"
							+ "<td>" + posistions[i].slice(4,5) + "</td>"
							+ "<td>" + posistions[i].slice(7,8) + "</td>"
							+ "<td>" + coords.Ma + "</td>"
							+ "<td>" + coords.La + "</td>"
							+ "</tr>");
					
					
				}
			});
			}
		},
		error : function(){
			console.log("불러오기 실패");
		}
	});

}


//숙박 마커
function accMarker(){
	$.ajax({
		url : "mapAccCon",
		dataType : "json", 
		success:function(result){
			console.log("숙박 불러오기 성공");
			for(let i = 0; i<result.length; i++){
				var data = JSON.parse(result[i]);	
				posistions.push([data.acc_add, data.acc_name, data.acc_tel, data.acc_time, data.acc_img, data.acc_ct, data.acc_loc, data.acc_views]);
				info.push([data.acc_info]);
			}
			for(let i = 0; i<posistions.length; i++){
			geocoder.addressSearch(posistions[i], function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						var marker = new kakao.maps.Marker({
							position: coords,
						});
						var infowindow = new kakao.maps.InfoWindow({
				             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + posistions[i][1]+'<br>'+ '주소 : ' +posistions[i][0]+'<br>'+'전화번호 : ' +posistions[i][2] + '<br>'+'영업시간 : ' +posistions[i][3] + '</div>'
				    	 });
						(function(marker, infowindow){
						    kakao.maps.event.addListener(marker, 'mouseover' , function(){
						   	 infowindow.open(map, marker);
						   });
						    
						    kakao.maps.event.addListener(marker, 'mouseout' , function(){
						   	 infowindow.close();
						   });
						    })(marker,infowindow);
					
					// 마커를 지도에 표시합니다.
					marker.setMap(map);
					markers.push(marker);
					console.log(posistions[i].slice(1,2), coords);
					$("#start").append("<tr>"
							+ "<td>" + i + "</td>"
							+ "<td>" + posistions[i].slice(1,2) + "</td>"
							+ "<td>" + posistions[i].slice(2,3) + "</td>"
							+ "<td>" + posistions[i].slice(3,4) + "</td>"
							+ "<td>" + posistions[i].slice(5,6) + "</td>"
							+ "<td>" + posistions[i].slice(0,1) + "</td>"
							+ "<td>" + posistions[i].slice(6,7) + "</td>"
							+ "<td>" + posistions[i].slice(4,5) + "</td>"
							+ "<td>" + posistions[i].slice(7,8) + "</td>"
							+ "<td>" + coords.Ma + "</td>"
							+ "<td>" + coords.La + "</td>"
							+ "<td>" + info[i].slice(0,1) + "</td>"
							+ "</tr>");
					
				}
			});
			}
		},
		error : function(){
			console.log("숙박 불러오기 실패");
		}
	});

}

//주차장 마커
function pMarker(){
	$.ajax({
		url : "mapPCon",
		dataType : "json", 
		success:function(result){
			console.log("주차장 불러오기 성공");
			for(let i = 0; i<result.length; i++){
				var data = JSON.parse(result[i]);	
				posistions.push([data.p_add, data.p_name, data.p_tel, data.p_ct, data.p_views]);
				info.push([data.acc_info]);
			}
			for(let i = 0; i<posistions.length; i++){
			geocoder.addressSearch(posistions[i], function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						var marker = new kakao.maps.Marker({
							position: coords,
						});
						var infowindow = new kakao.maps.InfoWindow({
				             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + posistions[i][1]+'<br>'+ '주소 : ' +posistions[i][0]+'<br>'+'전화번호 : ' +posistions[i][2] + '<br>'+'영업시간 : ' +posistions[i][3] + '</div>'
				    	 });
						(function(marker, infowindow){
						    kakao.maps.event.addListener(marker, 'mouseover' , function(){
						   	 infowindow.open(map, marker);
						   });
						    
						    kakao.maps.event.addListener(marker, 'mouseout' , function(){
						   	 infowindow.close();
						   });
						    })(marker,infowindow);
					
					// 마커를 지도에 표시합니다.
					marker.setMap(map);
					markers.push(marker);
					console.log(posistions[i].slice(1,2), coords);
					$("#start").append("<tr>"
							+ "<td>" + i + "</td>"
							+ "<td>" + posistions[i].slice(1,2) + "</td>"
							+ "<td>" + posistions[i].slice(2,3) + "</td>"
							+ "<td>" + posistions[i].slice(3,4) + "</td>"
							+ "<td>" + posistions[i].slice(5,6) + "</td>"
							+ "<td>" + posistions[i].slice(0,1) + "</td>"
							+ "<td>" + posistions[i].slice(6,7) + "</td>"
							+ "<td>" + posistions[i].slice(4,5) + "</td>"
							+ "<td>" + posistions[i].slice(7,8) + "</td>"
							+ "<td>" + coords.Ma + "</td>"
							+ "<td>" + coords.La + "</td>"
							+ "<td>" + info[i].slice(0,1) + "</td>"
							+ "</tr>");
					
				}
			});
			}
		},
		error : function(){
			console.log("숙박 불러오기 실패");
		}
	});

}


//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

function setDraggable(draggable) {
    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
    map.setDraggable(false);    
}

function setZoomable(zoomable) {
    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
    map.setZoomable(false);    
}



</script>
	
<h1>위도, 경도 정보 불러오기</h1>
<table border = "1" id="start">
	<tr>
		<td>개수</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>영업시간</td>
		<td>분야</td>
		<td>주소</td>
		<td>지역</td>
		<td>이미지 주소</td>
		<td>조회수</td>
		<td>위도</td>
		<td>경도</td>
		<td>설명</td>
		
	</tr>
</table>	
	

	
	
</body>
</html>