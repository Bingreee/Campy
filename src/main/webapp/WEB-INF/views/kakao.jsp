<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	if(${user.id} == null) {
		<img src="kakao_login_medium_narrow.png">;
	} else {
		
	}
</script>

	<a href="https://kauth.kakao.com/oauth/authorize?client_id=c37e73341e7c2e31c70cb4c682ed41f7&redirect_uri=http://localhost:8090/snsjoin&response_type=code" id="apple">
		<img src="kakao_login_medium_narrow.png">
	</a>

	<form action="http://localhost:8090/logout" name="logout">
		<input type="submit" value="로그아웃">
	</form>
</body>
</html>