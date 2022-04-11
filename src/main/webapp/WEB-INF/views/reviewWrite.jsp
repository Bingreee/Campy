<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 작성</title>
<style>
	h1 {
  		display: inline-block;
	}

	nav {
  		display: inline-block;
  		float : right;
	}
	
	.rightButton{
		width : 100px;
	}
	
	#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: white;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}

.lightgray{background-color: lightgray; width: 50px;}
	table{border-collapse : collapse; width: 800px;}
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

<form method="post" id="reviewWrite" action="/reviewWrite">
<table>
		<tr>
			<td class="lightgray">제목</td>
			<td><input name="rv_title"/></td>
		</tr>
		<tr>
			<td class="lightgray">작성자</td>
			<td><input name="id" value="${user.id}" readonly></td>
		</tr>
		<tr>
			<td class="lightgray">내용</td>
			<td>
			<textarea name="rv_content" id="editorTxt" cols="40" rows="10" placeholder="내용을 입력해주세요"
                  style="width: 700px"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="save" value="새글 등록"> 
			</td>
		</tr>
	</table>

</form>

	
	
	
	
</body>
</html>