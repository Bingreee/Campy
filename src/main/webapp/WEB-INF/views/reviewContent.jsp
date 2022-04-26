<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 상세보기</title>
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
</style>
</head>
<body>
<h1> Campy </h1>
<nav>
		<ul>
			<c:if test="${user.id == null }">
				<button type="button" onclick="location.href='/login' " class="rightButton">로그인</button><br>
				<button type="button" onclick="location.href='/join' " class="rightButton">회원가입</button>
		<!-- 		<a href="login">로그인</a><br>
				<a href="join">회원가입</a> -->
			</c:if>
			<c:if test="${user.id != null }">
				${user.id}
			</c:if>
		</ul>
	</nav>
	<hr>


<h3>${rdto.rv_title}</h3>
 <table border="1">
	<tr><th>제목</th><td>${rdto.rv_title}</td>
	<tr><th>등록일</th><td>${rdto.rv_date }</td>
	<tr><th>작성자</th><td>${rdto.id}</td>
	<tr><th>내용</th><td>${rdto.rv_content}</td>
	<tr><th>별점</th><td>${rdto.rate }</td>
	<tr><td colspan="2" align="right">
	<c:if test="${ user.id == rdto.id }">
	<a href="/review/update/${rdto.rv_no}">글 수정 </a>
	<a id="${rdto.rv_no}" href="#">글 삭제</a>
	</c:if>
	<a href="#" onclick='history.back(-1); return false;'>목록 이동</a> 
	</td></tr>
</table>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$("a[id]").click(function(){
		let rv_no = $(this).attr("id");
		$.ajax({url:"/review/delete", data:"rv_no="+rv_no, method:"delete"}
		).done(function(){
			location.href="/review";
		})
		return false;
	})//click
})//ready

</script>
</body>
</html>