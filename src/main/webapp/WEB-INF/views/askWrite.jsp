<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
<style>
	.silver{background-color: silver; width: 50px;}
	table{border-collapse : collapse; width: 800px;}
</style>
</head>
<body>
<form method="post" id="writeform" action="askWrite">
<input type="hidden" name="writeform" value="put">

	<table border="1">
		<tr>
			<td class="silver">제목</td>
			<td><input name="qa_title"/></td>
		</tr>
		<tr>
			<td class="silver">작성자</td>
			<td><input name="id" value="${user.id}" readonly></td>
		</tr>
		
  		<!-- <tr>
			<td class="silver">파일첨부</td>
			 <td>
			<input name="id" type="file" name="file"/>
			
			</td> 
		</tr>  문의사항에 파일은 필요없을것 같아서 지웠고 스마트에디터로 사진전송가능-->
		 
		<tr>
			<td class="silver">내용</td>
			<td><div id="smarteditor">
        	<textarea name="qa_content" id="editorTxt" 
                  rows="20" cols="10" 
                  placeholder="내용을 입력해주세요"
                  style="width: 700px">${dto.qa_content}</textarea>
      </div></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="save" value="새글 등록"> 
			</td>
		</tr>
	</table>

</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

let oEditors = []

smartEditor = function() {
  //console.log("Naver SmartEditor")
  nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "editorTxt",
    sSkinURI: "/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
  })
} 


	$(document).ready(function() {
      
	  smartEditor() 
	  
      $("#save").click(function(){
    	  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    	  $("#writeform").submit();
      });
      
    })
		
</script>
</body>
</html>