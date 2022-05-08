<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Campy 로그인</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
	
<style>
#con {
	width:500px;
	margin:auto;
}

.campy {
	display: flex;
	justify-content: center;
	margin-top: 150px;
	margin-bottom: 50px;
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

#loginbtn {
	background: linear-gradient(to left, rgb(41, 123, 255), rgb(51, 203, 255));
	border: none;
	color: white;
	border-radius: 8px;
	width: 220px;
	height: 35px;
	font-size: 14pt;
	margin-top: 100px;
	margin-left: 32px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
}

#joinbtn {
	background: linear-gradient(to left, rgb(41, 123, 255), rgb(51, 203, 255));
	border: none;
	color: white;
	border-radius: 8px;
	width: 220px;
	height: 35px;
	font-size: 14pt;
	margin-rigth: 20px;
	margin-bottom: 300px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
}

#forgot {
	text-align: right;
	font-size: 12pt;
	color: rgb(164, 164, 164);
	margin: 10px 0px;
}

#errors {
	color: red;
	margin-bottom: 30px;
}

a {
	text-decoration-line: none;
	text-align: center;
	color:rgb(164, 164, 164);
}

.link{
	color: black;
}
</style>
</head>
<body>
	<header class="campy">
		<a href="/campy/main"><h1 class="link">Campy</h1></a>
	</header>
	<div id="con">
	<form:form action="/login/memLogin" method="post" modelAttribute="command">
		<div class="input-box">
			<input id="id" name="id" placeholder="아이디"> <label for="id">아이디</label>
		</div>
		<div class="input-box">
			<input id="pw" type="password" name="pw" placeholder="비밀번호">
			<label for="pw">비밀번호</label>
		</div>
		<div id="forgot"><a href="/login/find_Id_Form">아이디 찾기</a></div>
		<div id="forgot"><a href="/login/find_Pw_Form">비밀번호 찾기</a></div>
			<form:errors id="errors" element="div"/>
		<input type="button" id="joinbtn" onclick="location.href='/login/join'" value="회원가입">
		<input id="loginbtn" type="submit" value="로그인">
	</form:form>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	//아이디,비밀번호 공백 확인
	$("#loginbtn").click(function(){
		let id = $("#id").val();
		let pw = $("#pw").val();
		if(!id && !pw) {
			alert("아이디와 비밀번호를 입력해주세요");
			return false;
		}
		else if(!id) {
			alert("아이디를 입력해주세요.");
			return false;
		}
		else if(!pw) {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
	})
})
</script>
</body>
</html>