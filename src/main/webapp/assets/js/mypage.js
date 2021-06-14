$(document).ready(function() {


    //추가 정보 모두 기입하면 문구 사라지게 하기
    $("a").on("click",function(){

        if($(document).find(".insert").length == -1){
            console.log("detail 다 입력했는지 체크 이벤트");
            $(".sub_title").css("display","none");

        }else{
            $(".sub_title").css("display","block");
        }

    });

    //About Cycoder 부분의 정보 각각 비동기로 변경하기
    // 개인정보 담을 변수
    let before;
    let atfer;

    //수정 버튼 누르면 수정창 생성
    $(document).on("click",".m-btn",function(){
    
        console.log("클릭");
        console.log($(this));
        console.log($(this).prev());

        //바꾸기 전의 input 태그의 값 미리 담아두고
        before = $(this).prev().val();

            //input 태그의 읽기 전용 비활성화, 기존 값은 placeholder로 바꾼다
            $(this).prev().prop("readonly",false);
            $(this).prev().attr("placeholder",before);
            $(this).prev().addClass("info-mdf");

            //버튼 글씨 바꾸기
            $(this).text("확인");
            $(this).removeClass("m-btn");
            $(this).addClass("c-btn");

    });

    //확인 버튼 누르면 수정 내용 확정
    $(document).on("click",".c-btn",function(){
        

        console.log("확인");
        console.log($(this));
        console.log($(this).prev());

        atfer = $(this).prev().val();
        console.log(atfer);

        //수정 눌렀는데 값이 변한게 없을 때
        if(before == $(this).prev().val()){
            //swal("수정할 내용이 없습니다");

                        $(this).prev().empty();
                        $(this).prev().val(atfer);
                        $(this).prev().prop("readonly",true);
                        $(this).prev().removeClass("info-mdf");
                        $(this).text("수정");
                        $(this).removeClass("c-btn");
                        $(this).addClass("m-btn");
                        

        //값이 변했을 때
        }else{

            let code = $(this).prev().prev().text();
            console.log(code);
            let button = $(this);

            $.ajax({

                url:"ajax/editmydetail.ajax",
                data:{
                   code:code,
                   info:atfer,
                   userid:$("#m_id").val()
                },
                type:"get",
                dataType:"text",
                success:function(data){

                    if(data == "success" && code != "비밀번호"){

                        button.prev().empty();
                        button.prev().val(atfer);
                        button.prev().prop("readonly",true);
                        button.prev().removeClass("info-mdf");
                        button.text("수정");
                        button.removeClass("c-btn");
                        button.addClass("m-btn");

                        swal("수정되었습니다" , "" ,"success");

                        //닉네임 수정할 경우 프사 밑의 닉네임도 변경
                        if(code == "닉네임"){
                            $("#cycoder").children().text("");
                            $("#cycoder").children().text($("#nick").val());
                            console.log($("#cycoder").children().text());
                        }

                    } else if(data == "success" && code == "비밀번호"){
                    
                        //비밀번호가 변경되었을 때는 인풋 태그의 값을 굳이 바꾸지 않는다
                        //암호화 된 거 엄청 길어서 사용자한테 그대로 보여주지 않을 것
                        console.log("여기 안 타나");
                        button.prev().val("password");
                        button.prev().prop("readonly",true);
                        button.prev().removeClass("info-mdf");
                        button.text("수정");
                        button.removeClass("c-btn");
                        button.addClass("m-btn");

                        swal("수정되었습니다" , "" ,"success");

                    }else{
                        swal("수정에 실패했습니다","","error");
                    }

                },
                error:function(xhr){
                    console.log(xhr);
                    swal("수정에 실패했습니다","","error");
                }

            });

        }
            

    });

    let newStats = [];

    //detail영역 스탯 모달창
    $('.trigger').on('click', function() {
        $('.modal-wrapper').toggleClass('open');
        //console.log($(this));
         return false;
   });

        //기술/기간 클릭하면 태그 선택
        $(document).on("click",".tags",function(){

           // let name = $(this).text();
           //선택된 태그를 담을 배열
            selected= $(".clicked");
            newStats.push($(".clicked").attr("id"));

            console.log(selected.length);
            console.log(selected);
            console.log(newStats);
    
            console.log($(this).text(), " 태그 선택");

                if(selected.length>2){

                    swal("세 개까지만 선택 가능합니다");
    
                } else{
    
                    $(this).addClass("clicked");
                    $(this).addClass("chosen");
                    $(this).removeClass("tags");
                    $("#selectedarea").append($(this));
                }

        });

        //기술/기간 클릭하면 태그 선택 해제
        $(document).on("click",".clicked",function(){

           // let name = $(this).text();
             
            $(this).removeClass("clicked");
            $(this).removeClass("chosen");
            $(this).addClass("tags");
            $("#tagarea").append($(this));
            
        });

        //클릭하면 포지션 태그 선택
        $(document).on("click",".positions",function(){


            let name = $(this).text();
            selected= $(".p_clicked");

            console.log(selected.length);
            console.log(selected);
    
            console.log($(this).text(), " 태그 선택");

                if(selected.length>0){

                    swal("하나만 선택 가능합니다");
                    
    
                } else{
    
                    $(this).addClass("p_clicked");
                    $(this).addClass("chosen");
                    $(this).removeClass("positions");
                    $("#selectedarea").append($(this));
                }

        });

        //클릭하면 포지션 태그 선택 해제
        $(document).on("click",".p_clicked",function(){
            let name = $(this).text();             
            $(this).removeClass("p_clicked");
            $(this).removeClass("chosen");
            $(this).addClass("positions");
            $("#tagarea").append($(this));
        });

       

}); //document.ready 끝

   //모달창에 스탯 리스트 뿌리기
   function edit_modal(code){
    
    console.log("모달 실행");
    console.log(code);
    $("#stat").val(code);

    if(code == 'skill'){
    
		$("#modal-title").empty();
        $("#modal-title").append(
            "보유하고 계신 기술을 선택해주세요<br>"
            +"<span style='font-size:16px; color:#CA8FAB'>첫번째 기술이 대표기술로 소개됩니다</span>"
            );

        getStat('skill');

    } else if(code == 'experience'){

        $("#modal-title").empty();
        $("#modal-title").append("경험하신 프로젝트에 대해 알려주세요");


        getStat('experience');
    
    }else if(code == 'position'){

        $("#modal-title").empty();
        $("#modal-title").append("선호하는 포지션을 선택해주세요");
    
        getStat('position');
    
    }else if(code == 'duration'){

		$("#modal-title").empty();
		$("#modal-title").append("선호하는 프로젝트 기간을 선택해주세요");

        getStat('duration');
        
    }


    let key ="";
    let originStat =[];
    function getStat(key){
        console.log("프로젝트 경험 모달에 뿌리기");
        key = key;
        let link;

        $("#contentarea").append(

            '<div id="tagarea"></div><div id="selectedarea"></div>'

        );

        if(key == "skill"){
        
            link = "ajax/getskills.ajax";
        
        } else if(key == "experience"){


            $("#contentarea").empty();

            $("#contentarea").append(

                `<div class="exarea">
                <div class="ex_title">
                    <input type="text" class="exinput" placeholder="프로젝트명"></input>
                    <span class="index"></span>
                </div>

                <div class="ex_title"><input type="text" class="exinput" placeholder="담당 업무/포지션"></input> </div>

                <div class="ex_title"><input type="text" class="exinput" placeholder="사용기술"></input> </div>

                <div class="ex_title"><input type="text" class="exinput" placeholder="소요 기간"></input> </div>

                <div class="ex_content"><input type="text" class="exinput" placeholder="간단한 설명"></input> </div>

                <div class="ex_button"><button type="button" class="add_ex">+</button><button type="button" class="del_ex">-</button></div>

            </div>`

            );

            if($("#have").length == 0){
                console.log("그냥 프로젝트 경험이 없는 사람");
                $("#contentarea").empty();
            }

            //$(".index").text("#"+$(this).parent().parent().find(".exarea").index(this));


            return;


        } else if(key == "position"){
        
            link = "ajax/getposition.ajax";
        
        } else if(key == "duration"){
            
            link = "ajax/getdurations.ajax";
        
        }

        $.ajax({

            url:link,
            data:{

                userid:$("#m_id").val()

            },
            type:"get",
            dataType:"json",
            success:function(response){
                console.log(response);
                $("#tagarea").empty();

                if(key == "skill"){

                    $.each(response, function(index, obj){
                        console.log("each??");
                        
                        //if( $(".trigger-btn").find(".skill").text().indexOf(obj.skill_name) != -1){
                          //  $("#selectedarea").append(
    
                          //      "<div class='clicked' id='"+obj.skill_code+"'>"+obj.skill_name+"</div>"
                          //   );
                        //} else{

                            $("#tagarea").append(
    
                                "<div class='tags' id='"+obj.skill_code+"'>"+obj.skill_name+"</div>"
                             );

                       // }
                        
    
                   });

                } else if(key == "position"){

                    $.each(response, function(index, obj){
                        console.log("each??");

                       // if( $(".trigger-btn").find(".position").text().indexOf(obj.position_name) != -1){
                            //$("#selectedarea").append(
    
                            //    "<div class='p_clicked' id='"+obj.position_id+"'>"+obj.position_name+"</div>"
                            // );
                        //} else{
                        
                            $("#tagarea").append(

                                "<div class='positions' id='"+obj.position_id+"'>"+obj.position_name+"</div>"
                            );
                       // }
                            
                   });

                }else if(key == "duration"){

                    $.each(response, function(index, obj){
                        console.log("each??");

                        //if( $(".trigger-btn").find(".duration").text().indexOf(obj.du_date) != -1){
                           // $("#selectedarea").append(
    
                            //    "<div class='clicked' id='d"+(index+1)+"'>"+obj.du_date+"</div>"
                            // );
                       // } else{
                        
                            $("#tagarea").append(
        
                                "<div class='tags' id='D"+(index+1)+"'>"+obj.du_date+"</div>"
                            );
                       // }
    
                   });
                }
               

            },
            error:function(xhr){
                console.log(xhr);
            }

        });

    }
}


//모달창 닫으며 데이터 태그 초기화하기
$("#cancel").on("click",function(){

    $(".exarea").remove();
    $("#tagarea").empty();
    $("#selectedarea").empty();

});

//모달에서 선택한 태그 DB와 뷰단에 반영하기(기술, 포지션, 기간)
//스탯 비동기 반영
$("#edit-btn").on("click",function(){
    console.log("수정버튼 클릭");

    let first = $("#selectedarea :nth-child(1)").attr("id");
    let second = $("#selectedarea :nth-child(2)").attr("id");
    let third =  $("#selectedarea :nth-child(3)").attr("id");

    console.log("1",first);
    console.log("2",second);
    console.log("3",third);

    let arr = [];

    if(third == undefined && second == undefined && first == undefined){
        swal("수정할 내용이 없습니다","","error");

    } else{
        
        if($("#stat").val() != "position"){
        
            del($("#stat").val());

            if(third == undefined && second == undefined && first != undefined){
    
                console.log("하나 선택했을 때");            
       
                edit(first);
    
        
            } else if(third == undefined && second != undefined){
    
                arr.push(first);
                arr.push(second);
    
                console.log("두 개 선택했을 때");
                
                $.each(arr, function(index, item){
                    edit(item);
                });
                //edit(first);
                //edit(second);
    
        
            } else if(third != undefined ){
                
                console.log("세 개 선택했을 때");
        
                //edit(first);
                //edit(second);
                //edit(third);
    
                
                arr.push(first);
                arr.push(second);
                arr.push(third);
                
                $.each(arr, function(index, item){
                    edit(item);
                });
    
            } 

        } else if($("#stat").val() == "position"){

            edit(first);

        }
           

        console.log("마지막에 실행될 구간");
        modifyStatView($("#stat").val());

    } 
    
    
});

//기존 스탯들 삭제하는 함수
function del(type){

    let url = "";
    console.log("1번 시작");
    console.log(type, " 삭제 ");
    
    $.ajax({

        //url:url,
        url:"ajax/deletestat.ajax",
        data:{
            memberid:$("#m_id").val(),
            type:type
        },
        type:"get",
        dataType:"text",
        async: false,
        success:function(data){
            console.log("1. 삭제 결과 : ", data);
            console.log("1번 끝");
        },
        error:function(xhr){
            console.log(xhr);
        }

    });
}


//새로 선택된 스탯들 인서트 하는 함수
function edit(stats){

    let url = "";
    let keyword = $("#stat").val();
    console.log(keyword);
    console.log(stats);
    console.log("2번 시작");

    if(keyword == 'skill'){
        
        url="ajax/editskills.ajax";

    } else if(keyword == 'position'){

        console.log("키워드 ",keyword);
        console.log("왜 여길 들어와?");
        url="ajax/updateposition.ajax";

    } else if(keyword == 'duration'){
        console.log("여기 타나");
        url="ajax/editdurations.ajax";

    }

    
    $.ajax({

        url:url,
        data:{
            memberid:$("#m_id").val(),
            stat:stats
        },
        type:"post",
        dataType:"text",
        async: false,
        success:function(data){
            console.log("2. 인서트 결과  ",data);
            console.log("2번 끝");
        },
        error:function(xhr){
            console.log(xhr);
        }

    });
}

//스탯 변경사항 뷰단에 반영하는 함수
function modifyStatView(type){

    console.log("3번 시작")
    console.log("3. 비동기 반영 실행", $("#m_email").val());

    $.ajax({

        url:"ajax/modifystatview.ajax",
        data:{

            userid:$("#m_email").val(),
            type:type

        },
        type:"post",
        dataType:"json",
        async: false,
        success:function(data){

            console.log("화면 비동기 반영결과 : ",data);
            
            if(type == "skill"){

                $(".skillarea").empty();

                $.each(data, function(index,obj){
    
                    if(index == 0){
    
    
                        $(".skillarea").append(
    
                            '<a href="#m_stat" class="trigger-btn" data-toggle="modal">'
                            +'<i class="fa fa-star" id=star></i>'
                            +'<div class="info_tags main_skill skill">'
                            +obj.skill_name+'</div></a>'
    
                        );
    
                    } else{
    
                        $(".skillarea").append(
    
                            '<a href="#m_stat" class="trigger-btn" data-toggle="modal">'
                            +'<div class="info_tags skill">'
                            +obj.skill_name+'</div></a>'
    
                        );
    
                    }
                    
    
                });

            } else if(type == "position"){

                $(".positionarea").empty();

                $.each(data, function(index,obj){
                
                $(".positionarea").append(
                    '<a href="#m_stat" class="trigger-btn" data-toggle="modal">'
					+'<div class="info_tags position">'+obj.position_name+'</div></a>'
                );

            });

            } else if(type=="duration"){


                $(".durationarea").empty();

                $.each(data, function(index,obj){

    
                        $(".durationarea").append(
    
                            '<a href="#m_stat" class="trigger-btn" data-toggle="modal">'
                            +'<div class="info_tags duration">'
                            +obj.du_date+'</div></a>'
    
                        );
    
                });

            }

            swal("수정되었습니다","","success");
            console.log("3번 끝");

            
    $("#tagarea").empty();
    $("#selectedarea").empty();


        },
        error:function(xhr){
            console.log(xhr);
        }

    });

}
// 여기까지가 보유 기술, 선호 포지션, 기간 수정 및 화면 반영
///////////////////////////////////////////////////////////////////////////////////////

//프로젝트 경험 여부 관련 함수

// '없음' 선택하면 입력 완료로 바꾸기
$("#never").on("click",function(){

    $(this).toggleClass("insert");
    $(this).toggleClass("info_tags");
    $(this).css("margin","10px auto");

    console.log($("#have").length);

    if( $("#have").length != 0){
        console.log("태그 없애기~");
        $("#have").remove();
        $("#ex_btn").find("a").remove();


    } else{

        console.log("태그 만들기")
        $("#ex_toggle").append(

         `<a href="#m_stat" class="trigger-btn" data-toggle="modal">
												<div class="insert experience" id="have">있음</div>
											</a>`

        );
    }
    



});

// 프로젝트 경험 추가 기입
$(document).on("click",".add_ex",function(){

    addEx();

});

//프로젝트 경험 추가기입 삭제
$(document).on("click",".del_ex",function(){
    console.log("폼 삭제")
    $(this).parent().parent().remove();

});

//추가 버튼 클릭시 폼 생성
function addEx(){
    console.log("경험 입력 폼 생성");
    $("#contentarea").append(

        `<div class="exarea">
        <div class="ex_title">
            <input type="text" class="exinput" placeholder="프로젝트명"></input>
            <span class="index"></span>
        </div>

        <div class="ex_title"><input type="text" class="exinput" placeholder="담당 업무/포지션"></input> </div>

        <div class="ex_title"><input type="text" class="exinput" placeholder="사용기술"></input> </div>

        <div class="ex_title"><input type="text" class="exinput" placeholder="소요 기간"></input> </div>

        <div class="ex_content"><input type="text" class="exinput" placeholder="간단한 설명"></input> </div>

        <div class="ex_button"><button type="button" class="add_ex">+</button><button type="button" class="del_ex">-</button></div>

    </div>`

    );
}


// 프로필 이미지 파일 업로드
$('#target_img').click(function (e) {
    
    console.log("프로필 이미지 클릭");
    $('#file').click();
}); 

$('#file').change(function(event) {

    var reader = new FileReader();
	
	console.log("프로필 이미지 업로드");
	
    reader.onload = function(event) {
        $('#target_img').attr("src", event.target.result);
       
    }

   reader.readAsDataURL(event.target.files[0]);
   //swal("프로필 이미지가 변경되었습니다!");

   $("#img_form").submit();

    console.log("리다이렉트");
});


//비동기로 이미지 바뀌도록 이미지 폼태그가 submit 될 때 작동할 스크립트 추가
/*
$("#img_form").submit(function(e){

    //동기로 전송되는 것 막고
    e.preventDefault();

    //직렬화 해서 이미지 폼 안의 정보를 키/값 쌍으로 만듦
    let imgdata = $("#img_form").serialize();
    console.log(imgdata);

    //애증의 비동기...
    $.ajax({

        url:$("#img_form").attr("action"),
        type:"post",
        data:imgdata,
        dataType:"text",
        processData: false,
        contentType:'multipart/form-data',
        success:function(data){
            console.log(data);

        },
        error:function(xhr){
            console.log(xhr);
        }

    });

});
*/
//회원 탈퇴
$("#quit").on("click",function(){

    console.log("회원탈퇴 버튼 클릭");
    
    $.ajax({

        url:"ajax/updatedeletecount.ajax",
        data:{
            quit_id : $("#m_id").val()
        },
        type:"post",
        dataType:"text",
        success:function(response){
            console.log(response);
            if(response == "success"){
                swal("탈퇴 신청이 완료되었습니다","7일 이내 로그인시 철회 가능합니다","success")
            }else{
                swal("탈퇴 신청을 실패했습니다","","error");
            }
        },
        error:function(xhr){
            console.log(xhr);
        }


    });


});
