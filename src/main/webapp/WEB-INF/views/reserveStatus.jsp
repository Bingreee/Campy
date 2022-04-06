<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>예약 현황</title>
</head>
<body>
<table border="1">
	<thead>예약한 날짜 : </thead>
	<tr><td>${user.c_name }</td><td><a href="reserveDetail">상세보기</a></td>
	<tr><td colspan="2" align="right">
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