<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
<style>
	.silver{background-color: silver;}
	table{border-collapse : collapse;}
</style>
</head>
<body>
<form method="post" id="writeform">
	<table border="1">
		<tr>
			<td class="silver">제목</td>
			<td><input name="qa_title"/></td>
		</tr>
		<tr>
			<td class="silver">작성자</td>
			<td><input name="id" value="${user.id}" readonly></td>
		</tr>
 <!-- 		<tr>
			<td class="silver">파일첨부</td>
			 <td>
			<input name="id" type="file" name="file"/>
			
			</td> 
		</tr>  -->
		<tr>
			<td class="silver">내용</td>
			<td><textarea name="qa_content" cols="40" rows="10"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="새글 등록"> 
			</td>
		</tr>
	</table>

</form>

</body>
</html>