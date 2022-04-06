<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>예약 현황</title>
<style>
	#MypageSide {
		float : left;
		height : 100px;
		width : 300px;
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
	
	<nav id="MypageSide">
		<ul>
			<button type="button" class="sideButton" onclick="location.href='mypage' ">개인정보</button>
			<button type="button" class="sideButton" onclick="location.href='memLove' ">찜한상품</button>
			<button type="button" class="sideButton" onclick="location.href='reserveStatus' ">예약현황</button>
			<button type="button" class="sideButton" onclick="location.href='qna' ">Q&A</button>
			<button type="button" class="sideButton" onclick="location.href='ask' ">공지사항</button>
			
		</ul>
	</nav>
<table border="1">
	<thead >예약한 날짜 : ${reserve.reserve_date }</thead>
	<tr><td width="100px">캠핑장 이름 : ${camping.c_name }</td><td><a href="reserveDetail">상세보기</a></td>
	<tr><td colspan="2" align="left">
	이용날짜 : ${reserve.start_date } ~ ${reserve.end_date }</td>
	<c:if test="${reserve.end_date - sysdate > 0 }">
		<a href="reviewWrite">리뷰 작성하러 가기</a>
	</c:if>
	<c:if test="${reserve.end_date - sysdate < 0 }">
		<a href="deleteReserve">예약 취소</a>
	</c:if>
</table>


</body>
</html>