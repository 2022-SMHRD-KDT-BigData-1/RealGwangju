<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<title>코스 추천</title>
</head>
<body>
<jsp:include page="topBar.jsp"></jsp:include>
	<div class="recommend_top_img1">
			<img src="img/main_img/course_back.PNG" class="rc_top1">
			
			<div class="recommend_top_text1">
				<h1 style="font-size: 75px;">맞춤 코스 추천</h1>
			</div>
		</div>

	<div class="course_main">
	<div class="course_main_title">편안한여행코스</div>
		<div class="course_title">국립광주박물관 &gt; 광주광역시역사민속박물관 &gt; 광주시립미술관 </div>
		<div class="inmap" style="background-color: violet">
			지도가들어감
		</div>
		
		
	 </div>
	 <div class="course_num">
		<ul>
			<li> 1번 국립광주박물관</li>
		
		</ul>
		
		</div>
	 <jsp:include page="bottomBar.jsp"></jsp:include>
</body>
</html>