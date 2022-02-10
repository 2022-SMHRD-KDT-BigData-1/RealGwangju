<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<title>Insert title here</title>
</head>
<body>
<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<div class="containar">
		<!-- 최상단메뉴바 -->
		<div class="row top">
			<div class="col-md-5"></div>
			<div class="col-md-1">
				<a href="main.jsp">홈</a>
			</div>
			<div class="col-md-1">헤헤</div>
			<c:choose>
				<c:when test="${empty member}">
					<div class="col-md-3" style="text-align: right;">
						<a href="login.jsp">로그인</a>
					</div>
					<div class="col-md-1" style="text-align: left;">
						<a href="join.jsp">회원가입</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-md-1" style="text-align: left;">
						<a href="logout.jsp">로그아웃</a>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="col-md-1" style="text-align: left;">
				<a href="LikeListCon.do">찜목록</a>
			</div>

		</div>
		<hr style="color: red;">
		<!-- 상단메뉴바 -->
		<div class="row top2">
			<div class="col-md-1"></div>
			<div class="col-md-4 image-gwang " style="text-align: left;">
				<a href="main.jsp"> <img src="img/gwang.PNG "
					src="img/main_title.PNG " style="width: 38px; height: 38px;">
					<img src="img/main_title.PNG " style="height: 38px;">
				</a>

			</div>
			<div class="col-md-1 b">
				<a href="search.jsp">검색</a>
			</div>
			<div class="col-md-1 b">
				<A href="ts_view.html">추천</A>
			</div>
			<div class="col-md-1 b">메뉴</div>
			<div class="col-md-1 b">메뉴</div>

		</div>
		  <!-- 줄였을때 네비게이션바 -->
        <div class="row top2_active">
           <div class="nav_bar">
            <button class="nav_bar_button" onclick="clk()">
                <span class="nav_bar_img"> <img src="img/other/nav_icon (1).png">
                </span>
            </button>
            <hr style="color: red;">
            <div>
                <ul class="nav_list">
                    <li style="color: red;"> <img src="img/gwang.PNG "
                         style="width: 38px; height: 38px;"> 두유노광주
                         <!-- <button style="padding-left: 50%;
                         position: absolute;">x</button> -->
                         </li>
                    <li>  <a href="gwang_search.html">검색</a></li>
                    <li> <A href="ts_view.html">추천</A>    </li>
                    <li>리뷰</li>
                    <li>메뉴</li>
                </ul>
            </div>
         
           </div>
           <script type="text/javascript">
               function clk(){
                   if($('.nav_list').css('display')=='none'){
                    $('.nav_list').show();
                   }
                   else{
                    $('.nav_list').hide();
                   }
               }

           </script>
         
          <!-- <span class="navbar-toggler-icon"> -->
            

        </div>
	</div>
</body>
</html>