<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form method="post" action="update_Pw_Form">
				<div class="w3-center w3-large w3-margin-top">
					<h3>비밀번호 찾기</h3>
				</div>
				<div>
					<p>
						<label>아이디</label>
						<input class="w3-input" type="text" id="id" name="id" required>
					</p>
					<p>
						<label>인증문자</label>
						<input class="w3-input" type="password" id="chk_num" name="chk_num" required>
					</p>
					<p class="w3-center" id="btnLeft">
						<button type="submit" id=findPwBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 찾기</button>
					</p>
					<p class="w3-center" id="btnRight">
						<button type="submit" id=chk_btn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">인증 확인</button>
					</p>
					<p>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
					</p>
				</div>
			</form>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#findPwBtn").click(function(){
		 let email = $("#id").val();

	$.ajax({url:"/sendPw",
		 	data:"emailAddress="+email,
			dataType:"json"}
		).done(function(data){
			if(eval(data[1])){
				num = data[0];
				alert("메일이 전송되었습니다. 인증문자 입력 확인 후 비밀번호를 변경해주세요.")
			}
		}); 
	})//메일 인증
	
	$("#chk_btn").click(function(){
		let ck_num = $("#chk_num").val();
		if(ck_num == num){
			alert("인증이 확인되었습니다.");
			location.replace('update_Pw_Form.jsp');
		}else{
			alert("인증 실패했습니다. 다시 확인하세요.");
		}
	})//인증 번호 확인
})
</script>
</body>
</html>