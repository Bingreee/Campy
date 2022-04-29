<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	어떤 캠핑장을 수정하시겠습니까?<br><br>
	<c:forEach items="${campList }" var="campList">
			${campList.c_name }<br>
			<a href="campRevise/${campList.c_no}" >수정 </a>
			<a href="campDelete/${campList.c_no}" >삭제 </a> <br>
	</c:forEach>



</body>
</html>