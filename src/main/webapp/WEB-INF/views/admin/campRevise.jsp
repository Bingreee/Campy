<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<title>캠핑장 수정</title>
<style>
 input{
 border: solid 2px #1E90FF;
 border-radius: 5px;
 }
 label {
 	margin:10px;
 	font-weight:bold;
 }
 textarea {
			width: 100%;
			height: 200px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
		}
</style>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom" style="position:sticky;top:0px; z-index: 10;background-color:white;">
      <a href="/campy/main" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <img src="../../../CampPhoto/Camping/CampyLogo2.png" style="width:50px;" alt="campy"/>
        <span class="fs-4" href="/campy/main">Campy</span>
      </a>
		
      <ul class="nav nav-pills">
       		<div class="dropdown">
  			<a class="btn btn-secondary dropdown-toggle nav-link" type="button" id="dropdownButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			${user.id }님
  			</a>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="/mypage">마이 페이지</a></li>
    				<li><a class="dropdown-item" href="/mypage/qna">Q&A</a></li>
    				<li><a class="dropdown-item" href="/notice/noticeList">공지사항</a></li>
  				</ul>
			</div>
        	<li class="nav-item"><a href="/logout" class="nav-link">Log out</a></li>
      </ul>
</header>	
	
<div class="container-fluid">
<div class="row">
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/admin/fullCalenderPage">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>  Full Calender              
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/adminReserve">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>  전체 예약 리스트
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/campCreate">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>  캠핑장 등록
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/campShowAll">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>  캠핑장 수정/삭제
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/ask/ask">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg> 문의사항 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/notice/noticeList">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
				</svg>  공지사항 관리
            </a>
          </li>
          
        </ul>
      </div>
</nav>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="padding-bottom:20px">	
	<form:form action="/admin/campReviseInfo" method="POST" id="campReviseForm">
        <div id="campingInformation">
            <h4>캠핑장 정보 수정</h4>
            <input type="hidden" name = "c_no" value=${ReviseCamp.c_no }>
            
            <label> 캠핑장 이름 </label><input type="text" name="c_name" id="c_name" value="${ReviseCamp.c_name }"><br>
            
            <label> 캠핑장 주소 </label><input type="text" name="c_address" id="c_address" value="${ReviseCamp.c_address }" style="width:400px;"><br>
            
            <label> 최대인원 </label>
            <select name="maxno" id="maxno">
    			<option value="0">인원선택</option>
    			<option value="1">1</option>
    			<option value="2">2</option>
    			<option value="3">3</option>
    			<option value="4">4</option>
    			<option value="5">5</option>
    			<option value="6">6</option>
    			<option value="7">7</option>
    			<option value="8">8</option>
			</select><br>
            
            <label> 캠핑장 주변경관 </label><br>
            <div class = "place">
				<input type="radio" name="place" id="mount" value="산"  class="place">산
				<input type="radio" name="place" id="sea" value="바다" class="place">바다
				<input type="radio" name="place" id="city" value="도심" class="place">도심
			</div>
            
            <label> 전화번호 </label><input type="text" name="c_tel" id="c_tel" value="${ReviseCamp.c_tel }"><br>
            
            <label> 옵션 선택 </label><br>
            <label><input type="checkbox" name="swim"  id="swim" class="swim"> 수영</label> 			
			<label><input type="checkbox" name="pick"  id="pick" class="pick"> 픽업</label> 				
			<label><input type="checkbox" name="elec"  id="elec" class="elec"> 전기</label> 				
			<label><input type="checkbox" name="wifi"  id="wifi" class="wifi"> 와이파이</label>				
			<label><input type="checkbox" name="snack"  id="snack" class="snack"> 스낵</label>				
			<label><input type="checkbox" name="pet"  id="pet" class="pet"> 펫</label>
            <br>
 			<hr>

        </div>
            
			<h4>객실 정보 입력</h4>
			
            <c:forEach items="${ReviseRoom }" var="ReviseRoom" varStatus="status">
            <fieldset style="margin-bottom:20px;border:2px solid black;border-radius:5px;width:40%">
            <div style="float:left;height:249px;">
            	<label> 객실 번호 </label><input type="text" name="r_no${status.count}" id="r_no${status.count} " value="${ReviseRoom.r_no }" readonly><br>
            	<label> 객실 테마 </label><input type="text" name="theme${status.count}" id="theme${status.count}" value="${ReviseRoom.theme }"><br>
            	<label> 최대 인원 </label><input type="number" name="r_maxno${status.count}" id="r_maxno${status.count}" value="${ReviseRoom.r_maxno }"><br>
            	<label> 객실 가격 </label><input type="number" name="c_price${status.count}" id="c_price${status.count}" value="${ReviseRoom.c_price }"><br>
			</div>
			</fieldset>
			</c:forEach>
   			 <input type="submit" name="campReviseButton" value="수정 완료" id="campReviseButton">
	</form:form>
</body>
</main>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var radio ="${ReviseCamp.place}";
if(radio == "산"){
	$("#mount").prop("checked",true);
}else if(radio == "바다"){
	$("#sea").prop("checked",true);
}else{
	$("#city").prop("checked",true);
}

var checkYn1 = "${ReviseCamp.swim}";
if(checkYn1 == "t"){
	$("#swim").prop("checked",true);
}else{
	$("#swim").prop("checked",false);
}

var checkYn2 = "${ReviseCamp.pick}";
if(checkYn2 == "t"){
	$("#pick").prop("checked",true);
}else{
	$("#pick").prop("checked",false);
}

var checkYn3 = "${ReviseCamp.elec}";
if(checkYn3 == "t"){
	$("#elec").prop("checked",true);
}else{
	$("#elec").prop("checked",false);
}

var checkYn4 = "${ReviseCamp.wifi}";
if(checkYn4 == "t"){
	$("#wifi").prop("checked",true);
}else{
	$("#wifi").prop("checked",false);
}

var checkYn5 = "${ReviseCamp.snack}";
if(checkYn5 == "t"){
	$("#snack").prop("checked",true);
}else{
	$("#snack").prop("checked",false);
}

var checkYn6 = "${ReviseCamp.pet}";
if(checkYn6 == "t"){
	$("#pet").prop("checked",true);
}else{
	$("#pet").prop("checked",false);
} 

$(document).on('click',"#campReviseButton",function(){
	if(document.getElementById("swim").checked==true){
		document.getElementById("swim").value='t';
	}else if(document.getElementById("swim").checked!=true){
		document.getElementById("swim").value='f';
	}
	if(document.getElementById("pick").checked==true){
		document.getElementById("pick").value='t';
	}else if(document.getElementById("pick").checked!=true){
		document.getElementById("pick").value='f';
	}
	if(document.getElementById("elec").checked==true){
		document.getElementById("elec").value='t';
	}else if(document.getElementById("elec").checked!=true){
		document.getElementById("elec").value='f';
	}
	if(document.getElementById("wifi").checked==true){
		document.getElementById("wifi").value='t';
	}else if(document.getElementById("wifi").checked!=true){
		document.getElementById("wifi").value='f';
	}
	if(document.getElementById("snack").checked==true){
		document.getElementById("snack").value='t';
	}else if(document.getElementById("snack").checked!=true){
		document.getElementById("snack").value='f';
	}
	if(document.getElementById("pet").checked==true){
		document.getElementById("pet").value='t';
	}else if(document.getElementById("pet").checked!=true){
		document.getElementById("pet").value='f';
	}
});
</script>

</html>