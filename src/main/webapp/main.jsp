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
<title>Do you know Gwangju?</title>
</head>
<body>
<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<jsp:include page="topBar.jsp"></jsp:include>

	<!-- 메인 이미지 -->
	<div class="inner" style="overflow: hidden;">
		<div class="row img_sizebig"
			style="background-image: url(img/main/plz11.png);">
			<h1 class="titi">지금 우리 광주는</h1>
			<hr style="color: black; width: 100%; height: 15px;">
		</div>
	</div>
	<!-- <hr style="color: red;"> -->
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

			<!-- 컨텐츠 2 -->
			<div class="row top3">
				<div class="col-md-1"></div>
				<div class="col-md-11">추천</div>
			</div>
			<hr style="color: red; height: 5px; width: 90%; margin-left: 5%;">
			<div>
				<div class="inner" style="overflow: hidden;">
					<button class="prev pr2">&lt;</button>
					<button class="next nx2">&gt;</button>
					<div class="container2 cn2">
						<a href="ts_view.html">
							<div class="img-slide">
								<span><img src="img/chucun/bo1.PNG" class="img-size"></span>
								<span class="silde-text">1번</span>
							</div>
						</a>
					</div>
				</div>
			</div>
			
		<jsp:include page="bottomBar.jsp"></jsp:include>




		<!-- <script src="assets/js/main.js"></script> -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/
    bootstrap.bundle.min.js">
			
		</script>
		<!-- 			<왜팔로 들가면 안되냐 필요없긴함 걍 대충하자 > -->
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
						if (b < -30) {
							b = 0
							cn2.style.transform = 'translate(0vw)';
						} else {
							cn2.style.transform = 'translate(' + b + 'vw)';
						}
					})
		</script>
</body>
</html>