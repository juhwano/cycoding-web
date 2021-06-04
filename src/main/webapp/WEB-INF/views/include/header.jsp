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
	<link type="text/css" href="../css/pixel.css" rel="stylesheet">
	</head>

<body>
   
<header class="header-global">
    <nav id="navbar-main" aria-label="Primary navigation" class="navbar navbar-main navbar-expand-lg navbar-theme-primary headroom navbar-dark">
        <div class="container position-relaive">
            <a class="navbar-brand me-lg-5" href="./index.html">
                <img class="navbar-brand-dark" src="./assets/img/brand/LOGO.svg" alt="Logo light">
            </a>
            <div class="navbar-collapse collapse me-auto" id="navbar_global">
               
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
                    
                    <li class="nav-item dropdown navbar-collapse">
                        <a href="#" class="nav-link" data-bs-toggle="dropdown" id="supportDropdown" aria-expanded="false">
                            COMMUNITY
                        </a>
                    </li>
                    
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
                            00님
                            <span class="fas fa-angle-down nav-link-arrow ms-1"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg" aria-labelledby="supportDropdown">
                            <div class="col-auto px-0">
                                
                            </div>
                        </div>
                    </li>
                    
                </ul>
            </div>
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