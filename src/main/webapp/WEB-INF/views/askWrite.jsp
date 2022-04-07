<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>문의사항 글쓰기</title>
</head>
<body>
<h1>문의사항 글쓰기</h1>
<form method="post" id="writeform" action="write">
	<table border="1">
		<tr>  
			<td>제목</td>
			<td><input name="title"/></td>
		</tr>
		<tr>
			<td>파일첨부</td>
			<td>
			<input name="id" type="file" name="file">
			
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
        	<textarea name="content" id="editorTxt" 
                  rows="20" cols="10" 
                  placeholder="내용을 입력해주세요"
                  style="width: 700px"></textarea>
      </td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="save" value="새글 등록">
				 
			</td>
		</tr>
	</table>

</form>
</body>
</html>