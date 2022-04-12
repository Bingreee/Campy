<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>비밀번호 변경</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form action="updatePw" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h3>비밀번호 변경</h3>
				</div>
				<div>
					<p>
						<label>아이디</label>
						<input class="w3-input" type="text" id="id" name="id" value="${id}" required>
					</p>
					<p>
						<label>변경할 비밀번호</label>
						<input class="w3-input" type="password" id="pw" name="pw" required>
					</p>
					 <div class="pw regex"></div>
					<p>
						<label>비밀번호 확인</label>
						<input class="w3-input" type="password" id="pw2" name="pw2" required>
					</p>
					<div class="repw regex"></div>
					<p class="w3-center" id="btnLeft">
						<button type="submit" id=updatePwBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
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
	//비밀번호 유효성 검사
	 $("#pw").on("input",function(){
	        var regex = /^[A-Za-z\d]{8,12}$/;
	        var result = regex.exec($("#pw").val())
	        
	        if(result != null){
	            $(".pw.regex").html("");
	        }else{
	            $(".pw.regex").html("영어대소문자,숫자 8-11자리");
	            $(".pw.regex").css("color","red")
	        }
	    });
	   //비밀번호 확인    
	  $("#pw2").on("keyup",function(){
	        if($("#pw").val()==$("#pw2").val()){
	            $(".repw.regex").css("color","black").html("비밀번호가 일치합니다"); 
	        }else{
	        	$(".repw.regex").css("color","red").html("비밀번호가 일치하지않습니다"); 
	        }
	    })
})
</script>
</body>
</html>