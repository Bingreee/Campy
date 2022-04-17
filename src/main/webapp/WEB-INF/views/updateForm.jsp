<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>글수정</title>
</head>
<body>


<form method="post" id="update" action="/update" > 
<input type="hidden" name="update" value="put">
	<table border="1">
		<tr>	
			<td class="silver">제목</td>
			<td><input name="qa_title" value="${dto.qa_title }"/>
				<input name="qa_no" value="${dto.qa_no}" type="hidden"> 
			</td>
		</tr>
		<tr>
			<td class="silver">작성자</td>
			<td><input name="id" value="${dto.id}" readonly></td>
		</tr>
		<tr>
			<td class="silver">내용</td>
			<td><textarea name="qa_content" cols="40" rows="10">${dto.qa_content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<button type="submit">수정완료</button> 
			</td>
		</tr>
	</table>

</form>

</body>
</html>