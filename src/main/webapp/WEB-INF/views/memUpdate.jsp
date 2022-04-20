<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<style>
	#MypageSide {
		float : left;
		height : 500px;
		width : 300px;
		border-right : solid 1px black;
	}
	
	h1 {
  		display: inline-block;
	}
	nav {
  		display: inline-block;
  		float : right;
	}
	
	.sideButton{
		float : left;
		width : 150px;
		margin : 30px;
	}
	
	#fix{
		clear : both;
		width : 300px; 
	}
	
	.rightButton{
		width : 100px;
	}
	
	.outer {
		display : inline-block;
		float : left;
		width:400px;height:150px;background:gray;
  		text-align: center;
	}
	.inner {
		width:150px;height:100px;background:gray;color:white;
  		display: inline-block;
  		position : absolute;
  		bottom:0;
  		font-size : 5px;
	}
	.outer,.inner {position:relative; display : inline block;}
	.absolute {position:absolute;bottom:0;right:0}
	
	.correction{
		display : inline block;
		width : 1500;		
	}
	
	#okay{
		display : inline-block;
	}
</style>
</head>
<body>
	memUpdate 페이지입니다
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

	<jsp:include page=""></jsp:include>

	<nav id="MypageSide">
			<button type="button" class="sideButton" onclick="location.href='mypage' ">개인정보</button>
			<button type="button" class="sideButton" onclick="location.href='memLove' ">찜한상품</button>
			<button type="button" class="sideButton" onclick="location.href='reserveStatus' ">예약현황</button>
			<button type="button" class="sideButton" onclick="location.href='qna' ">Q&A</button>
			<button type="button" class="sideButton" onclick="location.href='ask' ">공지사항</button>
	</nav>

	<form action="memUpdate" method="POST" id="memUpdate">
        <div id="wrapper">
            <div class="title">회원 가입 정보 입력</div>
            <label>아이디 : </label> <input type="text" name="id" id="id" value=${user.id} readonly>
     		<br>

            <label>비밀번호 : </label><input type="password" name="pw" id="pw"><br>
            <div class="pw regex"></div>

            <label>비밀번호확인 : </label><input type="password" id="repw"><br>
            <div class="repw regex"></div>


            <input type="button" name="signup" value="수정" id="memUpdateButton">
        </div>
</form>

</body>
</html> 