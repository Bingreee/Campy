<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
.silver {
	background-color: silver;
	width: 50px;
}

table {
	border-collapse: collapse;
	width: 800px;
}
</style>
</head>
<body>
	<h1>공지사항 쓰기</h1>
	<form method="post" id="writeform" action="noticeWrite">
		<input type="hidden" name="writeform" value="put">

		<table border="1">
			<tr>
				<td class="silver">제목</td>
				<td><input name="not_title" /></td>
			</tr>
			<tr>
				<td class="silver">작성자</td>
				<td><input name="id" value="${user.id}" readonly></td>
			</tr>

			<!-- <tr>
				<td class="silver">파일첨부</td>
				<td><input name="id" type="file" name="not_file" /></td>
			</tr> -->

			<tr>
				<td class="silver">내용</td>
				<td><div id="smarteditor">
						<textarea name="not_content" id="editorTxt" rows="20" cols="10"
							placeholder="내용을 입력해주세요" style="width: 700px">${dto.not_content}</textarea>
					</div></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" id="save" value="새글 등록"></td>
			</tr>
		</table>

	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js"
		charset="utf-8"></script>
	<script type="text/javascript">
		let oEditors = []

		smartEditor = function() {
			//console.log("Naver SmartEditor")
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "editorTxt",
				sSkinURI : "/smarteditor/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			})
		}

		$(document).ready(
				function() {

					smartEditor()

					$("#save").click(
							function() {
								oEditors.getById["editorTxt"].exec(
										"UPDATE_CONTENTS_FIELD", []);
								$("#writeform").submit();
							});

				})
	</script>
</body>
</html>