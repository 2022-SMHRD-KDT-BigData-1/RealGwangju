<%@page import="model.SearchDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.TsDTO"%>
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
					<a href="searchMenuCon.do?visit_kind=ts" class="choice_btn">관광지</a>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<a href="searchMenuCon.do?visit_kind=res" class="choice_btn">식당</a>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<a href="searchMenuCon.do?visit_kind=cf" class="choice_btn">카페</a>
				</div>
				<div class="col-md-2" style="border: solid black 1px;">
					<a href="searchMenuCon.do?visit_kind=acc" class="choice_btn">숙소</a>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
				<div class="col-md-2" style="border: solid black 1px;">
					<a href="searchMenuCon.do?visit_kind=p" class="choice_btn">주차장</a>
					<!-- 					<a href="searchSeeMoreCon.do?visit_kind=p&search_word=&pageCount=" class="choice_btn">주차장</a> -->
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
				<em class="search_rank">1</em><a class="search_text" href="SearchCon.do?search_word=${searchedPopularWordList[0]}">${searchedPopularWordList[0]}</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank">2</em><a class="search_text" href="SearchCon.do?search_word=${searchedPopularWordList[1]}">${searchedPopularWordList[1]}</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank">3</em><a class="search_text" href="SearchCon.do?search_word=${searchedPopularWordList[2]}">${searchedPopularWordList[2]}</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">4</em><a class="search_text" href="SearchCon.do?search_word=${searchedPopularWordList[3]}">${searchedPopularWordList[3]}</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">5</em><a class="search_text" href="SearchCon.do?search_word=${searchedPopularWordList[4]}">${searchedPopularWordList[4]}</a>
			</div>

			<div class="col-md-2"></div>
			
			<div class="col-md-2">
				<em class="search_rank2">6</em><a class="search_text" href="SearchCon.do?search_word=${searchedPopularWordList[5]}">${searchedPopularWordList[5]}</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">7</em><a class="search_text" href="SearchCon.do?search_word=${searchedPopularWordList[6]}">${searchedPopularWordList[6]}</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">8</em><a class="search_text" href="SearchCon.do?search_word=${searchedPopularWordList[7]}">${searchedPopularWordList[7]}</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">9</em><a class="search_text" href="SearchCon.do?search_word=${searchedPopularWordList[8]}">${searchedPopularWordList[8]}</a>
			</div>
			<div class="col-md-2">
				<em class="search_rank2">10</em><a class="search_text" href="SearchCon.do?search_word=${searchedPopularWordList[9]}">${searchedPopularWordList[9]}</a>
			</div>

			<div class="col-md-1" style="padding-bottom: 20px;"></div>
		</div>

	</div>

	<div class="search_result">

		<c:choose>

			<c:when test="${visit_kind eq 'ts'}">
				<p class="dbdb">
					<span style="text-align: left; margin-left: 5%;">관광지</span> <span
						style="margin-right: 5%"></span>
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

			<c:when test="${visit_kind eq 'res'}">
				<p class="dbdb">
					<span style="text-align: left; margin-left: 5%;">음식점</span> <span
						style="margin-right: 5%"></span>
				</p>
				<div class="gong">
					<ul class="result_box">
						<!-- 한칸을 area div로 묶음 -->
						<c:forEach items="${searchedResList}" var="res">
							<div class="area">
								<li class="result_boxin"><a
									href="Res_viewCon.do?visit_name=${res.res_name}"
									class="result_link"> <span> <img
											src="${res.res_img}" class="inimg">
									</span> <span class="intext"> <span>${res.res_name}</span> <!--  <span>설명이나
											주소</span --> <!-- 3칸까지 성공 --> <!-- <span>줄바꿈</span> -->
									</span>
								</a></li>
							</div>
						</c:forEach>
						<!-- 여기까지 1칸 -->
					</ul>
				</div>
			</c:when>

			<c:when test="${visit_kind eq 'cf'}">
				<p class="dbdb">
					<span style="text-align: left; margin-left: 5%;">카페</span> <span
						style="margin-right: 5%"></span>
				</p>
				<div class="gong">
					<ul class="result_box">
						<!-- 한칸을 area div로 묶음 -->
						<c:forEach items="${searchedCfList}" var="cf">
							<div class="area">
								<li class="result_boxin"><a
									href="Cf_viewCon.do?visit_name=${cf.cf_name}"
									class="result_link"> <span> <img src="${cf.cf_img}"
											class="inimg">
									</span> <span class="intext"> <span>${cf.cf_name}</span>
									</span>
								</a></li>
							</div>
						</c:forEach>
					</ul>
				</div>
			</c:when>

			<c:when test="${visit_kind eq 'acc'}">
				<p class="dbdb">
					<span style="text-align: left; margin-left: 5%;">숙박</span> <span
						style="margin-right: 5%"></span>
				</p>
				<div class="gong">
					<ul class="result_box">
						<!-- 한칸을 area div로 묶음 -->
						<c:forEach items="${searchedAccomList}" var="acc">
							<div class="area">
								<li class="result_boxin"><a
									href="Accom_viewCon.do?visit_name=${acc.acc_name}"
									class="result_link"> <span> <c:choose>
												<c:when test="${acc.acc_img eq '-'}">
													<img src="img/other/noimg.PNG" class="inimg">
												</c:when>
												<c:otherwise>
													<img src="${acc.acc_img}" class="inimg">
												</c:otherwise>
											</c:choose>
									</span> <span class="intext"> <span>${acc.acc_name}</span>
									</span>
								</a></li>
							</div>
						</c:forEach>
					</ul>
				</div>
			</c:when>

			<c:when test="${visit_kind eq 'p'}">
				<p class="dbdb">
					<span style="text-align: left; margin-left: 5%;">주차장</span> <span
						style="margin-right: 5%"></span>
				</p>
				<div class="gong">
					<ul class="result_box">
						<!-- 한칸을 area div로 묶음 -->
						<c:forEach items="${searchedPList}" var="p">
							<div class="area">
								<li class="result_boxin"><a
									href="P_viewCon.do?visit_name=${p.p_name}" class="result_link">
										<span> <!-- <img src="img/other/noimg.PNG" class="inimg"> -->
									</span> <span class="intext"> <span>${p.p_name}</span>
									</span>
								</a></li>
							</div>
						</c:forEach>
					</ul>
				</div>
			</c:when>

		</c:choose>
		<div class="" style="text-align: center; font-size: 30px">
			<c:choose>
				<c:when test="${paging.prev}">
					<a
						href="searchSeeMoreCon.do?visit_kind=${visit_kind}&page=${paging.beginPage-1}&pageCount=">◀</a>
				</c:when>
			</c:choose>
			<c:forEach begin="${paging.beginPage}" end="${paging.endPage}"
				step="1" varStatus="status">
				<a
					href="searchSeeMoreCon.do?visit_kind=${visit_kind}&page=${status.index}&pageCount="
					class="bottom_count${status.index}">${status.index}</a>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.next}">
					<a
						href="searchSeeMoreCon.do?visit_kind=${visit_kind}&page=${paging.endPage+1}&pageCount=">▶</a>
				</c:when>
			</c:choose>

		</div>
	</div>
	<script>
		$(".bottom_count"+${page}).css('color','red');
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/
    bootstrap.bundle.min.js"></script>
</body>
</html>