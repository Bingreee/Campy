<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 목록</title>
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
      	<c:if test="${user.id != null }">
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


	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<h3>${campName }</h3>
	<c:if test="${countReview != 0 }">
		<table class="table caption-top">
			<div style="text-align : right">
  			<a href="/reviewWrite/${review }" id="reviewWrite">리뷰 등록</a>
  			</div>
  			<thead>
    		<tr>
      			<th scope="col">제목</th>
      			<th scope="col">작성자</th>
      			<th scope="col">작성일</th>
      			<th scope="col">별점</th>
    		</tr>
  			</thead>
  			<tbody>
    			<c:forEach items="${reviewList }" var="reviewList">
    				<tr>
					<td> <a href="/reviewContent/${reviewList.rv_no }">${reviewList.rv_title }</a> </td>
					<td>${reviewList.id }</td>
					<td>${reviewList.rv_date }</td>
					<td>${reviewList.rate } / 5</td>
					</tr>
    			</c:forEach>
  			</tbody>
		</table>
		
		<center>
		<div id="page" >
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
		</div>
		</center>
	</c:if>
	<c:if test="${count == 0 }">
		아직 입력한 글이 없습니다.
	</c:if>
			
	
	
	</main>	
	
	<!-- 검색
	<div id="search" align="center">
		<form action="search">
			<select name="searchn">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">작성자</option>
			</select>
			<input type="text" name="search" size="15" maxlength="50" />
			<input type="submit" value="검색" />
		</form>
	</div> -->
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

/* $(function(){
	 $("select").click(function(){ 
		let c_no = ${review};
		$.ajax({
			url : "/reviewInfo/"+c_no,
			type : "get",
			dataType : "json",
			async : false
		}).done(function(data){
			//console.log(data[1].rv_no);
			$("td").empty();
			var html = "";
			for(let i=0; i<data.length; i++){
				html += '<tr>';
				html += "<td> <a href='/reviewContent/"+data[i].rv_no+"'>"+data[i].rv_title+"</a> </td>";
				html += "<td>"+data[i].id+"</td>";
				html += "<td>"+data[i].rv_date+"</td>";
				html += "<td>"+data[i].rate+"/ 5"+"</td>";
				html += '</tr>';
				
			}
			$(".table1").html(html);
		 }) */
		
	/* }); */
	/* $('#reviewWrite').click(function(){
		if ("${user.id}" == null){
			alert("로그인 해야함");
			return false;
		}else if("${user.id}" != null){
			alert("리뷰");
			return reviewWrite;
		}
	}) */
});





</script>
</body>
</html>