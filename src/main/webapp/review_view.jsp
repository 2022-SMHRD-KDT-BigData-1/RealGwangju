<%@page import="model.ReviewDAO"%>
<%@page import="model.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
ReviewDAO dao = new ReviewDAO();
reviewList = dao.selectAllReview();
%> --%>
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
			<p style="text-align: left; margin-left: 5%; font-size: 20px">ID : 작성자 아이디</p>
			<p style="text-align: left; margin-left: 5%">제목이 들어갈 공간</p>
			<img src ="img/main/plz22.png" class ="review_view_img">
		<!-- "img/other/noimg.PNG"이미지가 없을때 사용하는 png파일 -->
			<p style="text-align: left; margin-left: 5%;  margin-right: 5%; 
			font-size: 20px; margin-top: 50px">리뷰내용이 들어간다 리뷰내용이 들어간다
			 리뷰내용이 들어간다 리뷰내용이 들어간다 리뷰내용이 들어간다 </p>
		</div>
	

	</div>
	<div class ="choice_review">
		<h2 >최근 게시물</h2><span><a href="review.jsp">전체보기</a></span>
	
	</div>
	
	
		<div class="near_review">
	
		<!-- 최근게시물 -->
			<div class ="near_review_img" style="margin-right: 3%">
				<img src="img/other/noimg.PNG" class ="near_review_list">
				<p><a href="review_view.jsp">제목</a></p>
			</div>
			
				<div class ="near_review_img">
				<img src="img/other/noimg.PNG" class ="near_review_list">
					<p><a href="review_view.jsp">제목</a></p>
			</div>
		</div>
				
		<jsp:include page="bottomBar.jsp"></jsp:include>
		
</body>
</html>