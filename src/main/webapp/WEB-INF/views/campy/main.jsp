<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Campy</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />

<style>

#MypageSide {
		float : left;
		height : 1000px;
		width : 401px;
		border-right : solid 1px black;
}
	
li{ list-style: none; } 

.gallery{
  width: 940px; margin: 0 auto;
  overflow: hidden;
}
.gallery h3{
  width: 100%; height: 50px;
  line-height: 50px; text-align: center;
}
.gallery li{
  width: 600px; height: 400px;
  margin-right: 20px;
}
.gallery li:last-child{ margin-right: 0; }

.gallery a{
  display: block; 
  width: 100%; height: 100%;

  overflow: hidden;

  position: relative; 
}

.gallery figure{
  width: 100%; height: 100%;
}
.gallery figcaption{
  width: 100%; height: 100%;
  background-color: rgba(0,0,0,0.7);

  text-align : center;
  position: absolute; 
  top: 0; left: 0;

  color: #fff; text-align: center;
  line-height: 400px;
  opacity: 0; 

  transition: 0.3s;
  
}

.gallery a:hover figcaption, .gallery a:focus figcaption{
  opacity: 1;
}
	
	.hc {  left:0; right:0; margin-left:auto; margin-right:auto; } 
	.vc {  top: 0; bottom:0; margin-top:auto; margin-bottom:auto; } 

	
	#mainSearchButton {
	background: linear-gradient(to left, rgb(41, 123, 255), rgb(51, 203, 255));
	border: none;
	color: white;
	border-radius: 8px;
	width: 200px;
	height: 35px;
	font-size: 14pt;
	margin-left: 32px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 600;
	}
	
	#adminOnly{
		display : none;
	}
	option {
		text-align : center;
	}
	select {
		width : 200px;
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
      		<button type="button" id="adminOnly" onclick="location.href='/admin/fullCalenderPage'" >관리자</button>
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
    				<li><a class="dropdown-item" href="/login/join">회원가입</a></li>
  				</ul>
			</div>
        </c:if>
      </ul>
</header>
	
	<nav id="MypageSide">
	<form>
	<h4>캠핑장 둘러보기</h4>
				<br>

		<input name="c_name" type="text" size="30" id="c_name" placeholder="캠핑장명을 입력해주세요" style="text-align:center;">
		<br>
		<br>
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-map-fill" viewBox="0 0 16 16">
 				 <path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.598-.49L10.5.99 5.598.01a.5.5 0 0 0-.196 0l-5 1A.5.5 0 0 0 0 1.5v14a.5.5 0 0 0 .598.49l4.902-.98 4.902.98a.502.502 0 0 0 .196 0l5-1A.5.5 0 0 0 16 14.5V.5zM5 14.09V1.11l.5-.1.5.1v12.98l-.402-.08a.498.498 0 0 0-.196 0L5 14.09zm5 .8V1.91l.402.08a.5.5 0 0 0 .196 0L11 1.91v12.98l-.5.1-.5-.1z"/>
				</svg>
			<select name="c_address" id ="c_address">
    			<option value="" >지역선택</option>
    			<option value="서울" >서울</option>
    			<option value="경기도">경기도</option>
    			<option value="강원도">강원도</option>
    			<option value="전라북도">전라북도</option>
    			<option value="전남">전남</option>
    			<option value="경상남도">경상남도</option>
			</select>
			<br><br>
	
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  			<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
			</svg>
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
			</select>
			<br>	
			<br>
			<div class = "place">
				<form>
				<fieldset>
				<legend>주변경관</legend>
				<input type="radio" name="place" value="산"  class="place">산
				<input type="radio" name="place" value="바다" class="place">바다
				<input type="radio" name="place" value="도심" class="place">도심
				</fieldset>
				</form>
			</div>
			<br><br>
		<div class = "options">
		<fieldset>
		<legend>옵션</legend>
		<label><input type="checkbox" name="swim"  id="swim" class="swim"> 수영</label>			
		<label><input type="checkbox" name="pick"  id="pick" class="pick"> 픽업</label>				
		<label><input type="checkbox" name="elec"  id="elec" class="elec"> 전기</label>			
		<label><input type="checkbox" name="wifi"  id="wifi" class="wifi"> 와이파이</label>				
		<label><input type="checkbox" name="snack"  id="snack" class="snack"> 스낵</label>				
		<label><input type="checkbox" name="pet"  id="pet" class="pet"> 펫</label> 
		</fieldset>
		<br>
		</div>
		
			<input type="button" value="검색" id="mainSearchButton">
	</form>
	</nav>
	<div class="gallery" id="table1">
		<c:forEach items="${campAll }" var="campAll">
			<ul>
				<li>
				<a href="/campy/roomInfo/${campAll.c_no }">
				<figure> <img src='../../../CampPhoto/Camping/${campAll.c_no }.jpg'  width='600' height='400'>
				<figcaption class='hc vc'>${campAll.c_name }</figcaption>
				</figure></a>
				</li>
			</ul>
		</c:forEach>
	</div>

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	if("${user.id}" == "admin"){
		$("#adminOnly").show();
	
	}

	$(document).on('click',"#mainSearchButton",function(){
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

		let c_name = $("#c_name").val();
		let c_address = $("#c_address").val();
		let maxno = $("#maxno").val();
		let place = $("input[name='place']:checked").val();
		
		let swim = $(".swim").val();
		let pick = $(".pick").val();
		let elec = $(".elec").val();
		let wifi = $(".wifi").val();
		let snack = $(".snack").val();
		let pet = $(".pet").val();
		
		console.log("확인!");
		console.log(c_name, c_address, maxno, place, swim, pick, elec, wifi, snack, pet);
		
		$.ajax({
			type: "get",
			url : "/main/mainSearch",
			data :{
				"c_name" : c_name,
				"c_address" : c_address,
				"maxno" : maxno,
				"place" : place,
				"swim" : swim,
				"pick" : pick,
				"elec" : elec,
				"wifi" : wifi,
				"snack" : snack,
				"pet" : pet
			},
			
			datatype : "text" ,
			
			success : function(result) { 
			},
			error : function(request, status, error) { 
			}
		}).done(function(data){
			$("#table1").empty(); 
			
			for(let i=0; i<data.length; i++){
				var htmlText = "";
				var htmlImg ="";
				var html = "";
				
				html += "<ul><li>";
				html += "<a href='/campy/roomInfo/"+data[i].c_no+"'>";
				html += "<figure> <img src='../../../CampPhoto/Camping/"+data[i].c_no+".jpg'  width='600' height='400'>";
				html += "<figcaption class='hc vc'>"+data[i].c_name+"</figcaption>";
				html += "</figure></a>";
				html += "</li></ul>";

				$("#table1").append(html);

			}
		})	
	});
</script>

</html>