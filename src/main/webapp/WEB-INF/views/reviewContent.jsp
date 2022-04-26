<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 상세보기</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4" href="/main">Campy</span>
      </a>
      <ul class="nav nav-pills">
       <div class="dropdown">
  		<a class="btn btn-secondary dropdown-toggle nav-link" type="button" id="dropdownButton1" data-bs-toggle="dropdown" aria-expanded="false">
    		${user.id }님
  		</a>
  			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    			<li><a class="dropdown-item" href="/mypage">마이 페이지</a></li>
    			<li><a class="dropdown-item" href="/qa">Q&A</a></li>
    			<li><a class="dropdown-item" href="/noticeList">공지사항</a></li>
  			</ul>
		</div>
        <li class="nav-item"><a href="#" class="nav-link">Log out</a></li>
      </ul>
</header>


<main>

<h3 style="margin-left:50px">${rdto.rv_title}</h3>
	<div style="margin-left:50px">
	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  		<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
	</svg>
	<span style="font-size: x-large">${rdto.id}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="opacity:0.5">${rdto.rv_date }</span>
 	</div>
 	<hr class="my-4">
 	<div style="margin-left:50px; width:70%">${rdto.rv_content}</div>
 	<c:if test="${ user.id == rdto.id }">
 	<hr class="my-4">
		<a href="/review/update/${rdto.rv_no}" style="margin-left:50px">글 수정 </a>
		<a id="${rdto.rv_no}" href="#" style="margin-left:50px">글 삭제</a>
	</c:if>
		<!-- <div style="margin-left:50px">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
			</svg><a href="#" onclick='history.back(-1); return false;' >리뷰 목록으로 이동</a> 
		</div>	 -->

</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$("a[id]").click(function(){
		let rv_no = $(this).attr("id");
		let c_no = ${rdto.c_no};
		$.ajax({
			url:"/review/delete", 
			data:"rv_no="+rv_no, 
			method:"delete"}
		).done(function(){
			location.href="/reviewInfo/"+c_no;
		})
		return false;
	})//click
})//ready

</script>
</body>
</html>