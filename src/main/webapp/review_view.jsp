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
	
	<div class="review_view"></div>
	
</body>
</html>