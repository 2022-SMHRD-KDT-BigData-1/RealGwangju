<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>선호도 조사</title>
</head>
<body>
<jsp:include page="topBar.jsp"></jsp:include>

<form action="preferenceCon.do" method="post">
<div class=ref>
	<img src="img/character/gw1.png"class ="bgc1">
	<img src="img/character/gw2.png"class ="bgc2">
	<div style="margin-top: 150px">
		<h1 style="border-bottom: solid 3px rgba(255,0,0,.3);margin-bottom : 30px;">선호도조사!</h1>
	
	</div>
	<div style="margin-top: 50px;" class="checks">
		
		    <p >좋아하는 장소</p>
		 
      자연과함께<input type="checkbox" name = "place" value="1a">
      문화유적지<input type="checkbox" name = "place" value="2a"> 
      도심지<input type="checkbox" name = "place" value="3a"> 
	</div>
		<div style="margin-top: 50px;"class="checks">
		    <p>사람이 많은곳?</p>
		많다<input type="checkbox" name = "human" value="1b">
      적다<input type="checkbox" name = "human" value="2b"> 
  
	</div>
		<div style="margin-top: 50px;"class="checks">
		    <p>좋아하는 분위기</p>
		  잔잔한<input type="checkbox" name = "feel" value="1c">
      북적북적<input type="checkbox" name = "feel" value="2c"> 
      편안한<input type="checkbox" name = "feel" value="3c"> 
	</div>
		<div style="margin-top: 50px;"class="checks">
	    <p>여행은 누구랑!?</p>
		  혼자서<input type="checkbox" name = "travel" value="1d">
      둘이서<input type="checkbox" name = "travel" value="2d"> 
      여럿이서<input type="checkbox" name = "travel" value="3d"> 
	</div>
		<div style="margin-top: 50px;"class="checks">
		    <p>여행 경비는</p>
		  많이 쓴다<input type="checkbox" name = "money" value="1e">
      조금 쓴다<input type="checkbox" name = "money" value="2e"> 
      적당히?<input type="checkbox" name = "money" value="3e"> 
	</div>
			<div style="margin-top: 50px;"class="sub">
			<input type="submit" value="go">
			</div>

</div>
</form>
	<jsp:include page="bottomBar.jsp"></jsp:include>
</body>
</html>