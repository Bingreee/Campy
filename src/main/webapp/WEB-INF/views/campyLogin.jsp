<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<style>
#con {
	width:500px;
	margin:auto;
}
header {
	display: flex;
	justify-content: center;
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
	border-bottom: solid 1px #ccc;
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
	background-color: #8aa1a1;
	border: none;
	color: white;
	border-radius: 5px;
	width: 45%;
	height: 35px;
	font-size: 14pt;
	margin-top: 100px;
	margin-left: 270px;
}

#joinbtn {
	background-color: #8aa1a1;
	border: none;
	color: white;
	border-radius: 5px;
	width: 225px;
	height: 35px;
	font-size: 14pt;
	margin-rigth: 20px;
	margin-bottom: 300px;
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
	color:rgb(164, 164, 164);
}
</style>
<head>
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
</head>
<body>
	<header>
		<h2>Login</h2>
	</header>
	<div id="con">
	<form:form action="memLogin" method="post" modelAttribute="command">
		<div class="input-box">
			<input id="id" name="id" placeholder="아이디"> <label for="id">아이디</label>
		</div>
		<div class="input-box">
			<input id="pw" type="password" name="pw" placeholder="비밀번호">
			<label for="pw">비밀번호</label>
		</div>
		<div id="forgot"><a href="/find_Id_Form">아이디 찾기</a></div>
		<div id="forgot"><a href="/find_Pw_Form">비밀번호 찾기</a></div>
			<form:errors id="errors" element="div"/>
		<input id="loginbtn" type="submit" value="로그인">
	</form:form>
	<button id="joinbtn" onclick="location.href='joinSelect'">회원가입</button>
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

