<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 변경</title>
<style>
	.con {
	width:500px;
	margin:auto;
}
	
	.campy {
	display: flex;
	justify-content: center;
	margin-top: 150px;
	margin-bottom: 30px;
	}
	
	form {
	padding: 10px;
	}
	
	.input-box {
	position: relative;
	margin: 10px 0;
}

.input-box>input {
	background: transparent;
	border: none;
	border-bottom: solid 1px #88C6E5;
	padding: 20px 0px 5px 0px;
	font-size: 14pt;
	width: 100%;
}

input::placeholder {
	color: transparent;
}

input:placeholder-shown+label {
	color: #aaa;
	font-size: 14pt;
	top: 15px;
}

input:focus+label, label {
	color: #8aa1a1;
	font-size: 10pt;
	pointer-events: none;
	position: absolute;
	left: 0px;
	top: 0px;
	transition: all 0.2s ease;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	-o-transition: all 0.2s ease;
}

input:focus, input:not(:placeholder-shown) {
	border-bottom: solid 1px #8aa1a1;
	outline: none;
}

#updatePwBtn {
	background: linear-gradient(to left, rgb(41, 123, 255), rgb(51, 203, 255));
	border: none;
	color: white;
	border-radius: 8px;
	width: 100%;
	height: 35px;
	font-size: 14pt;
	margin-top: 70px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
}

#cancel {
	background: linear-gradient(to left, rgb(41, 123, 255), rgb(51, 203, 255));
	border: none;
	color: white;
	border-radius: 8px;
	width: 225px;
	height: 35px;
	font-size: 14pt;
	margin-rigth: 20px;
	margin-bottom: 300px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
}

a {
	text-decoration-line: none;
	color: #1ea1f7;
	margin: 10px auto;
}

#forgot {
	text-align: center;
	font-size: 12pt;
	color: rgb(164, 164, 164);
	margin: 10px 0px;
}

.content{
	margin-bottom: 50px;
	color: #aaa;
}

.link{
	color: black;
}
</style>
</head>
<body>
	<div class="con">
		<div>
			<form action="updatePw" method="post">
				<header class="campy">
					<a href="/campy/main"><h1 class="link">Campy</h1></a>
				</header>
				<h3 class="main">비밀번호 변경</h3>
				<div>
					<div class="input-box">
						<input type="text" id="id" name="id" value="${id}" readonly="readonly"><label for="id">아이디</label>
					</div>
					<div class="input-box">
						<input type="password" id="pw" name="pw" required><label for="pw">변경할 비밀번호</label>
					</div>
					 <div class="pw regex"></div>
					 <div class="input-box">
						<input type="password" id="pw2" name="pw2" required><label for="">비밀번호 확인</label>
					</div>
					<div class="repw regex"></div>
						<input type="submit" id="updatePwBtn" value="비밀번호 변경">
						<div id="forgot"><a href="/login">로그인으로 돌아가기</a></div>
				</div>
			</form>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	 $("#pw").on("input",function(){
	        var regex = /^[A-Za-z\d]{8,12}$/;
	        var result = regex.exec($("#pw").val())
	        
	        if(result != null){
	            $(".pw.regex").html("");
	        }else{
	            $(".pw.regex").html("대소문자 및 숫자로 조합된 8~11자리 비밀번호를 입력하세요.");
	            $(".pw.regex").css("color","red")
	        }
	    });
	  $("#pw2").on("keyup",function(){
	        if($("#pw").val()==$("#pw2").val()){
	            $(".repw.regex").css("color","green").html("비밀번호가 일치합니다."); 
	        }else{
	        	$(".repw.regex").css("color","red").html("비밀번호가 일치하지않습니다."); 
	        }
	    })
})
</script>
</body>
</html>