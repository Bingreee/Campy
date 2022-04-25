<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	#MypageSide {
		float : left;
		height : 1000px;
		width : 500px;
		border-right : solid 1px black;
	}
	
	h1 {
  		display: inline-block;
	} 

	.starter {
  		display: inline-block;
  		float : right;
	} 
	
	.rightButton{
		width : 100px;
	}
</style>
</head>


<body>
<%-- 
		<h1> Campy </h1>
	<nav class="starter">
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
	</nav> --%>


	<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
	<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
		<div class="container-fluid">
			<h1> Campy </h1>
			<div>
				<ul class="nav justify-content-end">
					<li>
						<c:if test="${user.id == null }">
							<button type="button" onclick="location.href='login' "
								class="rightButton">로그인</button>
							<br>
							<button type="button" onclick="location.href='join' "
								class="rightButton">회원가입</button>
						</c:if> 
						<c:if test="${user.id != null }">
								${user.id}
						</c:if>
					</li>
				</ul>
			</div>
		</div>
	</nav> 


	<hr>
	
	<nav id="MypageSide">
	<form>
	캠핑장 둘러보기			<br>

		이름으로 검색 <input name="c_name" type="text" size="10" id="c_name">
		<br>


			<select name="c_address" id ="c_address">
    			<option value="">지역선택</option>
    			<option value="서울">서울</option>
    			<option value="경기도">경기도</option>
    			<option value="강원도">강원도</option>
    			<option value="전라북도">전라북도</option>
    			<option value="전남">전남</option>
    			<option value="경상남도">경상남도</option>
			</select>
			<br>
	

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

			<div class = "place">
				주변경관<br>
				<input type="radio" name="place" value="산" checked="checked" class="place">산
				<input type="radio" name="place" value="바다" class="place">바다
				<input type="radio" name="place" value="도심" class="place">도심
			</div>
	
		<div class = "options">
		옵션 <br>
		<label><input type="checkbox" name="swim"  id="swim" class="swim"> 수영</label>			
		<label><input type="checkbox" name="pick"  id="pick" class="pick"> 픽업</label>				
		<label><input type="checkbox" name="elec"  id="elec" class="elec"> 전기</label>			
		<label><input type="checkbox" name="wifi"  id="wifi" class="wifi"> 와이파이</label>				
		<label><input type="checkbox" name="snack"  id="snack" class="snack"> 스낵</label>				
		<label><input type="checkbox" name="pet"  id="pet" class="pet"> 펫</label> 
		<br>
		</div>
	
	
	
	
			<input type="button" value="검색" id="mainSearchButton">
	
	
	</form>
	</nav>
	
	<figure id="table1">
  		<!-- <img src="..." class="figure-img img-fluid rounded" alt="...">
  		<figcaption class="figure-caption text-end">A caption for the above image.</figcaption> -->
	</figure>
	

<!-- 	<table id="table1">
			<tr>
				<td>검색 결과값은 여기에 나옵니다</td>
			</tr>
	</table> -->
	
	<div> </div>


</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	
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
			url : "/mainSearch",
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
			
			success : function(result) { // 결과 성공 콜백함수
			    console.log(result);
			},
			error : function(request, status, error) { // 결과 에러 콜백함수
			    console.log(error)
			}
		}).done(function(data){
			$("#table1").empty(); 
			/* 	console.log(data); */
			
			for(let i=0; i<data.length; i++){
				var htmlText = "";
				var htmlImg ="";
			/* 	htmlText += '<tr>';
				htmlText += "<td> <a href='/roomInfo/"+data[i].c_no+"'>"+data[i].c_name+"</a> </td>";
				htmlText += '</tr>';
				htmlImg += '<tr>';
				htmlImg += '<td>'
				htmlImg += "<img src='../../CampPhoto/Camping/"+data[i].c_no+".jpg' class="figure-img img-fluid rounded" alt="..." />";
				htmlImg += '</td>';
				htmlImg += '</tr>';  */
				
				
				htmlText += "<a href='/roomInfo/"+data[i].c_no+"'>"+data[i].c_name+"</a><br><br>";
				htmlImg += "<img src='../../CampPhoto/Camping/"+data[i].c_no+".jpg' width='200' />";
				
				
				$("#table1").append(htmlImg); 
				$("#table1").append(htmlText);
		/* 		<figcaption class="figure-caption text-end">A caption for the above image.</figcaption> */
			}
		})	
	});
	
	
</script>

</html>