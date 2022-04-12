<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<style>
        #wrapper{
            border:2px solid salmon;
            border-radius: 5px;;
            width: 450px;
            height:450px;
            margin:auto;
        }
        .title{
            text-align: center;
            font-size: 20px;
           font-weight: bold;
           color:black;
           margin:20px 0px 20px 0px;
          
        }
        label{
            width:95px;
            display: inline-block;
            text-align: right;
            font-size: 13px;
           
        }
        input{
            margin:3px 5px;
            border-radius: 3px;
            background-color: transparent;
            border:1px solid darkgray;
            height:20px;
            outline:none;
            
        }
        
        #signup{
        text-align: center;
        margin:5px;
        }
        input[type=button],input[type=reset]{
            border:1px solid salmon;
            border-radius: 3px;
            background-color: transparent;
            margin:0px;
            height:24px;
            color:salmon;
        }
        
        input[type=button]:hover,input[type=reset]:hover{
        background-color: salmon;
        transition-duration:1s;
        color:white;
      	outline:none;
        }
        
		#roadAddress,#detailAddress{
			width: 280px;
		}
        .regex{
            font-size: 12px;
            text-align: center;
        }
        #input{
        	 display: none;
        	 margin-left: 95px;
        }
    </style>
</head>
<body>
<h2>회원가입</h2>
<form action="insert" method="POST" id="signform">
        <div id="wrapper">
            <div class="title">회원 가입 정보 입력</div>
            <label>아이디 : </label><input type="text" name="id" id="id" placeholder="ex)example@google.com">
            <input type="button" value="중복확인" id="id_check"><input type="button" id="mail_ck" value="인증">
            <div class="id regex"></div>
			<div id="input"><input id="ck_num"><input type="button" id="ck_b" value="인증 확인"></div>
            
            <label>비밀번호 : </label><input type="password" name="pw" id="pw"><br>
            <div class="pw regex"></div>
            
            <label>비밀번호확인 : </label><input type="password" id="repw"><br>
            <div class="repw regex"></div>
            
            <label>이름: </label><input type="text" name="mem_name" id="mem_name"><br>
            <div class="mem_name regex"></div>
            
            <label>휴대폰번호 : </label><input type="text" name="mem_tel" id="mem_tel" placeholder="ex)010-0000-0000"><br>
            <div class="mem_tel regex"></div>
            
            <label>우편번호 :</label><input type="text" id="postcode" placeholder="우편번호" name="postcode">
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
            <label>주소1 : </label><input type="text" id="roadAddress" placeholder="도로명주소" name="roadAddress"><br>
            <label>주소2 : </label><input type="text" id="detailAddress" placeholder="상세주소" name="detailAddress"><br>
            <div id="signup">
            <input type="button" name="signup" value="회원가입" id="signupbtn">
            <input type="reset" value="다시입력" id="resignupbtn">
            </div>
        </div>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//다음 우편번호 API
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
			$(".id.regex").css("color","red").html('올바른 아이디 형식이 아닙니다');
			return false;
		}
		$.ajax({url:"/idCheck", data:"id="+id, datatype:"text"}
		).done(function(data){
			if(data == ""){
				$(".id.regex").html("사용가능한 아이디 입니다.");
				$(".id.regex").css("color","black")
				$(".id.regex").append("<input type='hidden' id='id_ck' value='1'>");
			}else{
				$(".id.regex").html("사용중인 아이디 입니다.");
				$(".id.regex").css("color","red");
			}
		})
	});//아이디 중복 확인 click 
 	
	 $("#mail_ck").click(function(){
		 let email = $("#id").val();
		if(!email){
				alert("아이디를 먼저 입력하세요.");
				
				return false;
			} 
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
            $(".pw.regex").html("영어대소문자,숫자 8-11자리");
            $(".pw.regex").css("color","red")
        }
    });
    
   //비밀번호 확인    
       $("#repw").on("keyup",function(){
            if($("#pw").val()==$("#repw").val()){
               $(".repw.regex").css("color","black").html("비밀번호가 일치합니다"); 
            }else{
             $(".repw.regex").css("color","red").html("비밀번호가 일치하지않습니다"); 
            }
       })
    
    //이름 유효성검사
        $("#mem_name").on("input",function(){
            var regex = /[가-힣]{2,}/;
            var result = regex.exec($("#mem_name").val());
            
            if(result != null){
               $(".mem_name.regex").html("");  
            }else{
                $(".mem_name.regex").html("한글만 입력 가능합니다.");
            }
            
        })
    
    //전화번호 유효성검사
        $("#mem_tel").on("input",function(){
        	var regex = /^\d{3}-\d{3,4}-\d{4}$/;
            var result = regex.exec($("#mem_tel").val());
            
            if(result != null){
               $(".mem_tel.regex").html("");  
            }else{
                $(".mem_tel.regex").html("올바른 번호가 아닙니다");
            }
            
        })
    
  //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
   $("#signupbtn").on("click",function(){
	   var id = $("#id").val();
	   var pw = $("#pw").val();
	   var name = $("#mem_name").val();
	   var phone = $("#mem_tel").val();
	   
	   var idregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
	   var pwregex = /^[A-Za-z\d]{8,12}$/;
	   var nameregex = /[가-힣]{2,}/;
	   var phoneregex = /^\d{3}-\d{3,4}-\d{4}$/;
	   
	   var idregex = idregex.exec(id);
	   if(idregex == null){
		   alert("아이디양식을 다시 확인해주세요");
		   return;
	   }
	   var pwregex = pwregex.exec(pw);
	   if(pwregex == null){
		   alert("비밀번호양식을 다시 확인해주세요");
		   retrun;
	   }
	   var nameregex = nameregex.exec(name);
	   if(nameregex == null){
		   alert("이름양식을 다시 확인해주세요");
		   retrun;
	   }
	   var phoneregex = phoneregex.exec(phone);
	   if(phoneregex == null){
		   alert("핸드폰번호양식을 다시 확인해주세요");
		   retrun;
	   }
     //빈칸 없을 때 제출.
	   $("#signform").submit();
   })
})
</script>
</body>
</html>