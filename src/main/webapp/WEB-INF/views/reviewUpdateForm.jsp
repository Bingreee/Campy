<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 수정</title>
<style>
	.lightgray{background-color: light-gray; width: 50px;}
	table{border-collapse : collapse; width: 800px;}
</style>
</head>
<body>
<form method="post" id="reviewUpdateForm" action="/review/update"> 
<input type="hidden" name="_method" value="put">
	<table border="1">
		<tr>
			<td class="lightgray">제목</td>
			<td><input type="text" name="rv_title" value="${rv_dto.rv_title }"/>
				<input type="hidden" name="rv_no" value="${rv_dto.rv_no }">
			</td>
		</tr>
		<tr>
			<td class="lightgray">작성자</td>
			<td><input name="id" value="${user.id}" readonly></td>
		</tr>
		<tr>
			<td class="lightgray">내용</td>
			<td><div id="smarteditor">
        	<textarea name="rv_content" id="editorTxt" 
                  rows="20" cols="10" 
                  style="width: 100%"></textarea></div></td>
		</tr>
		<tr>
			<td class="lightgray">별점</td>
			<td><input type="number" min="0.5" max="5.0" step="0.5" name="rate" value="${rv_dto.rate }"></td>
			<!-- <td><input type="text" pattern = "[0-9]+(.[0-9]+)?" name="rate" id="rate"></td> -->
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="save" value="글 수정 완료"> 
			</td>
		</tr>
	
	</table>



</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

let oEditors = []

smartEditor = function() {
  nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "editorTxt",
    sSkinURI: "/smarteditor/SmartEditor2Skin.html",
    fOnAppLoad : function(){
        oEditors.getById["editorTxt"].exec("PASTE_HTML", ['${rv_dto.rv_content}']);
    },
    fCreator: "createSEditor2"
  })
}

$(document).ready(function() {
	smartEditor() 
	
    $("#save").click(function(){
    	oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
  	  $("#reviewUpdateForm").submit();
    });
    
  })
</script>

</body>
</html>