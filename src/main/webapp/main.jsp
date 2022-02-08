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
		<c:when test="${empty member}">
			<a href="login.jsp">로그인</a>
			<br>
			<a href="join.jsp">회원가입</a>
			<br>
		</c:when>
		<c:otherwise>
			<a href="logout.jsp">로그아웃</a>
			<br>
		</c:otherwise>
	</c:choose>

	<a href="LikeListCon.do">찜목록</a>
	<br>
	<a href="Ts_viewCon.do?ts_name=광주우">ts_view</a>




</body>
</html>