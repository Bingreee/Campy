<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<style>
	#input , #result{ display: none;}
</style>
</head>
<body>
<h2>회원가입</h2>
<form action="insert" method="post">
<table>
		<tr><td>아이디</td><td><input name="id" id="id" placeholder="example@google.com">
		<input type="button" id="id_check" value="중복체크">
		<input type="button" id="mail_ck" value="인증"><div id="id_msg"></div>
		<div id="input"><input id="ck_num"><input type="button" id="ck_b" value="인증 확인"></div>
		<div id="result"></div></td></tr>
		<tr><td>비밀번호</td><td><input type="password" name="pw" id="pw" placeholder="내용을 입력해주세요"></td></tr>
		<tr><td><span id="pw_msg1"></span></td></tr>
		<tr><td>비밀번호 확인</td><td>
		<input type="password" name="pw2" id="pw2" placeholder="내용을 입력해주세요" onkeyup="passConfirm()">
		<span id="pw_msg2"></span></td></tr>
		<tr><td>이름</td><td><input name="mem_name" id="mem_name"></td></tr>
		<tr><td>주소</td><td><input name="mem_address" id="mem_address1">
					<input type="button" id="addbtn" value="주소 검색" onclick="addPost()"></td></tr>
		<tr><td>휴대폰 번호</td><td><input name="mem_tel" id="mem_tel">
		<tr><td><input type="submit" value="가입"></td></tr>
</table>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            	document.querySelector("#mem_address1").value = data.address;
            	document.querySelector("#mem_tel").focus();
        }
    }).open();
}    

function passConfirm() {
	let pw1 = document.getElementById('pw1');	
	let pw2 = document.getElementById('pw2');	
	let pw_msg2 = document.getElementById('pw_msg2');				
	let correctColor = "#00ff00";	
	let wrongColor ="#ff0000";	
	
	if(pw1.value == pw2.value){
		pw_msg2.style.color = correctColor;
		pw_msg2.innerHTML ="비밀번호 일치";
	}else{
		pw_msg2.style.color = wrongColor;
		pw_msg2.innerHTML ="비밀번호 불일치";
	}
}//비밀번호 확인
	let num ="";
	$(function(){
		$("#id_check").click(function(){
			let id = $("#id").val();
			if(!id){
				$("#id_msg").html("아이디를 입력하세요")
				return false;
			}
			$.ajax({url:"/idCheck", data:"id="+id, datatype:"text"}
			).done(function(data){
				if(data == ""){
					$("#id_msg").html("사용가능한 아이디 입니다.");
					$("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
				}else{
					$("#id_msg").html("사용중인 아이디 입니다.");
				}
			})
		});//아이디 중복 확인 click
		
		 $("#mail_ck").click(function(){
			 let email = $("#id").val();
			if(!email){
					$("#result").css("display","block").html("메일 주소를 입력하세요");
					
					return false;
				} 
		 $.ajax({url:"/send",
			 	data:"emailAddress="+email,
				dataType:"json"}
			).done(function(data){
				if(eval(data[1])){
					num = data[0];
					alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
					$("#input,#result").css("display","block");
				}
			}); 
		}) 
		$("#ck_b").click(function(){
			let ck_num = $("#ck_num").val();
			if(ck_num == num){
				$("#result").html("인증이 확인되었습니다.")
				$("#result").append("<input type='hidden' id='ck' value='1'>");
			}else{
				$("#result").html("인증 실패했습니다. 다시 확인하세요.");
			}
		})
	})//ready
</script>
</body>
</html>