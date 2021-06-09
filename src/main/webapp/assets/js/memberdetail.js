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

    //엔터 치면 수정 내용 확정
    /*
    $(document).on("keyup.keyCode==13",".info-mdf",function(){
        

        console.log("확인");
        console.log($(this));

        atfer = $(this).val();
        console.log(atfer);
        if(before == $(this).val()){
            //swal("수정할 내용이 없습니다");

                        $(this).empty();
                        $(this).val(atfer);
                        $(this).prop("readonly",true);
                        $(this).removeClass("info-mdf");
                        $(this).next().text("수정");
                        $(this).next().removeClass("c-btn");
                        $(this).next().addClass("m-btn");
                        

        }else{

            let code = $(this).prev().text();
            console.log(code);
            let input = $(this);

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

                        input.empty();
                        input.val(atfer);
                        input.prop("readonly",true);
                        input.removeClass("info-mdf");
                        input.next().text("수정");
                        input.next().removeClass("c-btn");
                        input.next().addClass("m-btn");

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
*/

    //기술스택 모달창
    $('.trigger').on('click', function() {
        $('.modal-wrapper').toggleClass('open');
         return false;
   });




})