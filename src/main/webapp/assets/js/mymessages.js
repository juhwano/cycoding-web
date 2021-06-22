$(document).ready(function(){
	
	//메시지 제목 잘라서 보여주기
	$.each($(".content"),function(index, item){
		
		if($(this).children().text().trim().length > 10){
		
			console.log("들어옴?");
			console.log($(this).text().trim());
			let msg_content = $(this).children().text().trim().substring(0,10);
			$(this).children().text(msg_content);
			
		}		
	});

	
});


//메시지 모달창 띄우면서 쪽지 내용 붙여주기
$(".msg-trigger").on("click",function(){
	
	$(".msg_content").empty();
	
	let msg = $(this).next().val();
	console.log(msg);
	
	$(".msg_content").append("<p>"+msg+"</p>");
	$(this).toggleClass("clickedarea");
	
	
	
})

//메시지 모달창 그림 바꾸기
$('.messagearea').on("click", function() {
	
	$(this).toggleClass("clickedarea");
	
});

	
	//쪽지 수신시 알림
	function addNewMessage(data){
		console.log("메시지 실행");
		$("#new_note_modal").show();
		
	}
