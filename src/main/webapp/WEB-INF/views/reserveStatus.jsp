<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<title>예약 현황</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="/resources/bootstrap.css">-->

</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<%-- <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow" style="height:70px">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="/main">Campy</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
    <a class="nav-link px-3" href="/mypage" style="display:inline-block;">${user.id }님</a>
    <a class="nav-link px-3" href="#" style="display:inline-block;">Sign out</a>
    </div>
  </div>
</header> --%>

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
	
    
<div class="container-fluid">
<div class="row">
	<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/mypage">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home" aria-hidden="true"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
              마이 페이지
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/memLove">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file" aria-hidden="true"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
              찜한 캠핑장
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reserveStatus">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart" aria-hidden="true"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
              내 예약 확인
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="qna">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users" aria-hidden="true"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
              Q&A
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="noticeList">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2" aria-hidden="true"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
              공지사항
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="noticeList">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers" aria-hidden="true"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
              Integrations
            </a>
          </li>
        </ul>
      </div>
    </nav>
	
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

	<c:forEach items="${rStatus}" var="rStatus">
	<c:if test="${user.id == rStatus.id}">
		<div  width="820" height="345" style="display: block; height: 230px; width: 800px;float:right">
  			<a href="/reserveDetail/${rStatus.reserve_no }" class="list-group-item list-group-item-action " > <!-- aria-current="true" -->
    			<div class="d-flex w-100 justify-content-between">
     			<img src='../../CampPhoto/Camping/${rStatus.c_no}.jpg' style="width : 100px" "margin : 10px"/>
      			<h5 class="mb-1">${rStatus.c_name}</h5>
     			<small>3 days ago</small>
    			</div>
    			<p class="mb-1" style="text-align : center">
    			<fmt:formatDate value="${rStatus.start_date }" pattern="yyyy-MM-dd" var="start_date"/>
				<fmt:formatDate value="${rStatus.start_date }" pattern="E" var="start_E"/>
				<fmt:formatDate value="${rStatus.end_date }" pattern="yyyy-MM-dd" var="end_date"/>
				<fmt:formatDate value="${rStatus.end_date }" pattern="E" var="end_E"/>
				${start_date}(${start_E }) ~ ${end_date }(${end_E })
    			</p>
  			</a>
  
		</div>
	</c:if>
	</c:forEach>
	</main>
</div>
</div>





<%-- <c:forEach items="${rStatus}" var="rStatus">
<fmt:formatDate value="${rStatus.end_date }" var="end_date2" pattern="yyyyMMdd"/>
<fmt:parseNumber value="${end_date2/(1000*60*60*24)}" integerOnly="true" var="endDate" scope="request"/>
<fmt:formatDate var="today" value="${now}" pattern="yyyyMMdd" />
<fmt:parseNumber value="${today/(1000*60*60*24)}" integerOnly="true" var="todayDate" scope="request"/>
<c:if test="${today > end_date2 }">
	 <p><a href="#" id="${rStatus.reserve_no }">예약 취소</a></p> 
</c:if>
<c:if test="${today <= end_date2 }">
	<p><a href="reviewInfo/${rStatus.c_no }">리뷰 작성</a></p>
</c:if>

</c:forEach> --%>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
	
	$("a[id]").click(function(){
		let reserve_no = $(this).attr("id");
		$.ajax({url:"/deleteReserve", data:"reserve_no="+reserve_no, method:"delete"}
		).done(function(){
			location.href="/reserveStatus";
		})
		return false;
	})//click
})//ready
		
	



</script>
</body>
</html>