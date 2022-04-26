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
    			<c:forEach items="${reviewOne }" var="reviewOne">
    				<tr>
					<td> <a href="/reviewContent/${reviewOne.rv_no }">${reviewOne.rv_title }</a> </td>
					<td>${reviewOne.id }</td>
					<td>${reviewOne.rv_date }</td>
					<td>${reviewOne.rate } / 5</td>
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