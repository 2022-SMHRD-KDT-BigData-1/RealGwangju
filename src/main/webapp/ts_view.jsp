<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="topBar.jsp"></jsp:include>

	<a href="LikeCon.do?ts_name=${tsInfo.ts_name}">찜하기</a>
	<br>
	<h2>ts_name : ${tsInfo.ts_name}</h2>
	<h2>ts_tel: ${tsInfo.ts_tel}</h2>
	<h2>ts_ct: ${tsInfo.ts_ct}</h2>
	<h2>ts_add : ${tsInfo.ts_add}</h2>
	<h2>ts_loc : ${tsInfo.ts_loc}</h2>
	ts_img : <img src="${tsInfo.ts_img}">
	<h2>ts_info : ${tsInfo.ts_info}</h2>
	<h2>ts_views : ${tsInfo.ts_views}</h2>
	
	
	
	<c:choose>
		<c:when test="${empty review}">
			<h2>리뷰작성페이지 출력</h2>
		</c:when>
		<c:otherwise>
			<h3>${review.re_date}</h3>
		</c:otherwise>
	</c:choose>


<jsp:include page="bottomBar.jsp"></jsp:include>
</body>
</html>