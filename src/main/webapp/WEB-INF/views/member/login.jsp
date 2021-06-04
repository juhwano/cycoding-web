<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Primary Meta Tags -->
<title>Pixel Pages - Sign up</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="title" content="Pixel Pages - Sign up">
<meta name="author" content="Themesberg">
<meta name="description" content="Open source and accessibility first Bootstrap Design System featuring over 80 premium components and 4 example pages.">
<meta name="keywords" content="bootstrap, Bootstrap Design System, accessiblity, accessibility first, open source, open source Bootstrap Design System" />
<link rel="canonical" href="https://themesberg.com/product/ui-kits/pixel-lite-free-bootstrap-4-ui-kit">

<!-- Open Graph / Facebook -->
<meta property="og:type" content="website">
<meta property="og:url" content="https://demo.themesberg.com/pixel-lite">
<meta property="og:title" content="Pixel Pages - Sign up">
<meta property="og:description" content="Open source and accessibility oriented Bootstrap Design System featuring over 80 premium components and 4 example pages.">
<meta property="og:image" content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/pixel-lite/pixel-lite-preview.jpg">

<!-- Twitter -->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url" content="https://demo.themesberg.com/pixel-lite">
<meta property="twitter:title" content="Pixel Pages - Sign up">
<meta property="twitter:description" content="Open source and accessibility oriented Bootstrap Design System featuring over 80 premium components and 4 example pages.">
<meta property="twitter:image" content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/pixel-lite/pixel-lite-preview.jpg">

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
<link type="text/css" href="/html&css/css/register_pixel.css" rel="stylesheet">
<link type="text/css" href="/html&css/css/register.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR" rel="stylesheet">


</head>

<body>
    <main>
<!-- 
        <div class="preloader bg-dark flex-column justify-content-center align-items-center">
    <svg id="loader-logo" xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 64 78.4">
        <path fill="#fff" d="M10,0h1.2V11.2H0V10A10,10,0,0,1,10,0Z"/>
        <rect fill="none" stroke="#fff" stroke-width="11.2" x="40" y="17.6" width="0" height="25.6"/>
        <rect fill="none" stroke="#fff" stroke-opacity="0.4" stroke-width="11.2" x="23" y="35.2" width="0" height="25.6"/>
        <path fill="#fff" d="M52.8,35.2H64V53.8a7,7,0,0,1-7,7H52.8V35.2Z"/>
        <rect fill="none" stroke="#fff" stroke-width="11.2" x="6" y="52.8" width="0" height="25.6"/>
        <path fill="#fff" d="M52.8,0H57a7,7,0,0,1,7,7h0v4.2H52.8V0Z"/>
        <rect fill="none" stroke="#fff" stroke-opacity="0.4" stroke-width="11.2" x="57.8" y="17.6" width="0" height="11.2"/>
        <rect fill="none" stroke="#fff" stroke-width="11.2" x="6" y="35.2" width="0" height="11.2"/>
        <rect fill="none" stroke="#fff" stroke-width="11.2" x="40.2" y="49.6" width="0" height="11.2"/>
        <path fill="#fff" d="M17.6,67.2H28.8v1.2a10,10,0,0,1-10,10H17.6V67.2Z"/>
        <rect fill="none" stroke="#fff" stroke-opacity="0.4" stroke-width="28.8" x="31.6" width="0" height="11.2"/>
        <rect fill="none" stroke="#fff" x="14" stroke-width="28.8" y="17.6" width="0" height="11.2"/>
    </svg>
</div>
 -->	
 
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
                                <h1 class="mb-0 h3" id="title">로그인</h1>
                            </div>
                            <form action="#">
                            <div id="formbox">
                                <!-- Form -->

                                   <!--   <label for="exampleInputIcon4">Your email</label>-->
                                    <div class="input-group mb-4">

                                        <input class="form-control" id="exampleInputIcon4" name="member_email" placeholder="email@cycoding.com" type="text" aria-label="email adress" required>

                                    </div>
                             

                                        <!-- <label for="password">Password</label>-->
                                        <div class="input-group mb-4">

                                            <input class="form-control" id="password" placeholder="비밀번호" name="member_pwd" type="password" aria-label="Password" required>
                                        </div>
                                        
                                        <div>
                                        <p>이메일 찾기/비밀번호 찾기</p>
                                        </div>

  
                                <button type="submit" class="btn-color">로그인</button>
                                <button type="submit" style="background-color:#fef01b; color:#3A1D1D; margin-top:10px">카카오 계정으로 로그인</button>
                                </div>
                            </form>
                           
                            <div class="d-block d-sm-flex justify-content-center align-items-center mt-4">
                                <span class="font-weight-normal">
                                    계정이 없으신가요?
                                    <a href="register.cy" style="color:#C0A9BD">회원가입</a>
                                </span>
                            </div>
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