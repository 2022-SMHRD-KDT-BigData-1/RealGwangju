<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 페이지</h1>
   <todo여기 성별 나이를 버튼 형식 바꾸기>ㅣ혀ㅣㅕ혀ㅣㅣㅕㅎ 
	<form action="JoinCon.do" method="post">
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
				<td>NICK:</td>
				<td><input type="text" name="nick"></td>
			</tr>
			<tr>
				<td>age:</td>
				<td><input type="number" name="age"></td>
			</tr>
			<tr>
				<td>gen:</td>
				<td><input type="text" name="gen"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="회원가입"></td>
			</tr>

		</table>
	</form>
</body>
</html>