<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<title>캠핑장 등록 페이지</title>
</head>
<body>
	<h2> 캠핑장 등록 </h2>
	
	<form:form action="campCreateInfo" method="POST" id="campCreateForm">
        <div id="campingInformation">
            <div class="title"><h4>캠핑장 정보 입력</h4></div>
            
            <label> 캠핑장 이름 </label><input type="text" name="c_name" id="c_name"><br>
            
            <label> 캠핑장 주소 </label><input type="text" name="c_address" id="c_address"><br>
            
            <label> 최대인원 </label>
            <select name="maxno" id="maxno">
    			<option value="0">인원선택</option>
    			<option value="1">1</option>
    			<option value="2">2</option>
    			<option value="3">3</option>
    			<option value="4">4</option>
    			<option value="5">5</option>
    			<option value="6">6</option>
    			<option value="7">7</option>
    			<option value="8">8</option>
			</select><br>
            
            <label> 캠핑장 주변경관 </label><br>
            <div class = "place">
				<input type="radio" name="place" value="산" checked="checked" class="place">산
				<input type="radio" name="place" value="바다" class="place">바다
				<input type="radio" name="place" value="도심" class="place">도심
			</div>
            
            <label> 전화번호 </label><input type="text" name="c_tel" id="c_tel" placeholder="ex)010-0000-0000"><br>
            
            <label> 옵션 선택 </label><br>
            <label><input type="checkbox" name="swim"  id="swim" class="swim"> 수영</label> 			
			<label><input type="checkbox" name="pick"  id="pick" class="pick"> 픽업</label> 				
			<label><input type="checkbox" name="elec"  id="elec" class="elec"> 전기</label> 				
			<label><input type="checkbox" name="wifi"  id="wifi" class="wifi"> 와이파이</label>				
			<label><input type="checkbox" name="snack"  id="snack" class="snack"> 스낵</label>				
			<label><input type="checkbox" name="pet"  id="pet" class="pet"> 펫</label>
            <br>
            
            
 			<hr>
 			
 			
            </div>
            
            <div id = roomInformation1>
            	<div class="title"><h4>객실 정보 입력</h4></div>
            	
            	<label> 객실 번호 </label><input type="text" name="r_no1" id="r_no1"><br>
            	
            	<label> 객실 테마 </label><input type="text" name="theme1" id="theme1"><br>
            	
            	<label> 최대 인원 </label>
            	<select name="r_maxno1" id="r_maxno1">
    			<option value="0">인원선택</option>
    			<option value="1">1</option>
    			<option value="2">2</option>
    			<option value="3">3</option>
    			<option value="4">4</option>
    			<option value="5">5</option>
    			<option value="6">6</option>
    			<option value="7">7</option>
    			<option value="8">8</option>
				</select><br>
            	
            	<label> 객실 설명 </label><textarea name="r_content1" id="r_content1" rows=4></textarea><br>
            	
            	<label> 객실 가격 </label><input type="number" name="c_price1" id="c_price1"><br>
            </div>
            
            <div id = roomInformation2>
            	<div class="title"><h4>객실 정보 입력</h4></div>
            	
            	<label> 객실 번호 </label><input type="text" name="r_no2" id="r_no2"><br>
            	
            	<label> 객실 테마 </label><input type="text" name="theme2" id="theme2"><br>
            	
            	<label> 최대 인원 </label>
				<select name="r_maxno2" id="r_maxno2">
    			<option value="0">인원선택</option>
    			<option value="1">1</option>
    			<option value="2">2</option>
    			<option value="3">3</option>
    			<option value="4">4</option>
    			<option value="5">5</option>
    			<option value="6">6</option>
    			<option value="7">7</option>
    			<option value="8">8</option>
				</select><br>
            	
            	<label> 객실 설명 </label><textarea name="r_content2" id="r_content2" rows=4></textarea><br>
            	
            	<label> 객실 가격 </label><input type="number" name="c_price2" id="c_price2"><br>
            </div>
            
            <div id = roomInformation3>
            	<div class="title"><h4>객실 정보 입력</h4></div>
            	
            	<label> 객실 번호 </label><input type="text" name="r_no3" id="r_no3"><br>
            	
            	<label> 객실 테마 </label><input type="text" name="theme3" id="theme3"><br>
            	
            	<label> 최대 인원 </label>
				<select name="r_maxno3" id="r_maxno3">
    			<option value="0">인원선택</option>
    			<option value="1">1</option>
    			<option value="2">2</option>
    			<option value="3">3</option>
    			<option value="4">4</option>
    			<option value="5">5</option>
    			<option value="6">6</option>
    			<option value="7">7</option>
    			<option value="8">8</option>
				</select><br>
            	
            	<label> 객실 설명 </label><textarea name="r_content3" id="r_content3" rows=4></textarea><br>
            	
            	<label> 객실 가격 </label><input type="number" name="c_price3" id="c_price3"><br>
            </div>
            
                 <input type="submit" name="campCreateButton" value="캠핑장 신규등록" id="campCreateButton">
            
	</form:form>
	
	

	
</body>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).on('click',"#campCreateButton",function(){
	if(document.getElementById("swim").checked==true){
		document.getElementById("swim").value='t';
	}else if(document.getElementById("swim").checked!=true){
		document.getElementById("swim").value='f';
	}
	if(document.getElementById("pick").checked==true){
		document.getElementById("pick").value='t';
	}else if(document.getElementById("pick").checked!=true){
		document.getElementById("pick").value='f';
	}
	if(document.getElementById("elec").checked==true){
		document.getElementById("elec").value='t';
	}else if(document.getElementById("elec").checked!=true){
		document.getElementById("elec").value='f';
	}
	if(document.getElementById("wifi").checked==true){
		document.getElementById("wifi").value='t';
	}else if(document.getElementById("wifi").checked!=true){
		document.getElementById("wifi").value='f';
	}
	if(document.getElementById("snack").checked==true){
		document.getElementById("snack").value='t';
	}else if(document.getElementById("snack").checked!=true){
		document.getElementById("snack").value='f';
	}
	if(document.getElementById("pet").checked==true){
		document.getElementById("pet").value='t';
	}else if(document.getElementById("pet").checked!=true){
		document.getElementById("pet").value='f';
	}
});
</script>


</html>