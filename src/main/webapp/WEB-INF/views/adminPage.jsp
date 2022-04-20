<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지</title>
<style>
	table {
		border: 1px solid black;
		border-collapse: collapse;
		margin-top: 10px;
	}
	th, td {
     	border: 1px solid #444444;
    }
    th {
    	width: 250px;
    	height: 50px;
    }
    td {
    	text-align: right;
    }
</style>
</head>
<body>
<h1>관리자 페이지입니다</h1>
<input type="button" value="예약현황" id="showReserve">
<table>
	<tr><th>예약번호</th><th>고객명</th><th>예약일</th><th>객실</th><th>요금</th></tr>
	<tr>
		<td class="reserve_no"></td>
		<td class="mem"><br></td>
		<td class="reserve_date"></td>
		<td class="room_date"></td>
		<td class="price"></td></tr>
</table>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#showReserve").click(function(){
		$.ajax({
			url:"/allReserve",
			type:"post",
			dataType:"json"
		}).done(function(data){
			for(let i=0; i<data.length; i++) {
				let reserve_no = data[i].reserve_no;
				let mem = data[i].mem_name +"<br>"+ data[i].mem_tel;
				let reserve_date = data[i].reserve_date;
				let room_date = data[i].c_no+"&nbsp"+data[i].r_no+"<br>"+data[i].start_date+"<br>"+data[i].end_date;
				let price = data[i].c_price
			
			$(".reserve_no").append(reserve_no+"<br><hr>");
			$(".mem").append(mem+"<br><hr>");
			$(".reserve_date").append(reserve_date+"<br><hr>");
			$(".room_date").append(room_date+"<br><hr>");
			$(".price").append(price+"원<br><hr>");
			}
		})
	})
	
})//ready
</script>
</body>
</html>
