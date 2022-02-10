<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>

</head>
<body>
<jsp:include page="topBar.jsp"></jsp:include>

<form action="DeleteLikeListCon.do">
<input type="submit" value="선택삭제"	style="background-color: white; border-radius: 10%;">
<!-- <button>전체선택</button> -->
	<c:choose>
		<c:when test="${empty likeList}">
			<h2>찜목록이 없어요</h2>
		</c:when>
		<c:otherwise>
			<c:forEach var="e" items="${likeList}">
			<div>
				<input type="checkbox" name="delete_ts_nameList" value="${e.ts_name}">
				<a href="Ts_viewCon.do?ts_name=${e.ts_name}">
					<img src="${e.ts_img}">
					<span>${e.ts_name}</span>
				</a>
			</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</form>
<jsp:include page="bottomBar.jsp"></jsp:include>
</body>
</html>