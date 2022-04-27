<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>qna</title>
<!-- 부트스트랩 css 사용 head안에 적용-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

h1 {
	display: inline-block;
}

nav {
	display: inline-block;
	float: right;
}

.rightButton {
	width: 100px;
}

#body-wrapper {
	min-height: 100%;
	position: relative;
}

#body-content {
	margin-top: 0px;
	padding-bottom: 250px; /* footer의 높이 */
}

.main {
	
}

.footer {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	padding: 15px 0;
	text-align: center;
	color: black;
	background: silver;
}

.layout {
	max-width: 600px;
	margin: 0 auto;
}

.qna {
	list-style: none;
	margin: 0;
	padding: 0;
}

.qna>li {
	padding: 10px 0;
	box-sizing: border-box;
}

.qna>li:nth-child(n+2) { /* 아이템 구분 점선 */
	border-top: 1px dashed #aaa;
}

.qna input {
	display: none;
}

.qna label { /* 제목 - 클릭 영역 */
	font-weight: bold;
	color: #000;
	margin: 20px 0 0;
	cursor: pointer;
}

.qna label::before { /* 제목 앞 화살표 */
	display: block;
	content: "";
	width: 0;
	height: 0;
	border: 8px solid transparent;
	border-left: 8px solid #a00;
	margin: 2px 0 0 8px;
	float: left;
}

.qna input:checked+label::before { /* 내용 펼침 상태 제목 앞 화살표 */
	border: 8px solid transparent;
	border-top: 8px solid #a00;
	border-bottom: 0;
	margin: 8px 4px 0;
}

.qna div { /* 내용 영역 - 기본 감춤 상태 */
	display: none;
	color: #666;
	font-size: 0.9375em;
	overflow: hidden;
	padding: 10px 0 10px 30px;
	box-sizing: border-box;
	transition: max-height 0.4s;
}

.qna input:checked+label+div { /* 내용 영역 펼침 */
	display: block;
}

a {
	text-decoration-line: none;
	color: #1ea1f7;
}
</style>
</head>
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

<body>
	<div id="body-wrapper">
		<div id="body-content">

			<main class="main">
			
				<h2 style="text-align: center">Q&A</h2>
				<h3 style="text-align: lite">자주 묻는 질문
				<button type="button" class="btn btn-link btn-lg" style="float:right">
						<a href="/ask" >문의사항 목록 이동</a>
					</button>
					</h3>
				
				<hr>

				<section>
					<div>
						<ul class="qna">
							<li><input type="checkbox" id="qna-1"> <label
								for="qna-1">다른 사람 명의의 계좌로 환불받을 수 있나요?</label>
								<div>
									<p>다른 사람 명의로는 환불할 수 없습니다. 고객님 본인 명의 계좌로만 환불이 가능합니다.</p>
								</div></li>
							<li><input type="checkbox" id="qna-2"> <label
								for="qna-2">예약은 어떻게 취소하나요?</label>
								<div>
									<p>예약자 본인이 직접 예약확인/취소 가능합니다.</p>
									<p>예약/결제 당시 안내된 취소/환불 규정에 따라 처리되며, 취소수수료가 발생 시 취소수수료를 차감한
										금액으로 환불 처리됩니다.</p>
								</div></li>
							<li><input type="checkbox" id="qna-3"> <label
								for="qna-3">입실일을 변경하고 싶어요</label>
								<div>
									<p>예약 이용일 변경 불가합니다. (취소수수료 확인 후) 기존 예약건 취소 및 재예약하셔야 합니다.</p>

								</div></li>
							<li><input type="checkbox" id="qna-4"> <label
								for="qna-4">객실타입(사이트) 변경하고 싶어요</label>
								<div>
									<p>캠핑톡 고객센터(070-4336-1824)로 문의하시기 바랍니다.</p>

								</div></li>
							<li><input type="checkbox" id="qna-5"> <label
								for="qna-5">취소수수료 계산 기준은 어떻게되나요?</label>
								<div>
									<p>취소수수료는 숙소별로 상이합니다. 취소수수료는 예약시점과는 무관하게 '입실일로부터 남은 날짜'
										기준으로 부과됩니다. 결제금액에서 취소수수료를 차감한 금액으로 환불 처리됩니다. 환불 예정금액은 조회 시점 및
										실제 환불 진행 시점에 따라 달라질 수 있으므로, 예약/결제 진행 당시 안내된 취소/환불 규정을 꼭 숙지해
										주시길 바랍니다.</p>

								</div></li>
						</ul>


					</div>

				</section>


			</main>

		</div>
		<footer class="footer">
			<div>
				<p>사이트명 고객센터친절하게 도와드리겠습니다. 010-0000-0000평일 : 9:00 ~ 18:00(점심시간
					12:00 ~ 1:00) 주말 및 공휴일에는 문의 게시판을 이용해주세요.</p>
			</div>
		</footer>

	</div>
	<!-- 부트스트랩 js 사용 body안에 적용-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>