<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<title>캠핑 객실 검색</title>
<style>
	h1 {
  		display: inline-block;
	}

	nav {
  		display: inline-block;
  		float : right;
	}
	
	.rightButton{
		width : 100px;
	}
	
	.v-line{
	 	border-left: thin solid #000;
 		height:100%;
 		left: 40%;
 		position: absolute;
	}
	
	.roomList{
		display : inline;
		position : relative;
		left : 800px;
		border-top : 10px;
		background-color: #BBDEFB;
        margin: 10px 20px;
        padding: 10px 20px;
	}

	#roomInfo{
		position : relative;
		left : 1000px;
		display : block;
		margin-top : 50px;
	}
	
	#setting{
		position: absolute;
	}
	
	.thumbnail, .roomPhoto{
		position: relative;
		right:200px;
		width:150px;
		height:150px;
		border-radius: 10%;
	}
	
	.loveBtn {
		margin-top: 100px;
	}
	
	.loveBtn, .reservation, .detail{
		cursor: pointer;
	}
	
	.roomDetail, #lovechk, .roomContent{
		display:none;
	}
	
</style>
</head>
<body>
<h1> Campy </h1>
	<nav>
		<ul>
			<c:if test="${user.id == null }">
				<button type="button" onclick="location.href='/login' " class="rightButton">로그인</button><br>
				<button type="button" onclick="location.href='/join' " class="rightButton">회원가입</button>
		<!-- 		<a href="login">로그인</a><br>
				<a href="join">회원가입</a> -->
			</c:if>
			<c:if test="${user.id != null }">
				${user.id}
				<form action="logout" method="get">
					<button type="submit">로그아웃</button>
				</form>
			</c:if>
		</ul>
	</nav>
	<hr>
	<div class="v-line"></div>
	
	<h4>검색결과</h4>
		
	<select id="c_no" name="c_no">
		<c:forEach items="${campList }" var="campList">
		<c:if test="${room == campList.c_no }">
			<option value="${campList.c_no }" selected="${room }" class="bb">${campList.c_name }</option> 
		</c:if>
		</c:forEach>
		
		<!-- value는 c_no, 출력은 c_name -->
	</select>
		<p>${room }</p>
	<h4>날짜선택</h4>
	<input id="selectDate" class="form-control linkedCalendars"/><br><br>
	<span id="setting" class="input-group-text calendar-icon">
	<i data-feather="calendar" class="feather-sm"></i>
	</span>
	
	<span>인원 선택 </span><span id='result'> 1</span>
	<input type="button" value="+" onclick='count("plus")'><input type="button" value="-"  onclick='count("minus")'><br>
	<c:if test="${user.id == null }">
	</c:if>
	<c:if test="${user.id != null}">
		<input type="button" id="lovebtn" value="♡"><br>
	</c:if>
	<input type="button" value="리뷰 확인하러가기" onclick="location.href='/reviewInfo/${room}'">
	<h4 class="roomList">객실 목록</h4>
	<div id="roomInfo"></div>
	<button id="cc">버튼</button>
	<%-- 전체 객실 가져오기
	<c:forEach items="${room}" var="room">
		<div class="roomListDetail">${room.c_no } / ${room.r_no} / ${room.r_content }
		<input type="button" value="예약하기"></div><br>
	</c:forEach> --%>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript">

$('.linkedCalendars').daterangepicker({
	linkedCalendars: false,
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
	console.log('선택된 날짜: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	});//dateRangePicker
	
	function count(type)  {
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('result');
		  
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;
		  
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
		  resultElement.innerText = number;
		}
	
	$(function(){

			let c_no = $(".bb").val();
			$.ajax({
				url : "/room/"+c_no,
				type : "get",
				dataType : "json"
			}).done(function(data){
				console.log(data);
				$("#roomInfo").empty();
				for(let i=0; i<data.length; i++){
					let img = $("<img class='thumbnail'>").attr({'src': '../../CampPhoto/'+data[i].r_photo});
					let str = "<div id='"+data[i].r_no+"'>객실번호 :"+data[i].r_no+"<br>"+
								"캠핑 종류 : "+data[i].theme+"<br>" +
								"최대 인원 : "+data[i].r_maxno+"<br>"+
								"객실 소개 : "+data[i].r_content+"<br>"+
								"가격 : <span class='c_price'>"+data[i].c_price+"</span><br>"+
								"<input type='button' id='"+data[i].r_no+"' class='reservation' value='예약하기'>"+
								"<input type='button' id='"+data[i].r_no+"' class='detail' value='상세정보'>"+
								"<div class='roomDetail'></div>"+
								"<div class='roomContent'>"+data[i].r_content+"</div><br><br>";
					$("#roomInfo").append(img);			
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
			
			let c_no = $("#c_no").val();
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
				}).done(function(date){
					location.href="reserveStatus";
				})
			}
		})
		
		$(document).on('click',".detail",function(){
			$('.roomContent').slideUp(300);
	         if ($(this).siblings('.roomContent').is(':hidden')){
	            $(this).siblings('.roomContent').slideDown(300);
	         } else{
	            $(this).siblings('.roomContent').slideUp(300);
	         }
			
			 $('.roomDetail').slideUp(300);
	         if ($(this).siblings('.roomDetail').is(':hidden')){
	            $(this).siblings('.roomDetail').slideDown(300);
	         } else{
	            $(this).siblings('.roomDetail').slideUp(300);
	         }
			
			  let c_no = $("#c_no").val();
			  let r_no = $(this).attr("id");
			  
			  $.ajax({
					url:"/selRoomPho",
					data:{"c_no" :c_no,"r_no":r_no},
					dataType:"json"
				}).done(function(data){
					console.log(data);
					$(".roomDetail").empty();
					for(let i=0; i<data.length; i++) {
						let img = $("<img class='roomPhoto'>").attr({'src': '../../CampPhoto/'+data[i].pho_address});
						$(".roomDetail").append(img);
					} 
				})
				
		})
		
		$("#lovebtn").click(function(){
			var c_no = $("#c_no").val();
			var btnval = $("#lovebtn").val();
			
			if(btnval == "♥") {
				$.ajax({
					url:"/deleteLove",
					data:{"c_no":c_no},
					dataType:"text"
				}).done(function(date){
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
		
	});//ready
</script>
</body>
</html>