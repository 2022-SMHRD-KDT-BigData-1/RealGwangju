<%@page import="model.ResDTO"%>
<%@page import="model.ResDAO"%>
<%@page import="model.TsDTO"%>
<%@page import="model.TsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리로 장소 표시하기</title>
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
<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<div id="map" style="width: 100%; height: 600px;"></div>

	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68878d404fd6bd8eed85265e5a08e807&libraries=services"></script>
		
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  
    

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 


$("#category li .ts").click(function(){
    console.log("관광지 클릭")
    removeMarker();
    searchTs();
    
});

$("#category li .res").click(function(){
    console.log("식당 클릭")
    removeMarker();
    searchRes();
    
});
$("#category li .ts").click(function(){
    console.log("카페 클릭")
    searchTs();
    
});
$("#category li .ts").click(function(){
    console.log("숙박 클릭")
    searchTs();
    
});
$("#category li .ts").click(function(){
    console.log("주차장 클릭")
    searchTs();
    
});


//관광지
//searchTs();

function searchTs(){
	<%TsDAO ts = new TsDAO();
	ArrayList<TsDTO> tsList = ts.tsAddress();

	for(int i = 0; i < tsList.size(); i++) {
		
	String tempAddress = tsList.get(i).getTs_add();
	String holy = "'";
	String resultAddress = holy+tempAddress+holy;

	String tempText = tsList.get(i).getTs_name();
	String resultText = holy+tempText+holy;

	String tempTel = tsList.get(i).getTs_tel();
	String resultTel = holy+tempTel+holy;

	String tempTime = tsList.get(i).getTs_time();
	String resultTime = holy+tempTime+holy;

	String tempImg = tsList.get(i).getTs_img();
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
	geocoder.addressSearch(positions[0], function(result, status) {
	 // 정상적으로 검색이 완료됐으면 
	  if (status === kakao.maps.services.Status.OK) {
	     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	     // 결과값으로 받은 위치를 마커로 표시합니다
	     var marker = new kakao.maps.Marker({
	         map: map,
	         position: coords
	     });

	     
	    	 var infowindow = new kakao.maps.InfoWindow({
	             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + <%=resultText%>+'<br>'+ '주소 : '+<%=resultAddress%>+'<br>'+'전화번호 : ' + <%=resultTel%>+'<br>'+'영업시간 : ' + <%=resultTime%>+ '</div>'
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
	     
	     map.setCenter(coords);
/* 	     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	     mapOption = {
	         center: new kakao.maps.LatLng(35.14991, 126.91984), // 지도의 중심좌표
	         level: 5 // 지도의 확대 레벨 
	     };*/
	 } 
	});    
	<%}%>
	
}

// 식당
function searchRes(){
	<%ResDAO res = new ResDAO();
	ArrayList<ResDTO> resList = res.resAddress();

	for(int i = 0; i < resList.size(); i++) {
		
	String tempAddress = resList.get(i).getRes_add();
	String holy = "'";
	String resultAddress = holy+tempAddress+holy;

	String tempText = resList.get(i).getRes_name();
	String resultText = holy+tempText+holy;

	String tempTel = resList.get(i).getRes_tel();
	String resultTel = holy+tempTel+holy;

	String tempTime = resList.get(i).getRes_time();
	String resultTime = holy+tempTime+holy;

	String tempImg = resList.get(i).getRes_img();
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
	geocoder.addressSearch(positions[0], function(result, status) {
	 // 정상적으로 검색이 완료됐으면 
	  if (status === kakao.maps.services.Status.OK) {
	     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	     // 결과값으로 받은 위치를 마커로 표시합니다
	     var marker = new kakao.maps.Marker({
	         map: map,
	         position: coords
	     });

	     
	    	 var infowindow = new kakao.maps.InfoWindow({
	             content: '<div style="width:250px;text-align:center;padding:6px 0;">'+'이름 : ' + <%=resultText%>+'<br>'+ '주소 : '+<%=resultAddress%>+'<br>'+'전화번호 : ' + <%=resultTel%>+'<br>'+'영업시간 : ' + <%=resultTime%>+ '</div>'
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
	     
	     map.setCenter(coords);
/* 	     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	     mapOption = {
	         center: new kakao.maps.LatLng(35.14991, 126.91984), // 지도의 중심좌표
	         level: 5 // 지도의 확대 레벨 
	     };*/
	 } 
	});    
	<%}%>
	
}


//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}


//카테고리 검색을 요청하는 함수입니다
function searchPlaces() {

		
	
}

//각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}


//카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

//클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 


</script>
</body>
</html>