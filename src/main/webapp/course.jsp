<%@page import="model.CourseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CourseDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
CourseDAO dao = new CourseDAO();
ArrayList<CourseDTO> courseInfo = dao.courseSelectAll();
//courseInfo.get(1).getTheme_name()
int cnt = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="./assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<title>테마별 코스 추천</title>
</head>
<body>
<script type="text/javascript">
console.log(${courseInfo.get(1).getTheme_name()});
</script>
<jsp:include page="topBar.jsp"></jsp:include>
	<div class="recommend_top_img1">
			<img src="img/main_img/course_back.PNG" class="rc_top1">
			
			<div class="recommend_top_text1">
				<h1 style="font-size: 75px;">맞춤 코스 추천</h1>
			</div>
		</div>
	<div>
		<ul class="course_top_tap">
			<li><button class="course1">맞춤코스</button></li>
				<li><button class="course2" >테마여행</button></li>
			<li><button class="course3">나홀로여행</button></li>
		</ul>
		<hr style="border: 2px red; margin-top: 0px;">
		
	<p style="margin-left:10%; margin-top: 10px;">총 (<%=cnt %>)건의 추천코스가 있습니다</p>
	</div>
	<!-- course_box를 반복하면 됨 1번 선택지는 cour1-->
	<% for(int i = 0; i < courseInfo.size(); i++){%>
			<div class="course_box cour1"><a href="#">
				<span class="thumb">				
						<img src=<%=courseInfo.get(i).getTheme_img() %> style="margin-right:20px; width: 260px;height: 148px" align="left">									
				</span>
				<span class="info">
					<em class="title"><%=courseInfo.get(i).getTheme_name() %></em><br>
					<span class="cource_ne"><%=courseInfo.get(i).getTheme_course() %></span>
				</span>
			<span class="etc">
					<span class="tag"><span class="comment">거리:</span><%=courseInfo.get(i).getTheme_dis() %></span>
				<!-- 	<span class="btn"><img src="/modules/tour/img/course_board_btn.jpg" alt="코스보기"></span> -->
				</span> 
			</a></div>
			
			<%
				cnt++;	
			} 
			%>	
			<!--반복  2번 선택지는 cour2-->
			<div class="course_box cour2"><a href="#">
				<span class="thumb">				
						<img src="img/main/plz22.png" style="margin-right:20px; width: 260px;height: 148px" align="left">									
				</span>
				<span class="info">
					<em class="title">이런 컨셉의 코스입니다</em><br>
					<span class="cource_ne">국립광주박물관 &gt; 광주광역시역사민속박물관 &gt; 광주시립미술관</span>
				</span>
			<span class="etc">
					<span class="tag"><span class="comment">태그:</span> 두번쨰 | 넣을까 | 말까 |  </span>
				<!-- 	<span class="btn"><img src="/modules/tour/img/course_board_btn.jpg" alt="코스보기"></span> -->
				</span> 
			</a></div>
			
			<!-- 3번 선택지는 cour3으로 한다 -->
			<div class="course_box cour3"><a href="#">
				<span class="thumb">				
						<img src="img/main/plz3.png" style="margin-right:20px; width: 260px;height: 148px" align="left">									
				</span>
				<span class="info">
					<em class="title">이런 컨셉의 코스입니다</em><br>
					<span class="cource_ne">국립광주박물관 &gt; 광주광역시역사민속박물관 &gt; 광주시립미술관</span>
				</span>
			<span class="etc">
					<span class="tag"><span class="comment">태그:</span> 두번쨰 | 넣을까 | 말까 |  </span>
				<!-- 	<span class="btn"><img src="/modules/tour/img/course_board_btn.jpg" alt="코스보기"></span> -->
				</span> 
			</a></div>
			<jsp:include page="bottomBar.jsp"></jsp:include>
		<script type="text/javascript">
		$(document).ready(function() {
			
			$('.cour1').show();
			$('.cour2').hide();
			$('.cour3').hide();
		})
			$('.course1').click(function() {
			$('.course1').css('color','red');
			$('.course2').css('color','black');
			$('.course3').css('color','black');
			$('.cour1').show();
			$('.cour2').hide();
			$('.cour3').hide();
		})
			$('.course2').click(function() {
				$('.course1').css('color','black');
				$('.course2').css('color','red');
				$('.course3').css('color','black');
			$('.cour1').hide();
			$('.cour2').show();
			$('.cour3').hide();
		})
			$('.course3').click(function() {
				$('.course1').css('color','black');
				$('.course2').css('color','black');
				$('.course3').css('color','red');
			$('.cour1').hide();
			$('.cour2').hide();
			$('.cour3').show();
		})

	</script>
		
</body>
</html>