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

        atfer = $(this).prev().val();

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

                url:"ajax/editmydetail",
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

        key = key;
        let link;

        if(key == "skill"){
        
            link = "ajax/getskills";
        
        } else if(key == "experience"){

            $("#m_experience").addClass("show");
            $("#ex_contentarea").empty();
            addEx();

            if($("#have").length == 0){
                console.log("그냥 프로젝트 경험이 없는 사람");
                $("#ex_contentarea").empty();
            }

            return;

        } else if(key == "position"){
        
            link = "ajax/getposition";
        
        } else if(key == "duration"){
            
            link = "ajax/getdurations";
        
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

                        
                           $("#tagarea").append(
    
                                "<div class='tags' id='"+obj.skill_code+"'>"+obj.skill_name+"</div>"
                             );                   
    
                   });

                } else if(key == "position"){

                    $.each(response, function(index, obj){
                        
                            $("#tagarea").append(

                                "<div class='positions' id='"+obj.position_id+"'>"+obj.position_name+"</div>"
                            );
                           
                   });

                }else if(key == "duration"){

                    $.each(response, function(index, obj){
                        
                            $("#tagarea").append(
        
                                "<div class='tags' id='D"+(index+1)+"'>"+obj.du_date+"</div>"
                            );
    
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
        
            } else if(third != undefined ){
                
                console.log("세 개 선택했을 때");
                 
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

    
    $.ajax({

        //url:url,
        url:"ajax/deletestat",
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

    console.log("2번 시작");

    if(keyword == 'skill'){
        
        url="ajax/editskills";

    } else if(keyword == 'position'){

        url="ajax/updateposition";

    } else if(keyword == 'duration'){

        url="ajax/editdurations";

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

    $.ajax({

        url:"ajax/modifystatview",
        data:{

            userid:$("#m_email").val(),
            type:type

        },
        type:"post",
        dataType:"json",
        async: false,
        success:function(data){

        
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

        $("#have").remove();
        $("#ex_btn").find("a").remove();

        // 회원 상세 테이블에 프로젝트 경험컬럼 null에서 0으로 업데이트
        haveExperience("never");

    } else{

        $("#ex_toggle").append(

         `<a href="#m_experience" class="trigger-btn" data-toggle="modal">
												<div class="insert experience" id="have">있음</div></a>`

        );
    }    
});

//회원 상세 테이블에 프로젝트 경험여부 업데이트 하기
function haveExperience(answer){

    $.ajax({

        url:"ajax/updateexperience",
        data:{
            memberid:$("#m_id").val(),
            answer:answer
        },
        type:"post",
        dataType:"text",
        success:function(res){         

        },
        erroe:function(xhr){
            console.log(xhr);
        }

    });

}

// 프로젝트 경험 추가 기입
$(document).on("click",".add_ex",function(){

    // + 버튼 눌러서 폼 추가
    addEx();

});

//프로젝트 경험 기입한 것 삭제
$(document).on("click",".del_ex",function(){

    $(this).parent().parent().remove();

});

//추가 버튼 클릭시 폼 생성
function addEx(){

    //왜인지 form 을 서버에 넘기면 첫번째 인풋 태그의 값을 못 받아서
    //아무 의미 없는 인풋태그를 맨 앞에 하나 추가한다
    $("#ex_contentarea").append(

        `<div class="exarea">
        <form class="ex_form" method="post" action="ajax/insertexperiences">
        <input type="hidden" calss="MEMBER_ID" name="MEMBER_ID" id="ex_member_id"></input>
        <div class="ex_title">
            <input type="text" class="exinput EXP_TITLE" id="EXP_TITLE" placeholder="프로젝트명"></input>
            <span class="index"></span>
        </div>

        <div class="ex_title"><input type="text" class="exinput EX_POSITION" name="EX_POSITION" id="EX_POSITION" placeholder="담당 업무/포지션"></input> </div>
        <div class="ex_title"><input type="text" class="exinput EX_SKILL" name="EX_SKILL" id="EX_SKILL" placeholder="사용기술"></input> </div>
        <div class="ex_title"><input type="text" class="exinput EX_DURATION" name="EX_DURATION" id="EX_DURATION" placeholder="소요 기간"></input> </div>
        <div class="ex_content"><input type="text" class="exinput EX_CONTENT" name="EX_CONTENT" id="EX_CONTENT" placeholder="간단한 설명"></input> </div>
        <div class="ex_button"><button type="button" class="add_ex">+</button><button type="button" class="del_ex">-</button></div>
        </form>
    </div>`

    );

    //인풋 태그에 바로 넣어주면 첫번째 폼에서는 회원번호를 못 가져온다
    $("#ex_member_id").val($("#m_id").val().trim());
}

//수정 버튼 누르면 폼에 입력한 프로젝트 경험들 인서트
$("#insert_ex").on("click", function(){
    console.log("아몬드 넥스트레블");
    insertExperiences();
})

//폼에 입력한 프로젝트 경험들 비동기로 날리고 받은 거 뷰단에 반영하기
function insertExperiences(){

    var ex_data = $(".ex_form").serialize();
    //var ex_data = new FormData(document.getElementsByClassName("ex_form"));
/*
    var ex_data = {
        MEMBER_ID : $("#ex_member_id").val(),
        EXP_TITLE : $(".EXP_TITLE").val(),
        EX_POSITION : $(".EX_POSITION").val(),
        EX_SKILL : $(".EX_SKILL").val(),
        EX_CONTENT : $(".EX_CONTENT").val(),
        EX_DURATION : $(".EX_DURATION").val()
    }
*/
    $.ajax({

        url:$(".ex_form").attr("action"),
        type:"post",
        dataType:"text",
        traditional : true,
        data:JSON.stringify(ex_data),
        contentType:"application/json;chrset=uft-8",
        success:function(res){
            console.log(res);

        },
        error:function(xhr){
            console.log(xhr);
        }

    });

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
    
    $.ajax({

        url:"ajax/updatedeletecount",
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
