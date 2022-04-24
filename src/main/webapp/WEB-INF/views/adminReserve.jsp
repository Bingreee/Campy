<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	#AdminSide {
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
	fieldset {
		width : 500px;
		float : right;
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
	
	<nav id="AdminSide">
		<ul>
			<button type="button" class="sideButton" onclick="location.href='adminReserve' ">전체 예약 리스트</button>
			<button type="button" class="sideButton" onclick="location.href='fullCalenderPage' ">FUll CALENDER</button>
			<button type="button" class="sideButton" onclick="location.href='campCreate' ">캠핑장 등록</button>
			<button type="button" class="sideButton" onclick="location.href='qna' ">Q&A</button>
			<button type="button" class="sideButton" onclick="location.href='noticeList' ">공지사항</button>
			
		</ul>
	</nav>
	<h3>전체 예약 현황</h3>
	<c:forEach items="${adminR }" var="adminR">
	<table>
	<tr><th>예약번호</th><th>고객명</th><th>예약일</th><th>이용날짜</th><th>객실</th><th>요금</th></tr>
	<tr>
		<td class="reserve_no">${adminR.reserve_no }</td>
		<td class="mem"> ${adminR.mem_name }<br></td>
		<td class="reserve_date">
			<fmt:formatDate value="${adminR.reserve_date }" pattern="yy.MM.dd"/>
		</td>
		<td class="room_date">
			<fmt:formatDate value="${adminR.start_date }" pattern="yy.MM.dd"/>~<fmt:formatDate value="${adminR.end_date }" pattern="yy.MM.dd"/>
		</td>
		<td class="r_no"> ${adminR.r_no }호</td>
		<td class="price">${adminR.c_price }원</td></tr>
	</table>
</c:forEach> 

</body>
</html>