
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
	
})
/*$(document).on("click",".clickedarea",function(){
	
	$(".msg_content").css("display","none");
	
})*/