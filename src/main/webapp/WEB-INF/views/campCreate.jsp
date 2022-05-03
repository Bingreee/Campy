<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<title>캠핑장 등록 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom" style="top:0px; z-index: 10;background-color:white;">
      <a href="/main" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4" href="/main">Campy</span>
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
    				<li><a class="dropdown-item" href="/qa">Q&A</a></li>
    				<li><a class="dropdown-item" href="/noticeList">공지사항</a></li>
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
	<h2> 캠핑장 등록 </h2>
	
	<form:form action="campCreateInfo" method="POST" id="campCreateForm">
        <div id="campingInformation">
            <div class="title"><h4>캠핑장 정보 입력</h4></div>
            
            <label> 캠핑장 이름 </label><input type="text" name="c_name" id="c_name"><br>
            
           <!-- <input type="text" name="c_address" id="c_address"><br> -->
           <!--  <input type="text" id="postcode" placeholder="우편번호" name="postcode" readonly><br> -->
             <label> 캠핑장 주소 </label><input type="text" id="c_address" placeholder="도로명주소" name="c_address"><br>
            <input type="button" id="find_addr" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
            
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
				<input type="radio" name="place" value="산" checked="checked" class="place">산
				<input type="radio" name="place" value="바다" class="place">바다
				<input type="radio" name="place" value="도심" class="place">도심
			</div>
            
            <label> 전화번호 </label><input type="text" name="c_tel" id="c_tel" placeholder="ex)010-0000-0000"><br>
            
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
            
            <div id = roomInformation1>
            	<div class="title"><h4>객실 정보 입력</h4></div>
            	
            	<label> 객실 번호 </label><input type="text" name="r_no1" id="r_no1"><br>
            	
            	<label> 객실 테마 </label><input type="text" name="theme1" id="theme1"><br>
            	
            	<label> 최대 인원 </label>
            	<select name="r_maxno1" id="r_maxno1">
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
            	
            	<label> 객실 설명 </label><textarea name="r_content1" id="r_content1" rows=4></textarea><br>
            	
            	<label> 객실 가격 </label><input name="c_price1" id="c_price1"><br>
            </div>
            
            <div id = roomInformation2>
            	<div class="title"><h4>객실 정보 입력</h4></div>
            	
            	<label> 객실 번호 </label><input type="text" name="r_no2" id="r_no2" value="0"><br>
            	
            	<label> 객실 테마 </label><input type="text" name="theme2" id="theme2"><br>
            	
            	<label> 최대 인원 </label>
				<select name="r_maxno2" id="r_maxno2">
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
            	
            	<label> 객실 설명 </label><textarea name="r_content2" id="r_content2" rows=4></textarea><br>
            	
            	<label> 객실 가격 </label><input name="c_price2" id="c_price2" value="0"><br>
            </div>
            
            <div id = roomInformation3>
            	<div class="title"><h4>객실 정보 입력</h4></div>
            	
            	<label> 객실 번호 </label><input type="text" name="r_no3" id="r_no3" value="0"><br>
            	
            	<label> 객실 테마 </label><input type="text" name="theme3" id="theme3"><br>
            	
            	<label> 최대 인원 </label>
				<select name="r_maxno3" id="r_maxno3">
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
            	
            	<label> 객실 설명 </label><textarea name="r_content3" id="r_content3" rows=4></textarea><br>
            	
            	<label> 객실 가격 </label><input name="c_price3" id="c_price3" value="0"><br>
            </div>
            
                 <input type="submit" name="campCreateButton" value="캠핑장 신규등록" id="campCreateButton">
            
	</form:form>
	
</main>
</div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var c_address = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
           
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
           /*  document.getElementById('postcode').value = data.zonecode; */
            document.getElementById("c_address").value = c_address;
        }
    }).open();
}


$(document).on('click',"#campCreateButton",function(){
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