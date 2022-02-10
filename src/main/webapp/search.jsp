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
	<form action="SearchCon.do">
		<input type="text" name="search_word">
		<button type="submit">검색</button>
	</form>
	<c:choose>
		<c:when test="${not empty searchedTsList}">
			<h1>관광지</h1>
			<c:forEach items="${searchedTsList }" var="ts">
				<h3>${ts.ts_name}</h3>
			</c:forEach>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${not empty searchedResList}">
			<h1>음식점</h1>
			<c:forEach items="${searchedResList}" var="res">
				<h3>${res.ts_name}</h3>
			</c:forEach>
		</c:when>
	</c:choose>
</body>
</html>