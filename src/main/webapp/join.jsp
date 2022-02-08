<%@page import="model.MemberDAO"%>
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
<title>회원가입</title>
<style type="text/css">
table {
	width: 500px
}
</style>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">

</head>
<body>


	<div class="join_main"><!--  -->
		<table>
			<tr>
				<td class="table-1">아이디</td>
				<td class="table-2"><input type="text" name="id"
					class="input_id"> <font id="checkId" size="2"></font></td>
			</tr>
			<tr>
				<td class="table-1">비밀번호</td>
				<td class="table-2"><input type="password" name="pw" id="pw"
					onchange="check_pw()"></td>
			</tr>
			<tr>
				<td class="table-1">비밀번호 확인</td>
				<td class="table-2"><input type="password" name="pw2" id="pw2"
					onchange="check_pw()"><font id="checkPw" size="2"></font></td>
			</tr>
			<tr>
				<td class="table-1">닉네임</td>
				<td class="table-2"><input type="text" name="nick"></td>
			</tr>
			<tr>
				<td class="table-1">성별</td>
				<td class="table-2" colspan="2">
				남자<input type="radio" name="gen" value="m">
				여자<input type="radio" name="gen" value="f">
				비공개<input type="radio" name="gen" value="">
				</td>
			</tr>
			<tr>
				<td class="table-1">나이</td>
				<td class="table-2"><input type="number"></td>

			</tr>

			<tr>
				<td colspan="3" style="text-align: center;"><a
					href="real_main.html"> <input type="submit" value="가입하기"
						style="background-color: white; border-radius: 10%;">
				</a></td>

			</tr>

		</table>
	</div>


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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/
        bootstrap.bundle.min.js">
		
	</script>
</body>
</html>