<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
table.type02 {
	border-collapse: separate;
	border-spacing: 0;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	margin: 20px 10px;
}

table.type02 th {
	width: 250px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
}

table.type02 td {
	width: 650px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

button {
	color: black;
}

button:hover {
	background: #fff;
	color: black;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: black;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

a {
	text-decoration-line: none;
	color: #1ea1f7;
	margin: 10px auto;
}
</style>
</head>
<body>
	<table border="1" class="type02">
		<tr>
			<th scope="row">제목</th>
			<td>${dto.not_title}</td>
		</tr>
		<tr>
			<th scope="row">작성자</th>
			<td>${dto.id}</td>
		</tr>
			<th scope="row">내용</th>
			<td>${dto.not_content}</td>
		<tr>
			<th scope="row">등록일</th>
			<td><fmt:formatDate value="${dto.not_date }" dateStyle="long" /></td>
		</tr>	
			<%-- 	<tr><td>파일</td><td>${dto.not_file}</td>
 --%>
		<tr>
			<td colspan="2" align="right">
			<c:if test="${ user.id == dto.id }">
					<button>
						<a href="/noticeUpdateForm/${dto.not_no}">글 수정 </a>
					</button>
					<button>
						<a id="${dto.not_no}" href="#">글 삭제</a>
					</button>
				</c:if>
				<button>
					<a href="../noticeList">목록 이동</a>
				</button></td>
		</tr>
	</table>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			$("a[id]").click(function() {
				let not_no = $(this).attr("id");
				$.ajax({
					url : "/noticeList/delete",
					data : "not_no=" + not_no,
					method : "delete"
				}).done(function() {
					location.href = "/noticeList";
				})
				return false;

			})
		})
	</script>

</body>
</html>