<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<title>캠핑 객실 검색</title>
<style>

	h1 {
  		display: inline-block;
	}
	
	.searchResult {
		margin-bottom: 40px;
	}
	
	.selectDate{
		margin-top: 40px;
	}
	
	nav {
  		display: inline-block;
  		float : right;
	}
	
	.rightButton{
		width : 100px;
	}
	
	#setting{
		display: none;
	}
	
	.loveBtn, .reservation, .detail{
		cursor: pointer;
	}
	
	
	.thumbnail{
		width: 780px;
		border-radius: 7px;
	}
	
	.roomPhoto0, .roomPhoto1, .roomPhoto2{
		width: 260px;
		height: 200px;
	}
	
	.roomPhoto0 {
		border-radius: 7px 0 0 7px;
	}
	
	.roomPhoto2 {
		border-radius: 0 7px 7px 0;
	}


li{ list-style: none; }

#roomInfo{
  margin: 0 auto;
  overflow: hidden;
  float: left;
}

#roomInfo li{
  width: 500px; 
  height: 300px;
  display: inline;
}

#roomInfo a{
  display: block; 
  overflow: hidden;
  position: relative; 
  float: left;
}

#roomInfo figure{
  width: 100%; height: 100%;
}
#roomInfo figcaption{
  width: 100%; height: 100%;
  background-color: rgba(0,0,0,0.7);

  position: absolute; 
  top: 0; left: 0;

  color: #fff; text-align: center;
  line-height: 200px;

  opacity: 0; 

  transition: 0.3s;
}

#roomInfo a:hover figcaption, #roomInfo a:focus figcaption{
  opacity: 1;
}

#roomInfo{
	float: right;
}

.roomContent0, .roomContent1, .roomContent2{
	display: none;
}

.bb{
	font-size: 1.5em;
	display: inline;
}

#selectDate{
	width: 300px;
	text-align: center;
}

#result{
	width: 120px;
	height: 30px;
	text-align: center;
	margin-bottom: 50px;
	border-radius: 5px;
}

.countBtn{
	width: 30px;
	height: 30px;
}

.detail{
	width:100%;
	height:100%;
	border: none;
	background-color:transparent;
	font-size: 2em;
	color: white;
}

</style>
</head>
<body>
<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom" style="position:sticky;top:0px; z-index: 10;background-color:white;">
      <a href="/main" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
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
    				<li><a class="dropdown-item" href="/joinSelect">회원가입</a></li>
  				</ul>
			</div>
        </c:if>
      </ul>
</header>


	<h4 class="searchResult">검색결과</h4>
		
		<c:forEach items="${campList }" var="campList">
		<c:if test="${room == campList.c_no }">
			<option value="${campList.c_no }" selected="${room }" class="bb">${campList.c_name }</option> 
		</c:if>
		</c:forEach>
		<c:if test="${user.id == null }">
		</c:if>
		<c:if test="${user.id != null}">
			<input type="button" id="lovebtn" value="♡"><br>
		</c:if>
		
	<h4 class="selectDate">날짜선택</h4>
	<input id="selectDate" class="form-control linkedCalendars"/><br><br>
	<span id="setting" class="input-group-text calendar-icon">
	<i data-feather="calendar" class="feather-sm"></i>
	</span>
	
	<span><h3>인원 선택</h3> </span><input class="countBtn" type="button" value="+" onclick='count("plus")'><input id='result' value='1' readonly><input type="button" class="countBtn" value="-"  onclick='count("minus")'><br>
	<!-- <input type="button" value="+" onclick='count("plus")'><input type="button" value="-"  onclick='count("minus")'><br> -->
	<input type="button" value="리뷰 확인하러가기" onclick="location.href='/reviewInfo/${room}'">
	<h4 class="roomList">객실 목록</h4>
	<div id="roomInfo"></div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript">

$('.linkedCalendars').daterangepicker({
	endDate: new Date(new Date().setDate(new Date().getDate()+1)),
	linkedCalendars: false,
	minDate: new Date(),
	
	"locale":{
	"format": "YYYY-MM-DD",
	"separator": " ~ ",
	"applyLabel": "확인",
	"cancelLabel": "취소",
	"fromLabel": "From",
	"toLabel": "To",
	"customRangeLabel": "Custom",
	"daysOfWeek": ["일","월", "화", "수", "목", "금", "토"],
	"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"] },
	}, function (start, end, label) {
	//console.log('선택된 날짜: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	});//dateRangePicker
	
	function count(type)  {
		  // 결과를 표시할 element
		  var number = document.getElementById('result').value;
		 
		  // 현재 화면에 표시된 값
		  //let number = resultElement.val();
		  
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		    if(number > 5) {
		    	alert("최대 인원은 5명입니다.")
		    	return false;
		    }
		  }else if(type === 'minus')  {
		    number = parseInt(number) - 1;
		    if(number < 1) {
		    	alert("최소 인원은 1명입니다.");
		    	return false;
		    }
		  }
		  // 결과 출력
		  document.getElementById('result').value = number;
		}
	
	$(function(){
		
			let c_no = $(".bb").val();
			$.ajax({
				url : "/room/"+c_no,
				type : "get",
				dataType : "json"
			}).done(function(data){
				$("#roomInfo").empty();
				for(let i=0; i<data.length; i++){
					let src = "../../CampPhoto/"+data[i].r_photo+""
					let str = "<div id='"+data[i].r_no+"'><ul><li><a><figure><img class='thumbnail' src='"+src+"'><figcaption>"+"<input type='button' id='"+data[i].r_no+"' class='detail' value='상세정보'>"+"</figcaption></figure></a>"+
								"<span class='flo'>객실번호 :"+data[i].r_no+"<br>"+
								"캠핑 종류 : "+data[i].theme+"<br>"+
								"최대 인원 : "+data[i].r_maxno+"<br>"+
								"가격 : <span class='c_price'>"+data[i].c_price+"</span><br>"+
								"<input type='button' id='"+data[i].r_no+"' class='reservation' value='예약하기'>"+
								"<div class='rooms"+i+"'><div class='roomDetail"+i+"'></div>"+
								"<div class='roomContent"+i+"'>"+data[i].r_content+"</div></div></span></li></ul></div>";
								
					$("#roomInfo").append(str);	
					
				}
				
				$.ajax({url : "/checkLove",
					type : "get",
					data : {"c_no" :c_no},
					dataType : "text"})
					.done(function(data){
						if(data == 0){
							 $("#lovebtn").val("♡");
						}else{
							 $("#lovebtn").val("♥");
						}	
					})
				
		}); 
		
		$(document).on('click',".reservation",function(){
			
			let id = "${user.id}";
			let r_no = $(this).attr("id");
			let countP = document.getElementById('result').innerText;
			let date = $("#selectDate").val();
			let start_date = date.substr(0,10);
			let end_date = date.substr(13);
			let sday = start_date.substr(8);
			let eday = end_date.substr(8);
			
			let sdate2 = new Date(start_date);
			let edate2 = new Date(end_date);
			let date2 = edate2.getTime() - sdate2.getTime();
			let day2 = Math.abs(date2 / (1000 * 3600 * 24));
			
			let c_no = $(".bb").val();
			let c_price = $(this).parents().children(".c_price").text() * day2;
			
			if(id == "") {
				alert("로그인 후 이용 가능합니다.");
				location.href="/login";
				return false;
			}
			
			if(!confirm("예약하시겠습니까?")) {
				location.href="redirect:/";
				return false;
			}else {
				alert("예약이 완료되었습니다.");
				$.ajax({
					url:"/insertReserve",
					type:"post",
					data:{"c_no":c_no,"r_no":r_no,"c_price":c_price,"start_date":start_date,"end_date":end_date},
					dataType:"text"
				}).done(function(data){
					location.href="/reserveStatus";
				})
			}
		})
		
		$(document).on('click',".detail",function(){
			
	          let c_no = $(".bb").val();
			  let r_no = $(this).attr("id");
			  let j_no = r_no - 101;
			  
			  $(".rooms"+j_no).toggle();
			  
			  $.ajax({
					url:"/selRoomPho",
					data:{"c_no" :c_no,"r_no":r_no},
					dataType:"json"
				}).done(function(data){
					console.log(data);
					$(".roomDetail"+j_no+"").empty();
					for(let i=0; i<data.length; i++) {
						//let img = $("<img class='roomPhoto'>").attr({'src': '../../CampPhoto/'+data[i].pho_address});
						let src = "../../CampPhoto/"+data[i].pho_address+""
						$(".roomDetail"+j_no+"").append("<img class='roomPhoto"+i+"' src='"+src+"'>");
						$(".roomContent"+j_no+"").show();
					} 
				})
				
		})
		
		$("#lovebtn").click(function(){
			var c_no = $(".bb").val();
			var btnval = $("#lovebtn").val();
			
			if(btnval == "♥") {
				$.ajax({
					url:"/deleteLoveRoom",
					data:{"c_no":c_no},
					dataType:"text"
				}).done(function(data){
					alert("찜 목록에서 삭제되었습니다.");
					$("#lovebtn").val("♡");
				})
				return false;
			}
			
			$.ajax({
				url:"/insertLove",
				data:"c_no="+c_no,
				dataType:"text"
			}).done(function(data){
				alert("찜 목록에 추가되었습니다.");
				$("#lovebtn").val("♥");
				return false;
			})
			
		})
		
		$(".linkedCalendars").on('apply.daterangepicker',function(){
			$(".thumbnail101").show();
			$(".thumbnail102").show();
			$(".thumbnail103").show();
			$("#101").show();
			$("#102").show();
			$("#103").show();
			let c_no = $(".bb").val();
			
			let date = $("#selectDate").val();
			let start_date = date.substr(0,10);
			let end_date = date.substr(13);
			if(start_date == end_date) {
				alert("예약은 최소 1박부터 가능합니다.");
				return false;
			}
			
			console.log(start_date);
			$.ajax({
				url : "/room/"+c_no,
				type : "get",
				dataType : "json"
			}).done(function(data){
				for(let i=0; i<data.length; i++){
					
					let r_no = data[i].r_no
					let date = $("#selectDate").val();
					let start_date = date.substr(0,10);
					let end_date = date.substr(13);
					$.ajax({
						url:"/chkDateList",
						data:{"c_no":c_no,"r_no":r_no,"start_date":start_date,"end_date":end_date},
						dataType:"json"
					}).done(function(data){
						
						for(let i = 0; i <data.length; i++) {
							console.log(data[i].r_no);
							$("#"+data[i].r_no+"").hide();
							$(".thumbnail"+data[i].r_no+"").hide();
							
						}
					})
				}
			})					
			
		})
		
	});//ready
</script>
</body>
</html>