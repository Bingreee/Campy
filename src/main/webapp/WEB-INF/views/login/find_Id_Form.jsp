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

#findBtn {
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
				<header class="campy">
					<a href="/campy/main"><h1 class="link">Campy</h1></a>
				</header>
				<h3>아이디 찾기</h3>
				<div class="content">이름과 전화번호를 입력하시면 일치하는 아이디를 찾아드립니다.</div>
				<div>
					<div class="input-box">
						<input type="text" id="mem_name" name="mem_name" placeholder="이름" required> <label for="mem_name">이름</label>
					</div>
					<div class="input-box">
						<input type="text" id="mem_tel" name="mem_tel" placeholder="ex)010-0000-0000" required> <label for="mem_tel">휴대폰 번호</label>
					</div>
					<div id="showId" class="input-box">
						
					</div>
					<input type="button" id="findBtn" value="아이디 찾기">
					<div id="forgot"><a href="/login">로그인으로 돌아가기</a></div>
				</div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			let mem_name = $("#mem_name").val();
			let mem_tel = $("#mem_tel").val();
			console.log(mem_name);
			console.log(mem_tel);
			
			$.ajax({
				url:"/login/findId",
				data:{"mem_name":mem_name,"mem_tel":mem_tel},
				dataType:"json"
			}).done(function(data){
				if(data != null) {
					$("#showId").empty();
					$("#showId").append(mem_name+"님의 아이디는 "+data+" 입니다.");
					$("#showId").css("color","black");
				}else{
					$("#showId").empty();
					$("#showId").append("해당하는 아이디가 없습니다.");
					$("#showId").css("color","red");
				}
			})
		})
	})
</script>	
</body>
</html>