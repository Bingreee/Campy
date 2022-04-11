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
		<td><label><input type="checkbox" name="swim" value="t"> 수영</label> </td>
		<td><label><input type="checkbox" name="pick" value="t"> 픽업</label> </td>
		<td><label><input type="checkbox" name="elec" value="t"> 전기</label> </td>
		<td><label><input type="checkbox" name="wifi" value="t"> 와이파이</label> </td>
		<td><label><input type="checkbox" name="snack" value="t"> 스낵</label> </td>
		<td><label><input type="checkbox" name="pet" value="t"> 펫</label> </td>
	</tr>
	
	
	
	<tr>
		<td>
			<input type="submit" value="검색">
		</td>  
	</tr>
	
	</table>
	</form:form>
</body>
</html>