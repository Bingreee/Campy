<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>글수정</title>
<style>
	.silver{background-color: silver; width: 50px;}
	table{border-collapse : collapse; width: 800px;}
</style>
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
			<td><div id="smarteditor">
			<textarea name="qa_content" id="editorTxt" cols="40" 
						rows="10" style="width: 100%">
			</textarea></div></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<button type="submit" id="save">수정완료</button> 
			</td>
		</tr>
	</table>

</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
    let oEditors = []

    smartEditor = function() {
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fOnAppLoad : function(){
            oEditors.getById["editorTxt"].exec("PASTE_HTML", ['${dto.qa_content}']);
        },
        fCreator: "createSEditor2"
      })
    }

    $(document).ready(function() {
      smartEditor() 
      
      $("#save").click(function(){
    	  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    	  $("#update").submit();
      });
      
    })
  </script>
</body>
</html>