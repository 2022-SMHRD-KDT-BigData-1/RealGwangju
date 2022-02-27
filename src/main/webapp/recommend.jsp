<%@page import="model.MemberDTO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.VisitDAO"%>
<%@page import="model.TsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<TsDTO> tsRank10 = new ArrayList<TsDTO>();
VisitDAO dao = new VisitDAO();
tsRank10 = dao.selectRank10();
request.setAttribute("tsRank10", tsRank10);

ArrayList<TsDTO> tsReco = new ArrayList<TsDTO>();
ArrayList<TsDTO> tsReco2 = new ArrayList<TsDTO>();
ArrayList<TsDTO> tsReco3 = new ArrayList<TsDTO>();
tsReco = dao.selectRe();
tsReco2 = dao.selectRe2();
tsReco3 = dao.selectRe3();
request.setAttribute("tsReco", tsReco);
request.setAttribute("tsReco2", tsReco2);
request.setAttribute("tsReco3", tsReco3);

MemberDTO member = (MemberDTO)session.getAttribute("member");

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
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<title>추천</title>
</head>
<body>
<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<jsp:include page="topBar.jsp"></jsp:include>
	
		<div class="recommend_top_img">
			<img src="img/main_img/gwang_back.PNG" class="rc_top">
			
			<div class="recommend_top_text">
				<h1 style="font-size: 91px;">광주 어디로?</h1>
			</div>
		</div>
		<!-- 컨텐츠 -->
	<div class="row top3">
		<div class="col-md-1"></div>
		<div class="col-md-11">랭킹</div>
	</div>
	<hr style="color: red; height: 5px; width: 90%; margin-left: 5%;">
		<div class="inner" style="overflow: hidden;">
			<button class="prev">&lt;</button>
			<button class="next">&gt;</button>
			<div class="container2 cn1">
				<c:forEach var="ts" items="${tsRank10}" varStatus="status">
					<div class="img-slide">
						<a href="Ts_viewCon.do?visit_name=${ts.ts_name}"> <span><img
								src="${ts.ts_img}" class="img-size">${status.index+1}위</span> <span
							class="slide-text">${ts.ts_name}</span>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
			<div class="row top3">
				<div class="col-md-1"></div>
				<div class="col-md-11">${member.mem_nick } 님! 이런곳은 어떠신가요?</div>
			</div>
			<hr style="color: red; height: 5px; width: 90%; margin-left: 5%;">
			<div>
				<div class="inner" style="overflow: hidden;">
					<button class="prev pr2">&lt;</button>
					<button class="next nx2">&gt;</button>
					<div class="container2 cn2">
						<c:forEach var="ts" items="${tsReco}" varStatus="status">
							<div class="img-slide">
								<a href="Ts_viewCon.do?visit_name=${ts.ts_name}"> <span><img
										src="${ts.ts_img}" class="img-size">${status.index+1}번</span> <span
									class="slide-text">${ts.ts_name}</span>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="row top3">
				<div class="col-md-1"></div>
				<div class="col-md-11">비슷한 이용자들이 많이 찾았어요!</div>
			</div>
			<hr style="color: red; height: 5px; width: 90%; margin-left: 5%;">
			<div>
				<div class="inner" style="overflow: hidden;">
					<button class="prev pr33">&lt;</button>
					<button class="next nx33">&gt;</button>
					<div class="container2 cn3">
						<c:forEach var="ts" items="${tsReco2}" varStatus="status">
							<div class="img-slide">
								<a href="Ts_viewCon.do?visit_name=${ts.ts_name}"> <span><img
										src="${ts.ts_img}" class="img-size">${status.index+1}번</span> <span
									class="slide-text">${ts.ts_name}</span>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="row top3">
				<div class="col-md-1"></div>
					<%
						LocalDate now =LocalDate.now();
						int month = now.getMonthValue();
						System.out.println(month);
						String monthst="";
						if(month==12||month<=2){
							monthst="겨울";
						}
						else if(month>=3){
							monthst="봄";
						}
						else if(month>=6){
							monthst="여름";
						}
						else if(month>=9){
							monthst="가을";
						}
					%>
				
				<div class="col-md-11"><%=monthst %>의 추천테마!</div>
			</div>
			<hr style="color: red; height: 5px; width: 90%; margin-left: 5%;">
			<div>
				<div class="inner" style="overflow: hidden;">
					<button class="prev pr4">&lt;</button>
					<button class="next nx4">&gt;</button>
					<div class="container2 cn4">
						<c:forEach var="ts" items="${tsReco3}" varStatus="status">
							<div class="img-slide">
								<a href="Ts_viewCon.do?visit_name=${ts.ts_name}"> <span><img
										src="${ts.ts_img}" class="img-size">${status.index+1}번</span> <span
									class="slide-text">${ts.ts_name}</span>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
				<jsp:include page="bottomBar.jsp"></jsp:include>
		<script>
			let a = 0;
			let cn1 = document.querySelector(".cn1")
			document.querySelector(".prev").addEventListener('click',
					function() {
						a = a + 30;
						if (a > 0) {
							a = 0
						}
						cn1.style.transform = 'translate(' + a + 'vw)';
					})
			if (a > 0) {
				a = 0
			}
			document.querySelector(".next").addEventListener('click',
					function() {
						a = a - 30
						if (a < -210) {
							a = 0
							cn1.style.transform = 'translate(0vw)';
						} else {
							cn1.style.transform = 'translate(' + a + 'vw)';
						}
					})
					/* 1번칸긑*/
			let b = 0;
			let cn2 = document.querySelector(".cn2")
			document.querySelector(".pr2").addEventListener('click',
					function() {
						b = b + 30;
						if (b > 0) {
							b = 0
						}
						cn2.style.transform = 'translate(' + b + 'vw)';

					})
			if (b > 0) {
				b = 0
			}

			document.querySelector(".nx2").addEventListener('click',
					function() {
						b = b - 30
						if (b < -210) {
							b = 0
							cn2.style.transform = 'translate(0vw)';
						} else {
							cn2.style.transform = 'translate(' + b + 'vw)';
						}
					})
					/*2번쨰칸끝*/
						let c = 0;
			let cn3 = document.querySelector(".cn3")
			document.querySelector(".pr33").addEventListener('click',
					function() {
						c = c + 30;
						if (c > 0) {
							c = 0
						}
						cn3.style.transform = 'translate(' + c + 'vw)';

					})
			if (c > 0) {
				c = 0
			}

			document.querySelector(".nx33").addEventListener('click',
					function() {
						c = c - 30
						if (c < -210) {
							c = 0
							cn3.style.transform = 'translate(0vw)';
						} else {
							cn3.style.transform = 'translate(' + c + 'vw)';
						}
					})
					/* 3번째칸 끝 */
			let d = 0;
			let cn4 = document.querySelector(".cn4")
			document.querySelector(".pr4").addEventListener('click',
					function() {
						d = d + 30;
						if (d > 0) {
							d = 0
						}
						cn4.style.transform = 'translate(' + d + 'vw)';

					})
			if (d> 0) {
				d = 0
			}

			document.querySelector(".nx4").addEventListener('click',
					function() {
						d = d - 30
						if (d < -210) {
							d = 0
							cn4.style.transform = 'translate(0vw)';
						} else {
							cn4.style.transform = 'translate(' + d + 'vw)';
						}
					})
					/* 4번째칸 끝 */
		</script>
	
	
</body>
</html>