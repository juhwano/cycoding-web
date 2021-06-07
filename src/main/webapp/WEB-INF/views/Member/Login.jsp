<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 스프링 시큐리티 설정 -->
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

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
                    
                    <!-- 로그인 싸고 있는 박스 -->
                    <se:authorize access="!hasAnyRole('ROLE_PREMEMBER','ROLE_MEMBER','ROLE_ADMIN', 'ROLE_TEAMMANGER', 'ROLE_PENALTY')">
                        <div class="signin-inner mt-3 mt-lg-0 bg-white border-light p-4 p-lg-5 w-100 fmxw-500">
                            <div class="text-center text-md-center mb-4 mt-md-0">
                                <h1 class="mb-0 h3" id="title">로그인</h1>
                            </div>
                            <form id="form" action="login.cy" method="post">
                            <div id="formbox">
                                <!-- Form -->
                                
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									
                                   <!--   <label for="exampleInputIcon4">Your email</label>-->
                                    <div class="input-group mb-4">

                                        <input class="form-control" id="email" name="username" placeholder="email@cycoding.com" type="text" aria-label="email adress">

                                    </div>
                             
                                        <!-- <label for="password">Password</label>-->
                                        <div class="input-group mb-4">

                                            <input class="form-control" id="password" placeholder="비밀번호" name="password" type="password" aria-label="Password">
                                        </div>
                                        
                                        <div>
                                        <p id="find">이메일 찾기/비밀번호 찾기</p>
                                        </div>

  
                                <button type="submit" class="btn-color"">로그인</button>
                                <button type="submit" id="kakaobtn" onclick="kakaoLogin();" style="background-color:#fef01b; color:#3A1D1D; margin-top:10px">카카오 계정으로 로그인</button>
                                </div>
                            </form>
                           
                            <div class="d-block d-sm-flex justify-content-center align-items-center mt-4">
                                <span class="font-weight-normal">
                                    계정이 없으신가요?
                                    <a href="register.cy" style="color:#C0A9BD">회원가입</a>
                                    <!--  <a href="admin.cy" style="color:#C0A9BD">어드민 페이지</a>-->
                                </span>
                            </div>
                        </div>
                        </se:authorize>
                        
                        <!-- 로그인 한 유저가 접속시 -->
                        <se:authorize access="hasAnyRole('ROLE_PREMEMBER','ROLE_MEMBER','ROLE_ADMIN', 'ROLE_TEAMMANGER', 'ROLE_PENALTY')">
						
					
                        <div class="signin-inner mt-3 mt-lg-0 bg-white border-light p-4 p-lg-5 w-100 fmxw-500">
                            <div class="text-center text-md-center mb-4 mt-md-0">
                                <h1 class="mb-0 h3" id="title">CYCODING</h1>
                                </div>
                            <form id="form" action="logout.cy" method="post">
                            <div id="formbox">
                                <!-- Form -->
                                
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									
									                               
                                
                                <div class="d-block d-sm-flex justify-content-center align-items-center mt-4">
                                
                                <p class="font-weight-normal" style="text-align:center">
                                    나가기 전에 한 번 더 둘러보세요<br>방금 나에게 꼭 맞는 프로젝트가 생겼을지도 몰라요!
                                    
                                    <br>
                                    <br>
                                    
                                    <span style="margin-right:auto">
                                    <a href="#" style="color:#C0A9BD" >프로젝트 보기</a></span>
                                    <span><a href="#" style="color:#C0A9BD">멤버 보기</a></span>
                                    <!--  <a href="admin.cy" style="color:#C0A9BD">어드민 페이지</a>-->
                               </p>
                            </div>
                                    <button type="submit" class="btn-color">로그아웃</button>
                                </div>
                            </form>
						</div>
                    </se:authorize>
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
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('25d56d8cc547216af9df8aabb4c0ada4'); //발급받은 키 중 javascript키 사용
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//$("#kakaobtn").on("click",function(){
	
	//카카오로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	    	
	      success: function (response) {
	    	  
	    	//로그인 성공시 API 호출
	        Kakao.API.request({
	        url:'kakaologin.cy',
	          success: function (response) {
	        	  console.log("응답 : " ,response)
	        	  
	        	  let email = response.email
	        	  
	        	  $.ajax({
	        		  
	        		  url : "kakaologinajax.cy/"+email,
	                  headers : {
	                      "Accept" : "application/json",
	                      "Content-Type" : "application/json"
	                    },
	                    success : function(idChk){
	                        
	                    	console.log(idChk);
	                    	
	                        if(idChk==true){ //DB에 아이디가 없을 경우 => 회원가입
	                            console.log("회원가입중...");
	                        	
	                        	location.href="register.cy"
	                        
	                            /* $.ajax({
	                                url : "/user/json/addUser",
	                                method : "POST",
	                                headers : {
	                                  "Accept" : "application/json",
	                                  "Content-Type" : "application/json"
	                                },
	                                data : JSON.stringify({
	                                userId : res.id,
	                                userName : res.properties.nickname,
	                                  password : "kakao123",
	                                }),
	                                success : function(JSONData){
	                                   alert("회원가입이 정상적으로 되었습니다.");
	                                   $("form").attr("method","POST").attr("action","/user/snsLogin/"+res.id).attr("target","_parent").submit();
	                                }
	                            }) */
	                        }
	                        if(idChk==false){ //DB에 아이디가 존재할 경우 => 로그인
	                            console.log("로그인중...");
	                            $("form").attr("method","POST").attr("action","kakaologin.cy/"+email).attr("target","_parent").submit();
	                        }
	                    }
	        		  
	        	  });
	            },
	            fail: function(error) {
	              alert(JSON.stringify(error));
	            }
	          });
	        	  
	          },
	          fail: function (error) {
	            console.log(error)
	          }
	        });
		}	
	//});
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/logout.cy',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
</body>
</html>