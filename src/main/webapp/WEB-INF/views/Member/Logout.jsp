<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Primary Meta Tags -->
<title>사이좋게 코딩하자</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="title" content="Pixel Pages - Sign up">
<meta name="author" content="Themesberg">
<meta name="description" content="Open source and accessibility first Bootstrap Design System featuring over 80 premium components and 4 example pages.">
<meta name="keywords" content="bootstrap, Bootstrap Design System, accessiblity, accessibility first, open source, open source Bootstrap Design System" />
<link rel="canonical" href="https://themesberg.com/product/ui-kits/pixel-lite-free-bootstrap-4-ui-kit">

<!-- Favicon -->
<link rel="apple-touch-icon" sizes="120x120" href="../../assets/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="../../assets/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="../../assets/img/favicon/favicon-16x16.png">
<link rel="manifest" href="../../assets/img/favicon/site.webmanifest">
<link rel="mask-icon" href="../../assets/img/favicon/safari-pinned-tab.svg" color="#ffffff">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">

<!-- Fontawesome 
<link type="text/css" href="html&css/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR" rel="stylesheet">

<!-- Pixel CSS -->
<link type="text/css" href="html&css/css/register_pixel.css" rel="stylesheet">
<link type="text/css" href="html&css/css/register.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR" rel="stylesheet">

<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


</head>

<body>
    <main>

 		<!--  header -->
 		
 		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
 		
 		
        <!-- Section -->
        <section class="min-vh-100 d-flex align-items-center" style="background-color:#F4F2F3">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 d-flex align-items-center justify-content-center">
                    
                    <!-- 화원가입 싸고 있는 박스 -->
                        <div class="signin-inner mt-3 mt-lg-0 bg-white border-light p-4 p-lg-5 w-100 fmxw-500">
                            <div class="text-center text-md-center mb-4 mt-md-0">
                                <h1 class="mb-0 h3" id="title">로그아웃 하시겠습니까?</h1>
                            </div>
                            
  
                                <button type="button" class="btn-color" onclick="location.href='logout.cy'">로그아웃</button>
                                
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Core -->
<script src="html&css/vendor/jquery/dist/jquery.min.js"></script>
<script src="html&css/vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="html&css/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="html&css/vendor/headroom.js/dist/headroom.min.js"></script>

<!-- Vendor JS -->
<script src="html&css/vendor/onscreen/dist/on-screen.umd.min.js"></script>
<script src="html&css/vendor/nouislider/distribute/nouislider.min.js"></script>
<script src="html&css/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="html&css/vendor/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
<script src="html&css/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
<script src="html&css/vendor/jarallax/dist/jarallax.min.js"></script>
<script src="html&css/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="html&css/vendor/vivus/dist/vivus.min.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<!-- pixel JS -->
<script src="html&css/assets/js/pixel.js"></script>


</body>

</html>