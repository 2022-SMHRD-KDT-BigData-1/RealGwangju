
$('.input_id').focusout(function() {
	let InputId = $('.input_id').val();

	$.ajax({
		url: "idCheckCon",
		type: "post",
		data: { check_id: InputId },
		dataType: 'json',
		success: function(result) {
			if (result == 0) {
				$("#checkId").html('사용할 수 없는 아이디입니다.');
				$("#checkId").attr('color', 'red');
			} else {
				$("#checkId").html('사용 가능한 아이디입니다.');
				$("#checkId").attr('color', 'blue');
			}
		},
		error: function() {
			$("#checkId").html('오류');
			$("#checkId").attr('color', 'red');
		}
	})
})



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








