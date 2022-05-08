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

<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom" style="position:sticky;top:0px; z-index: 10;background-color:white;">
      <a href="/main" class="d-flex align-items-center  me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <img src="../../CampPhoto/Camping/CampyLogo2.png" style="width:50px;" alt="campy"/>
        <span href="/main" style="font-weight:bold;font-size:30px;">Campy</span>  <!-- class="fs-4" -->
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
    				<li><a class="dropdown-item" href="/join">회원가입</a></li>
  				</ul>
			</div>
        </c:if>
      </ul>
</header>
	
    
<div class="container-fluid">
<div class="row">
	<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse" style="position:sticky;top:100px;height:500px;">
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
        </ul>
      </div>
    </nav>
	
	
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="padding-bottom:20px">
	<h3 style="margin: 20px 170px">
	<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart" aria-hidden="true"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
	내 예약 확인</h3>
	<c:if test="${reserveList == [] }">
		<h4 style="margin: 20px 170px">예약 내역이 없습니다.</h4>
	</c:if>
	<c:if test="${reserveList != [] }">
	<c:forEach items="${reserveList}" var="rStatus">
		<nav style="display: block; height: 150px; width: 700px;float:center; margin-left:170px; margin-bottom:100px">
  			<nav class="list-group-item list-group-item-action " > <!-- aria-current="true" -->
  				<jsp:useBean id="now" class="java.util.Date" />
  				<fmt:formatDate value="${rStatus.start_date }" pattern="yyyy-MM-dd" var="start_date"/>
				<fmt:formatDate value="${rStatus.start_date }" pattern="E" var="start_E"/>
				<fmt:formatDate value="${rStatus.end_date }" pattern="yyyy-MM-dd" var="end_date"/>
				<fmt:formatDate value="${rStatus.end_date }" pattern="E" var="end_E"/>
    			<fmt:formatDate value="${rStatus.end_date }" var="end_date2" pattern="yyyyMMdd"/>
				<fmt:parseNumber value="${end_date2/(1000*60*60*24)}" integerOnly="true" var="endDate" scope="request"/>
				<fmt:formatDate var="today" value="${now}" pattern="yyyyMMdd" />
				<fmt:parseNumber value="${today/(1000*60*60*24)}" integerOnly="true" var="todayDate" scope="request"/>
    			
    			<div class="d-flex w-100 justify-content-between" >
    			<a href="/reserveDetail/${rStatus.reserve_no }" >
     				<img src='../../CampPhoto/Camping/${rStatus.c_no}.jpg' style="width : 200px; margin-top:25px"/>
      			</a>
      				<h5 class="mb-1" style=" margin-right:40px;margin-top:25px; position:relative">${rStatus.c_name}</h5>
     					<c:if test="${today < end_date2 }">
     						<small id="small" style="font-weight:bold; color:blue;margin-right:40px;margin-top:25px;">이용 전</small>
     						</c:if>
     					<c:if test="${today > end_date2 }">
     						<small id="small" style="font-weight:bold;color:red;margin-right:40px;margin-top:25px;">이용 완료</small>
     						</c:if>
     						
    			</div>
    			<p class="mb-1" style="text-align : center; margin-left:130px;">
				${start_date}(${start_E }) ~ ${end_date }(${end_E })
    			</p>
    			<p class="mb-1" style="text-align : center; margin-left:130px">
					<c:if test="${today < end_date2 }">
						 <a href="#" id="${rStatus.reserve_no }" class="deleteReserve">예약 취소</a> 
					</c:if>
					<c:if test="${today >= end_date2 }">
					<center>
					<form action="reviewWrite/${rStatus.c_no }" id="goReview" method="get"> 
						<input type="hidden" name="reserve_no" id="reserve_no" value="${rStatus.reserve_no }"/>
						<input type="button" class="goReview" value="리뷰 작성"/>
					</form>
					</center>
					</c:if>
    			</p>
  			</nav>
		</nav>
	
	</c:forEach>
	</c:if>
	
	<center>
		<div id="page" >
				<c:if test="${begin > pageNum }">
					<a href="reserveStatus?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="reserveStatus?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="reserveStatus?p=${end+1}">[다음]</a>
				</c:if>
		</div>
		</center>
	</main>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	 $(".goReview").click(function(){
   	  $("#goReview").submit();

     })
	
	$(".deleteReserve").click(function(){
		if (confirm("예약을 취소하시겠습니까 ?")) {
		let reserve_no = $(this).attr("id");
		 $.ajax({url:"/deleteReserve", 
				data:"reserve_no="+reserve_no, 
				method:"delete"
			}).done(function(){
				location.href="/reserveStatus";
			})
			return false;
		}
	})//click
})//ready
		
	
</script>
</body>
</html>