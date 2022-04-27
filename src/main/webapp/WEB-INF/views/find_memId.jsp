<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾기</title>
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
	
#loginBtn {
	background: linear-gradient(to left, rgb(41, 123, 255), rgb(51, 203, 255));
	border: none;
	color: white;
	border-radius: 8px;
	width: 200px;
	height: 35px;
	font-size: 14pt;
	margin-left: 32px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
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

.main{
	font-size: 1.17em;
	font-weight: bold;
}

.link{
	color: black;
}
</style>
</head>
<body>
	<div class="con">
		<div>
			<header class="campy">
				<a href="/main"><h1 class="link">Campy</h1></a>
			</header>
			<div>
			<h3 class="main">아이디 검색 결과</h3>
				<div class="input-box">회원님의 아이디는 ${ id } 입니다.</div>
				<input type="button" id="loginBtn" value="로그인 하러 가기">
			</div>
		</div>
	</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='/login';
		})
	})
</script>
</body>
</html>