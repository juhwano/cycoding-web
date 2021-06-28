$(document).ready(function() {

	//메시지 제목 잘라서 보여주기
	$.each($(".content"), function(index, item) {

		if ($(this).children().text().trim().length > 10) {

			//console.log($(this).text().trim());
			let msg_content = $(this).children().text().trim().substring(0, 10);
			$(this).children().text(msg_content + "...");

		}
	});

	//쪽지 날짜 잘라주기
	$.each($(".date"), function(index, item) {

		var datetext = $(this).text().substring(0, 10);
		$(this).text(datetext);

	});

	//메세지 발신창
	//div를 textarea처럼 사용
	$('#messagearea').attr('contentEditable', 'true');
	$('#messagearea').on("click", function() {
		$(this).find("span").remove();
	})
	//글자수 제한
	$('#messagearea').on('input', function() {
		$('#textcount').html($(this).text().length + " / 100");

		if ($(this).text().length > 100) {
			$(this).text($(this).val().substring(0, 100));
			$('#textcount').html("100 / 100");
			swal("쪽지는 100자 이상 쓸 수 없습니다", "", "warning");
		}
	});


}); //document.ready 끝

//읽은 쪽지, 안 읽은 쪽지, 전체 쪽지 보여주기
$("#all_note").on("click", function() {

	//테이블에 display:block을 썼다간 다 깨진다
	$(".new").css("display", "");
	$(".read").css("display", "");
	$("#all_note").addClass("checked_title");
	$("#read_note").removeClass("checked_title");
	$("#never_read_note").removeClass("checked_title");

	//체크박스 해제
	$("input").prop("checked", false);

});

$("#never_read_note").on("click", function() {

	$(".new").css("display", "");
	$(".read").css("display", "none");
	$("#all_note").removeClass("checked_title");
	$("#read_note").removeClass("checked_title");
	$("#never_read_note").addClass("checked_title");

	//체크박스 해제
	$("input").prop("checked", false);
});

$("#read_note").on("click", function() {

	$(".new").css("display", "none");
	$(".read").css("display", "");
	$("#all_note").removeClass("checked_title");
	$("#read_note").addClass("checked_title");
	$("#never_read_note").removeClass("checked_title");

	//체크박스 해제
	$("input").prop("checked", false);

});


//수신 쪽지 읽음
$(".msg-trigger").on("click", function() {

	//메시지 모달창 띄우면서 쪽지 내용 붙여주기
	$("#message_content").css("display", "block");
	$("#reply_content").css("display", "none");

	$(".msg_content").empty();
	let msg = $(this).next().val();
	$(".msg_content").append("<p>" + msg + "</p>");

	let tr = $(this).parent().parent();
	$("#reply_to").val(tr.find(".sender").attr("id").replace("from", ""));
	//안 읽은 쪽지였으면 쪽지 확인 상태 업데이트 DB
	if (tr.parent().hasClass("new")) {

		let note_id = tr.attr("id").replace("to", "");
		$.ajax({

			url: "/alarm/updatenoteok",
			data: { noteid: note_id },
			type: "post",
			dataType: "text",
			success: function(res) {
				if (res) {

					//쪽지 확인 상태 뷰단 반영
					tr.removeClass("new");
					tr.addClass("read");
					tr.find(".isread").html('<i class="fas fa-envelope-open-text"></i>');

				} else {
					console.log("쪽지 읽음 업데이트 실패")
				}
			},
			error: function(xhr) {
				console.log(xhr)
			}
		})
	}
})

//메시지 모달창 그림 바꾸기
$('.messagearea').on("click", function() {

	$(this).toggleClass("clickedarea");

});

//답장하기
$("#reply_btn").on("click", function() {

	$("#message_content").css("display", "none");
	$("#reply_content").css("display", "block");

});

//메시지 전송함수(답장)
//DB 알람 테이블, 수신, 발신 테이블에 각각 insert 되어야 한다
$(document).on("click", "#msg_btn", function() {

	console.log("받는 사람 : ", $("#reply_to").val())
	//우선 div의 텍스트를 다루기 용이하도록 input태그의 값으로 만든다
	$("#text").val($("#messagearea").text());
	
	if($("#text").val() == ""){
		swal("보낼 내용을 입력해주세요","","warning");
		
	}else{
		
		
	console.log("쪽지 보내기")
	console.log($("#text").val());
	var data = {
		code: "CHAT_O",
		url: logineduser,
		message: $("#text").val(),
		member_id: $("#reply_to").val(),
		sender: logineduser,
		content: loginednickname + "님이 회원님에게 쪽지를 보냈습니다"
	};

	console.log(data);
	// 알림 테이블에 반영, 알림 보내기
	insertAlarm(JSON.stringify(data));
	swal("쪽지가 발송되었습니다", "", "success");
	$("#messagearea").empty();
		
	}


});

//메시지 전체 선택
$(".all").on("click", function() {

	var checkedbox;
	var _this = $(this);

	if ($(this).attr("id") == "all_to") {
		//checkedbox = document.getElementsByClassName('del_received')
		checkedbox = $('.del_received:visible')

	} else if ($(this).attr("id") == "all_from") {
		//checkedbox = document.getElementsByClassName('del_send')
		checkedbox = $('.del_send:visible')
	}

	//체크박스 전체 선택
	$.each(checkedbox, function(index, checkedbox) {
		$(this).prop("checked", _this.prop("checked"));
	});
});


//모두 체크하면 전체선택 박스도 체크/하나라도 체크 해제되면 전체선택 박스도 체크 해제
$(".del_received").on("click", function() {
	
	let check = true;
	let _this = $(this);

	if (_this.prop("checked")) {

		$.each($(".del_received:visible"), function(index, item) {

			if(!$(this).prop("checked")){
				check = false;
			}
		});

	} else{
		check = false;
	}

	if (check) {
		$("#all_to").prop("checked", true)
	} else {
		$("#all_to").prop("checked", false)
	}
});

//모두 체크하면 전체선택 박스도 체크/하나라도 체크 해제되면 전체선택 박스도 체크 해제
$(".del_send").on("click", function() {
	
	let check = true;
	let _this = $(this);

	if (_this.prop("checked")) {

		$.each($(".del_send:visible"), function(index, item) {

			if(!$(this).prop("checked")){
				check = false;
			}
		});

	} else{
		check = false;
	}

	if (check) {
		$("#all_from").prop("checked", true)
	} else {
		$("#all_from").prop("checked", false)
	}
});


//선택하면 색깔 바꾸기~
$("input[name=NOTE_ID]").on("click",function(){
	console.log("야호")
	var tablebody = $(this).parent().parent().parent();
	tablebody.toggleClass("selected_note");
	
});

//쪽지 삭제
$(".trash").on("click",function(){
	
	var checked_note = $("input[name=NOTE_ID]:checked");
	var notelist =[];
	var table;
	var msg;
	
	if($(this).attr("id") == "to_trash"){
		table = "TO_NOTE";
	}else{
		table = "FROM_NOTE";
	}
	
	$.each(checked_note,function(index,item){
		
		notelist.push($(this).val());
		
	});
	
	if(notelist.length==1){
		msg = "쪽지를 삭제하시겠습니까?"
	} else{
		msg = "쪽지 " + notelist.length+"건을 모두 삭제하시겠습니까?"
	}
	console.log(notelist);
		
	var data = {
		table : table,
		note_id : notelist	
	}
	
	swal({
				title: msg,
				text: "",
				icon: "warning",
				buttons: true,
				dangerMode: true,
				
		}).then((willDelete) =>{
			
			if(willDelete){
				
				$.ajax({
				url:"/alarm/deletenotes",
				data:JSON.stringify(data),
				dataType:"json",
				contentType: "application/json",
				type:"post",
				success:function(res){
					console.log(res)
					
					if(res){
						swal("쪽지가 삭제되었습니다","","success")
						getnotelist(table);
					}
				},
				error:function(xhr){
					console.log(xhr)
				}
				
				});
				
			} else{
				return false;
			}		
		});		
})


