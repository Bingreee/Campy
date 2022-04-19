<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 상세 내역</title>
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
	
	<h3>이용정보</h3>
	<p>캠핑장 이름 : ${rStatus.c_name } </p>
	<p> 이용 날짜 : 
		<fmt:formatDate value="${rStatus.start_date }" pattern="yyyy-MM-dd" var="start_date"/>
		<fmt:formatDate value="${rStatus.start_date }" pattern="E" var="start_E"/>
		<fmt:formatDate value="${rStatus.end_date }" pattern="yyyy-MM-dd" var="end_date"/>
		<fmt:formatDate value="${rStatus.end_date }" pattern="E" var="end_E"/>
		${start_date}(${start_E }) ~ ${end_date }(${end_E })
	</p>
	<!-- <input type="button" value="리뷰 작성하러 가기" onclick="location.href='reviewWrite'"> -->
	<hr>
	<h3>예약 정보</h3>
	<p>이름 : ${rStatus.mem_name }</p>
	<p>휴대폰 번호 : ${rStatus.mem_tel }</p>
	<p>예약 금액 : ${rStatus.c_price }</p>
</body>
</html>