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
<title>Insert title here</title>
<script src="assets/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="topBar.jsp"></jsp:include>

	<div class="join_main">
	<h1>로그인 페이지</h1>
		<form action="LoginCon.do" method="post">
			<table>
				<tr>
					<td class="table-1" name="id">아이디</td>
					<td class="table-2"><input type="text" name="id"></td>
				</tr>
				<tr>
					<td class="table-1">비밀번호</td>
					<td class="table-2"><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="submit" value="로그인"
						style="background-color: white; border-radius: 10%;"></td>

				</tr>
			</table>
		</form>
	</div>

<jsp:include page="bottomBar.jsp"></jsp:include>
<!-- 	<form action="LoginCon.do" method="post">
		<table border="1">
			<tr>
				<td>ID:</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>PW:</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인"></td>
			</tr>

		</table>
	</form> -->
</body>
</html>