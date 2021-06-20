
// 비동기로 종모양 바꾸기
function changeBell_New(){
	
	$(".alarmbell").attr("src","/assets/img/brand/NEWALARM.svg")
	
}

function changeBell_Old(){
	
	$(".alarmbell").attr("src","/assets/img/brand/ALARM.svg")
	
}

//페이지 이동할 때마다 알림 종모양 유지하기
function chekcBell(id){
	console.log(id)
	
	$.ajax({
		
		url:"/alarm/checkbell",
		type:"post",
		data:{id:id},
		dataType:"text",
		success:function(res){
			console.log(res)
			
			if(res == "true"){

				changeBell_New()
				//updatealarmlist(id)
				
			} else{

				changeBell_Old()
				
			}
			
		},
		error:function(xhr){
			console.log(xhr)
		}
		
	});
	
}

//알림 리스트 비동기로 바꿔주기
function updatealarmlist(id){
	
	$.ajax({
		url:"/alarm/updatealarmlist",
		type:"post",
		data:{id:id},
		dataType:"json",
		success:function(res){
			console.log(res)
			
			if(res.length != 0){
				console.log("여기 타나");
				$(".susub").empty();
	
				categorizeMessage(res)			
		
			} else{
				
				$(".susub").append(					
					"<li><p class='alarm_content'>새 알림이 없습니다</p></li>"					
				);				
			}
			
			$(".susub").append(
        	
        	 	"<li class='last'><a href='/mypage/myalarm'><button id='more'>더보기</button></a></li>"

        		);
		},
		error:function(xhr){
			console.log(xhr)
		}		
	});	
}
	//알림 종류에 따라 구분하는 함수
	function categorizeMessage(data){
		
		$.each(data, function(index,data){
			
			console.log(data.alarm_CODE);
			console.log(data.url);
        // 프로젝트에 초대됨
        if(data.alarm_CODE == "PR_IN"){
			$(".susub").append(
        	
        	 "<li><a href='/project/detail?project_id="+data.url+"'><p id='"+data.alarm_ID+"' class='alarm_content'>프로젝트에 초대되었습니다</p></a></li>"

        	);
        		
        	// 내 프로젝트에 누가 지원함
        } else if(data.alarm_CODE == "PR_A") {
        	
        	$(".susub").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>내 프로젝트에 지원자가 있습니다</p></a></li>"

        	);
        	
        	// 내가 지원 내역이 승인됨
        } else if(data.alarm_CODE == "PR_S") {
        	
        	$(".susub").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>내 지원내역이 승인되었습니다</p></a></li>"

        	);
        	
        	// 내 지원 내역이 거절됨
        } else if(data.alarm_CODE == "PR_F") {
        	
        	$(".susub").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>내 지원내역이 거절되었습니다</p></a></li>"

        	);
        	
        	// 내가 지원/참여한 프로젝트의 상태가 변경됨(모집/진행/종료)
        } else if(data.alarm_CODE == "PR_UP") {
        	
        	$(".susub").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>내 프로젝트의 상태가 바뀌었습니다</p></a></li>"

        	);
        	
        	// 누군가 나에게 후기를남김
        } else if(data.alarm_CODE == "MY_RV") {
        	
        	$(".susub").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>다른 회원이 내게 후기를 남겼습니다</p></a></li>"

        	);
        	
        	
        } else if(data.alarm_CODE == "QNAR") {
        	
        	$(".susub").append(
        	
        	 "<li><a href=''"+data.url+"><p class='alarm_content'>내 질문에 답변이 달렸습니다</p></a></li>"

        	);
        	
        }
	});
	
	/*function categorizeMessage(data){
		
		
		
		$.each(data, function(index,data){
			
			console.log(data.alarm_CODE);
			console.log(data.url);
        // 프로젝트에 초대됨
        if(data.alarm_CODE == "PR_IN"){
			$("#alarmlist").append(
        	
        	 "<li><a href='/project/detail?project_id="+data.url+"'><p class='alarm_content'>"+data.alarm_CONTENT+"</p></a></li>"

        	);
        		
        	// 내 프로젝트에 누가 지원함
        } else if(data.alarm_CODE == "PR_A") {
        	
        	$("#alarmlist").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>"+data.alarm_CONTENT+"</p></a></li>"

        	);
        	
        	// 내가 지원 내역이 승인됨
        } else if(data.alarm_CODE == "PR_S") {
        	
        	$("#alarmlist").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>"+data.alarm_CONTENT+"</p></a></li>"

        	);
        	
        	// 내 지원 내역이 거절됨
        } else if(data.alarm_CODE == "PR_F") {
        	
        	$("#alarmlist").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>"+data.alarm_CONTENT+"</p></a></li>"

        	);
        	
        	// 내가 지원/참여한 프로젝트의 상태가 변경됨(모집/진행/종료)
        } else if(data.alarm_CODE == "PR_UP") {
        	
        	$("#alarmlist").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>"+data.alarm_CONTENT+"</p></a></li>"

        	);
        	
        	// 누군가 나에게 후기를남김
        } else if(data.alarm_CODE == "MY_RV") {
        	
        	$("#alarmlist").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>"+data.alarm_CONTENT+"</p></a></li>"

        	);
        	
        	
        } else if(data.alarm_CODE == "QNAR") {
        	
        	$("#alarmlist").append(
        	
        	 "<li><a href='/project/detail?project_id='"+data.url+"><p class='alarm_content'>"+data.alarm_CONTENT+"</p></a></li>"

        	);
        	
        }
	});*/
	
}
	