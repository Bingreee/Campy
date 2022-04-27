<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
<!-- 부트스트랩 css 사용 head안에 적용--> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	width: 200px;
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
    <td>${dto.qa_title}</td>
  </tr>
  <tr>
    <th scope="row">작성자</th>
    <td>${dto.id}</td>
  </tr>
  <tr>
    <th scope="row">내용</th>
    <td>${dto.qa_content}</td>
  </tr>
<tr>
    <th scope="row">등록일</th>
    <td><fmt:formatDate value="${dto.qa_date }" dateStyle="long"/></td>
  </tr>

<tr>
	<td colspan="2" align="right">
	
	<c:if test="${ user.id == dto.id }">
	<button><a href="/updateForm/${dto.qa_no}">글 수정 </a> </button>
	<button><a id="${dto.qa_no}" href="#">글 삭제</a></button>
	</c:if>
	<button><a href="../ask">목록 이동</a></button>
	
	</td>
</tr>
</table>


<div>
	<c:forEach items="${cList}" var="Qa_CommDto">
		<div>${Qa_CommDto.id} / <fmt:formatDate value="${Qa_CommDto.qa_comm_date }" dateStyle="short"/></div>
		<div>${Qa_CommDto.qa_comm_content} 
		
		 <c:if test="${Qa_CommDto.id == user.id }">
		<button class="dbtn" id="${Qa_CommDto.qa_comm}">삭제</button>
		</c:if> 
		
		</div>
		<hr>
	</c:forEach>
		<div class="input-group mb-3">
			<input name="askContent" id="askContent" type="text" class="form-control">
			<button id="add" class="btn btn-outline-secondary">등록</button>
		</div>
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
			let qa_comm_content = $("#askContent").val();
			let qa_no = ${dto.qa_no};
			
			$.ajax({url:"/insertComm",
					data:"qa_no="+qa_no+"&id="+id+"&qa_comm_content="+qa_comm_content,
					method:"post"
			}).done(function(){
					location.reload();		
				});
			
		})//click
		$(".dbtn").click(function(){
			let qa_comm = $(this).attr("id");
			$.ajax({url:"/deleteComm/"+qa_comm,
				method:"delete"
		}).done(function(){
				location.reload();		
			});
			
		})//click
	})//ready

</script>
<!-- 부트스트랩 js 사용 body안에 적용--> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>