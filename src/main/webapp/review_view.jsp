<%@page import="model.ReviewDAO"%>
<%@page import="model.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int re_num= Integer.parseInt(request.getParameter("re_num"));
ReviewDTO review = new ReviewDTO();
ReviewDAO dao = new ReviewDAO();
review = dao.selectReview(re_num);
pageContext.setAttribute("review", review);

ArrayList<ReviewDTO> recentReviews = new ArrayList<ReviewDTO>();
recentReviews = dao.selectRecentReviews();
pageContext.setAttribute("recentReviews", recentReviews);
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
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>review_view</title>
<body>
	<jsp:include page="topBar.jsp"></jsp:include>
	
	<div class="review_view">
		<div class="review_view_all">
			<p style="text-align: left; margin-left: 5%; font-size: 20px">ID : ${review.mem_nick}</p>
			<p style="text-align: left; margin-left: 5%">${review.re_title}</p>
			<c:choose>
				<c:when test="${review.re_img ne 'images/uploadedReviewImages/null'}">
					<img src="${review.re_img}" class="review_list_img">
				</c:when>
				<c:otherwise>
					<img src="img/other/noimg.PNG" class="review_view_img">
				</c:otherwise>
			</c:choose>
		<!-- "img/other/noimg.PNG"이미지가 없을때 사용하는 png파일 -->
			<p style="text-align: left; margin-left: 5%;  margin-right: 5%; 
			<%-- font-size: 20px; margin-top: 50px"><%=review.getRe_content() %></p> --%>
			font-size: 20px; margin-top: 50px">${review.re_content}</p>
		</div>
	

	</div>
	<div class ="choice_review">
		<h2 >최근 게시물</h2><span><a href="ReviewCon.do">전체보기</a></span>
	</div>
	<div class="near_review">
	<!-- 최근게시물 -->
		<c:choose>
			<c:when test="${not empty recentReviews}">
				<c:forEach items="${recentReviews}" var="review">
					<div class ="near_review_img" style="margin-right: 3%">
						<c:choose>
							<c:when test="${review.re_img ne 'images/uploadedReviewImages/null'}">
								<a href="review_view.jsp?re_num=${review.re_num}">
								<img src="${review.re_img}" class="near_review_list">
								</a>
							</c:when>
							<c:otherwise>
								<a href="review_view.jsp?re_num=${review.re_num}">
								<img src="img/other/noimg.PNG" class="near_review_list">
								</a>
							</c:otherwise>
					</c:choose>
						<p><a href="review_view.jsp?re_num=${review.re_num}">${review.re_title}</a></p>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
<!-- 		<div class ="near_review_img">
			<img src="img/other/noimg.PNG" class ="near_review_list">
			<p><a href="review_view.jsp">제목</a></p>
		</div> -->
	</div>
				
		<jsp:include page="bottomBar.jsp"></jsp:include>
		
</body>
</html>