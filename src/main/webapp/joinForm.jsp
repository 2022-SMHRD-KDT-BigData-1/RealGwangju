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
	<form action="idCheckCon" method="post">
	<table border="1px solid black">
		<tr>
			<td width="80">ID</td>
			<td>
				<input type="text" name="id" class="input_id">
				<font id="checkId" size="2"></font>
			</td>
			</tr>
		<tr>
			<td>PW</td>
			<td>
				<input type="password" name="pw" class="pw" id="password_1">
			</td>
		</tr>
		<tr>
			<td>PW 확인</td>
			<td>
				<input type="password" name="pw2" class="pw" id="password_2">
				<font id="checkPw" size="2"></font>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name">
			</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>
				<input type="text" name="display_name">
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="phone">
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="address">
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<span>남자</span>
				<input type="radio" name="sex" value="man">
				<span>여자</span>
				<input type="radio" name="sex" value="woman">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value = "가입">
			</td>
		</tr>
	</table>
</form>
	<script src="jquery-3.6.0.min.js"></script>
	<script>
		$('.input_id').focusout(function() {
			let userId = $('.input_id').val();
			
			$.ajax({
				url : "idCheckCon",
				type : "post",
				data : {mem_id : userId},
				dataType : 'json',
				success : function(result){
					if(result == 0){
						$("#checkId").html('사용할 수 없는 아이디입니다.');
						$("#checkId").attr('color','red');
					} else{
						$("#checkId").html('사용 가능한 아이디입니다.');
						$("#checkId").attr('color','blue');
					}
				},
				error : function(){
					$("#checkId").html('오류');
					$("#checkId").attr('color','red');
				}
			})
		})
	</script>
</body>
</html>