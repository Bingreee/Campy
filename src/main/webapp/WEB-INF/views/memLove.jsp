<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>찜 하기 목록</title>
<style>
	#MypageSide {
		float : left;
		height : 100px;
		width : 300px;
	}
	
	h1 {
  		display: inline-block;
	}

	nav {
  		display: inline-block;
  		float : right;
	}
	
	.sideButton{
		float : left;
		width : 150px;
		margin : 30px;
	}
	
	#fix{
		clear : both;
		width : 300px; 
	}
	
	.rightButton{
		width : 100px;
	}
	.detail {
		position : relative;
		left :600px;
		right : 100px;
		padding : 2px;
	}
	fieldset{
		float:right;
		width:70%;
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
	
	<nav id="MypageSide">
		<ul>
			<button type="button" class="sideButton" onclick="location.href='mypage' ">개인정보</button>
			<button type="button" class="sideButton" onclick="location.href='memLove' ">찜한상품</button>
			<button type="button" class="sideButton" onclick="location.href='reserveStatus' ">예약현황</button>
			<button type="button" class="sideButton" onclick="location.href='qna' ">Q&A</button>
			<button type="button" class="sideButton" onclick="location.href='ask' ">공지사항</button>
			
		</ul>
	</nav>
	
	<h3>찜 목록</h3>
	
<c:forEach items="${loveStatus }" var="loveStatus">
<fieldset>
	<p>캠핑장이름 : ${loveStatus.c_name }</p>
	<p><a href="/roomInfo/${loveStatus.c_no }">상세보기</a></p>
	<!-- <button id="" type="button"></button> -->
	<button id="${loveStatus.id }" value="${loveStatus.c_no }" class="loveBtn" type="button">♥</button>
	</fieldset>
</c:forEach>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(document).on('click', '.loveBtn', function() {
	var id = $(this).attr("id");
	var c_no = $(this).val();
	if (confirm("찜 목록에서 삭제하시겠습니까 ?")) {
		$.ajax({
			url : "/deleteLove",
			data : {
				"id":id, "c_no":c_no
			},
			success : function(){
				alert('삭제 완료');
				location.href='/memLove';
			}
		})
	}
});

</script>
</body>
</html>