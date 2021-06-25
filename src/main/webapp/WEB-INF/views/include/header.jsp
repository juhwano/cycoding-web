<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<!-- Primary Meta Tags -->
<title>사이좋게 코딩하자</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 반응형 토글 -->
<script
	src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- Fontawesome -->
<link type="text/css"
	href="${pageContext.request.contextPath}/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">

<!-- Pixel CSS -->
<link type="text/css"
	href="${pageContext.request.contextPath}/css/pixel.css"
	rel="stylesheet">
<!-- main CSS -->
<link type="text/css"
	href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">

<!-- favicon -->
<link type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/img/favicon/cycoding-favicon.ico"
	rel="icon">

</head>
<!-- 반응형 토글 -->
<script
	src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- JQuesy -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<link type="text/css"
	href="${pageContext.request.contextPath}/css/pixel.css"
	rel="stylesheet">
<!-- main CSS -->
<link type="text/css"
	href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 스프링 시큐리티 설정 -->
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<body>
	<header class="header-global">
		<div class="header_">
			<nav id="navbar-main" aria-label="Primary navigation"
				class="navbar navbar-main navbar-expand-lg navbar-theme-primary headroom navbar-dark">
				<div class="container position-relaive">
					<a class="navbar-brand me-lg-5"
						href="${pageContext.request.contextPath}/main"> <img
						class="navbar-brand-dark"
						src="${pageContext.request.contextPath}/assets/img/brand/LOGO.svg"
						alt="Logo light">
					</a>
					<div class="navbar-collapse collapse me-auto" id="navbar_global">

						<div class="navbar-collapse-header">
							<div class="row">
								<div class="col-6 collapse-brand">
									<a href="/main"> <img
										src="${pageContext.request.contextPath}/assets/img/brand/LOGO.svg"
										alt="Themesberg logo">
									</a>
								</div>
								<div class="col-6 collapse-close">
									<a href="#navbar_global" class="fas fa-times"
										data-bs-toggle="collapse" data-bs-target="#navbar_global"
										aria-controls="navbar_global" aria-expanded="false"
										title="close" aria-label="Toggle navigation"></a>
								</div>
							</div>
						</div>


						<!-- Header Left -->
						<ul class="navbar-nav navbar-nav-hover align-items-lg-center">

							<li class="nav-item dropdown"><a
								href="${pageContext.request.contextPath}/main" class="nav-link">
									HOME </a></li>

							<li class="nav-item dropdown"><a
								href="${pageContext.request.contextPath}/project/list"
								class="nav-link"> PROJECT </a></li>


							<li class="nav-item dropdown"><a
								href="${pageContext.request.contextPath}/member/list"
								class="nav-link"> MEMBER </a></li>

							<li class="nav-item dropdown"><a
								href="${pageContext.request.contextPath}/board/list"
								class="nav-link"> COMMUNITY </a></li>
						</ul>

						<!-- Header Right -->
						<div class="right_nav">
							<ul
								class="navbar-nav navbar-nav-hover align-items-lg-center plex_right">

								<!-- 로그인 안하면 -->
								<se:authorize
									access="!hasAnyRole('ROLE_PREMEMBER','ROLE_MEMBER','ROLE_ADMIN', 'ROLE_TEAMMANGER', 'ROLE_PENALTY')">
									<li class="nav-item dropdown"><a
										href="${pageContext.request.contextPath}/login"
										class="nav-link"> 로그인 </a></li>
								</se:authorize>

								<!-- 어드민  -->
								<se:authorize access="hasRole('ROLE_ADMIN')">
									<!--알림 -->
									<li class="nav-item dropdown"><a href="register"
										class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
										id="supportDropdown" aria-expanded="false"> <img
											src="${pageContext.request.contextPath}/assets/img/brand/ALARM.svg">
									</a>
										<div class="dropdown-menu dropdown-menu-lg"
											aria-labelledby="supportDropdown">
											<div class="col-auto px-0"></div>
										</div></li>

									<!-- 로그인 -->
									<li class="nav-item dropdown">
									<a href="#"
										class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
										id="supportDropdown" aria-expanded="false"> 관리자 페이지 <span
											class="fas fa-angle-down nav-link-arrow ms-1"></span>
									</a>
									<div class="user_info" style="display: none">

											<div class="mypage">
												
												<a
													href="#">관리자 페이지</a>

											</div>


											<div class="Nav_Drop_A">
												<a href="">회원관리</a>
											</div>
											<div class="Nav_Drop_A">
												<a href="">사이트관리</a>
											</div>
											<div class="logout">
												<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
											</div>
										</div></li>
									


								</se:authorize>

								<!-- 기본 회원들 헤더 -->
								<se:authentication property="name" var="LoginUser" />

								<se:authorize
									access="hasAnyRole('ROLE_MEMBER','ROLE_PREMEMBER','ROLE_TEAMMANGER','ROLE_TEAMMANGER','ROLE_PENALTY','ROLE_BAN')">									
									<!-- 로그인 -->
									<li class="nav-item dropdown mydropdow">
									<div> ${sessionScope.nickname}님  <img class="alarmbell"
											src="${pageContext.request.contextPath}/assets/img/brand/ALARM.svg"></div>								
										<!-- 1차 메뉴 -->
										<div class="sub">
										<ul>											
											<li><a href="${pageContext.request.contextPath}/mypage/mypageCheck">마이페이지</a></li>
											<li><a href="${pageContext.request.contextPath}/mypage/wishProject">북마크/지원내역</a></li>
											
											
												<%-- <li><a href="${pageContext.request.contextPath}/project/create">프로젝트 생성하기</a></li>	 --%>
												<li class="subdrop"><a href="">프로젝트</a>
													<ul  class="susub">
														<li>진행중인 프로젝트</li>
														<li><a href="${pageContext.request.contextPath}/mypage/myProject">나의 프로젝트/후기</a></li>
													</ul>
												</li>												
											<li class="subdrop"><a href="">알림</a>
												<ul class="susub" id="alarmsub"></ul>
											</li>
												<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
											
										</ul>
										</div>
										</li>
										<!--알림 -->
									<li class="nav-item dropdown" id="alram"><a href="#"
										class="nav-link" id="supportDropdown"> 
									</a> <!-- 드랍 박스 -->
										<div class="Alram_box" style="display: none">
											<div id="myalarm">
												<ul id="alarmlist">
													
												</ul>
											</div>

										</div></li>
										
								</se:authorize>

							</ul>
						</div>
					</div>
					<button class="navbar-toggler ms-2" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbar_global"
						aria-controls="navbar_global" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
			</nav>
		</div>
	</header>

	<main>

		<!-- LOADER -->
		<div id="preloader">
			<div class="loader-container">
				<div class="progress-br float shadow">
					<div class="progress__item"></div>

				</div>
			</div>
			<!-- END LOADER -->
	</main>

	<!-- 반응형 토글 -->
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/headroom.js/dist/headroom.min.js"></script>

	<!-- Pixel JS -->
	<script src="${pageContext.request.contextPath}/assets/js/pixel.js"></script>

	<script
		src="${pageContext.request.contextPath}/vendor/vivus/dist/vivus.min.js"></script>

	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
	<!-- header.js -->
	<script src="${pageContext.request.contextPath}/assets/js/header.js"></script>
	<script type="text/javascript">
/* ==============================================
Loader -->
=============================================== */
$(function() {
    $("#preloader").on(500).fadeOut();
    $(".preloader").on(600).fadeOut("slow");
	$('.loader-container').addClass('done');
	$('.progress-br').addClass('done');	 
});
/* ==============================================
Loader -->
=============================================== */
// 회원 정보
$('#info').click(function() {
	var toggle = $('.user_info').attr('style');
	var Alramtoggle = $('.Alram_box').attr('style');
	
	if(toggle == "display:none"){
		$('.user_info').attr('style','');
		if(Alramtoggle == ""){
			$('.Alram_box').attr('style','display:none');
		}
	}else {
		$('.user_info').attr('style','display:none');
		
	}
})
$('#alram').click(function() {
	var toggle = $('.Alram_box').attr('style');
	var infotoggle = $('.user_info').attr('style');
	
	if(toggle == "display:none"){
		$('.Alram_box').attr('style','');
		if(infotoggle == ""){
			$('.user_info').attr('style','display:none');
		}
	}else {
		$('.Alram_box').attr('style','display:none');
	}
})
	//웹소켓
	var ws;
	var logineduser = "${sessionScope.member_id}";
	var loginednickname = "${sessionScope.nickname}"
	var wsurl = "ws://localhost:8090/websocket/${sessionScope.member_id}"	
	function openSocket() {
	/*var ws = new WebSocket("wss://localhost:8090/alarm/{code, sender, receiver}");   */
	ws = new WebSocket(wsurl);
	console.log("웹소켓 파라미터로 넘기는 회원번호 ",${sessionScope.member_id});
	let logineduser = "${sessionScope.member_id}";
	function open(){
		//서버와 연결할 때 호출됨
		ws.onopen = function(event) {
			if (event.data === undefined) {
				return;
			}	
		};
	}
	
	ws.onmessage = function(event) {
		
		let data = event.data;

		console.log("서버에서 받은 메시지 ",JSON.parse(data));
		updatealarmlist(logineduser);
		
		//알림페이지에 알림 하나 추가하는 함수
		addNewAlarm(JSON.parse(data));
		
		changeBell_New();
		
	}		
	 	ws.onclose = function(event){
		    console.log("연결 해제");
		    
		    openSocket();
	}
}
	
	//알림 보내고 디비에 반영하는 함수
	function insertAlarm(data){
		
		$.ajax({
			
			url:"/alarm/insertalarm",
			type:"post",
			dataType:"json",
			data:data,
			dataType:"text",
			contentType: "application/json; charset=utf-8;",
			success:function(res){
				console.log(res)
			},
			error:function(xhr){
				console.log(xhr)
			}			
		});
		
	}
	
//////////////////////////////////////////
	$(document).ready(function(){
		
		if(logineduser != ""){
			
			openSocket();
			chekcBell(logineduser);
			updatealarmlist(logineduser);
		}
		
		
		//드롭다운 메뉴
		$(".sub").hide();
		$(".mydropdow").hover(function(){
			console.log($(this));
			
			$(this).find(".sub").slideDown();
			$(this).parent().hover(function(){
			}, function(){
				$(this).find(".sub").slideUp();
			})
			
		});
		
		//서브메뉴 다운
/* 		$(".susub").hide();
		$(".subdrop").hover(function(){
			
			$(this).find(".susub").slideDown();
			$(this).hover(function(){
			}, function(){
				$(this).find(".susub").slideUp();
			})
		}); */
		$(".susub").hide();
		$(".subdrop").hover(function(){
			
			$(this).find(".susub").slideDown();
			$(this).hover(function(){
			})
		});
		
	});
///////////////////////////////////////////
	
</script>

</body>
</html>