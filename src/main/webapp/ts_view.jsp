<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>view</title>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
</head>
<body>
	<c:set var="visit_lat" value="${tsInfo.ts_lat}" scope="request"></c:set>
	<c:set var="visit_lng" value="${tsInfo.ts_lng}" scope="request"></c:set>
	<c:set var="visit_name" value="${tsInfo.ts_name}" scope="request"></c:set>
	<jsp:include page="topBar.jsp"></jsp:include>
	<div class="container r_view">
		<div class="top_view_img">
			<!-- <h1 style="padding-bottom: 20px;"> 아무튼 여기에 무슨 제목을 넣어야되는데</h1> -->
			<ul class="view_img_line">
				<li class="slide_1"><img src="${tsInfo.ts_img}"	class="view_img"></li>
			</ul>
			<button class="pr3">&lt;</button>
			<button class="nx3">&gt;</button>
		</div>
		<div class="view_title">
			<!-- 이름 -->
			<p><h1>${tsInfo.ts_name}</h1></p>
			<!-- 주소 -->
			<p>주소 : ${tsInfo.ts_add}</p>
			<!-- 전화번호 -->
			<p>번호 : ${tsInfo.ts_tel}</p>
			<p>
				<button class="gbtn">
					<span class="heart"> &#x2661;</span> 찜하기
				</button>
			</p>
		</div>
	</div>
	<!-- 사진3개만가능 -->
	<script type="text/javascript">
		$('.gbtn').click(function(){
			location.href = 'LikeCon.do?ts_name=${tsInfo.ts_name}&kind=?ts';
		});
		// 조정버튼
		let a = 1;
		$('button.pr3').click(function() {
			if (a == 1) {
				a = 3;
				$('.slide_1').css('opacity', 0);
				$('.slide_3').css('opacity', 1);

			} else {
				$('.slide_' + a + '').css('opacity', 0);
				$('.slide_' + (a - 1) + '').css('opacity', 1);
				a = a - 1;
			}
			$('.pr3').prop('disabled', false);
		})

		$('button.nx3').click(function() {

			$('.slide_' + a + '').css('opacity', 0);
			$('.slide_' + (a + 1) + '').css('opacity', 1);
			a = a + 1;
			if (a > 3) {
				a = 1;
				$('.slide_' + 3 + '').css('opacity', 0);
				$('.slide_' + a + '').css('opacity', 1);
			}
		})

	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/
            bootstrap.bundle.min.js">
	</script>
	<div class="view_li">
		<ul>
			<!-- 건드리지말기 -->
			<li class="view_tab"><button class="sul">설명</button></li>
			<li class="view_tab"><button class="posi">위치</button></li>
			<li class="view_tab"><button class="riew">리뷰</button></li>
		</ul>
			<hr>
	</div>
	<script>
		$('button.sul').click(function() {
			$('.view_map').css('opacity', 0);
			$('.view_sul').css('opacity', 1);
			$('.view_riew').css('opacity', 0);

		})
		$('button.posi').click(function() {
			$('.view_map').css('opacity', 1);
			$('.view_sul').css('opacity', 0);
			$('.view_riew').css('opacity', 0);
		})
		$('button.riew').click(function() {
			$('.view_map').css('opacity', 0);
			$('.view_sul').css('opacity', 0);
			$('.view_riew').css('opacity', 1);

		})
	</script>
	<div class="view_result">
		<!-- 설명 -->
		<div class="view_sul">${tsInfo.ts_info}</div>
		<div class="view_map">
		<jsp:include page="kakaoCaTest6.jsp"></jsp:include>
		</div>
		<div class="view_riew">
		<jsp:include page="visit_view_review.jsp"></jsp:include>
		</div>


	</div>
<script>
	$('.modify').click(function(){
		location.href = 'ModifyReviewCon.do?visit_name=${tsInfo.ts_name}';
	});
	$('.delete').click(function(){
		location.href = 'DeleteReviewCon.do?visit_name=${tsInfo.ts_name}';
	});
</script>
</body>
</html>