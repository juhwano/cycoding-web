$(document).ready(function() {

    let before;
    let atfer;
    //수정 버튼 누르면 수정창 생성
    $(document).on("click",".m-btn",function(){
    
        console.log("클릭");
        console.log($(this));
        console.log($(this).prev());

        before = $(this).prev().val();

            $(this).prev().prop("readonly",false);
            $(this).prev().attr("placeholder",before);
            $(this).prev().addClass("info-mdf");
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
        if(before == $(this).prev().val()){
            //swal("수정할 내용이 없습니다");

                        $(this).prev().empty();
                        $(this).prev().val(atfer);
                        $(this).prev().prop("readonly",true);
                        $(this).prev().removeClass("info-mdf");
                        $(this).text("수정");
                        $(this).removeClass("c-btn");
                        $(this).addClass("m-btn");
                        

        }else{

            let code = $(this).prev().prev().text();
            console.log(code);
            let button = $(this);

            $.ajax({

                url:"editmydetail.ajax",
                data:{
                   code:code,
                   info:atfer,
                   userid:$("#m_id").val()
                },
                type:"get",
                dataType:"text",
                success:function(data){

                    if(data == "success"){

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

                    } else{
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



    //detail영역 스탯 모달창
    $('.trigger').on('click', function() {
        $('.modal-wrapper').toggleClass('open');
        //console.log($(this));
         return false;
   });

        //기술/기간 클릭하면 태그 선택
        $(document).on("click",".tags",function(){


            let name = $(this).text();
            selected= $(".clicked");

            console.log(selected.length);
            console.log(selected);
    
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

            let name = $(this).text();
             
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
                }

        });

        //클릭하면 포지션 태그 선택 해제
        $(document).on("click",".p_clicked",function(){
            let name = $(this).text();             
            $(this).removeClass("p_clicked");
            $(this).removeClass("chosen");
            $(this).addClass("positions");
        });

       

}); //document.ready 끝

   //모달창에 스탯 리스트 뿌리기
   function edit_modal(code){

    if(code == 'skill'){
    
		$("#modal-title").empty();
        $("#modal-title").append("보유하고 계신 기술을 선택해주세요");

        getStat('skill');

    } else if(code == 'experience'){

        $("#modal-title").empty();
        $("#modal-title").append("프로젝트 경험 여부를 선택해주세요");

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

    function getStat(key){
        console.log("모달에 태그 뿌리기 실행");
        key = key;
        let link;

        if(key == "skill"){
        
            link = "getskills.ajax";
        
        } else if(key == "experience"){

            link = "getexperiences.ajax";

        } else if(key == "position"){
        
            link = "getposition.ajax";
        
        } else if(key == "duration"){
            
            link = "getdurations.ajax";
        
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
                        
                        $("#tagarea").append(
    
                           "<div class='tags' id='"+obj.skill_code+"'>"+obj.skill_name+"</div>"
                        );
    
                   });

                } else if(key == "position"){

                    $.each(response, function(index, obj){
                        console.log("each??");
                        
                        $("#tagarea").append(

                            "<div class='positions' id='"+obj.position_id+"'>"+obj.position_name+"</div>"
                        );
    
                   });

                }else if(key == "duration"){

                    $.each(response, function(index, obj){
                        console.log("each??");
                        
                        $("#tagarea").append(
    
                           "<div class='tags'>"+obj.du_date+"</div>"
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

    $("#tagarea").empty();
    $("#selectedarea").empty();

});

//모달에서 선택한 태그 DB와 뷰단에 반영하기(기술, 포지션, 기간)
$("#edit").on("click",function(){
    console.log("수정버튼 클릭");

    newStat = $(".chosen").attr("id");

    console.log(newStat);


});

//스탯 비동기 반영
function editStat(keyword){

    let url = "";

    if(keyword == 'skill'){
        
        url="editSkills.ajax";

    } else if(keyword = 'position'){

        url="editPosition.ajax";

    } else if(keyword='duration'){

        url="editDurations.ajax";

    }

    
    $.ajax({

        url:url,
        data:{
            memberid:$("m_id").val()
        },
        type:"get",
        dataType:"json",
        success:function(data){
            console.log(data);
        },
        error:function(xhr){
            console.log(xhr);
        }
        


    });

}




