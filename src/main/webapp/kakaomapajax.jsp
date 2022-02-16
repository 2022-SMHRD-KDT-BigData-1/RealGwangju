<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./assets/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>관광지 정보 불러오기</h1>
	<table border = "1" id="start">
		<tr>
			<td>이름</td>
			<td>전화번호</td>
			<td>시간</td>
			<td>ct</td>
			<td>주소</td>
			<td>지역</td>
			<td>이미지</td>
			<td>설명</td>
			<td>조회수</td>
		</tr>
	</table>
	
	<button>정보 가져오기</button>
	
	<script src="jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		
	$("button").on("click", function(){
		$.ajax({
			url : "mapCon",
			dataType : "json", // dataType 넘겨받을 때의 데이터 타입을 약속
			success:function(result){
				// json 형식의 문자열로 넘어가짐
				// >>객체 타입으로 바꾸어 줘야함!!
				alert("성공");
				// json 형식의 문자열을 사용가능한 객체로 바꾸어 줄꺼에요
				console.log(JSON.parse(result[0]));
				// 받아온 데이터를 테이블에 추가해주세요!
				for(let i = 0; i<result.length; i++){
					// 현재 배열의 원소를 사용가능한 객체로 바꿔준다음에
					let data = JSON.parse(result[i]);	
					$("#start").append("<tr>" 
							+ "<td>" + data.title + "</td>"
							+ "<td>" + data.tel + "</td>"
							+ "<td>" + data.tiem + "</td>"
							+ "<td>" + data.ct + "</td>"
							+ "<td>" + data.add + "</td>"
							+ "<td>" + data.loc + "</td>"
							+ "<td>" + data.img + "</td>"
							+ "<td>" + data.deatil + "</td>"
							+ "<td>" + data.view + "</td>"
							+ "</tr>");	
				}
			},
			error : function(){
				alert("실패");
			}
		});
	});
	
	</script>
</body>
</html>