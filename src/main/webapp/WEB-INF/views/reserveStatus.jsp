<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

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
<%-- <%
SimpleDateFormat dfhm        = new SimpleDateFormat("yyyyMMddHHmm");
Calendar cal = Calendar.getInstance();
String today = dfhm.format(cal.getTime());

Date end_date = null;
Date now = null;

long diff = 0;
long diffDays = 0;

end_date = dfhm.parse("${rStatus.end_date}");    //parse: 문자형 날짜 -> Date 형태로 변환
now = dfhm.parse(today);
%> --%>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate var="today" value="${now}" pattern="yyyyMMdd" />

	<h3>예약 내역</h3>
<fieldset>
<ul>
<c:forEach items="${rStatus }" var="rStatus">
	<li>캠핑장이름 : ${rStatus.c_name }</li>
	<span><a href="reserveDetail">상세보기</a></span>
	<span id="apple"></span>
	<li>예약날짜 :<fmt:formatDate value="${rStatus.start_date }" pattern="yyyymmdd" var="start_date" /> ~ <fmt:formatDate value="${rStatus.end_date }" pattern="yyyymmdd" var="end_date"/></li> 
	<li>예약자명 : ${rStatus.mem_name }</li>
	<c:if test="${rStatus.end_date < today }"><p><a href="deleteReserve">예약 취소</a></p></c:if>
	<c:if test="${rStatus.end_date >= today }">p><a href="reviewWrite">리뷰 작성</a></c:if>
</c:forEach>
</ul>
</fieldset>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	/* let today = new Date();
	let end_date = new Date("${rStatus.end_date}")

	$(document).ready(function(){
		
	}); */
		
	



</script>
</body>
</html>