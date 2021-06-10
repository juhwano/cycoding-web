$(document).ready(function(){
    validation();
    
    
    //이용약관 모달창
      $('.trigger').on('click', function() {
             $('.modal-wrapper').toggleClass('open');
             return false;
    });
    
    
});
	
	

      var csrfToken = $("meta[name='_csrf']").attr("content");
	  $.ajaxPrefilter(function(options, originalOptions, jqXHR){
	    if (options['type'].toLowerCase() === "post") {
	        jqXHR.setRequestHeader('X-CSRF-TOKEN', csrfToken);
	    }
	  });



//let email = $('#email').val();
//let password = $('#password').val();
//let passwordC = $('#passwordC').val();
//let name = $('#name').val();
//let nickName = $('#nickName').val();
//let phone =  $('#phone').val();

let dice = '';

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
            $("#emailCheck").text("✔ 올바른 형식의 이메일입니다");
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
                $("#pwdCheck").text("✔ 사용 가능한 비밀번호 입니다");
            }

        }
        
    });
    
    
    //비밀번호 일치 체크
    $("#passwordC").keyup(function(){
        
        let password = $('#password').val().trim();
        let passwordC = $('#passwordC').val().trim();
        
        console.log("이벤트 발생");
        console.log("비밀번호 ", password);
        console.log("비밀번호 확인 ", passwordC);
        
        if(password =! "" && passwordC != "" ){
            
            if(password. passwordC){
                
                $("#pwdcCheck").css("color","green");
                $("#pwdcCheck").text("✔ 비밀번호가 일치합니다");
                
            } else if(password != passwordC){
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
            swal("올바른 이메일을 입력해주세요." , "" ,"error");
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
            swal("이름을 입력하세요." , "" ,"error");
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
            swal("비밀번호는 8-20자리 이내로 입력하세요." , "" ,"error");
            checking = false;
            $("#password").focus();
            return;

        } else if (password.search(/\s/) != -1) {
            /* swal({
                title: "비밀번호는 공백을 입력할 수 없습니다",
                icon: "error"
            }); */
            swal("비밀번호는 공백을 입력할 수 없습니다." , "" ,"error");
            checking = false;
            $("#password").focus();
            return;

        } else if (num < 0 || eng < 0 ) {
            /* swal({
                title: "영문, 숫자를 포함하여 입력하세요",
                icon: "error"
            }); */
            swal("영문, 숫자를 포함하여 입력하세요." , "" ,"error");
            checking = false;
            $("#password").focus();
            return;
        }

        if (password == '') {
            /* swal({
                title: "비밀번호를 입력하세요",
                icon: "error"
            }); */
            swal("비밀번호를 입력하세요." , "" ,"error");
            checking = false;
            $("#password").focus();
            return;
        }


        //비밀번호 일치 체크
        /*if (!(password == passwordC)) {
             swal({
                title: "비밀번호가 일치하지 않습니다",
                icon: "error"
            });
            alert("비밀번호가 일치하지 않습니다");
            console.log(password);
            console.log(passwordC);
            $("#passwordC").focus();
            checking = false;
            return;
        }
*/
        if (passwordC == "") {
            /* swal({
                title: "비밀번호 확인란을 입력하세요",
                icon: "error"
            }); */
            swal("비밀번호를 확인해주세요." , "" ,"error");
            checking = false;
            $("#passwordC").focus();
            return;
        }



        //닉네임 체크
        if (nickName == '') {
            /* swal({
                title: "닉네임 을 입력하세요",
                icon: "error"
            }); */
            swal("닉네임을 입력하세요." , "" ,"error");
            $("#nickName").focus();
            checking = false;
            return;
        }


        if (!($('#emailCheckBtn').html() == '인증완료')) {
            console.log($('#emailCheckBtn').html());
            swal("이메일을 인증해주세요." , "" ,"error");
             /* swal({
                title: "이메일 중복체크를 해주세요",
                icon: "error"
            }); */ 
            return;
        }
         if (!($('#nickNameCheckBtn').html() == '체크완료')) {
             swal("닉네임 중복확인을 해주세요." , "" ,"error");
            /* swal({
                title: "상점이름 중복체크를 해주세요",
                icon: "error"
            }); */
            return;
        } 
        if (!($('#phoneCheckBtn').html() == '체크완료')) {
            
             swal("휴대폰 번호 중복확인을 해주세요." , "" ,"error");
            /* swal({
                title: "핸드폰 번호 인증을 해주세요",
                icon: "error"
            }); */
            return;
        }
        
        if($("#defaultCheck6").is(":checked")!=true){
            swal("약관 동의를 해주세요." , "" ,"error");
            return;
        }

        if (checking) {
            
            console.log("가입하기");
            
            document.getElementById('form').submit();
        }
    });


    //이메일 인증
    //중복체크, 인증메일링 두 가지
    $('#emailCheckBtn').click(function() {
        let email = $('#email').val().trim();

        console.log(email);
        if (email == '') {
            /* swal({
                title: "이메일을 입력해주세요",
                icon: "error"
            }); */
            swal("인증할 이메일을 입력해주세요." , "" ,"error");
            return;
        }
        
        $.ajax({
            url: "emailcheckajax.cy",
            data: {
                email: email
            },
            type: "post",
            dataType: "text",
            success: function(data) {
                console.log(data);
                if (data == 'disable') {
                    /* swal({
                        title: "이미 존재하는 이메일입니다",
                        icon: "error"
                    }); */
                    swal("이미 가입된 이메일입니다." , "" ,"error");
                    
                } else {
                    
                    //alert("사용 가능한 이메일입니다");
                    
                    $.ajax({
                        url: "emailcheckajax.cy",
                        data: {
                            email: email
                        },
                        type: "post",
                        dataType: "text",
                        success: function(data) {
                            console.log(data);
                            
                            let result = data.split("-");
                            if (result[0] == 'fail') {
                                /* swal({
                                    title: "이미 존재하는 이메일입니다",
                                    icon: "error"
                                }); */
                                swal("인증 메일 발송에 실패했습니다." , "" ,"error");
                                
                            } else {

                                //alert("인증메일이 발송되었습니다.");
                                swal("📨" , "메일을 발송하였습니다.");

                                
                                $("#mailcheck").empty();
                                $("#mailcheck").append(
                                    '<div class="input-group">'+										
                                    '<input class="form-control" id="emailCheckNumber" name="random" placeholder="인증번호" type="text" >'+
                                    '<button type="button" id="emailCheckNumberBtn" class="checkbtn">확인</button>'+
                                    '</div><div class="validation"></div>'
                                        
                                );
                                dice = result[1];
                                console.log("랜덤 숫자 : ",dice);
                                
                                //이메일 인증법호 확인
                                $("#emailCheckNumberBtn").click(function(){
                                    
                                    $("#emailCheckNumber").val();
                                    console.log("인증확인 클릭");
                                    console.log(dice);
                                    
                                    if(dice == $("#emailCheckNumber").val()){
                                        swal("인증이 완료되었습니다." , "" ,"success");
                                        $('#emailCheckBtn').html('인증완료');
                                        $('#emailCheckBtn').attr('disabled', 'true');
                                        $("#mailcheck").empty();
                                        
                                    } else if( $("#emailCheckNumber").val() == ""){
                                        swal("인증번호를 입력해주세요." , "" ,"error");
                                    } else if(dice != $("#emailCheckNumber").val()){
                                        swal("다시 입력해주세요." , "" ,"error");
                                    }
                                    
                                    
                                });
                                
                            }
                        },
                        error: function(error) {
                            console.log(error);
                        }
                    });
                    
                    
                }
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

    //닉네임 중복체크
    $('#nickNameCheckBtn').click(function() {
        let nickName = $('#nickName').val();

        if (nickName == '') {
            /* swal({
                title: "닉네임 을 입력해주세요",
                icon: "error"
            }); */
            swal("닉네임을 입력해주세요." , "" ,"error");
            $("#nickName").focus();
            return;
        }

        $.ajax({
            url: "nicknamecheckajax.cy",
            data: {
                nickName: nickName
            },
            type: "get",
            dataType: "text",
            success: function(data) {
                if (data == 'able') {
                    /* swal({
                        title: "사용 가능한 닉네임입니다",
                        icon: "success"
                    }); */
                    swal("사용 가능한 닉네임입니다." , "" ,"success");
                    $('#nickNameCheckBtn').html('체크완료');
                    $('#nickNameCheckBtn').attr('disabled', 'true');
                    
                    $("#nickNameCheck").css("color","green");
                    $("#nickNameCheck").text("✔사용 가능한 닉네임입니다");
                    
                } else {
                    /* swal({
                        title: "이미 존재하는 닉네임 입니다",
                        icon: "error"
                    }); */
                    swal("이미 존재하는 닉네임입니다." , "" ,"error");
                }
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
    
    //휴대폰 번호 중복체크
    $('#phoneCheckBtn').click(function() {
        let phone = $('#phone').val();

        if (phone == '') {
            /* swal({
                title: "닉네임 을 입력해주세요",
                icon: "error"
            }); */
            swal("휴대폰 번호를 입력해주세요." , "" ,"error");
            $("#phone").focus();
            return;
        }

        $.ajax({
            url: "phonecheckajax.cy",
            data: {
                phone: phone
            },
            type: "get",
            dataType: "text",
            success: function(data) {
                if (data == 'able') {
                    /* swal({
                        title: "사용 가능한 번호입니다",
                        icon: "success"
                    }); */
                    swal("사용 가능한 번호입니다." , "" ,"success");
                    $('#phoneCheckBtn').html('체크완료');
                    $('#phoneCheckBtn').attr('disabled', 'true');
                    
                    $("#phoneCheck").css("color","green");
                    $("#phoneCheck").text("✔ 사용 가능한 번호입니다");
                } else {
                    /* swal({
                        title: "사용할 수 없는 번호입니다",
                        icon: "error"
                    }); */
                    swal("사용할 수 없는 번호입니다." , "" ,"success");
                }
            },
            error: function(error) {
                console.log(error);
            }
        });
    });

}