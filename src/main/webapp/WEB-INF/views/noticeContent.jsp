<%@ page contentType="text/html; charset=UTF-8" %>
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
  margin : 20px 10px;
}
table.type02 th {
  width: 150px;
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
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
  button{ 
  color:black;
  
}
button:hover{
  background:#fff;
  color:black;
}
</style>
</head>
<body>
<h1>공지사항 내용</h1>
<table border="1" class="type02">
	<tr><td>제목</td><td>${dto.not_title}</td>
	<tr><td>작성자</td><td>${dto.id}</td>
	<tr><td>내용</td><td>${dto.not_content}</td>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.not_date }" dateStyle="long"/></td>
<%-- 	<tr><td>파일</td><td>${dto.not_file}</td>
 --%>	<tr><td colspan="2" align="right">
	<c:if test="${ user.id == dto.id }">
	<a href="/noticeUpdateForm/${dto.not_no}">글 수정 </a> 
	<a id="${dto.not_no}" href="#">글 삭제</a>
	</c:if>
	<a href="../noticeList">목록 이동</a> 
	</td></tr>
</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let not_no = $(this).attr("id");
			$.ajax({url:"/noticeList/delete", data:"not_no="+not_no, method:"delete"}
			).done(function(){
				location.href="/noticeList";
			})
			return false;
	
		}) 
	})


</script>

</body>
</html>