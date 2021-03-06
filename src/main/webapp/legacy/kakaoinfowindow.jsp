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
	
.info-title {
    display: block;
    background: #50627F;
    color: #fff;
    text-align: center;
    height: max-content;
    line-height:22px;
    border-radius:4px;
    padding:0px 10px;
	/* width:max-content; */
  	clear :both;
  	height: max-content;
  
}
.allin{
	border: solid rgba(0,0,128,.5) 3px;
 
}
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

<div id="map" style="width: 100%; height: 600px;"></div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68878d404fd6bd8eed85265e5a08e807&libraries=services"></script>
<script type="text/javascript">
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   mapOption = {
       center: new kakao.maps.LatLng(35.14991, 126.91984), // 지도의 중심좌표
       level: 4 // 지도의 확대 레벨
   };

var imageSrc = './images/marker.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(58, 61), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
<%boolean flag = true;%>


var mapBounds = map.getBounds();

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

// 관광지 마커
function tsMarker(){
	
	$.ajax({
		url : "mapCon",
		dataType : "json", 
		success:function(result){
			for(let i = 0; i<result.length; i++){
				var data = JSON.parse(result[i]);	
				posistions.push([data.ts_lat, data.ts_lng, data.ts_add, data.ts_name, data.ts_tel, data.ts_time, data.ts_img]);
			}
			for(let i = 0; i<posistions.length; i++){
				if((mapBounds.ha < posistions[i].slice(1,2) && mapBounds.oa > posistions[i].slice(1,2)) && 
						(mapBounds.qa < posistions[i].slice(0,1) && mapBounds.pa > posistions[i].slice(0,1))){
					var marker = new kakao.maps.Marker({
						position: new kakao.maps.LatLng(posistions[i].slice(0,1), posistions[i].slice(1,2)),
						image: markerImage // 마커이미지 설정
					});
					
					var infowindow = new kakao.maps.InfoWindow({
						content: "<div class='allin'style='height:auto; background-color:white;'>"
						+"<div style='font-family: arial, dotum, sans-serif; margin-left:auto; margin-right:auto; width:max-content; font-size: 18px;text-align: center; font-weight: bold;margin-bottom: 5px; margin-top: 5px;'>"
						 + posistions[i].slice(3,4) + "</div>" +
			             "<table><tbody><tr>" +
			             "<td style='width: 60px; font-weight: bold; color:#767676;padding-right:6px;'>주소</td>" +
			             "<td ><span class = 'info-title'>" + posistions[i].slice(2,3)+ "</span></td></tr>" +
			             "<tr><td style='font-weight: bold; color:#767676;padding-right:6px'>전화번호</td>" +
			             "<td><span class = 'info-title'>"+posistions[i].slice(4,5) +"</span></td></tr>" +
			             "<tr><td style='font-weight: bold; color:#767676;padding-right:6px;'>영업시간</td>" +
			             "<td><span class = 'info-title'>"+posistions[i].slice(5,6) +"</span></td></tr>" +
			             "</tbody></table></div>"
			    	 });
					(function(marker, infowindow){
					    kakao.maps.event.addListener(marker, 'mouseover' , function(){
					    	infowindow.open(map, marker);
					   });
					    
					    kakao.maps.event.addListener(marker, 'mouseout' , function(){
					    	infowindow.close();
					   });
					    })(marker,infowindow);
					
					var infoTitle = document.querySelectorAll('.info-title');
					infoTitle.forEach(function(e) {
					    var w = e.offsetWidth + 10;
					    var ml = w/2;
					    e.parentElement.style.top = "82px";
					    e.parentElement.style.left = "50%";
					    e.parentElement.style.marginLeft = -ml+"px";
					    e.parentElement.style.width = w+"px";
					    e.parentElement.previousSibling.style.display = "none";
					    e.parentElement.parentElement.style.border = "0px";
					    e.parentElement.parentElement.style.background = "unset";
					});
				
				// 마커를 지도에 표시합니다.
				marker.setMap(map);
				markers.push(marker);
				//console.log(posistions[i].slice(1,2));
				console.log("관광지 불러오기 성공");
				}
				
			
			}
			
		},
		error : function(){
			console.log("식당 불러오기 실패");
		}
	});

}

// 식당 마커
function resMarker(){
	
	$.ajax({
		url : "mapResCon",
		dataType : "json", 
		success:function(result){
			//console.log("식당 불러오기 성공");
			for(let i = 0; i<result.length; i++){
				var data = JSON.parse(result[i]);	
				posistions.push([data.res_lat, data.res_lng, data.res_add, data.res_name, data.res_tel, data.res_time, data.res_img]);
			}
			for(let i = 0; i<posistions.length; i++){
				if((mapBounds.ha < posistions[i].slice(1,2) && mapBounds.oa > posistions[i].slice(1,2)) && 
						(mapBounds.qa < posistions[i].slice(0,1) && mapBounds.pa > posistions[i].slice(0,1))){
					var marker = new kakao.maps.Marker({
						position: new kakao.maps.LatLng(posistions[i].slice(0,1), posistions[i].slice(1,2)),
						image: markerImage // 마커이미지 설정
					});
					var infowindow = new kakao.maps.InfoWindow({
			             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + posistions[i].slice(3,4)+'<br>'+ '주소 : ' +posistions[i].slice(2,3)+'<br>'+'전화번호 : ' +posistions[i].slice(4,5) + '<br>'+'영업시간 : ' +posistions[i].slice(5,6) + '</div>'
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
				//console.log(posistions[i].slice(1,2));
				console.log("식당 불러오기 성공");
				}
				
			
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
			for(let i = 0; i<result.length; i++){
				var data = JSON.parse(result[i]);	
				posistions.push([data.cf_lat, data.cf_lng, data.cf_add, data.cf_name, data.cf_tel, data.cf_time, data.cf_img]);
			}
			for(let i = 0; i<posistions.length; i++){
				if((mapBounds.ha < posistions[i].slice(1,2) && mapBounds.oa > posistions[i].slice(1,2)) && 
						(mapBounds.qa < posistions[i].slice(0,1) && mapBounds.pa > posistions[i].slice(0,1))){
					var marker = new kakao.maps.Marker({
						position: new kakao.maps.LatLng(posistions[i].slice(0,1), posistions[i].slice(1,2)),
						image: markerImage // 마커이미지 설정
					});
					var infowindow = new kakao.maps.InfoWindow({
			             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + posistions[i].slice(3,4)+'<br>'+ '주소 : ' +posistions[i].slice(2,3)+'<br>'+'전화번호 : ' +posistions[i].slice(4,5) + '<br>'+'영업시간 : ' +posistions[i].slice(5,6) + '</div>'
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
				//console.log(posistions[i].slice(1,2));
				console.log("카페 불러오기 성공");
				}
				
			
			}
			
		},
		error : function(){
			console.log("카페 불러오기 실패");
		}
	});

}


//숙박 마커
function accMarker(){
	$.ajax({
		url : "mapAccCon",
		dataType : "json", 
		success:function(result){
			for(let i = 0; i<result.length; i++){
				var data = JSON.parse(result[i]);	
				posistions.push([data.acc_lat, data.acc_lng, data.acc_add, data.acc_name, data.acc_tel, data.acc_time, data.acc_img]);
			}
			for(let i = 0; i<posistions.length; i++){
				if((mapBounds.ha < posistions[i].slice(1,2) && mapBounds.oa > posistions[i].slice(1,2)) && 
						(mapBounds.qa < posistions[i].slice(0,1) && mapBounds.pa > posistions[i].slice(0,1))){
					var marker = new kakao.maps.Marker({
						position: new kakao.maps.LatLng(posistions[i].slice(0,1), posistions[i].slice(1,2)),
						image: markerImage // 마커이미지 설정
					});
					var infowindow = new kakao.maps.InfoWindow({
			             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + posistions[i].slice(3,4)+'<br>'+ '주소 : ' +posistions[i].slice(2,3)+'<br>'+'전화번호 : ' +posistions[i].slice(4,5) + '<br>'+'영업시간 : ' +posistions[i].slice(5,6) + '</div>'
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
				//console.log(posistions[i].slice(1,2));
				console.log("숙박 불러오기 성공");
				}
				
			
			}
			
		},
		error : function(){
			console.log("숙박 불러오기 실패");
		}
	});

}

// 주차장 마커
function pMarker(){
	
	$.ajax({
		url : "mapPCon",
		dataType : "json", 
		success:function(result){
			console.log("주차장 불러오기 성공");
			for(let i = 0; i<result.length; i++){
				var data = JSON.parse(result[i]);	
				posistions.push([data.p_lat, data.p_lng, data.p_add, data.p_name, data.p_tel]);
			}
			for(let i = 0; i<posistions.length; i++){
				if((mapBounds.ha < posistions[i].slice(1,2) && mapBounds.oa > posistions[i].slice(1,2)) && 
						(mapBounds.qa < posistions[i].slice(0,1) && mapBounds.pa > posistions[i].slice(0,1))){
					var marker = new kakao.maps.Marker({
						position: new kakao.maps.LatLng(posistions[i].slice(0,1), posistions[i].slice(1,2)),
						image: markerImage // 마커이미지 설정
					});
					var infowindow = new kakao.maps.InfoWindow({
			             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + posistions[i].slice(3,4)+'<br>'+ '주소 : ' +posistions[i].slice(2,3)+'<br>'+'전화번호 : ' +posistions[i].slice(4,5) + '</div>'
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
				//console.log(posistions[i].slice(1,2));
				console.log("주차장 불러오기 성공");
				}
				
			
			}
			
		},
		error : function(){
			console.log("주차장 불러오기 실패");
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
	
	
	

	
	
</body>
</html>