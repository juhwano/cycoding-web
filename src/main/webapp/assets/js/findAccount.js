//닉네임 중복체크
    $('#findEmailBtn').click(function() {
        let userName = $('#userName').val();
        let userPhone = $('#userPhone').val();
        userPhone = userPhone.replace("-", "")

        if (userName == '') {
            swal("이름을 입력해주세요." , "" ,"error");
            $("#userName").focus();
            return;
        }else if (userPhone == '') {
			swal("핸드폰번호를 입력해주세요." , "" ,"error");
            $("#userPhone").focus();
            return;
		}

        $.ajax({
            url: "register/ajax/findEmail",
            data: {
                userName: userName,
                userPhone: userPhone
            },
            type: "get",
            dataType: "text",
            success: function(data) {
				console.log(data);
				if (data == 'noExist') {
					 swal("존재하지 않는 사용자입니다." , "이름과 핸드폰번호를 다시 확인해주세요" ,"error");
				}
                /*if (data == 'able') {

                    swal("사용 가능한 닉네임입니다." , "" ,"success");
                    $('#nickNameCheckBtn').html('체크완료');
                    $('#nickNameCheckBtn').attr('disabled', 'true');
                    
                    $("#nickNameCheck").css("color","green");
                    $("#nickNameCheck").text("✔사용 가능한 닉네임입니다");
                    
                } else {

                    swal("이미 존재하는 닉네임입니다." , "" ,"error");
                }*/
            },
            error: function(error) {
                console.log(error);
            }
        });
    });