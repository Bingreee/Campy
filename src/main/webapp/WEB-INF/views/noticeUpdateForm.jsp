<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- 부트스트랩 css 사용 head안에 적용-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
a {
	text-decoration-line: none;
	color: #1ea1f7;
	margin: 10px auto;
}
	.silver{background-color: silver; width: 50px;}
	table{border-collapse : collapse; width: 800px;}
</style>
</head>
<body>
<h1>공지사항 수정</h1>
<form method="post" id="updateform" action="/noticeUpdateForm" >
<input type="hidden" name="_method" value="put">
<table border="1">
		<tr>	
			<td class="silver">제목</td>
			<td><input name="not_title" value="${dto.not_title }"/>
				<input name="not_no" value="${dto.not_no}" type="hidden"> 
			</td>
		</tr>
		<tr>
			<td class="silver">작성자</td>
			<td><input name="id" value="${dto.id}" readonly></td>
		</tr>
		<tr>
			<td class="silver">내용</td>
			<td><div id="smarteditor">
        	<textarea name="not_content" id="editorTxt" 
                  rows="20" cols="10" 
                  style="width: 100%"></textarea></div></td>
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
<script>
    let oEditors = []

    smartEditor = function() {
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fOnAppLoad : function(){
            oEditors.getById["editorTxt"].exec("PASTE_HTML", ['${dto.not_content}']);
        },
        fCreator: "createSEditor2"
      })
    }

    $(document).ready(function() {
      smartEditor() 
      
      $("#save").click(function(){
    	  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    	  $("#updateform").submit();
      });
      
    })
  </script>


	<!-- 부트스트랩 js 사용 body안에 적용-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>