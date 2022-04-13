<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
</head>
<body>
<table border="1">
	<tr><td>제목</td><td>${dto.qa_title}</td>
	<tr><td>작성자</td><td>${dto.id}</td>
	<tr><td>내용</td><td>${dto.qa_content}</td>
	<tr><td>등록일</td><td><fmt:formatDate value="${dto.qa_date }" dateStyle="long"/></td>
<%-- 	<tr><td>조회수</td><td>${dto.readcount}</td> --%>
	<tr><td colspan="2" align="right">
	<c:if test="${ user.id == dto.id }">
	<a href="/update/${dto.qa_no}">글 수정 </a> 
	<a id="${dto.qa_no}" href="#">글 삭제</a>
	</c:if>
	<a href="../ask">목록 이동</a> 
	</td></tr>
</table>
<!--  cList -->
<div>
	<c:forEach items="${cList}" var="Qa_CommDto">
		<div>${Qa_CommDto.id} / <fmt:formatDate value="${Qa_CommDto.qa_comm_date }" dateStyle="short"/></div>
		<div>${Qa_CommDto.content} 
		<c:if test="${comm.id == user.id }">
		<button class="dbtn" id="${Qa_CommDto.qa_no}">삭제</button>
		</c:if>
		</div>
		<hr>
	</c:forEach>
	<input name="askContent" id="askContent"><button id="add">등록</button>
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let qa_no = $(this).attr("id");
			$.ajax({url:"/delete", data:"qa_no="+qa_no, method:"delete"}
			).done(function(){
				location.href="/ask";
			})
			return false;
		})//click
		
		$("#add").click(function(){
			let id = '${user.id}';
			let qa_content = $("#qa_content").val();
			let qa_no = ${dto.qa_no};
			
			$.ajax({url:"/insert",
					data:"qa_no="+qa_no+"&id="+id+"&qa_content="+qa_content,
					method:"post"
			}).done(function(){
					location.reload();		
				});
			
		})//click
		$(".dbtn").click(function(){
			let qa_no = $(this).attr("id");
			$.ajax({url:"/delete/"+qa_no,
				method:"delete"
		}).done(function(){
				location.reload();		
			});
			
		})//click
	})//ready

</script>

</body>
</html>