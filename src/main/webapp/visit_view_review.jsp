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
			<div class="review_nologin">
				<textarea class="textin" placeholder="로그인 후에 리뷰작성이 가능합니다!" disabled></textarea>
				<!-- <input type="textbox" class = "textin" value="  리뷰가들어갑니다^^"> -->
				<button class="textinbtn" disabled="disabled">작성</button>
			</div>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${empty myReview}">
					<div class="review_yeslogin">
						<form action="WriteReviewCon.do?visit_name=${visit_name}"
							method="post" enctype="multipart/form-data">
							<!-- 	<textarea class="texttitle" name="title" placeholder="제목을 작성해주세요"></textarea> -->
							<input type="text" class="texttitle" name="title"
								placeholder="제목을 작성해주세요"></input>
							<textarea class="textin" name="content" placeholder="리뷰를 작성해주세요"></textarea>
							<!-- <input type="text" class="textin" name ="content" placeholder="리뷰를 작성해주세요"></input> -->
							<input type="file" name="reviewImg" value="이미지 첨부"
								style="width: 75%; margin-left: 10%;">
							<!-- <input type="textbox" class = "textin" value="  리뷰가들어갑니다^^"> -->
							<!-- <input class="textinbtn" type="submit"
								style="height: 60px; width: 75px; font-size: 30px;"></input> -->
							<button class="textinbtn" type="submit" style="height: 60px; width: 75px; font-size: 30px;">작성</button>
						</form>
					</div>
				</c:when>
				<c:otherwise>
					<form action="">
						<ul class="review_main">
							<li><span>내가 작성한 리뷰</span></li>
							<li class="review_in">
								<p class="review_id" style="padding-left: 5%;">
								<p style="padding-left: 5%">${myReview.re_title}</p> <span
								style="padding-left: 70%; position: relative;">${myReview.re_date}</span>
								<span style="padding-left: 5%">${member.mem_nick}</span>
								<hr style="color: black;">
								<p style="padding-left: 2%;">
									<c:choose>
										<c:when
											test="${myReview.re_img ne 'images/uploadedReviewImages/null'}">
											<img src="${myReview.re_img}" class="review_img">
										</c:when>
									</c:choose>
									${myReview.re_content}
								</p>
								<P class="deleteandrebuild">
									<!-- <button class="modify" type="submit">수정</button> -->
									<button type="button" class="delete">x</button>
								</P>
							</li>
						</ul>
					</form>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>

	<ul class="review_main">
		<!-- review_no는 리뷰가 하나도 없을 떄 ul안에서 실행 -->
		<c:choose>
			<c:when test="${empty allReview}">
				<li class="review_no" style="text-align: center;">
					<P style="padding-left: 2%;">리뷰가 없습니다. 리뷰를 작성해 주세요.</P>
				</li>
			</c:when>
			<c:otherwise>
				<c:forEach items="${allReview}" var="re">
					<li class="review_in">
						<p class="review_id" style="padding-left: 5%;">
						<p style="padding-left: 5%">${re.re_title}</p> <span
						style="padding-left: 70%; position: relative;">${re.re_date}</span>
						<span style="padding-left: 5%">${re.mem_nick}</span>
						<hr style="color: black;">
						<P style="padding-left: 2%;">
							<c:choose>
								<c:when
									test="${re.re_img ne 'images/uploadedReviewImages/null'}">
									<img src="${re.re_img}" class="review_img">
								</c:when>
							</c:choose>
							${re.re_content}
						</P>
					</li>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</ul>

</body>
</html>