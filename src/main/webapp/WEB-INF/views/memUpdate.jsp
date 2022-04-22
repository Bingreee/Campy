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



<%-- 
	<form action="update" method="POST" id="memUpdate">
        <div id="wrapper">
            <div class="title"><h3>${user.id}님의 정보를 수정합니다.</h3></div>
            <label>아이디 : </label> <input type="text" name="id" id="id" value=${user.id} readonly>
     		<br>

            <label>변경할 비밀번호 : </label><input type="password" name="pw" id="pw"><br>
            <div class="pw regex"></div>

            <label>전화번호 : </label><input type="text" id="repw" value=${user.mem_tel} ><br>
            <div class="repw regex"></div>

           <input type="button" name="signup" value="수정" id="memUpdateButton">
        </div>
	</form> --%>
<h3>${user.id}님의 정보를 수정합니다.</h3>
<form action="/memUpdate" method="post" id="memUpdate">
<input type="hidden" name="_method" value="put">
	<table>
		<tr><td>id</td><td>${user.id}
				</td></tr>
		<tr><td>pw</td><td><input name="pw" type="pw" id="pw" value="${user.pw}"></td></tr>
		<tr><td>mem_tel</td><td><input name="mem_tel" id="mem_tel" value="${user.mem_tel}"></td></tr>
	
		<tr><td><input type="submit" value="수정" id="update"></td></tr>
		
	</table>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#update").click(function(){
			alert("수정완료");
			
		})
		
	})
		
</script>
</body>
</html> 