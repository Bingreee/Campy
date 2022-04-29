<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 수정</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="/main" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-4" href="/main">Campy</span>
      </a>

      <ul class="nav nav-pills">
      	<c:if test="${user.id != null }">
       		<div class="dropdown">
  			<a class="btn btn-secondary dropdown-toggle nav-link" type="button" id="dropdownButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			${user.id }님
  			</a>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="/mypage">마이 페이지</a></li>
    				<li><a class="dropdown-item" href="/qna">Q&A</a></li>
    				<li><a class="dropdown-item" href="/noticeList">공지사항</a></li>
  				</ul>
			</div>
        	<li class="nav-item"><a href="/logout" class="nav-link">Log out</a></li>
        </c:if>
        <c:if test="${user.id == null }">
        	<div class="dropdown">
  			<a class="btn btn-secondary dropdown-toggle nav-link" type="button" id="dropdownButton1" data-bs-toggle="dropdown" aria-expanded="false">
    			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  					<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
				</svg>
  			</a>
  				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    				<li><a class="dropdown-item" href="/login">로그인</a></li>
    				<li><a class="dropdown-item" href="/joinSelect">회원가입</a></li>
  				</ul>
			</div>
        </c:if>
      </ul>
</header>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="padding-bottom:20px">
	<h4>리뷰 수정</h4>
<form method="post" id="reviewUpdate" action="/review/updateForm"> 
<input type="hidden" name="_method" value="put">

	<table style="width:1000px">
		<tr>
			<td class="lightgray">제목</td>
			<td><input type="text" name="rv_title" value="${rv_dto.rv_title }"/>
			<input type="hidden" name="c_no" id="c_no" value="${rv_dto.c_no }"/>
			<input type="hidden" name="rv_no" id="rv_no" value="${rv_dto.rv_no }"/>
			</td>
			
		</tr>
		<tr>
			<td class="lightgray">작성자</td>
			<td><input name="id" value="${rv_dto.id}" readonly></td>
		</tr>
		<tr>
			<td class="lightgray">내용</td>
			<td><div id="smarteditor">
			<textarea name="rv_content" id="editorTxt"  placeholder="내용을 입력해주세요"
                  style="width: 100px"></textarea>
			</div></td>
		</tr>
		<tr>
			<td class="lightgray">별점</td>
			<td><input type="number" min="0.5" max="5.0" step="0.5" name="rate" id="rate" value="${rv_dto.rate }"></td>
			<!-- <td><input type="text" pattern = "[0-9]+(.[0-9]+)?" name="rate" id="rate"></td> -->
		</tr>
		<tr>
			<td colspan="2" align="center" >
				<input type="button" id="rv_update_save" value="수정 완료" > 
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
	
    $("#rv_update_save").click(function(){
    	var rate = $("#rate").val();
    	oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    	
    	/* console.log(rate); */
  	  $("#reviewUpdate").submit();
    });
    
  })
</script>

</body>
</html>