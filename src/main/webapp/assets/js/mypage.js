$(document).ready(function() {
	

	//추가항목 기입 여부에 따라 문구 노출
	$("#ex_toggle").on("click",function(){
		
        console.log("프로젝트 경험 클릭");
        //입력하기 버튼이 있는지 그 개수를 세서 미입력 여부 확인
		let insert_btn = $(".detail_section").children().children().children(".insert");
		
		console.log(insert_btn);
		if(insert_btn.length==0){
			$(".sub_title").empty();
			givePoint();
		} else{
			$(".sub_title").text("모든 항목을 입력해야 프로젝트에 지원할 수 있어요!");
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
            
            
            //닉네임은 중복체크 먼저
            if(code == "닉네임"){
				$.ajax({
		            url: "ajax/nicknamecheck",
		            data: {
		                nickName:$("#nick").val()
		            },
		            type: "get",
		            dataType: "text",
		            success: function(data) {
                if (data == 'able') {

					editMyDetail(code,button);	
                    
                } else {

                    swal("이미 존재하는 닉네임입니다." , "" ,"error");
                }
            },
            error: function(error) {
                console.log(error);
            }
        });
   	
			//휴대폰 번호도 중복체크 먼저
			} else if(code == "휴대폰"){
				
			$.ajax({
            url: "ajax/phonecheck",
            data: {
                phone: $("#m_phone").val()
            },
            type: "get",
            dataType: "text",
            success: function(data) {
                if (data == 'able') {

					editMyDetail(code,button);
					
                } else {

                    swal("사용할 수 없는 번호입니다." , "" ,"error");
                }
            },
            error: function(error) {
                console.log(error);
            }
        });
				//비밀번호는 유효성 검사도 해야 한다
			} else if(code == "비밀번호"){
				
				let checking = true;
				let password = $("#password").val();
				let num = password.search(/[0-9]/g);
            	let eng = password.search(/[a-z]/ig);
    
            if (password.length < 8 || password.length > 13) {
    
                swal("비밀번호는 8-20자리 이내로 입력하세요." , "" ,"error");
                checking = false;


    
            } else if (password.search(/\s/) != -1) {
    
                swal("비밀번호는 공백을 입력할 수 없습니다." , "" ,"error");
                checking = false;


    
            } else if (num < 0 || eng < 0 ) {
    
                swal("영문, 숫자를 포함하여 입력하세요." , "" ,"error");
                checking = false;


            }
				
				
				if(checking){
					editMyDetail(code,button);
				}
				
				
			} else{
				
				editMyDetail(code,button);
				
			}
           

        }
            
    });
    
    
    //수정 버튼 누르면 바뀌는 개인정보 디비에 실반영 하는 함수
    function editMyDetail(code,button){
	
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
            $(".exarea").remove();
            addEx();

            if($("#have").length == 0){

                $(".exarea").remove();
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
        
        //수정 버튼 눌렀을 때 아직 미입력 스탯 있는지 체크해서 문구 보여주기
        let insert_btn = $(".detail_section").children().children().children(".insert");
		
		console.log(insert_btn);
		if(insert_btn.length==0){
			$(".sub_title").empty();
			givePoint();
		} else{
			$(".sub_title").text("모든 항목을 입력해야 프로젝트에 지원할 수 있어요!");
		}

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

// 프로젝트 경험 추가폼 삭제
$(document).on("click",".del_ex",function(){

    // - 버튼 눌러서 폼 삭제
   $(this).parent().parent().remove();

});

//추가 버튼 클릭시 폼 생성
function addEx(){

   $(".ex_form").append(

        `<div class="exarea">
            <input type="hidden" class="MEMBER_ID" name="ID" value=""></input> 
            <input type="text" class="exinput EXP_TITLE" id="EXP_TITLE" name="EXP_TITLE" placeholder="프로젝트명"></input>    
            <input type="text" class="exinput EX_POSITION" name="EX_POSITION" id="EX_POSITION" placeholder="담당 업무/포지션"></input>
            <input type="text" class="exinput EX_SKILL" name="EX_SKILL" id="EX_SKILL" placeholder="사용기술"></input> 
            <input type="text" class="exinput EX_DURATION" name="EX_DURATION" id="EX_DURATION" placeholder="소요 기간"></input> 
           <input type="text" class="exinput EX_CONTENT" name="EX_CONTENT" id="EX_CONTENT" placeholder="간단한 설명"></input>
            <div class="ex_button"><button type="button" class="add_ex">+</button><button type="button" class="del_ex">-</button></div>
        </div>`
    );

    // //인풋 태그에 바로 넣어주면 첫번째 폼에서는 회원번호를 못 가져온다
    $(".MEMBER_ID").val($("#m_id").val().trim());
}

let check = "true";
//모든 항목 입력 전에는 수정 버튼을 누를 수 없다
$(document).on("input",".exinput",function(){ 
    
    $.each($(".exinput"),function(index,obj){

        if($(this).val() == ""){

            check = false;
            $("#insert_ex").text("대기");
       		$("#insert_ex").attr("disabled",true);
           
        } else {
			check = true;
		}

    });

    if(check){
        console.log("모든 항목 입력");
        $("#insert_ex").text("수정");
        $("#insert_ex").attr("disabled",false);
    }

})

//수정 버튼 누르면 폼에 입력한 프로젝트 경험들 인서트
$("#insert_ex").on("click", function(){
    
    console.log(check);

    let mex = [];
    $.each($("div[class=exarea]"),function(index,item){

        console.log($(this));
        
        var ex_data = {
            ID : $(this).children(".MEMBER_ID").val(),
            EXP_TITLE :  $(this).children(".EXP_TITLE").val(),
            EX_POSITION : $(this).children(".EX_POSITION").val(),
            EX_SKILL :  $(this).children(".EX_SKILL").val(),
            EX_CONTENT :  $(this).children(".EX_CONTENT").val(),
            EX_DURATION :  $(this).children(".EX_DURATION").val()
        }

        insertExperiences(ex_data);
    }); 

})

//폼에 입력한 프로젝트 경험들 서버에 보내기
function insertExperiences(ex_data){
    
    $.ajax({

        url:$(".ex_form").attr("action"),
        type:"post",
        dataType:"text",
        data:ex_data,
        success:function(res){
            console.log(res);

            getNewExperiences();

        },
        error:function(xhr){
            console.log(xhr);
        }

    });

}

//서버에서 비동기로 새로 추가된 경험 불러오기
function getNewExperiences(){

    $.ajax({

        url:"ajax/getnewexperiences",
        type:"post",
        dataType:"json",
        data:{ useremail : $("#m_email").val()},
        success:function(res){

            console.log(res);

            $("#exlistarea").empty();
            $("#exlistarea").append(
                `<div id="exlist"></div>`
            );

            $.each(res, function(index,obj){

                $("#exlistarea").append(

                    `<form action="ajax/updateexperiences" class="ex_edit_form">
                    <div class="ex_box" id="`+obj.ex_count+`">										
                        <div class="ex ex_titlebox">
                            <div id="exicons">
                                <i class="fas fa-edit edit_exbox"></i>
                                <i class="fas fa-eraser del_exbox"></i>
                            </div>
                            <span class="ex_count">#`+obj.ex_count+`</span>
                            <input type="text" class="ex_title exp_title_input" name="exp_title_input" value="`+obj.exp_TITLE+`" readonly/>
                            </div>
                            <div class="ex"><input type="text"  name="ex_position" class="ex_position_input" name="ex_position_input" value="`+obj.ex_POSITION+`" readonly/></div>
                            <div class="ex"><input type="text"  name="ex_skill" class="ex_skill_input" name="ex_skill_input" value="`+obj.ex_SKILL+`" readonly/></div>
                            <div class="ex"><input type="text"  name="ex_duration" class="ex_duration_input" name="ex_duration_input" value="`+obj.ex_DURATION+`" readonly/></div>
                            <div class="ex"><input type="text"  name="ex_content"  class="ex_content_input" name="ex_content_input" value="`+obj.ex_CONTENT+`" readonly/></div>               
                    </div></form>`

                );

            });

            $("#exlistarea").append(
                `<a href="#m_experience" class="trigger-btn" data-toggle="modal">
                <div class="add experience" id="have">추가</div></a>`
            );
        },
        error:function(xhr){
            console.log(xhr);
        }

    });

}

//클릭하면 경험 수 체크하고 삭제 모든 경험 삭제는 안되게 막기(뷰단처리)
$(document).on("click",".del_exbox",function(){
	
		console.log("삭제");
		if($(".ex_box").length == 1){
			
			swal("경험을 모두 삭제하실 수는 없습니다");
            
		}else{

            $(this).parent().parent().parent().remove();

            $.each($(".ex_count"),function(index,item){
 
                 $(this).empty();
                 $(this).text("#"+(index+1));
 
             });

             deleteExperience($(this));           
        }

});
//프로젝트 경험 삭제 디비 반영
function deleteExperience(del_btn){
    
		let boxid = del_btn.parent().parent().parent().attr("id");
		console.log(boxid);
		
		$.ajax({
			
			url:"ajax/deleteexperience",
			type:"post",
			dataType:"text",
			data:{
				ex_id : boxid,
				memberid:$("#m_id").val()
			},
			success:function(res){
				console.log(res);
			},
			error:function(xhr){
				console.log(xhr);
			}
		});
}

//프로젝트 경험 수정!!!!!!!!!!!!
$(document).on("click",".edit_exbox",function(){

    let exbox = $(this).parent().parent().parent().children();

	//클릭한 버튼이 속한 박스의 인풋태그들을 활성화시킨다
    $(this).parent().parent().parent().children().children("input").prop("readonly",false);
    $(this).removeClass("edit_exbox");
    $(this).addClass("confirm_edit");
    $(this).css("color","#94A7AE");
    $(this).parent().parent().parent().children().children("input").addClass("ex_mdf");
})

//수정한 거 디비에 반영하기
$(document).on("click",".confirm_edit",function(){
	
    let id = $(this).parent().parent().parent().attr("id");
    let m_id = $(".member_id_input").val();
    let exbox = $(this).parent().parent().parent().children();
	console.log(m_id);
	
	var newEx = {
		member_id_input:m_id,
		ex_count_input:id,
		exp_title_input: exbox.children(".exp_title_input").val(),
		ex_position_input: exbox.children(".ex_position_input").val(),
		ex_skill_input: exbox.children(".ex_skill_input").val(),
		ex_duration_input: exbox.children(".ex_duration_input").val(),
		ex_content_input: exbox.children(".ex_content_input").val()
	}
	
	console.log(newEx);
	console.log(exbox.parent().parent().attr("action"));
	
	$.ajax({
		
		//url:"ajax/updateexperiences",
        url:exbox.parent().parent().attr("action"),
		//data:JSON.stringify(newEx),
		data:newEx,
		type:"post",
		//contentType: "application/json",
		//contentType:'application/json; charset=utf-8',
		success:function(res){
			console.log(res);
			if(res == "success"){
				swal("프로젝트 경험 내용이 수정되었습니다","","success");
			} else{
				swal("프로젝트 경험을 수정하지 못했습니다","","error");
			}
		},
		error:function(xhr){
			console.log(xhr);
			console.log("newEx : ", newEx);
		}
		
	});
	
	
    $(this).removeClass("confirm_edit");
    $(this).addClass("edit_exbox");
    $(this).css("color","#CA8FAB");
    $(this).parent().parent().parent().children().children("input").removeClass("ex_mdf");
    

})

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

//추가 정보 모두 기입시 포인트 지급
function givePoint(){
	
	//디비에서 이중 체크를 해야 하나?
	//회원상세(포지션, 경험), 회원기간, 회원기술 테이블을 조회해서 값이 있는지 중복체크를 해야 할까ㅓ??
	//최초 1회 지급이므로 사용 포인트, 보유 포인트가 있는지 확인
	$.ajax({
		
		url:"ajax/givepoint",
		type:"post",
		data:{
			member_id:$("#m_id").val()
		},
		success:function(res){
			console.log(res);
			
			if(res == "success"){
				swal("🎉🎉모든 정보를 입력한 기념으로\n보너스 포인트가 지급되었습니다🎉🎉","","success");	
				$("#point").val("50점");		
			}
			
		},
		error:function(xhr){
			console.log(xhr);
		}
		
	});
	
}

$("#charge-btn").on("click",function(){
	console.log("클릭");
	payment();
});
//포인트 충전	
function payment() {
   var IMP = window.IMP; // 생략가능
   IMP.init('imp80764682');
   
   var money = $('input[name="cp_item"]:checked').val();
   var email = $('input[id="m_email"]').val();
   var name = $('input[id="m_name"]').val();
   var phone = $('input[id="m_phone"]').val();
   
  if(money == 100){
  	money = '5000';
  } 
  if(money == 300){
  	money = '10000';
  }
  if(money == 450){
  	money = '15000';
  }
   
   
   console.log('value값 : ' + money);
   console.log('회원메일 : ' + email);
   console.log('회원이름 : ' + name);
   console.log('회원폰 : ' + phone); 
   
   let originalpoint = $("#point").val().replace("점","");
   let plus = $("input[name=cp_item]:checked").val();
   IMP.request_pay({
   pg: 'kakao', 
//    pay_method: 'card',
   merchant_uid: 'merchant_' + new Date().getTime(),
   name: 'CYCO Point 결제',
   //결제창에서 보여질 이름
   amount: money,
   //가격
   buyer_email: email,
   buyer_name: name,
   buyer_tel: phone,
}, function (response) {
   console.log(response);
   if (response.success) {
      var msg = '결제가 완료되었습니다.';
      msg += ' 고유ID : ' + response.imp_uid;
      msg += ' 상점 거래ID : ' + response.merchant_uid;
      msg += ' 결제 금액 : ' + response.paid_amount;
      msg += ' 카드 승인번호 : ' + response.apply_num;

      $.ajax({
         type: "POST",
         url: "ajax/chargePoint",
//          받는거
         dataType : 'text',
//          보내는거
         data: {
            "memberid" :  $("#m_id").val(),
            "point" : $("input[name=cp_item]:checked").val(),
            "money" : money
         },
         success : function(data){
             console.log(data);
              if(data == "success"){
                 swal("성공", "결제에 성공하였습니다.", "success")
                  console.log(msg);
                  let newpoint = Number(originalpoint) + Number(plus);
                  $("#point").val("");
                  $("#point").val( newpoint + "점");
              } else{
                 var msg = '결제에 실패하였습니다.';
                 alert("실패")
                  console.log(msg);
              }
               
         },
         error : function(param){
               alert("에러");
               console.log(param);
         }
      })
   } else {
      var msg = '결제에 실패하였습니다.';
      msg += '에러내용 : ' + response.error_msg;
      console.log(msg);
      swal("실패", "결제에 실패하였습니다.", "error")
   }
//    console.log("실행완료");
});
}




