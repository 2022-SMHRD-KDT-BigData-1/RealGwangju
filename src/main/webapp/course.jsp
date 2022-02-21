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
<title>테마별 코스 추천</title>
</head>
<body>
<jsp:include page="topBar.jsp"></jsp:include>
	<div class="recommend_top_img1">
			<img src="img/main_img/course_back.PNG" class="rc_top1">
			
			<div class="recommend_top_text1">
				<h1 style="font-size: 75px;">맞춤 코스 추천</h1>
			</div>
		</div>
	<div>
		<ul class="course_top_tap">
			<li><button>맞춤코스</button></li>
				<li><button>테마여행</button></li>
			<li><button>나홀로여행</button></li>
		</ul>
	</div>
	<div class="course_box"><a href="#">
				<span class="thumb">				
						<img src="img/main/plz11.png" style="width: 260px;height: 148px">									
				</span>
				<span class="info">
					<em class="title">편안한 무장애 문화산책</em>
					<span class="cource_ne">국립광주박물관 &gt; 광주광역시역사민속박물관 &gt; 광주시립미술관 &gt; 광주문화예술회관 &gt; 광주전통문화관 &gt; 국립아시아문화전당</span>
				</span>
			<!-- 	<span class="etc">
					<span class="tag"><span class="comment">태그:</span> 무장애 |  무장애여행 |  문화산책 |  </span>
					<span class="btn"><img src="/modules/tour/img/course_board_btn.jpg" alt="코스보기"></span>
				</span> -->
			</a></div>

</body>
</html>