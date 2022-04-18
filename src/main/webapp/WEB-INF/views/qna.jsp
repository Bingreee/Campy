<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>qna</title>
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
	
	.main{
	
	}
	
	.footer{
	
	}
	
</style>
<body>

<header>
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
	 
</header>
 
<main class="main">
 
 	<section>
 		<a href="/ask">목록 이동</a><hr>
 	</section>

 	
</main>
   
   
   
   
   
   
<footer class="footer">
 <p>사이트명 고객센터친절하게 도와드리겠습니다.
 010-0000-0000평일 : 9:00 ~ 16:30(점심시간 12:00 ~ 1:00)
 주말 및 공휴일에는 문의 게시판을 이용해주세요.
 </p>
</footer>







</body>
</html>