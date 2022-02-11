<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 지도-->
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>
<!-- /지도 -->

<!-- 구 카테고리 -->
<div id="cateBtn">
    <button class="ca_1 cateBtn on" id="all" value="all">전체</button>
    <button class="ca_2 cateBtn" id="donggu" value="동구" >동구</button>
    <button class="ca_3 cateBtn" id="seogu" value="서구">서구</button>
    <button class="ca_4 cateBtn" id="namgu" value="남구">남구</button>
    <button class="ca_5 cateBtn" id="bukgu" value="북구">북구</button>
    <button class="ca_6 cateBtn" id="gwangsan" value="광산구">광산구</button>
</div>
<!-- /구 카테고리-->

<!-- 테이블 -->
<form action="" id="setRows" name="myHiddenForm">
    <input type="hidden" name="rowPerPage" value="10">
</form>
<table  class="table table-hover" id="products">
    <thead>
        <tr>
            <th>연번</th>
            <th>구</th>
            <th id="name">동캠프명</th>
            <th>주소</th>
            <th>활동내용</th>
        </tr>
    </thead>
    <tbody id="valInfo">
    </tbody>
</table>
<!-- /테이블 -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddfd7b8a2d630988678cbd6eb719178f&libraries=services"></script>
<script>
// 자동실행 -- > 기본적으로 지도와 게시판정보를 불러옴
$(function(){ 
    // alert("자동");
    cateMap(cate, cate2);
    cateGoo(cate, cate2);
    pagination(10);
});

// 동 or 아파트 선택했을 때
$("ul.cate li").click(function(){
    cate = $(this).children("a").attr("alt");

    $("ul.cate li").removeClass("on");
    $(this).addClass("on");
    cate2='all';
    cateMap(cate, cate2);
    cate2 = "all";
    $("button.cateBtn").removeClass("on");
    $("#all").addClass("on");
    cateGoo(cate, cate2);
    if(cate == "아파트 봉사활동거점"){
        $("#name").text("아파트명");
    }
    else if(cate == "동자원봉사캠프"){
        $("#name").text("동캠프명"); 
    }
    pagination(10);
});

// 구 카테고리 눌렀울 때
$("button.cateBtn").click(function(){
    cate2 = $(this).attr("value");
    $("button.cateBtn").removeClass("on");
    $(this).addClass("on");
    cateMap(cate, cate2);
    cateGoo(cate, cate2);
	pagination(10);
});



// 게시판 띄우기
function cateGoo(cate1 ,cate2){
  
  $.ajax({
      
      type: "GET",
      url: "valGoo_ajax.php",
      cache: "false",
      data: {cate1: cate1, cate2: cate2},
      async: false, 
      success:  function(data){
          $("#valInfo").html(data);
        //   alert("성공22");
           },
      error: function(request, status, error){
               console.log(error);
            //    alert("실패22");
           }
  }
  )};
// 지도 + 마커띄우기
  function cateMap(cate1, cate2){ 
 
    $.ajax({
        type: "GET",
        url: "valunteer_ajax.php",
        cache: "false",
        data: {cate1: cate1, cate2: cate2},
        async: false, 
        success:  function(data){
            // alert("지도들어옴11")
            console.log("data"+data);
            var addData = []; 
            var addArr = [];
            var nameArr = [];
            var num1 = 0;
            var num2 = 0;
            
            addData = data.split('|'); //addData 변수안에 배열 형식으로 들어감
            for(var i = 0; i<addData.length-1; i++){
                if(i%2 == 0){
                    addArr[num1] = addData[i];
                    num1++;
                }
                else if(i%2 != 0){
                    nameArr[num2] = addData[i];
                    num2++;
                }
            }
            markAdd(addArr, nameArr);
            },
        error: function(request, status, error){
            // alert("지도들어옴실패")
                    console.log(error);
        }
    }
)};

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng( 35.17252810900349  , 126.88635380507931 ), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
 }; 
//  
//     var map = new kakao.maps.Map(mapContainer, mapOption);  
//  
 function markAdd(addArr, nameArr){
    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption);  
    var coords;
        var marker;
        var num = 0;
    // alert("마커성공");
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    for(var i=0; i<addArr.length; i++){ // addData 길이만큼 for문 돌면서 마커 만듦
            makeMark(addArr, i);
        }
        map.setCenter(coords);
        function makeMark(addArr, num){
        // 주소로 좌표를 검색   
        geocoder.addressSearch(addArr[num], function(result, status) {
            // 정상적으로 검색이 완료됐으면 
                if (status === kakao.maps.services.Status.OK) {
                    coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    // 결과값으로 받은 위치를 마커로 표시합니다
                    marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    nameMark(nameArr, num, coords); 
                } 
            });
        }
    // 마커에 정보달아주는 함수
    function nameMark(nameArr, num, coords){
        var info= '<div class="mark_i" style="text-align:center,padding:1px 0;">'+nameArr[num]+'</div>'
        var infowindow = new kakao.maps.InfoWindow({
            content : info
        });
        infowindow.open(map, marker);
    };
    }



// 페이지네이션 시작
var $setRows = $('#setRows');//#setRows는 form 태그 아이디
function pagination(cnt){
	var rowPerPage = cnt;// 한페이지에 띄워줄 갯수
        $('#nav').remove();
        var $products = $('#products');
        $products.after('<div id="nav">');
        var $tr = $($products).find('tbody tr');
        var rowTotals = $tr.length;
        var pageTotal = Math.ceil(rowTotals/ rowPerPage);
        for (i=0; i < pageTotal; i++) {
            $('<a href="#"></a>')
                .attr('rel', i)
                .html(i + 1)
                .appendTo('#nav');
        }
        $tr.addClass('off-screen')
            .slice(0, rowPerPage)
            .removeClass('off-screen');
        var $pagingLink = $('#nav a');
        $pagingLink.on('click', function (evt) {
            evt.preventDefault();
            var $this = $(this);
            if ($this.hasClass('active')) {
            return;
            }
            $pagingLink.removeClass('active');
            $this.addClass('active');
    var currPage = $this.attr('rel');
    var startItem = currPage * rowPerPage;
    var endItem = startItem + rowPerPage;
    $tr.css('opacity', '0.0')
        .addClass('off-screen')
        .slice(startItem, endItem)
        .removeClass('off-screen')
        .animate({opacity: 1}, 300);
  });
  $pagingLink.filter(':first').addClass('active');
}
// 페이지네이션 끝	

</script>

<?php
$cate1 = $_GET['cate1']; // 봉사 정보를 받아왐
$cate2 = $_GET['cate2'];//구 정보를 받아옴

$conn = mysqli_connect(
  'localhost', // 주소
  'gjplatform',
  'qkrwnstjdxlawkd',
  'gjplatform'); // 데이터베이스 이름

  mysqli_set_charset($conn,"utf8");

// 구 카테고리에 따른 조건을 줌
if($cate2 != 'all'){// all 이 아니라면 == 선택했다면
    $condition = "where ca_name = '{$cate2}'";
}

// 아파트별, 캠프별에 따른 테이블명을 선택 
if($cate1 == "아파트 봉사활동거점"){ //아파트 봉사활동거점을 선택했다면
    $qry = "select * from apt {$condition }";
}
else{ //  = 동자원봉사캠프라면 or 선택한게 없다면
    $qry =  "select * from camp {$condition }";
}

$sql = $qry;
$result = mysqli_query($conn, $sql); // db 값이 들어 있음

 ?>
 
<? foreach($result as $key => $o):?>
<tr>
    <td><?= $key+1; ?></td>
    <td><?= $o["ca_name"]?></td>
    <td><?= $o["wr_name"]?></td>
    <td><?= $o["wr_1"]?></td>
    <?php if($cate1 == "동자원봉사캠프") : ?>
    <td><?= $o["wr_subject"]?></td>
    <?php endif ?>
</tr>
<? endforeach?>

<?php
  
  $cate1 = $_GET['cate1'];
  $cate2 = $_GET['cate2'];
  
$conn = mysqli_connect(
    'localhost', // 주소
    'gjplatform',
    'qkrwnstjdxlawkd',
    'gjplatform'); // 데이터베이스 이름
  
    mysqli_set_charset($conn,"utf8");

// 구 카테고리에 따른 조건을 줌
if($cate2 != "all"){
    $condition = "where ca_name='{$cate2}'";
}

if($cate1 == "아파트 봉사활동거점"){
    $qry = "select * from apt {$condition}";
}
else{
    $qry = "select * from camp {$condition}";
}
// 조건없으면 전체불러오고 조건있으면 해당 카테고리를 불러온다


$sql = $qry;
$result = mysqli_query($conn, $sql); // db 값이 들어 있음

?>

<? foreach($result as $key => $o):?>
<?php 
    $ad =  $o["wr_1"];
    $name = $o["wr_name"];?>
<?= $ad?>|<?= $name?>|
<? endforeach?>

</body>
</html>