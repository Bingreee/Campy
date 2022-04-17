<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 목록</title>
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
	
	#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: white;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}

td{
	width : 233.3px;
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
			</c:if>
		</ul>
	</nav>
	<hr>
	<div id="center">
		<h3>Review</h3>
		<div align="right">
			<a href="reviewWrite" id="reviewWrite">리뷰 등록</a>
		</div>
		
	<select>
		<c:forEach items="${campList }" var="campList">
			<option value="${campList.c_no }">${campList.c_name }</option> 
		</c:forEach>
		<!-- value는 c_no, 출력은 c_name -->
	</select>
	
	<c:if test="${countReview != 0 }">
			<table >
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</table>
			<table id="table1">
			
			</table>
	
				<%-- <c:forEach items="${reviewList}" var="review">
				<tr>
					<td>${review.rv_no }</td>
					<td><a href ="reviewContent/${review.rv_no}">${review.rv_title}</a></td>
					<td>${review.id }</td>
					<td><fmt:formatDate value="${review.rv_date }" dateStyle="short"/> </td>
				</tr>
				</c:forEach> --%>
			<!-- </table> -->
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>

	</div>
	
	<div id="search" align="center">
		<form action="search">
			<select name="searchn">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">작성자</option>
			</select>
			<input type="text" name="search" size="15" maxlength="50" />
			<input type="submit" value="검색" />
		</form>
	</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function(){
	$("select").click(function(){
		let c_no = $(this).val();
		$.ajax({
			url : "review/"+c_no,
			type : "get",
			dataType : "json"
		}).done(function(data){
			//console.log(data);
			$("td").empty();
			var html = "";
			for(let i=0; i<data.length; i++){
				html += '<tr>';
				html += "<td> <a href='/reviewContent/"+data[i].rv_no+"'>"+data[i].rv_title+"</a> </td>";
				html += '<td>'+data[i].id+'</td>';
				html += '<td>'+data[i].rv_date+'</td>';
				html += '</tr>';
				
			}
			$("#table1").html(html);
		 })
		
	});
	
	$("#reviewWrite").click(function(){
		if ("${user.id}" == null){
			alert("로그인 해야함");
			return false;
		}
	});
}); 




</script>
</body>
</html>