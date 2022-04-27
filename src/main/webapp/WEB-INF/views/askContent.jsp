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


a {
	text-decoration-line: none;
	color: #1ea1f7;
}



</style>
</head>
<body>
<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/main" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4" href="/main">Campy</span>
      </a>

      <ul class="nav nav-pills">
      	<c:if test="${user.id != null }">
       		<div class="dropdown">
  			<a class="btn btn-secondary dropdown-toggle nav-link" type="button" id="dropdownButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			${user.id }님
  			</a>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="/mypage">마이 페이지</a></li>
    				<li><a class="dropdown-item" href="/qna">Q&A</a></li>
    				<li><a class="dropdown-item" href="/noticeList">공지사항</a></li>
  				</ul>
			</div>
        	<li class="nav-item"><a href="/logout" class="nav-link">Log out</a></li>
        </c:if>
        <c:if test="${user.id == null }">
        	<div class="dropdown">
  			<a class="btn btn-secondary dropdown-toggle nav-link" type="button" id="dropdownButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  					<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
				</svg>
  			</a>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="/login">로그인</a></li>
    				<li><a class="dropdown-item" href="/joinSelect">회원가입</a></li>
  				</ul>
			</div>
        </c:if>
      </ul>
</header>


<h3 style="margin-left:50px">${dto.qa_title}</h3>
	<div style="margin-left:50px">
	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  		<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
	</svg>
	<span style="font-size: x-large">${dto.id}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="opacity:0.5">${dto.qa_date }</span>
 	</div>
 	<hr class="my-4">
 	<div style="margin-left:50px; width:70%">${dto.qa_content}</div>
 	
 	<div style="text-align : right">
 	<c:if test="${ user.id == dto.id }">
 	<hr class="my-4">
		<a href="/updateForm/${dto.qa_no}" style="margin-left:50px">글 수정 </a>
		<a id="${dto.qa_no}" href="#" style="margin-left:50px">글 삭제</a>
		
	</c:if>
	<a href="../ask" style="margin-left:50px">목록 이동</a>
	</div>






<div>
	<c:forEach items="${cList}" var="Qa_CommDto">
		
		<div>
		아이디 : ${Qa_CommDto.id} / 내용 : ${Qa_CommDto.qa_comm_content}
			
		 <c:if test="${Qa_CommDto.id == user.id }">
		<button class="dbtn btn btn-outline-secondary" id="${Qa_CommDto.qa_comm}">삭제</button>
		</c:if> 
		</div>
	
		<hr>
		
	</c:forEach>
		
		<div style= "text-align : right">
			<input name="askContent" id="askContent" type="text" >
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