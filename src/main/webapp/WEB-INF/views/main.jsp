<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	h1 {
  		display: inline-block;
	}

	nav {
  		display: inline-block;
  		float : right;
	}
	
	.rightButton{
		width : 100px;
	}
</style>
</head>


<body>
	<h1> Campy </h1>
	
	<nav>
		<ul>
			<c:if test="${user.id == null }">
				<button type="button" onclick="location.href='login' " class="rightButton">로그인</button><br>
				<button type="button" onclick="location.href='join' " class="rightButton">회원가입</button>
		<!-- 		<a href="login">로그인</a><br>
				<a href="join">회원가입</a> -->
			</c:if>
			<c:if test="${user.id != null }">
				${user.id}
			</c:if>
		</ul>
	</nav>
	<hr>
	
	
	
	
	
	
	
	<form:form action="mainSearch" method="post" modelAttribute="mainSearchInfo">
	캠핑장 둘러보기
	<table border="1" cellpadding="0" cellspacing="0">				
	<tr>
		<td>이름으로 검색</td>
		<td><input name="c_name" type="text" size="10"></td>
	</tr>

	<tr>
		<td>
			<select name="c_address">
    			<option value="">직업선택</option>
    			<option value="서울">서울</option>
    			<option value="경기도">경기도</option>
    			<option value="강원도">강원도</option>
    			<option value="전라북도">전라북도</option>
    			<option value="전남">전남</option>
    			<option value="경상남도">경상남도</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td>
			<select name="maxno">
    			<option value="">인원선택</option>
    			<option value="0">0</option>
    			<option value="1">1</option>
    			<option value="2">2</option>
    			<option value="3">3</option>
    			<option value="4">4</option>
    			<option value="5">5</option>
    			<option value="6">6</option>
    			<option value="7">7</option>
    			<option value="8">8</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="radio" name="place" value="산" checked="checked">산
			<input type="radio" name="place" value="바다">바다
			<input type="radio" name="place" value="도심">도심
		</td>
	</tr>
	
	<tr>
		<td><label><input type="checkbox" name="swim" value="t" id="swim"> 수영</label> </td>
		<td><label><input type="hidden" name="swim" value="f" id="swim_hidden"> 수영</label> </td>
		
		<td><label><input type="checkbox" name="pick" value='t' id="pick"> 픽업</label> </td>
		<td><label><input type="hidden" name="pick" value='f' id="pick_hidden"> 픽업</label> </td>
		
		<td><label><input type="checkbox" name="elec" value='t' id="elec"> 전기</label> </td>
		<td><label><input type="hidden" name="elec" value='f' id="elec_hidden"> 전기</label> </td>
		
		<td><label><input type="checkbox" name="wifi" value='t' id="wifi"> 와이파이</label> </td>
		<td><label><input type="hidden" name="wifi" value='f' id="wifi_hidden">와이파이</label> </td>
		
		<td><label><input type="checkbox" name="snack" value='t' id="snack"> 스낵</label> </td>
		<td><label><input type="hidden" name="snack" value='f' id="snack_hidden"> 스낵</label> </td>
		
		<td><label><input type="checkbox" name="pet" value='t' id="pet"> 펫</label> </td>
		<td><label><input type="hidden" name="pet" value='f' id="pet_hidden"> 펫</label> </td>
	</tr>
	
	
	
	<tr>
		<td>
			<input type="submit" value="검색">
		</td>  
	</tr>
	
	</table>
	</form:form>
		${mainSearchInfoResult}
		<img src="../../CampPhoto/${mainSearchInfoResult.c_photo}" width="50px" height="50px">	
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$function(){
		if(document.getElementById("swim").checked){
			document.getElementById("swim_hidden").disabled=true;
		}
		if(document.getElementById("pick").checked){
			document.getElementById("pick_hidden").disabled=true;
		}
		if(document.getElementById("elec").checked){
			document.getElementById("elec_hidden").disabled=true;
		}
		if(document.getElementById("wifi").checked){
			document.getElementById("wifi_hidden").disabled=true;
		}
		if(document.getElementById("snack").checked){
			document.getElementById("snack_hidden").disabled=true;
		}
		if(document.getElementById("pet").checked){
			document.getElementById("pet_hidden").disabled=true;
		}
	}
</script>

</html>