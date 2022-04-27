<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>회원가입</title>
<style>
		h1{
			font-weight: bold;
		}
		
        #wrapper{
            width: 700px;
            height:700px;
            margin:auto;
            margin-top: 30px;
        }
      	header {
			display: flex;
			justify-content: center;
			margin-bottom: 30px;
		}
		
		.content{
			margin-bottom: 50px;
			color: #aaa;
		}
        label{
            width:100px;
            margin-right: 40px;
            display: inline-block;
            text-align: left;
            font-weight: bold;
           
        }
        input{
            margin:3px 5px;
            border-radius: 3px;
            background-color: transparent;
            border:1px solid darkgray;
            height:38px;
            outline:none;
        }
        
        #signup{
        text-align: center;
        margin:5px;
        }
        
        input[type=button],input[type=reset]{
            border:1px solid #888;
            border-radius: 3px;
            background-color: transparent;
            margin:0px;
            height:24px;
            color:#666;
            font-weight: bold;
        }
        
        input[type=button]:hover,input[type=reset]:hover{
        background-color: #66b2ff;
        transition-duration:1s;
        color:white;
      	outline:none;
        }
        
		#roadAddress,#detailAddress, #postcode, #ck_num{
			width: 280px;
			margin-bottom: 15px;
		}
        .regex{
            font-size: 12px;
            text-align: center;
            margin-right: 300px;
            margin-bottom: 15px;
        }
      
        #input{
        	 display: none;
        }
        
        #id, #pw, #repw, #mem_name, #mem_tel, #postcode, #roadAddress, #detailAddress, #ck_num{
        	width: 300px;
        }
        
        #id_check, #mail_ck, #find_addr, #signupbtn, #resignupbtn, #ck_b{
        	height: 35px;
        }
        
        #ck_b{
        	margin-left: 6px;
        }
        
        #id_check{
        	margin-right: 6px;
        }
      
    </style>
</head>
<body>
<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4" href="/main">Campy</span>
      </a>

      <ul class="nav nav-pills">
      	<c:if test="${user.id != null }">
       		<div class="dropdown">
  			<a class="btn btn-secondary dropdown-toggle nav-link" type="button" id="dropdownButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			${user.id }님
  			</a>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="/mypage">마이 페이지</a></li>
    				<li><a class="dropdown-item" href="/qa">Q&A</a></li>
    				<li><a class="dropdown-item" href="/noticeList">공지사항</a></li>
  				</ul>
			</div>
        	<li class="nav-item"><a href="#" class="nav-link">Log out</a></li>
        </c:if>
        <c:if test="${user.id == null }">
        	<div class="dropdown">
  			<a class="btn btn-secondary dropdown-toggle nav-link" type="button" id="dropdownButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  					<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
				</svg>
  			</a>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="/login">로그인</a></li>
    				<li><a class="dropdown-item" href="/joinSelect">회원가입</a></li>
  				</ul>
			</div>
        </c:if>
      </ul>
</header>
<form action="insert" method="POST" id="signform">
        <div id="wrapper">
            <header class="main_title"><h1>Campy 회원가입</h1></header>
            <div class="content">Campy에 오신 것을 진심으로 환영합니다!</div>
            
            <label>아이디  </label><input type="text" name="id" id="id" placeholder="ex)example@google.com">
            <input type="button" value="중복확인" id="id_check"><input type="button" id="mail_ck" value="인증">
            <div id="id_regex" class="id regex"></div>
            
			<div id="input"><label>아이디 인증  </label><input id="ck_num"><input type="button" id="ck_b" value="인증 확인"></div>
            
            <label>비밀번호  </label><input type="password" name="pw" id="pw"><br>
            <div class="pw regex"></div>
            
            <label>비밀번호확인  </label><input type="password" id="repw"><br>
            <div class="repw regex"></div>
            
            <label>이름 </label><input type="text" name="mem_name" id="mem_name"><br>
            <div class="mem_name regex"></div>
            
            <label>휴대폰번호  </label><input type="text" name="mem_tel" id="mem_tel" placeholder="ex)010-0000-0000"><br>
            <div class="mem_tel regex"></div>
            
            <label>우편번호 </label><input type="text" id="postcode" placeholder="우편번호" name="postcode" readonly>
            <input type="button" id="find_addr" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
            <label>주소1  </label><input type="text" id="roadAddress" placeholder="도로명주소" name="roadAddress" readonly><br>
            <label>주소2  </label><input type="text" id="detailAddress" placeholder="상세주소" name="detailAddress"><br>
            <div id="signup">
            <input type="reset" value="다시입력" id="resignupbtn">
            <input type="button" name="signup" value="회원가입" id="signupbtn">
            </div>
        </div>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
           
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
        }
    }).open();
}

$(function(){
	$("#id_check").click(function(){
		let id = $("#id").val();
		const exp = /.+@[a-z]+(\.[a-z]+){1,2}$/;
		if(!id){
			$(".id.regex").css("color","red").html("아이디를 입력하세요");
			return false;
		}else if(!id.match(exp)) {
			$(".id.regex").css("color","red").html('&emsp;&emsp;&emsp;&emsp;&ensp;올바른 아이디 형식이 아닙니다');
			return false;
		}
		$.ajax({url:"/idCheck", data:"id="+id, datatype:"text"}
		).done(function(data){
			if(data == ""){
				$(".id.regex").html("&emsp;&emsp;&ensp;사용가능한 아이디 입니다.");
				$(".id.regex").css("color","green")
				$(".id.regex").append("<input type='hidden' id='id_ck' value='1'>");
			}else{
				$(".id.regex").html("&emsp;&ensp;사용중인 아이디 입니다.");
				$(".id.regex").css("color","red");
			}
		})
	});//아이디 중복 확인 click 
 	
	 $("#mail_ck").click(function(){
		 let email = $("#id").val();
		 let ck_id = $('#id_regex').text();
		 console.log(ck_id);
		 console.log(email);
		if(!email){
				alert("아이디를 먼저 입력하세요.");
				return false;
			}
		
	 if(ck_id == "   사용가능한 아이디 입니다.") {
	 $.ajax({url:"/send",
		 	data:"emailAddress="+email,
			dataType:"json"}
		).done(function(data){
			if(eval(data[1])){
				num = data[0];
				alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
				$(".id.regex").html("")
				$("#input").css("display","block");
				$("#ck_num").focus();
			}
		}); 
	 }else if(ck_id == "  사용중인 아이디 입니다.") {
		 alert("다른 아이디로 가입해주세요.");
		 return false;
	 }else if(ck_id == "") {
		 alert("중복 확인부터 해주세요.");
		 return false;
	 }
	 
	})//메일 인증
	
	$("#ck_b").click(function(){
		let ck_num = $("#ck_num").val();
		if(ck_num == num){
			alert("인증이 확인되었습니다.")
			$("#result").append("<input type='hidden' id='ck' value='1'>");
		}else{
			alert("인증 실패했습니다. 다시 확인하세요.")
		}
	})//인증 번호 확인
	
	//비밀번호 유효성검사
    $("#pw").on("input",function(){
        var regex = /^[A-Za-z\d]{8,12}$/;
        var result = regex.exec($("#pw").val())
        
        if(result != null){
            $(".pw.regex").html("");
        }else{
            $(".pw.regex").html("&emsp;&emsp;&emsp;영어대소문자,숫자 8-11자리");
            $(".pw.regex").css("color","red")
        }
    });
    
   //비밀번호 확인    
       $("#repw").on("keyup",function(){
            if($("#pw").val()==$("#repw").val()){
               $(".repw.regex").css("color","black").html("&emsp;비밀번호가 일치합니다"); 
            }else{
             $(".repw.regex").css("color","red").html("&emsp;&emsp;&emsp;&emsp;비밀번호가 일치하지않습니다"); 
            }
       })
    
    //이름 유효성검사
        $("#mem_name").on("input",function(){
            var regex = /[가-힣]{2,}/;
            var result = regex.exec($("#mem_name").val());
            
            if(result != null){
               $(".mem_name.regex").html("");  
            }else{
                $(".mem_name.regex").html("&emsp;&ensp;한글만 입력 가능합니다.");
            }
            
        })
    
    //전화번호 유효성검사
        $("#mem_tel").on("input",function(){
        	var regex = /^\d{3}-\d{3,4}-\d{4}$/;
            var result = regex.exec($("#mem_tel").val());
            
            if(result != null){
               $(".mem_tel.regex").html("");  
            }else{
                $(".mem_tel.regex").html("&emsp;&nbsp;올바른 번호가 아닙니다");
            }
            
        })
    
  //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
   $("#signupbtn").on("click",function(){
	   var id = $("#id").val();
	   var pw = $("#pw").val();
	   var name = $("#mem_name").val();
	   var phone = $("#mem_tel").val();
	   var postcode = $("#postcode").val();
	   var detailAddress = $("#roadAddress").val();
	   var detailAddress = $("#postcode").val();
	   
	   var idregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
	   var pwregex = /^[A-Za-z\d]{8,12}$/;
	   var nameregex = /[가-힣]{2,}/;
	   var phoneregex = /^\d{3}-\d{3,4}-\d{4}$/;
	   
	   var idregex = idregex.exec(id);
	   if(idregex == null){
		   alert("아이디양식을 다시 확인해주세요");
		   return false;
	   }
	   var pwregex = pwregex.exec(pw);
	   if(pwregex == null){
		   alert("비밀번호양식을 다시 확인해주세요");
		   return false;
	   }
	   var nameregex = nameregex.exec(name);
	   if(nameregex == null){
		   alert("이름양식을 다시 확인해주세요");
		   return false;
	   }
	   var phoneregex = phoneregex.exec(phone);
	   if(phoneregex == null){
		   alert("핸드폰번호양식을 다시 확인해주세요");
		   return false;
	   }
	   
	   if(postcode == "") {
		   alert("주소를 다시 확인해주세요");
		   return false;
	   }
	   
	   if(roadAddress == "") {
		   alert("주소를 다시 확인해주세요");
		   return false;
	   }
	   
	   if(detailAddress == "") {
		   alert("주소를 다시 확인해주세요");
		   return false;
	   }
     //빈칸 없을 때 제출.
       alert("회원가입을 축하합니다!")
	   $("#signform").submit();
   })
})
</script>
</body>
</html>