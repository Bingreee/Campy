<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>비밀번호 찾기</title>
<style>
	.con {
	width:500px;
	margin:auto;
	}
	
	h1{
	display: block;
    font-size: 2.1em;
    margin-block-start: 0.67em;
    margin-block-end: 0.67em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
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

#findPwBtn {
	background: linear-gradient(to left, rgb(41, 123, 255), rgb(51, 203, 255));
	border: none;
	color: white;
	border-radius: 8px;
	width: 200px;
	height: 35px;
	font-size: 14pt;
	margin-top: 70px;
	margin-left: 32px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
}

#chk_btn {
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
			<form method="post" action="update_Pw_Form">
				<header class="campy">
					<a href="/main"><h1 class="link">Campy</h1></a>
				</header>
				<h3 class="main">비밀번호 찾기</h3>
				<div class="content">이메일 아이디를 입력하시면 해당 메일 주소로 인증 문자를 보내드립니다. 입력 후 비밀번호를 변경해주세요.</div>
				<div>
					<div class="input-box">
						<input type="text" id="id" name="id" placeholder="아이디"><label for="id">아이디</label>
					</div>
					<div class="input-box">
						<input type="password" id="chk_num" name="chk_num" placeholder="인증문자"><label for="chk_num">인증문자</label>
					</div>
						<input type="button" id="findPwBtn" value="비밀번호 찾기">
						<input type="submit" id="chk_btn" value="인증 확인">
						<div id="forgot"><a href="login">로그인으로 돌아가기</a></div>
				</div>
			</form>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#findPwBtn").click(function(){
		 let email = $("#id").val();
		if(email == "") {
			alert("아이디를 입력하세요");
			return false;
		}
		$.ajax({
			url:"/idCheck",
			data:"id="+email,
			dataType:"text"
		}).done(function(data){
			console.log(data);
			if(data == ""){
				alert("해당하는 아이디가 없습니다.");
				return false;
			}else{
				$.ajax({url:"/sendPw",
				 	data:"emailAddress="+email,
					dataType:"json"}
				).done(function(data){
					if(eval(data[1])){
						num = data[0];
						alert("메일이 전송되었습니다. 인증문자 입력 확인 후 비밀번호를 변경해주세요.");
					}
				}); 
			}
			
		})

	
	})//메일 인증
	
	$("#chk_btn").click(function(){
		let ck_num = $("#chk_num").val();
		if(ck_num == ""){
			alert("인증 문자를 입력하세요");
			return false;
		}
		
		if(ck_num == num){
			alert("인증이 확인되었습니다.");
			location.replace('update_Pw_Form.jsp');
		}else{
			alert("인증 실패했습니다. 다시 확인하세요.");
			return false;
		}
	})//인증 번호 확인
})
</script>
</body>
</html>