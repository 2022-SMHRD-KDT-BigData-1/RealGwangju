<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<style type="text/css">
table {
	width: 500px
}
</style>


</head>
<body>

	<form action="JoinCon.do" method="post">
		<table border="1px solid black">
			<tr>
				<td width="80">ID</td>
				<td><input type="text" name="id" class="input_id"> <font
					id="checkId" size="2"></font></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pw" id="pw"
					onchange="check_pw()"></td>
			</tr>
			<tr>
				<td>PW 확인</td>
				<td><input type="password" name="pw2" id="pw2"
					onchange="check_pw()"><font id="checkPw" size="2"></font></td>
			</tr>

			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nick"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age"></td>
			</tr>

			<tr>
				<td>성별</td>
				<td><span>남자</span> <input type="radio" name="gen" value="m">
					<span>여자</span> <input type="radio" name="gen" value="f">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="회원가입"></td>
			</tr>
		</table>
	</form>
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script defer src="assets/js/main.js"></script>
	<script>
		function check_pw() {
			if (document.getElementById('pw').value != ''
					&& document.getElementById('pw2').value != '') {
				if (document.getElementById('pw').value == document
						.getElementById('pw2').value) {
					document.getElementById('checkPw').innerHTML = '비밀번호가 일치합니다.';
					document.getElementById('checkPw').style.color = 'blue';
				} else {
					document.getElementById('checkPw').innerHTML = '비밀번호가 일치하지 않습니다.';
					document.getElementById('checkPw').style.color = 'red';
				}
			}
		}
	</script>

</body>
</html>