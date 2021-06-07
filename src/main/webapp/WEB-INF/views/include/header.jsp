<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Primary Meta Tags -->
	<title>사이좋게 코딩하자</title>
	<!-- Fontawesome -->
	<link type="text/css" href="../vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
	<!-- Pixel CSS -->

	<link type="text/css" href="css/pixel.css" rel="stylesheet">
	<!-- main CSS -->
	<link type="text/css" href="css/main.css" rel="stylesheet">
	</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 스프링 시큐리티 설정 -->

	<link type="text/css" href="../css/pixel.css" rel="stylesheet">
	<!-- main CSS -->
	<link type="text/css" href="../css/main.css" rel="stylesheet">
	</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<body>
<header class="header-global">
    <nav id="navbar-main" aria-label="Primary navigation" class="navbar navbar-main navbar-expand-lg navbar-theme-primary headroom navbar-dark">
        <div class="container position-relaive">
            <a class="navbar-brand me-lg-5" href="main.cy">
                <img class="navbar-brand-dark" src="./assets/img/brand/LOGO.svg" alt="Logo light">
            </a>
            <div class="navbar-collapse collapse me-auto" id="navbar_global">
               	
               	<div class="navbar-collapse-header">
                    <div class="row">
                        <div class="col-6 collapse-brand">
                            <a href="main.cy">
                                <img src="./assets/img/brand/LOGO.svg" alt="Themesberg logo">
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
                        <a href="#" class="nav-link" id="frontPagesDropdown" aria-expanded="false" data-bs-toggle="dropdown">
                            HOME
                        </a>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link" id="dashboardDropdown" aria-expanded="false" data-bs-toggle="dropdown">
                            PROJECT
                        </a>
                    </li>
                    
                    
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link" id="componentsDropdown" aria-expanded="false" data-bs-toggle="dropdown">
                            MEMBER
                        </a>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link" data-bs-toggle="dropdown" id="supportDropdown" aria-expanded="false">
                            COMMUNITY
                        </a>
                    </li>
                </ul>
                
               <!-- Header Right --> 
               <div class="d-flex align-items-center">
               	<ul>
               		  
                    <!-- 로그인 안하면 -->

                    <se:authorize access="!hasAnyRole('ROLE_PREMEMBER','ROLE_MEMBER','ROLE_ADMIN', 'ROLE_TEAMMANGER', 'ROLE_PENALTY')">
						<li class="nav-item dropdown">
                        <a href="login.cy" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" id="supportDropdown" aria-expanded="false">

                           	로그인
                        </a>
                    </li>
					</se:authorize>

					<se:authorize access="hasRole('ROLE_ADMIN')">
						 <!--알림 -->
	                     <li class="nav-item dropdown">
	                        <a href="register.cy" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" id="supportDropdown" aria-expanded="false">
	                            <img src="./assets/img/brand/ALARM.svg">
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-lg" aria-labelledby="supportDropdown">
	                            <div class="col-auto px-0">
	                               
	                            </div>
	                        </div>
	                    </li>
						
					  	 <!-- 로그인 -->
	                     <li class="nav-item dropdown">
	                        <a href="admin.cy" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" id="supportDropdown" aria-expanded="false">
	                            관리자 페이지
	                            <span class="fas fa-angle-down nav-link-arrow ms-1"></span>
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-lg" aria-labelledby="supportDropdown">
	                            <div class="col-auto px-0">
	                                
	                            </div>
	                        </div>
	                    </li>
						
					</se:authorize>
					
		
					<se:authentication property="name" var="LoginUser" />
					<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
						 <!--알림 -->
	                     <li class="nav-item dropdown">
	                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" id="supportDropdown" aria-expanded="false">

	                            <img src="./assets/img/brand/ALARM.svg">
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-lg" aria-labelledby="supportDropdown">
	                            <div class="col-auto px-0">
	                               
	                            </div>
	                        </div>
	                    </li>
						
					  	 <!-- 로그인 -->
	                     <li class="nav-item dropdown">
	                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" id="supportDropdown" aria-expanded="false">
                     ${LoginUser})님

	                            <span class="fas fa-angle-down nav-link-arrow ms-1"></span>
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-lg" aria-labelledby="supportDropdown">
	                            <div class="col-auto px-0">
	                                
	                            </div>
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
</header>

    <main>
    
	 <!-- LOADER -->
	<div id="preloader">
		<div class="loader-container">
			<div class="progress-br float shadow">
				<div class="progress__item"></div>
			</div>
		</div>
	</div>
	<!-- END LOADER -->	
	
    </main>

<!-- 반응형 토글 -->
<script src="./vendor/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Pixel JS -->
<script src="./assets/js/pixel.js"></script>

<!-- sweetalert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

<!-- JQuesy -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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


</script>

</body>
</html>