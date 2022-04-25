<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form:form action="/campReviseInfo" method="POST" id="campReviseForm">
        <div id="campingInformation">
            <div class="title"><h4>캠핑장 정보 입력</h4></div>
            <input type="hidden" name = "c_no" value=${ReviseCamp.c_no }>
            
            <label> 캠핑장 이름 </label><input type="text" name="c_name" id="c_name" value=${ReviseCamp.c_name } readonly><br>
            
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
            

            <c:forEach items="${ReviseRoom }" var="ReviseRoom" varStatus="status">
            	
			
				<div class="title"><h4>객실 정보 입력</h4></div>
            	
            	<label> 객실 번호 </label><input type="text" name="r_no${status.count}" id="r_no${status.count} " value=${ReviseRoom.r_no } readonly><br>
            	
            	<label> 객실 테마 </label><input type="text" name="theme${status.count}" id="theme${status.count}"><br>
            	
            	<label> 최대 인원 </label>
            	<select name="r_maxno${status.count}" id="r_maxno${status.count}">
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
            	
            	<label> 객실 설명 </label><textarea name="r_content${status.count}" id="r_content${status.count}" rows=4></textarea><br>
            	
            	<label> 객실 가격 </label><input type="number" name="c_price${status.count}" id="c_price${status.count}"><br>
            	
			
				
			</c:forEach>
   			
   			
   			 <input type="submit" name="campReviseButton" value="캠핑장 수정버튼" id="campReviseButton">
	</form:form>
</body>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).on('click',"#campReviseButton",function(){
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