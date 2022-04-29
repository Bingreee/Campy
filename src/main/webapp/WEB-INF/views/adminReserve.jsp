<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
        <li class="nav-item"><a href="/mypage" class="nav-link">${user.id }님</a></li>
        <li class="nav-item"><a href="/logout" class="nav-link">Log out</a></li>
      </ul>
</header>

	
	<div class="container-fluid">
<div class="row">
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/fullCalenderPage">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>  Full Calender              
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/adminReserve">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>  전체 예약 리스트
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/campCreate">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>  캠핑장 등록
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="campShowAll">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>  캠핑장 수정/삭제
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/ask">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg> 문의사항 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/noticeList">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>  공지사항 관리
            </a>
          </li>
          
        </ul>
      </div>
</nav>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="padding-bottom:20px">
	<h3>전체 예약 리스트</h3>
	<table class="table caption-top">
  			<thead>
    		<tr>
      			<th scope="col">예약번호</th>
      			<th scope="col">고객명</th>
      			<th scope="col">예약일</th>
      			<th scope="col">이용날짜</th>
      			<th scope="col">객실</th>
      			<th scope="col">요금</th>
    		</tr>
  			</thead>
  			<c:forEach items="${adminR }" var="adminR">
  			<tbody>
    				<tr>
					<td> ${adminR.reserve_no }</a> </td>
					<td>${adminR.mem_name }</td>
					<td><fmt:formatDate value="${adminR.reserve_date }" pattern="yy.MM.dd"/></td>
					<td>
						<fmt:formatDate value="${adminR.start_date }" pattern="yy.MM.dd"/>~<fmt:formatDate value="${adminR.end_date }" pattern="yy.MM.dd"/>
					</td>
					<td>${adminR.r_no }호</td>
					<td>${adminR.c_price }원</td>
					</tr>
  			</tbody>
  			</c:forEach> 
	</table>
	
	<%-- <table>
	<tr><th>예약번호</th><th>고객명</th><th>예약일</th><th>이용날짜</th><th>객실</th><th>요금</th></tr>
	<tr>
		<td class="reserve_no">${adminR.reserve_no }</td>
		<td class="mem"> ${adminR.mem_name }<br></td>
		<td class="reserve_date">
			<fmt:formatDate value="${adminR.reserve_date }" pattern="yy.MM.dd"/>
		</td>
		<td class="room_date">
			<fmt:formatDate value="${adminR.start_date }" pattern="yy.MM.dd"/>~<fmt:formatDate value="${adminR.end_date }" pattern="yy.MM.dd"/>
		</td>
		<td class="r_no"> ${adminR.r_no }호</td>
		<td class="price">${adminR.c_price }원</td></tr>
	</table> --%>

</main>
	</div>
	</div>
</body>
</html>