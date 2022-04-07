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
		border-top : 20px;
		background-color: #BBDEFB;
        margin: 10px 20px;
        padding: 10px 20px;
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
	
	<h4 class="roomList">객실 목록</h4>
	
</body>
</html>