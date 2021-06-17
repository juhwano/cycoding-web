/* 북마크 */
function BookMarking(projectid) {
		$.ajax({
            url:'/ajaxproject/bookmark?project_id='+projectid,
            type: 'get',
            dataType:"text",
            success:function(result){
                console.log("result: "+ result);
                
                if(result == "insert") {
					swal("" , "북마크 내역은 마이페이지에서도 확인하실 수 있습니다." ,"success");
					$("#projectid").removeClass("no_marking");
					$("#projectid").addClass("marking");
                } else {
               	 	swal("" , "북마크를 해제하셨습니다." ,"success");
               	 	
               	 	$("#projectid").attr('class','no_marking');
                }
            }
		})
	}
	
$(document).on("click",".clicked",function(){
                    
	              var addSkill = $(this).addClass("clicked")[0].children[1];
	              $(addSkill).attr("name","");
		            
                  $(this).removeClass();
                  $(this).addClass("tags");
                  
                  $("#tagarea").append($(this));
              });