<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	

	
	<!-- Primary Meta Tags -->
	<title>사이좋게 코딩하자</title>
	
	<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
		<!-- 반응형 토글 -->
<script src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	

	<!-- Fontawesome -->
	<link type="text/css" href="${pageContext.request.contextPath}/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">

	<!-- Pixel CSS -->
	<link type="text/css" href="${pageContext.request.contextPath}/css/pixel.css" rel="stylesheet">
	<!-- main CSS -->
	<link type="text/css" href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
	
	<!-- favicon -->
	<link type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon/cycoding-favicon.ico" rel="icon">
	
	</head>
			<!-- 반응형 토글 -->
<script src="${pageContext.request.contextPath}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- JQuesy -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	

	
	<link type="text/css" href="${pageContext.request.contextPath}/css/pixel.css" rel="stylesheet">
	<!-- main CSS -->
	<link type="text/css" href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
	</head>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- 스프링 시큐리티 설정 -->
	<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<body>
<header class="header-global">
	<div class="header_">
    <nav id="navbar-main" aria-label="Primary navigation" class="navbar navbar-main navbar-expand-lg navbar-theme-primary headroom navbar-dark">
        <div class="container position-relaive">
            <a class="navbar-brand me-lg-5" href="${pageContext.request.contextPath}/main">
                <img class="navbar-brand-dark" src="${pageContext.request.contextPath}/assets/img/brand/LOGO.svg" alt="Logo light">
            </a>
            <div class="navbar-collapse collapse me-auto" id="navbar_global">
               	
               	<div class="navbar-collapse-header">
                    <div class="row">
                        <div class="col-6 collapse-brand">
                            <a href="/main">
                                <img src="${pageContext.request.contextPath}/assets/img/brand/LOGO.svg" alt="Themesberg logo">
                            </a>
                        </div>
                        <div class="col-6 collapse-close">
                            <a href="#navbar_global" class="fas fa-times" data-bs-toggle="collapse" data-bs-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" title="close" aria-label="Toggle navigation"></a>
                        </div>
                    </div>
                </div>
               	
               	
               	 <!-- Header Left --> 
                <ul class="navbar-nav navbar-nav-hover align-items-lg-center">
                
                    <li class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/main" class="nav-link" >
                            HOME
                        </a>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/project/list" class="nav-link" >
                            PROJECT
                        </a>
                    </li>
                    
                    
                    <li class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/member/list" class="nav-link" >
                            MEMBER
                        </a>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/board/list" class="nav-link">
                            COMMUNITY
                        </a>
                    </li>
                </ul>
                
               <!-- Header Right --> 
               	<div class="right_nav">
               	 <ul class="navbar-nav navbar-nav-hover align-items-lg-center plex_right">
               		  
                    <!-- 로그인 안하면 -->
                    <se:authorize access="!hasAnyRole('ROLE_PREMEMBER','ROLE_MEMBER','ROLE_ADMIN', 'ROLE_TEAMMANGER', 'ROLE_PENALTY')">
						<li class="nav-item dropdown">
                        <a href="${pageContext.request.contextPath}/login" class="nav-link">
                           	로그인 
                        </a>
                   		</li>
					</se:authorize>
					
					<!-- 어드민  -->
					<se:authorize access="hasRole('ROLE_ADMIN')">
						 <!--알림 -->
	                     <li class="nav-item dropdown">

	                        <a href="register" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" id="supportDropdown" aria-expanded="false">
	                            <img src="${pageContext.request.contextPath}/assets/img/brand/ALARM.svg">
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-lg" aria-labelledby="supportDropdown">
	                            <div class="col-auto px-0">
	                               
	                            </div>
	                        </div>
	                    </li>
						
					  	 <!-- 로그인 -->
	                     <li class="nav-item dropdown">
	                        <a href="${pageContext.request.contextPath}/admin.cy" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" id="supportDropdown" aria-expanded="false">
	                            관리자 페이지
	                            <span class="fas fa-angle-down nav-link-arrow ms-1"></span>
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-lg" aria-labelledby="supportDropdown">
	                            <div class="col-auto px-0">
	                                
	                            </div>
	                        </div>
	                    </li>
						
					</se:authorize>
					
					<!-- 기본 회원들 헤더 -->
					<se:authentication property="name" var="LoginUser" />
					
					<se:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_PREMEMBER','ROLE_TEAMMANGER')">
						 <!--알림 -->
	                     <li class="nav-item dropdown" id="alram">
	                        <a href="#" class="nav-link" id="supportDropdown" >

	                            <img src="${pageContext.request.contextPath}/assets/img/brand/ALARM.svg">
	                        </a>
	                       	
	                       	<!-- 드랍 박스 -->
	                       	<div class="Alram_box" style="display:none">
				 					<div class="mypage">
				 					
				 					<p>알림창 추후 수정 예정</p>
				 					</div>
				 					
				 				</div>
	                       	
	                       	
	                    </li>
						
					  	 <!-- 로그인 -->
	                     <li class="nav-item dropdown">
	                        <a href="#" class="nav-link" id="info">
                 			    ${sessionScope.nickname}님
	                            <span class="fas fa-angle-down nav-link-arrow ms-1"></span>
	                        </a>
	                        
	                        	<!-- 드랍 박스 -->
	                        	<div class="user_info" style="display:none">
				 					<div class="mypage">
				 					<%-- <a href="${pageContext.request.contextPath}/memberdetail/mypage?useremail=${LoginUser}">마이페이지</a> --%>
				 					<a href="${pageContext.request.contextPath}/memberdetail/mypageCheck">마이페이지</a>
				 					</div>
				 					
				 					
				 					<div class="Nav_Drop_A"><a href="">북마크</a></div>
				 					<div class="Nav_Drop_A"><a href="">지원 내역</a></div>
				 					<div class="Nav_Drop_A"><a href="${pageContext.request.contextPath}/project/create">프로젝트 생성하기</a></div>
								
                                  	
				 					<div class="logout"><a href="${pageContext.request.contextPath}/logout">로그아웃</a></div>
				 				</div>
	                        
	                   	 </li>
					</se:authorize>   
					
               		</ul>
                </div>
            </div>
            <button class="navbar-toggler ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
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

<script src="${pageContext.request.contextPath}/vendor/vivus/dist/vivus.min.js"></script>

<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

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



</script>

</body>
</html>