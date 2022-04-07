<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
</head>
<body>
<form:form action="memLogin" method="post" modelAttribute="command">
<form:errors element="div"/>
	<input name="id" size="15" placeholder="Username"><br>
	<input type="password" name="pw" size="15"><br>
	<input type="submit" value="로그인">
</form:form>
<button onclick="location.href='joinSelect'">회원가입</button>
</body>
</html>