<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	.detail {
		position : relative;
		left :600px;
		right : 100px;
		padding : 2px;
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
	<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
	<fmt:formatDate value="${reserve.end_date }" pattern="yyyyMMdd" var="end_date"/>
	
	<h3>예약 내역</h3>
<fieldset>
<table>
<c:choose>
	<c:when test="${reserve.id != null }">
		<legend>예약한 날짜  ${reserve.reserve_date }</legend>
		<tr><td>캠핑장 이름 : ${camping.c_name }</td><td><a href="reserveDetail" class="detail">상세보기</a></td>
		<tr><td>
		이용날짜 : ${reserve.start_date } ~ ${reserve.end_date }</td>
		<c:if test="${end_date - today >= 0 }">
			<a href="reviewWrite" class="detail">리뷰 작성하러 가기</a>
		</c:if>
		<c:if test="${end_date - today < 0 }">
			<a href="deleteReserve" class="detail">예약 취소</a>
		</c:if>
	</c:when>
	<c:when test="${reserve.id == null }">
		<h4>예약 내역이 없습니다.</h4>
	</c:when>
</c:choose>
</table>
</fieldset>


<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function getToday(){
    	var date = new Date();
    	var year = date.getFullYear();
    	var month = ("0" + (1 + date.getMonth())).slice(-2);
    	var day = ("0" + date.getDate()).slice(-2);

    	return year + month + day;
	}

</script> -->

</body>
</html>