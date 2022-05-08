<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<title>캠핑장 등록 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
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

<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom" style="top:0px; z-index: 10;background-color:white;">
      <a href="/campy/main" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <img src="../../../CampPhoto/Camping/CampyLogo2.png" style="width:50px;" alt="campy"/>
        <span class="fs-4" href="/campy/main">Campy</span>
      </a>
		
      <ul class="nav nav-pills">
      <li class="nav-item">
      	<c:if test="${user.id != null }">
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
			</li>
        	<li class="nav-item"><a href="/logout" class="nav-link">Log out</a></li>
        </c:if>
      </ul>
</header>

<div class="container-fluid">
<div class="row">
	<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse" > <!-- style="position:sticky;top:100px;height:500px;" -->
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
	<h2> 캠핑장 등록 </h2>
	
	<form:form action="/admin/createRoom" method="POST" id="campCreateForm">
        <div id="campingInformation">
            <div class="title"><h4>캠핑장 정보 입력</h4></div>
            
            <label> 캠핑장 이름 </label><input type="text" name="cdto.c_name" id="c_name"><br>
            
             <label> 캠핑장 주소 </label><input type="text" id="c_address" placeholder="도로명주소" name="cdto.c_address"><br>
            <input type="button" id="find_addr" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
            
            <label> 최대인원 </label>
            <select name="cdto.maxno" id="maxno">
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
				<input type="radio" name="cdto.place" value="산" checked="checked" class="place">산
				<input type="radio" name="cdto.place" value="바다" class="place">바다
				<input type="radio" name="cdto.place" value="도심" class="place">도심
			</div>
            
            <label> 전화번호 </label><input type="text" name="cdto.c_tel" id="c_tel" placeholder="ex)010-0000-0000"><br>
            
            <label> 옵션 선택 </label><br>
            <label><input type="checkbox" name="cdto.swim"  id="swim" class="swim"> 수영</label> 			
			<label><input type="checkbox" name="cdto.pick"  id="pick" class="pick"> 픽업</label> 				
			<label><input type="checkbox" name="cdto.elec"  id="elec" class="elec"> 전기</label> 				
			<label><input type="checkbox" name="cdto.wifi"  id="wifi" class="wifi"> 와이파이</label>				
			<label><input type="checkbox" name="cdto.snack"  id="snack" class="snack"> 스낵</label>				
			<label><input type="checkbox" name="cdto.pet"  id="pet" class="pet"> 펫</label>
            <br>
            
 			<hr>
 					
            </div>
              
          
            <div class = roomInformation1>
            	<div class="title"><h4>객실 정보 입력</h4></div>
            	<fieldset style="margin-bottom:20px;border:2px solid black;border-radius:5px;width:40%">
            	<label> 객실 번호 </label><input type="text" name="rListDto[0].r_no" id="r_no" value="101"><br>
            	
            	<label> 객실 테마 </label><input type="text" name="rListDto[0].theme" id="theme"><br>
            	
            	<label> 최대 인원 </label><input type='number' name='rListDto[0].r_maxno' id='r_maxno'><br>
            	
            	
            	<label> 객실 가격 </label><input name="rListDto[0].c_price" id="c_price"><br>
            	</fieldset>
            </div>
            
             <div class = roomInformation2>
           		
             </div>
            <button class="createRoom">등록</button>
            </form:form>
            <button id="plus" onclick="incrementClick()">추가</button>
            
</main>
</div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

let i = 0;

function incrementClick() {
	console.log(++i);
}
	$("#plus").click(function(){
		let plus = "<fieldset style='margin-bottom:20px;border:2px solid black;border-radius:5px;width:40%'>"+
					"<label> 객실 번호 </label><input name='rListDto["+i+"].r_no' id='r_no'><br>"+
    				"<label> 객실 테마 </label><input name='rListDto["+i+"].theme' id='theme'><br>"+
    				"<label> 최대 인원 </label><input type='number' name='rListDto["+i+"].r_maxno' id='r_maxno'><br>"+
    				"<label> 객실 가격 </label><input name='rListDto["+i+"].c_price' id='c_price'><br>"+
    				"</fieldset>";
	$(".roomInformation2").append(plus);
})


function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var c_address = data.roadAddress; 
            var extraRoadAddr = '';
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
           
            document.getElementById("c_address").value = c_address;
        }
    }).open();
}

$(function(){
	$(".createRoom").click(function(){
		
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
		
		$("#campCreateForm").submit();
	})
})
</script>


</html>