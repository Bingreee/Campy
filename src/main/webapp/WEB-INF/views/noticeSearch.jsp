<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: silver;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
</head>
<body>
	<div id="center">
		<h1>${noticesearch}로 검색한 공지사항입니다.</h1>
		
		<div align="right">
			<a href="/main">main</a> <a href="noticeWrite">새글 등록</a>
		</div>

		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${nList}" var="notice">
					<tr>
						
						<td>${notice.not_no}</td>
						<td>${notice.id }</td>
						<td><a href ="noticeContent/${notice.not_no}">${notice.not_title}</a></td>
						
						<td><fmt:formatDate value="${notice.not_date }" dateStyle="short"/> </td>
					</tr>
				</c:forEach>
			</table>
			
			
			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="noticeSearch?p=${begin-1}&noticesearch=${noticesearch}&noticesearchn=${noticesearchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="noticeSearch?p=${i}&noticesearch=${noticesearch}&noticesearchn=${noticesearchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="noticeSearch?p=${end+1}&noticesearch=${noticesearch}&noticesearchn=${noticesearchn}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	검색 조건에 맞는 글이 없습니다.
</c:if>
<div id="noticeSearch" align="center">
<form action="noticeSearch">
<select name="noticesearchn">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">작성자</option>
</select>
<input type="text" name="noticesearch" size="15" maxlength="50" /> 
<input type="submit" value="검색" />
</form>	
	</div>
	</div>
</body>
</html>