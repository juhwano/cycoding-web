<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- j쿼리  -->
    <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
<!-- Primary Meta Tags -->
<title>Pixel Pages - Sign up</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="title" content="Pixel Pages - Sign up">
<meta name="author" content="Themesberg">
<meta name="description" content="Open source and accessibility first Bootstrap Design System featuring over 80 premium components and 4 example pages.">
<meta name="keywords" content="bootstrap, Bootstrap Design System, accessiblity, accessibility first, open source, open source Bootstrap Design System" />
<link rel="canonical" href="https://themesberg.com/product/ui-kits/pixel-lite-free-bootstrap-4-ui-kit">

<!-- Open Graph / Facebook
<meta property="og:type" content="website">
<meta property="og:url" content="https://demo.themesberg.com/pixel-lite">
<meta property="og:title" content="Pixel Pages - Sign up">
<meta property="og:description" content="Open source and accessibility oriented Bootstrap Design System featuring over 80 premium components and 4 example pages.">
<meta property="og:image" content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/pixel-lite/pixel-lite-preview.jpg">

<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url" content="https://demo.themesberg.com/pixel-lite">
<meta property="twitter:title" content="Pixel Pages - Sign up">
<meta property="twitter:description" content="Open source and accessibility oriented Bootstrap Design System featuring over 80 premium components and 4 example pages.">
<meta property="twitter:image" content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/pixel-lite/pixel-lite-preview.jpg">
 -->
 
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
                                <h1 class="mb-0 h3" id="title">회원가입</h1>
                            </div>
                            <form action="">
                            <div id="formbox">
                                <!-- Form -->

                                   <!--   <label for="exampleInputIcon4">Your email</label>-->
                                   <div>
                                    <div class="input-group">

                                        <input class="form-control" id="email" name="MEMBER_EMAIL" placeholder="email@cycoding.com" type="text" aria-label="email adress" >
                                    	<button type="button" id="emailCheckBtn" class="checkbtn">인증하기</button>
                                    </div>
                                    <div id="emailCheck" class="validation"></div>
									</div>
                                

                                      <!--  <label for="passwordConfirm">Confirm Password</label>-->
                                      <div>
                                        <div class="input-group">

                                            <input class="form-control" id="name" placeholder="이름" name="MEMBER_NAME" type="text" aria-label="name">
                                        </div>
                                        <div id="nameCheck" class="validation"></div>
                                        </div>
                                        
                                        <div>
                                        <div class="input-group">

                                        <input class="form-control" id="nickName" name="MEMBER_NICKNAME" placeholder="닉네임" type="text" aria-label="nickName">
                                    	<button type="button" class="checkbtn">중복확인</button>
                                    	</div>
                                    	</div>
                                    	
                                    	<div>
                                    <div id="nickName" class="validation"></div>                            

                                        <!-- <label for="password">Password</label>-->
                                        <div class="input-group">

                                            <input class="form-control" id="password" placeholder="비밀번호" name="MEMBER_PWD" type="password" aria-label="Password">
                                        </div>
                                        </div>
                                        
                                        <div>
                                        <div id="pwdCheck" class="validation"></div>


                                        <!--  <label for="passwordConfirm">Confirm Password</label>-->
                                        <div class="input-group">

                                            <input class="form-control" id="passwordC" placeholder="비밀번호 확인" type="password" aria-label="Password">
                                        </div>
                                        </div>
                                        
                                        <div>
                                        <div id="pwdcCheck" class="validation"></div>
                                        
                                        <div class="input-group">

                                            <input class="form-control" id="phone" placeholder="핸드폰 번호" name="MEMBER_PHONE" type="text" aria-label="phone">
                                        </div>                                     
                                        <div id="phoneCheck" class="validation"></div>
                                        </div>
                                        
                                    <div class="form-check mb-4">
                                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck6">
                                        <label class="form-check-label" for="defaultCheck6">
                                            I agree to the <a href="#">terms and conditions</a>
                                        </label>
                                    </div>
  
                                <button type="button" class="btn-color" id="register">가입하기</button>
                                </div>
                            </form>
                           
                            <div class="d-block d-sm-flex justify-content-center align-items-center mt-4">
                                <span class="font-weight-normal">
                                    이미 계정이 있으신가요?
                                    <a href="login.cy" style="color:#C0A9BD">로그인</a>
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

<!-- 가입 정보 유효성 검사 -->
<script type="text/javascript">
	$(document).ready(function(){
		validation();
	});
	
	//let email = $('#email').val();
	//let password = $('#password').val();
	//let passwordC = $('#passwordC').val();
	//let name = $('#name').val();
	//let nickName = $('#nickName').val();
	//let phone =  $('#phone').val();
	
	

	function validation() {
		
		//이메일 체크
		function email_check( email ) {    
    		let regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
   			return (email != '' && email != 'undefined' && regex.test(email)); 
		}
		
		$("#email").on("propertychange change keyup paste input",function(){
			
			let email = $('#email').val();
			
			if(!email_check(email)){
				$("#emailCheck").css("color","#CA8FAB");
				$("#emailCheck").text("올바른 이메일을 입력해주세요");
			} else{
				$("#emailCheck").css("color","green");
				$("#emailCheck").text("✔올바른 형식의 이메일입니다");
			}
			
		});
		
		
		//비밀번호 체크
		$("#password").on("propertychange change keyup paste input",function(){
			
			let password = $('#password').val();
			let num = password.search(/[0-9]/g);
			let eng = password.search(/[a-z]/ig);
			
			console.log("이벤트 발생");
			
			if(password.length < 8 || password.length > 20 ){
				$("#pwdCheck").css("color","#CA8FAB");
				$("#pwdCheck").text("비밀번호는 8-20 글자로 입력해주세요");
			} else{
				if( num< 0 || eng < 0){
					$("#pwdCheck").css("color","#CA8FAB");
					$("#pwdCheck").text("비밀번호는 영문, 숫자를 포함해야 합니다");
					
				} else if(password.search(/\s/) != -1){
					$("#pwdCheck").css("color","#CA8FAB");
					$("#pwdCheck").text("비밀번호는 공백을 포함할 수 없습니다");
				} else{
					$("#pwdCheck").css("color","green");
					$("#pwdCheck").text("✔사용 가능한 비밀번호 입니다");
				}

			}
			
		});
		
		
		//비밀번호 일치 체크
		$("#passwordC").on("propertychange change keyup paste input",function(){
			
			let password = $('#password').val();
			let passwordC = $('#passwordC').val();
			
			console.log("이벤트 발생");
			console.log("비밀번호 ", password);
			console.log("비밀번호 확인 ", passwordC);
			
			if(password =! "" && passwordC != "" ){
				
				if(password == passwordC){
					
					$("#pwdcCheck").css("color","green");
					$("#pwdcCheck").text("✔비밀번호가 일치합니다");
					
				} else{
					$("#pwdcCheck").css("color","#CA8FAB");
					$("#pwdcCheck").text("비밀번호가 일치하지 않습니다");
				}
				
			}
		});
		
		//유효성
		$('#register').click(function() {
			
			console.log("가입하기 클릭");
			
			let email = $('#email').val();
			let password = $('#password').val();
			let passwordC = $('#passwordC').val();
			let name = $('#name').val();
			let nickName = $('#nickName').val();
			let phone =  $('#phone').val();

	
			console.log("이메일 ",email);
			console.log("비밀번호 ",password);
			console.log("비밀번호 확인 ",passwordC);
			console.log("이름 ",name);
			console.log("닉네임 ",nickName);
			console.log("전화번호 ",phone);

	
			let checking = true;
	
			//이메일 체크
			if (!email_check(email)) {
				/* swal({
					title: "이메일을 입력하세요",
					icon: "error"
				}); */
				alert("올바른 이메일을 입력해주세요");
				checking = false;
				$("#email").focus();
				
				return;
			}
			
			//이름 체크
			if (name == '') {
				/* swal({
					title: "이름을 입력하세요",
					icon: "error"
				}); */
				alert("이름을 입력하세요");
				checking = false;
				$("#name").focus();
				return;
			}
	
			//비밀번호 체크 
			let num = password.search(/[0-9]/g);
			let eng = password.search(/[a-z]/ig);
	
			if (password.length < 8 || password.length > 13) {
				/* swal({
					title: "비밀번호는 8-20자리 이내로 입력하세요",
					icon: "error"
				}); */
				alert("비밀번호는 8-20자리 이내로 입력하세요");
				checking = false;
				$("#password").focus();
				return;
	
			} else if (password.search(/\s/) != -1) {
				/* swal({
					title: "비밀번호는 공백을 입력할 수 없습니다",
					icon: "error"
				}); */
				alert("비밀번호는 공백을 입력할 수 없습니다");
				checking = false;
				$("#password").focus();
				return;
	
			} else if (num < 0 || eng < 0 ) {
				/* swal({
					title: "영문, 숫자를 포함하여 입력하세요",
					icon: "error"
				}); */
				alert("영문, 숫자를 포함하여 입력하세요");
				checking = false;
				$("#password").focus();
				return;
			}
	
			if (password == '') {
				/* swal({
					title: "비밀번호를 입력하세요",
					icon: "error"
				}); */
				alert("비밀번호를 입력하세요");
				checking = false;
				$("#password").focus();
				return;
			}
	
	
			//비밀번호 일치 체크
			if (!(password == passwordC)) {
				/* swal({
					title: "비밀번호가 일치하지 않습니다",
					icon: "error"
				}); */
				alert("비밀번호가 일치하지 않습니다");
				console.log(password);
				console.log(passwordC);
				$("#passwordC").focus();
				checking = false;
				return;
			}
	
			if (passwordC == "") {
				/* swal({
					title: "비밀번호 확인란을 입력하세요",
					icon: "error"
				}); */
				alert("비밀번호를 확인해주세요");
				checking = false;
				$("#passwordC").focus();
				return;
			}
	

	
			//상점 이름 체크
			if (nickName == '') {
				swal({
					title: "닉네임 / 상점이름을 입력하세요",
					icon: "error"
				});
				checking = false;
				return;
			}
	
	
			if (!($('#emailCheckBtn').html() == '인증완료')) {
				console.log($('#emailCheckBtn').html());
				swal({
					title: "이메일 중복체크를 해주세요",
					icon: "error"
				});
				return;
			}
			if (!($('#nameCheckBtn').html() == '체크완료')) {
				swal({
					title: "상점이름 중복체크를 해주세요",
					icon: "error"
				});
				return;
			}
			if (!($('#phoneCheckBtn').html() == '인증완료')) {
				swal({
					title: "핸드폰 번호 인증을 해주세요",
					icon: "error"
				});
				return;
			}
	
			if (checking) {
				console.log($('#emailType').val());
				document.getElementById('form').submit();
			}
		});
	
	
		//이메일 인증
		//중복체크, 인증메일링 두 가지
		$('#emailCheckBtn').click(function() {
			let email = $('#email').val();

			console.log(email);
			if (email == '') {
				/* swal({
					title: "이메일을 입력해주세요",
					icon: "error"
				}); */
				alert("인증할 이메일을 입력해주세요");
				return;
			}
			
			$.ajax({
				url: "emailcheckajax.cy",
				data: {
					email: email
				},
				type: "POST",
				dataType: "text",
				success: function(data) {
					console.log(data);
					if (data == 'disable') {
						/* swal({
							title: "이미 존재하는 이메일입니다",
							icon: "error"
						}); */
						alert("이미 존재하는 이메일입니다");
					} else {
						
						
						
					//$('#emailCheckBtn').html('인증완료');
					//$('#emailCheckBtn').attr('disabled', 'true');
						
					}
				},
				error: function(error) {
					console.log(error);
				}
			});
		});
	
		//닉네임 / 상점이름 중복체크
		$('#nameCheckBtn').click(function() {
			let nickName = $('#nickName').val();
	
			if (nickName == '') {
				swal({
					title: "닉네임 / 상점이름을 입력해주세요",
					icon: "error"
				});
				return;
			}
	
			$.ajax({
				url: "NameCheckOk.ajax",
				data: {
					storename: nickName
				},
				type: "get",
				dataType: "html",
				success: function(data) {
					if (data == 'true') {
						swal({
							title: "사용가능한 상점이름 입니다",
							icon: "success"
						});
						$('#nameCheckBtn').html('체크완료');
						$('#nameCheckBtn').attr('disabled', 'true');
					} else {
						swal({
							title: "이미 존재하는 상점이름 입니다",
							icon: "error"
						});
					}
				},
				error: function(error) {
					console.log(error);
				}
			});
		});

	}

	

</script>



</body>

</html>