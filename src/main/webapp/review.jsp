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
<title>review</title>
<style>
.review_list_img:hover {
	border: blue 5px solid;
}

.page a{
    border-radius: 50%;
    height: 50px;
    width: 50px;
    color: red;
    border: 5px skyblue;
    opacity: 0.8;
    font-size: 60px;
}
</style>
</head>
<body>
	<jsp:include page="topBar.jsp"></jsp:include>
	<div class="review_list">
		<!-- div class="review_list_in"을 반복하면됨 -->
		<c:forEach var="re" items="${allReviewList}">
			<div class="review_list_in">
				<a href="review_view.jsp?re_num=${re.re_num}"> <c:choose>
						<c:when test="${re.re_img ne 'images/uploadedReviewImages/null'}">
							<img src="${re.re_img}" class="review_list_img">
						</c:when>
						<c:otherwise>
							<img src="img/other/noimg.PNG" class="review_list_img">
						</c:otherwise>
					</c:choose>
				</a>
				<div style="text-align: left; margin-left: 5%">
					${re.re_title}
					<hr style="width: auto; padding: 0; margin: 0;">
				</div>
				<div>${re.visit_name}</div>
				<div>${re.mem_nick}　　　　　${re.re_date}</div>
			</div>
		</c:forEach>
	</div>
	<div class="" style="text-align: center; font-size: 30px;">
		<c:choose>
			<c:when test="${paging.prev}">
				<a href="ReviewCon.do?page=${paging.beginPage-1}">◀</a>
			</c:when>
		</c:choose>
		<c:forEach begin="${paging.beginPage}" end="${paging.endPage}"
			step="1" varStatus="status">
			<div class="page">
			<a href="ReviewCon.do?page=${status.index}"
				class="bottom_count${status.index}">${status.index}</a>
			</div>
		</c:forEach>
		<c:choose>
			<c:when test="${paging.next}">
				<a href="ReviewCon.do?page=${paging.endPage+1}">▶</a>
			</c:when>
		</c:choose>
	</div>


	<script>
		$(".bottom_count"+${page}).css('color','red');
	</script>
</body>
</html>