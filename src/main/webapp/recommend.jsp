<%@page import="model.VisitDAO"%>
<%@page import="model.TsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
ArrayList<TsDTO> tsRank10 = new ArrayList<TsDTO>();
VisitDAO dao = new VisitDAO();
tsRank10 = dao.selectRank10();
request.setAttribute("tsRank10", tsRank10);
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
<title>추천</title>
</head>
<body>
<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<jsp:include page="topBar.jsp"></jsp:include>
	
	
	
</body>
</html>