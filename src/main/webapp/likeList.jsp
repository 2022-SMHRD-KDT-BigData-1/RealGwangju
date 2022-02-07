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


	<c:choose>
		<c:when test="${empty likeList}">
			<h2>찜목록이 없어요</h2>
		</c:when>
		<c:otherwise>
			<c:forEach var="e" items="${likeList}">
				<h2>${e}</h2>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</body>
</html>