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
	fieldset{
		float:right;
		width:70%;
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
	<jsp:useBean id="now" class="java.util.Date" />
	

	<h3>예약 내역</h3>

<ul>
<c:forEach items="${rStatus}" var="rStatus">
<c:if test="${user.id == rStatus.id}">
<fieldset>
	<li>캠핑장이름 : ${rStatus.c_name}</li>
	<span><a href="reserveDetail">상세보기</a></span>
	<span id="apple"></span>
	<li>예약날짜 :
	<fmt:formatDate value="${rStatus.reserve_date }" pattern="yyyy-MM-dd" var="reserve_date" />
	<fmt:formatDate value="${rStatus.reserve_date }" pattern="E" var="reserve_E"/>
	${reserve_date }(${reserve_E }) </li>
	<li>캠핑장 이용 날짜 :
		<fmt:formatDate value="${rStatus.start_date }" pattern="yyyy-MM-dd" var="start_date"/>
		<fmt:formatDate value="${rStatus.start_date }" pattern="E" var="start_E"/>
		<fmt:formatDate value="${rStatus.end_date }" pattern="yyyy-MM-dd" var="end_date"/>
		<fmt:formatDate value="${rStatus.end_date }" pattern="E" var="end_E"/>
		${start_date}(${start_E }) ~ ${end_date }(${end_E })
		</li>
 	<li>예약자명 : ${rStatus.mem_name }</li>
 	</fieldset>
 	</c:if>
	</c:forEach>
</ul>

<c:forEach items="${rStatus}" var="rStatus">
<fmt:formatDate value="${rStatus.end_date }" var="end_date2" pattern="yyyyMMdd"/>
<fmt:parseNumber value="${end_date2/(1000*60*60*24)}" integerOnly="true" var="endDate" scope="request"/>
<fmt:formatDate var="today" value="${now}" pattern="yyyyMMdd" />
<fmt:parseNumber value="${today/(1000*60*60*24)}" integerOnly="true" var="todayDate" scope="request"/>
<c:if test="${today > end_date2 }">
	 <p><a href="#" id="${rStatus.reserve_no }">예약 취소</a></p> 
</c:if>
<c:if test="${today <= end_date2 }">
	<p><a href="reviewWrite">리뷰 작성</a></p>
</c:if>

</c:forEach>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("a[id]").click(function(){
		let reserve_no = $(this).attr("id");
		$.ajax({url:"/deleteReserve", data:"reserve_no="+reserve_no, method:"delete"}
		).done(function(){
			location.href="/reserveStatus";
		})
		return false;
	})//click
})//ready
		
	



</script>
</body>
</html>