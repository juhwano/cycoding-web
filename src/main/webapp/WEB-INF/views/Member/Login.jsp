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

<!-- Pixel CSS -->
<link type="text/css" href="${pageContext.request.contextPath}/css/register_pixel.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet">

<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<!--  header -->
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
    <main>
 		
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
                            <form id="form" action="login.cy" method="post" class="loginForm">
                            <div id="formbox">
                                <!-- Form -->
                                
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
									
                                   <!--   <label for="exampleInputIcon4">Your email</label>-->
                                    <div class="input-group mb-4">

                                        <input class="form-control" id="email" name="username" placeholder="email@cycoding.com" type="text" aria-label="email adress" onkeyup="enterkey()">

                                    </div>
                             
                                        <!-- <label for="password">Password</label>-->
                                        <div class="input-group mb-4">
									
                                            <input class="form-control" id="password" placeholder="비밀번호" name="password" type="password" aria-label="Password" onkeyup="enterkey()">
                                        </div>
                                        
                                        <div>
                                        <p id="find">이메일 찾기/비밀번호 찾기</p>
                                        </div>

  
                                <button type="button" class="btn-color" >로그인</button>
                                <button type="button" id="kakaobtn" onclick="kakaoLogin();" style="background-color:#fef01b; color:#3A1D1D; margin-top:10px">카카오 계정으로 로그인</button>
                                </div>
                            </form>
                           
                            <div class="d-block d-sm-flex justify-content-center align-items-center mt-4">
                                <span class="font-weight-normal">
                                    <a href="register.cy" style="color:#C0A9BD">계정이 없으신가요?</a>
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
    
    

<% String err = request.getParameter("error"); %>   
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
 
// 아이디 혹은 비밀번호 불일치시 얼럿창. 
var err = <%=err%>

function btnclick(){
	if($('#email').val() == "" || $('#password').val() == ""){
		swal("빈칸을 모두 채워주세요." , "" ,"error");
	}else {
		$('.loginForm').submit();
	}
}

if(err == true){
		swal("" , "아이디 혹은 비밀번호가 일치하지 않습니다." ,"error");
		err = false;	
}

$('.btn-color').click(function() {
	btnclick();		
})

// 엔터 키 발생 이벤트
function enterkey() { 
	if (window.event.keyCode == 13) { 
		
		btnclick();
	
	} 	
}			
</script>
</body>
</html>