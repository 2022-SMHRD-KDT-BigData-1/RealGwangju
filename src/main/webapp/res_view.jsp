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
	href="https://cdn.jsdelivr.net/npm/boorestrap@5.1.3/dist/css/boorestrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>view</title>
<link rel="stylesheet" type="text/css" href="asseres/css/main.css">
</head>
<body>
	<jsp:include page="topBar.jsp"></jsp:include>
	<div class="container r_view">
		<div class="top_view_img">
			<!-- <h1 style="padding-bottom: 20px;"> 아무튼 여기에 무슨 제목을 넣어야되는데</h1> -->
			<ul class="view_img_line">
				<li class="slide_1"><img src="${resInfo.res_img}"	class="view_img"></li>
			</ul>
			<button class="pr3">&lt;</button>
			<button class="nx3">&gt;</button>
		</div>
		<div class="view_title">
			<!-- 이름 -->
			<p><h1>${resInfo.res_name}</h1></p>
			<!-- 주소 -->
			<p>주소 : ${resInfo.res_add}</p>
			<!-- 전화번호 -->
			<p>번호 : ${resInfo.res_tel}</p>
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
			location.href = 'LikeCon.do?res_name=${resInfo.res_name}';
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
		src="https://cdn.jsdelivr.net/npm/boorestrap@5.1.3/dist/js/
            boorestrap.bundle.min.js">
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
		<div class="view_sul">${resInfo.res_info}</div>
		<div class="view_map">
			<!-- 지도 -->
			지도가 들어갑ㄴ디ㅏ
		</div>
		<div class="view_riew">
			<c:choose>
				<c:when test="${empty member}">
					<div class="review_nologin">
					<textarea class="textin" placeholder="로그인 후에 리뷰작성이 가능합니다!" disabled></textarea>
					<!-- <input type="textbox" class = "textin" value="  리뷰가들어갑니다^^"> -->
					<button class="textinbtn" disabled="disabled">작성</button>
					</div>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${empty myReview}">
							<div class="review_yeslogin">
								<form action="WriteReviewCon.do?visit_name=${resInfo.res_name}" method="post">
									<textarea class="texttitle" name="title" placeholder="제목을 작성해주세요"></textarea>
									<textarea class="textin" name ="content" placeholder="리뷰를 작성해주세요"></textarea>
									<!-- <input type="textbox" class = "textin" value="  리뷰가들어갑니다^^"> -->
									<button class="textinbtn" type="submit">작성</button>
								</form>
							</div>
						</c:when>
						<c:otherwise>
						<form action="">
							<ul class="review_main">
								<li><span>내가 작성한 리뷰</span></li>
								<li class="review_in">
									<p class="review_id" style="padding-left: 5%;">
									<p style="padding-left: 5%">${myReview.re_title}</p>
									<span style="padding-left: 70%; position: relative;">${myReview.re_date}</span>
									<span style="padding-left: 5%">${member.mem_nick}</span>
									<hr style="color: black;">
									<p style="padding-left: 2%;">
										<img src="img/other/like.PNG" class="review_img">
										 ${myReview.re_content}
									</p>
									<P class="deleteandrebuild">
										<!-- <button class="modify" type="submit">수정</button> -->
										<button type="button" class="delete">x</button>
									</P>
								</li>
							</ul>
						</form>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			
			<ul class="review_main">
				<!-- review_no는 리뷰가 하나도 없을 떄 ul안에서 실행 -->
				<c:choose>
					<c:when test="${empty allReview}">
						<li class="review_no" style="text-align: center;">
						<P style="padding-left: 2%;">리뷰가 없습니다. 리뷰를 작성해 주세요.</P>
						</li>
					</c:when>
					<c:otherwise>
						<c:forEach items="${allReview}" var="re">
							<li class="review_in">
								<p class="review_id" style="padding-left: 5%;">
								<p style="padding-left: 5%">${re.re_title}</p> <span
								style="padding-left: 70%; position: relative;">${re.re_date}</span>
								<span style="padding-left: 5%">${re.mem_nick}</span>
								<hr style="color: black;">
								<P style="padding-left: 2%;">
									<img src="img/other/like.PNG" class="review_img"> ${re.re_content}
								</P>
						</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</ul>

		</div>

	</div>
<script>
	$('.modify').click(function(){
		location.href = 'ModifyReviewCon.do?visit_name=${resInfo.res_name}';
	});
	$('.delete').click(function(){
		location.href = 'DeleteReviewCon.do?visit_name=${resInfo.res_name}';
	});
</script>
</body>
</html>