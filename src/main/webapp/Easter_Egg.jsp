<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/Easter_Egg.css">
<title>받아라보노보노빔!!</title>
</head>
<body>
<div class="nakksi"><button class="on"> <img src="img/easter/404.PNG"></button></div>
	<div class="easter_main">
		<div class="hurricain">
		<a href="https://heroesofthestorm.com/ko-kr/">
		<img src="img/easter/hios.PNG" class="hios">
		</a>
		<span style = "font-size: 50px;"> 시공의 포풍은 정말 최고야!</span>
		</div>
		
		<div class="bonobono">
		<a href="https://www.google.com/search?q=%EB%B3%B4%EB%85%B8%EB%B3%B4%EB%85%B8&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjS4Ofa06H2AhXLsVYBHb3dDWcQ_AUoAXoECAEQAw&biw=1920&bih=969">
			<img src="img/easter/bonobono.PNG">
		</a>	
			<img src = "img/easter/sun.png" class ="sun">
		
		</div>
		<div class= "traiser">
		<img src="img/easter/sigon.PNG" class="s">
		
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
		
		$('.nakksi').show();
		$('.easter_main').hide();
		
	})
		$('.on').click(function() {
	
		$('.easter_main').show();
		$('.nakksi').hide();
	
	})</script>
	
</body>
</html>