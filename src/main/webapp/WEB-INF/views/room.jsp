<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
		left : 500px;
		border-top : 10px;
		background-color: #BBDEFB;
        margin: 10px 20px;
        padding: 10px 20px;
	}
	
	span{
		position : relative;
		left : 550px;
	}
	#roomInfo{
		position : relative;
		left : 550px;
		display : block;
		margin-top : 50px;
	}
</style>
</head>
<body>
<h1> Campy </h1>
	
	<nav>
		<ul>
			<c:if test="${user.id == null }">
				<button type="button" onclick="location.href='login' " class="rightButton">로그인</button><br>
				<button type="button" onclick="location.href='join' " class="rightButton">회원가입</button>
		<!-- 		<a href="login">로그인</a><br>
				<a href="join">회원가입</a> -->
			</c:if>
			<c:if test="${user.id != null }">
				${user.id}
			</c:if>
		</ul>
	</nav>
	<hr>
	<div class="v-line"></div>
	
	<h4>검색결과</h4>
		
	<select>
		<c:forEach items="${campList }" var="campList">
			<option value="${campList.c_no }">${campList.c_name }</option> 
		</c:forEach>
		<!-- value는 c_no, 출력은 c_name -->
	</select>
	
	
	<h4 class="roomList">객실 목록</h4>
	<div id="roomInfo"></div>
	
	
	<%-- 전체 객실 가져오기
	<c:forEach items="${room}" var="room">
		<div class="roomListDetail">${room.c_no } / ${room.r_no} / ${room.r_content }
		<input type="button" value="예약하기"></div><br>
	</c:forEach> --%>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("select").click(function(){
			let c_no = $(this).val();
			$.ajax({
				url : "room/"+c_no,
				type : "get",
				dataType : "json"
			}).done(function(data){
				console.log(data);
				$("#roomInfo").empty();
				for(let i=0; i<data.length; i++){
					$("#roomInfo").append("객실번호 :"+data[i].r_no+"<br>")
					.append("캠핑 종류 : "+data[i].theme+"<br>")
					.append("최대 인원 : "+data[i].r_maxno+"<br>")
					.append("객실 소개 : "+data[i].r_content+"<br>")
					.append("가격 : "+data[i].c_price+"<br><br>")
				}
			 })
			
		});
	}); 
</script>

</body>
</html>