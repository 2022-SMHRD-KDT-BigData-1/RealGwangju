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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>검색창</title>
<!-- <link rel="stylesheet" type="text/css" href="sub.css"> -->
<link rel="stylesheet" type="text/css" href="assets/css/main.css">

</head>
<body id="all-content">
	<jsp:include page="topBar.jsp"></jsp:include>
	<!-- 검색창 -->
	<div class="cointainer" style="text-align: center;">
		<div class="search_line">
			<!-- <img src="/img/other/m_glass.PNG"> -->
			<form action="SearchCon.do">
				<input type="text" name="search_word" class="search_bar">
				<button type="submit" class="search_button">검색</button>
			</form>

		</div>
		<div class="choice_box" style="text-align: center;">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">통합검색</button>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">관광지</button>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">식당</button>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">카페</button>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">주차장</button>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">숙소</button>
				</div>

				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">숙소</button>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">숙소</button>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">통합검색</button>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">관광지</button>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">식당</button>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<button class="choice_btn">카페</button>
				</div>
				<div class="col-md-2"></div>
			</div>



		</div>

		<div class="row search_favorite">
			<div class="col-md-2"></div>
			<div class="col-md-10"
				style="text-align: left; padding-bottom: 20px; padding-top: 20px;">인기검색어</div>

			<div class="col-md-2"></div>
			<div class="col-md-2">
				<em class="search_rank">1</em><a class="search_text"
					href="search_react.html">결과가길tnm</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank">2</em><a class="search_text" href="#">헤헤2</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank">3</em><a class="search_text" href="#">헤헤3</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">4</em><a class="search_text" href="#">헤헤4</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">5</em><a class="search_text" href="#">헤헤5</a>
			</div>

			<div class="col-md-2"></div>
			<div class="col-md-2">
				<em class="search_rank2">6</em><a class="search_text" href="#">헤헤6</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">7</em><a class="search_text" href="#">헤헤7</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">8</em><a class="search_text" href="#">헤헤8</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">9</em><a class="search_text" href="#">헤헤9</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">10</em><a class="search_text" href="#">헤헤0</a>
			</div>
			<div class="col-md-1" style="padding-bottom: 20px;"></div>

		</div>

	</div>


	<div class="search_result">
		<c:choose>
			<c:when test="${!empty searchedTsList}">

				<p class="dbdb">
					<span style="text-align: left; margin-left: 5%;">관광지</span>
				</p>
				<div class="gong">
					<ul class="result_box">
						<!-- 한칸을 area div로 묶음 -->
						<c:forEach items="${searchedTsList}" var="ts">
							<div class="area">
								<li class="result_boxin"><a
									href="Ts_viewCon.do?visit_name=${ts.ts_name}"
									class="result_link"> <span> <img src="${ts.ts_img}"
											class="inimg">
									</span> <span class="intext"> <span>${ts.ts_name}</span>
									</span>
								</a></li>
							</div>
						</c:forEach>
					</ul>
				</div>

			</c:when>
		</c:choose>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/
    bootstrap.bundle.min.js"></script>
</body>
</html>