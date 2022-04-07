<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>캠핑 객실 검색</title>
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
	
	.v-line{
	 	border-left: thin solid #000;
 		height:100%;
 		left: 40%;
 		position: absolute;
	}
	
	.roomList{
		display : inline;
		position : relative;
		left : 500px;
		border-top : 10px;
		background-color: #BBDEFB;
        margin: 10px 20px;
        padding: 10px 20px;
	}
	.roomListDetail{
		position : relative;
		left : 550px;
		margin :15px;
	}
	fieldset{
		display : inline;
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
	<div class="v-line"></div>
	
	<h4>검색결과</h4>
	<%-- <c:set items="${ }">
		
	</c:set> --%>
	<form action="room">
	<input type="submit" id="searchRoomInfo" value="검색">
	</form>
	
	
	
	<h4 class="roomList">객실 목록</h4>
	<c:forEach items="${room}" var="room">
		<div class="roomListDetail">${room.c_no } / ${room.r_no} / ${room.r_content }
		<input type="button" value="예약하기"></div><br>
	</c:forEach>
</body>
</html>