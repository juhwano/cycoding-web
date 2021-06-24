	
	if(login_memberid == ""){
		swal("로그인을 하여야 확인 가능합니다.","", "error").then((willDelete) => {
		location.href = "../login";
		})
	}
	
$(document).ready(function(){
	
	
	// 모달 숨기기
	$('.Project_Apply_modal').hide();
	$('.Project_Detail_modal').hide();
	
	if($('.member_list').children().length < 1){
		$('.member_list').append("<tr><td class='ProjectDetail_p'>아직 프로젝트 멤버가 없습니다.</td></tr>");
	}
		
	
	$('.Project_menuBar > li ').unbind("click").bind("click", function(){
		
		$('.Project_menuBar > li ').attr('class','menuli');
		
		// 프로젝트 info
		if($(this).attr('id') == "project_info"){
			$('html').scrollTop(0);
			$('.ChangeContentBox').empty();
			
			$.ajax({
	     		url:"/ajaxproject/projectinfo",
	     		dataType:"html",
	     		data: {project_id:project_id},
	     		success: function(responsedata){   
	     			
	     			responsedata = JSON.parse(responsedata);
	     			
	     			var pmcountlist = responsedata.pmcountlist;
	     			var project = responsedata.project;
	     			
	     			
	     			var project_info = "<div class='Project_info'>"
	     			    project_info +=	"<div class='ProjectMember'>"
	     			    project_info += "<p>모집현황</p>"
	     			    project_info += "<p class='Project_p'><b style='color: red;'>*</b> 원하는 분야에 지원해보세요!</p>"
	     			    project_info += "<hr>"
	     			project_info +=  "<div id='PositionBox'>"
	     			project_info +=  "<table class='project_boxdiv'>"
	     			for(var i = 0; i < pmcountlist.length; i ++){
	     				project_info +=	 "<tr class='Project_memberList'>"
		     			project_info +=	 "<td width='50%'>" + pmcountlist[i].position_name + "</td>"
		     			if(pmcountlist[i].curr == pmcountlist[i].max){
		     				project_info +=	"<td class='memberListcurrFull' width='15%'>" +pmcountlist[i].curr +" / " + pmcountlist[i].max + "</td>"
			     			project_info +=	"<td width='30%' class='FullBtnWarp'>"
			     			project_info +=	"<input type='button' value='마감'>"
			     			project_info +=	"</td>"
		     			}else{
			     			project_info +=	"<td class='memberListcurr' width='15%'>" +pmcountlist[i].curr +" / " + pmcountlist[i].max + "</td>"
			     			project_info +=	"<td width='30%' class='BtnWarp'>"
			     			if( login_memberid != project.member_id){
				     			project_info +=	"<input class='ProjectApplyBtn' type='button' value='지원'>"
				     			project_info +=	"<label for='ProjectApplyBtn' hidden>" + pmcountlist[i].position_id + "</label>"
				     			project_info +=	"<label for='ProjectApplyBtn' hidden>" + pmcountlist[i].position_name + "</label>"
			     			}
			     			project_info +=	"</td>"
		     			}
		     		
		     			project_info +=	"</tr>"
	     			}
	     			
	     			project_info +=	"</table>"
	     			project_info +=	"</div>"
	     			project_info += "</div>"
					
	     			project_info += "<div class='ProjectContent'>"
	     			project_info +=	"<p>- 프로젝트 소개</p>"
	     			project_info +=	"<p class='Project_content'>" + project.p_content + "</p>"
	     			project_info += "</div>"
	     			project_info += "</div>"	
	     			
     				$('.ChangeContentBox').append(project_info);
	     			
	   		  		// 모달 
	     			$('.ProjectApplyBtn').unbind("click").bind("click", function(){
	     				var Applycode = this.nextElementSibling.textContent;
	     				var Applyname = this.nextElementSibling.nextElementSibling.textContent;
	     				var checkdata = {"member_id":login_memberid,
	     								"project_id":project_id};
	     				
	     				if('${project.p_state}' != '모집중'){
	     					swal("지원이 마감되었습니다.","","error");
	     					return false;
	     				}
	     				
	     				
	     				$.ajax({
	     		     		url:"/ajaxproject/projectCheckApply",
	     		     		dataType:"html",
	     		     		data: checkdata,
	     		     		success: function(responsedata){    		
	     		     			if(responsedata == "is_project"){
	     		     				swal("현재 진행 중인 프로젝트가 존재합니다.","","warning");
	     		     				return false;
	     		     			}else if(responsedata == "ProjectApply"){
	     		     				swal("현재 프로젝트에 이미 지원 하였습니다.","","warning");
	     		     				return false;
	     		     				
	     		     			}else{
	     		     				
	     		     				var Applydata = {"project_id":project_id,
	     		     								"position_id":Applycode,
	     		     								"member_id":login_memberid};
	     		     				
	     		     				
	     		     				 $('.ApplyName').empty();
	     		     			     $('.ApplyName').append(Applyname);
	     		     			     $('.Project_Detail_modal').show();
	     		     				
	     		     			     $('.ApplyBtn_No').unbind('click').bind('click',function(){
	     		     			    	 $('.Project_Detail_modal').hide();
	     		     			     });
	     		     			     
	     		     			     $('.ApplyBtn_Ok').unbind('click').bind('click',function(){
	     		     			    	 
	     		     			    	 $.ajax({
	     		     			     		url:"/ajaxproject/projectapply",
	     		     			     		dataType:"html",
	     		     			     		data: Applydata,
	     		     			     		success: function(responsedata){    		
	     		     			     			if(responsedata == "true"){
	     		     			     				swal("지원 되었습니다.","","success");

	     		     			     				setTimeout(function() {
	     		     			     						document.location.reload(true);
	     		     			     					}, 1000);
	     		     			     				
	     		     			     			}else{
	     		     			     				swal("오류가 발생하였습니다.","잠시후 다시 시도해주세요.","error");
	     		     			     				setTimeout(function() {
	     		     		     						document.location.reload(true);
	     		     		     					}, 1000);
	     		     			     			}
	     		     			     			
	     		     			     		}
	     		     			     	});
	     		     			     });
	     		     			}
	     		     		}
	     		     	});
	     			});
	     		}
	     		
	     		
		    })	
		// --------------------------------------------------------------------------------------------	
		// Qna 게시판    
		}else if($(this).attr('id') == "Qna"){
			$('html').scrollTop(0);
			$('.ChangeContentBox').empty();		
		
			var QnaBox = "<div class='QnABox'>"
				QnaBox += "qnabox"
				QnaBox += "</div>"
				
				$('.ChangeContentBox').append(QnaBox);
				
		// --------------------------------------------------------------------------------------------
		// 멤버관리 클릭	
		}else if($(this).attr('id') == "memberEdit"){
			
			$('html').scrollTop(0);
			$('.ChangeContentBox').empty();
			
			// 멤버관리 리스트 뿌려주는 ajax
			 $.ajax({
		     		url:"/ajaxproject/getMemberEditBox",
		     		dataType:"html",
		     		data: {project_id:project_id},
		     		success: function(responsedata){    		
		     			
		     			responsedata = JSON.parse(responsedata);
		     			
		     			var pmcountlist = responsedata.pmcountlist;
		     			var pmlist = responsedata.pmlist;
		     			var memberCount = 0;
		     						
		     		var Div  =  "<div class='MemberEditBox'>"
		     			Div +=	"<div class='ProjectMember'>"
		     			Div +=	"<p>지원내역</p>"
		     			Div +=	"<p class='Project_p'><b style='color: red;'>*</b> 나의 프로젝트에 지원한 멤버 목록입니다.</p>"
		     			Div +=	"<hr>"
		     			Div +=	"<div id='PositionBox'>"
		     			Div +=	"<table class='project_boxdiv'>"
		     				for(var i = 0; i < pmcountlist.length; i++){
		     					// 고용 멤버 확인
		     					memberCount += Number(pmcountlist[i].max);
		     					
				     			Div +=	"<tr class='Project_memberList'>"
				     			Div +=	"<td width='50%'>" + pmcountlist[i].position_name +"</td>"
				     			Div +=	"<td class='memberListcurr' width='15%'>" + pmcountlist[i].curr + " / " + pmcountlist[i].max + "</td>"
				     			Div +=	"<td width='30%' class='BtnWarp'>"
				     			Div +=	"<input class='ProjectApplyMember_List' type='button' value='상세보기'>"
				     			Div +=	"<label for='ProjectApplyBtn' hidden>" + pmcountlist[i].position_id +"</label>"
				    			Div +=	"<label for='ProjectApplyBtn' hidden>" + pmcountlist[i].position_name + "</label>"
				    			Div +=	"</td>"
				    			Div +=	"</tr>"
		     				}
		     			Div +=	"</table>"
		     			Div +=  "<div class='memberPlus'>"
		     			Div +=  "<input type='button' value='+' class='MemberPlusBtn'>"
		     			Div +=  "</div>"
		     			Div +=	"</div>"
		     			Div +=	"</div>"
		     			Div +=  "</div>"
		     			
			     				Div += "<div class='MemberSuperintend'>"
			     				Div += "<p>멤버목록</p>"
			     				Div += "<p class='Project_p'><b style='color: red;'>*</b> 멤버들을 관리해보세요. </p>"
			     				Div += "<hr>"
			     				Div += "<div class='MemberSuperintend_list'>"
			     				
		     				for(var i = 0; i < pmlist.length; i ++){
		     					if(pmlist[i].member_id != null){
		     						Div +=		"<div class='memberListBox'>"
				     				Div +=		"<div class='memberListInfo_data04042'>"
				     				Div +=		"<div class='memberListImgBox'>"
				     				Div +=		"<img src='/resources/upload/" + pmlist[i].member_image + "'>"
				     				Div +=		"</div>"
				     				Div +=		"<div class='memberinfoBox'>"
				     				Div +=		"<div class='memberList_nickname'>" + pmlist[i].member_nickname + "</div> <br>"
				     				Div +=		"<div class='memberList_skills'>_" + pmlist[i].position_name +" | 멤버</div>"
				     				Div +=		"</div>"
				     				Div +=	    "</div>"
				     				Div +=		"<div class='MemberSuperintend_list_Btn'>"
				     				Div +=		"<div class='handoverAuthority_Btn'>"
				     				Div +=		"<img src='/assets/img/project/handoverAuthority.png'>"
				     				
				     				Div +=		"<input type='text' value=" + pmlist[i].member_id + " hidden=''>"
				     				Div +=		"<input type='text' value=" + pmlist[i].position_id + " hidden=''>"
				     				Div +=		"</div>"
				     											
				     				Div +=		"<div class='Member_Expulsion_Btn'>"
				     				Div +=		"<img src='/assets/img/project/ExpulsionBtn.png'>"
				     				Div +=		"<input type='text' value=" + pmlist[i].member_id + " hidden=''>"
				     				Div +=		"<input type='text' value=" + pmlist[i].position_id + " hidden=''>"
				     				Div +=		"</div>"
				     				Div +=		"</div>"
				     				Div +=		"</div>"
				     				Div +=		"<hr>"
		     						}
		     					}
		     				
		     			
		     					Div +=		"</div>"
		     					Div +=  	"</div>"
		     					
	     						$('.ChangeContentBox').append(Div);
		     					if($('.MemberSuperintend_list').children().length < 1){
				     					$('.MemberSuperintend_list').append("<div class='ProjectDetail_p'>아직 프로젝트 멤버가 없습니다.</div>");
			     				}
		     					
		     					// -------------------------------------------------------
		     					// 멤버 추가
		     					var NoDump = 0;
		     					$('.MemberPlusBtn').unbind("click").bind("click", function(){
		     						
		     						NoDump ++;
		     						if(NoDump > 1){
		     							swal("현재 지정한 값을 반영 후 시도하시기 바랍니다.", "", "error");
		     						}else{
		     							
	     							memberCount ++;	
		     						$.ajax({
     						     		url:"/ajaxproject/PositionList",
     						     		dataType:"html",
     						     		success: function(responsedata){    
     						     			
   						     			responsedata = JSON.parse(responsedata);
     						     			
   						     			var memberPlusBox = "<tr class='Project_memberList'>"
   						     			memberPlusBox += "<td width='50%'>";
   						     			memberPlusBox += "<select class='MemberPlus_SelectBox' name='position_code'>"
     						     			for(var i = 0; i < responsedata.length; i++) {
     					    	    			if(responsedata[i].position_enabled == 1 ){
	     					    	    				memberPlusBox += "<option value='"+ responsedata[i].position_id +"'>"+ responsedata[i].position_name +"</option>";
	     					    	    			}
	     					    	    		}
     					    	    	memberPlusBox += "</select>"
     					    	    	memberPlusBox += "</td>"
   					    	    		memberPlusBox += "<td class='MemberPlusBtnWarp' width='15%'>";
   					    	    		memberPlusBox += "<input type='button' class='Up_num' value='+' >"
   					    	    		memberPlusBox += "<input type='text' class='number' name='field_selectCount' value='1' readonly='readonly'>"
   					    	    		memberPlusBox += "<input type='button' class='Down_num' value='-'>"
										memberPlusBox += "</td>"
										memberPlusBox += "<td width='30%'>"			
										memberPlusBox += "<input class='PlusMember_ListBtn' type='button' value='반영'>"
										memberPlusBox += "</td>"
     					    	    	memberPlusBox += "</tr>"	
     						     		
   					    	    		$('.project_boxdiv').append(memberPlusBox);
   					    	    		
   					    	    		$('.MemberPlusBtnWarp').unbind("click").bind("click", function(){
   					    	    			var UpBtn = $(this)[0].children[0];
   					    					var DownBtn = $(this)[0].children[2];
   					    					var Count = $(this)[0].children[1];
   					    					
   					    					console.log(memberCount);
   					    					// + 이벤트
   					    					$(UpBtn).unbind("click").bind("click", function(){
		
   					    						if (memberCount < 10) {
   					    							var Count_ = parseInt($(Count).val());
   					    							$(Count).val(Count_ + 1);
   					    							memberCount++;
   					    						} else {
   					    							swal("맴버는 10명이상의 구인이 불가능합니다.", "", "error");
   					    						}
   					    						console.log(memberCount);

   					    					})

   					    					// - 이벤트
   					    					$(DownBtn).unbind("click").bind("click", function(){
					    							if(parseInt($(Count).val()) <= -9){
					    								swal("더 이상 값을 반영 할 수 없습니다.", "", "error");
					    								$(Count).val(-9);
					    								return false;
					    							}
					    							var Count_ = parseInt($(Count).val());
					    							$(Count).val(Count_ - 1);
					    							memberCount--;
					    							console.log(memberCount);
   					    					})
   					    					
   					    	    		})
   					    	    		
   					    	    		// 반영 버튼
   					    	    		$('.PlusMember_ListBtn').unbind("click").bind("click", function(){
   					    	    			var num = $('.MemberPlusBtnWarp > input')[1];	
   					    	    			var selectPosition = $('.MemberPlus_SelectBox').val();
   					    	    			
   					    	    			if(memberCount > 10){
   					    	    				swal("멤버는 10명 이상 모집이 불가능합니다.","","error");
   					    	    				return null;
   					    	    			}
   					    	    				
   					    	    			data = {"project_id":project_id,
   					    	    					"select_num":$(num).val(),
   					    	    					"position_id":selectPosition}
   					    	    			
   					    	    			
   					    	    			$.ajax({
   		     						     		url:"/ajaxproject/memberplus",
   		     						     		dataType:"html",
   		     						     		data:data,
   		     						     		success: function(responsedata){    
   		     						     	
   		   						     				if(responsedata == "NumZero"){
   		   						     					swal("0이 아닌 값을 입력 후 반영해주세요.", "", "error");
   		   						     				}else if(responsedata == "Update"){
   		   						     					swal("멤버가 추가 입력 되었습니다.", "", "success");
   		   						     					$('#memberEdit').trigger('click');
   		   						     				}else if(responsedata == "Delete"){
   		   						     					swal("모집 멤버를 삭제 하였습니다.", "* 이미 모집된 멤버가 있을 경우 반영되지않습니다.", "warning");
   		   						     					$('#memberEdit').trigger('click');
   		   						     				}
   		   						     					
   		     						     		}
   					    	    			
   					    	    			})
   					    	    		})
   					    	    		
   					    	    		
   					    	    		
     						     		}
		     						});
	     						}
	     							
	     					})
		     					
		     					// 프로젝트 멤버 상세보기
		     					$('.ProjectApplyMember_List').unbind("click").bind("click", function(){
		     						var Applycode = this.nextElementSibling.textContent;
		     						
		     						$.ajax({
		     					     		url:"/ajaxproject/applyList",
		     					     		dataType:"html",
		     					     		data: {"project_id":project_id,
		     					     			   "Applycode":Applycode},
		     					     		success: function(responsedata){    
		     					     			
		     					     			responsedata = JSON.parse(responsedata);
		     					     			
		     					     			$('.Project_Apply_modal').empty();
		     					     			
		     					     				var table = "<form class='ProjectApply'><div class='ProjectApplyMemberListDiv'>";
		     					     				table += "<div>";
		     					     				table += "<input type='button' class='ApplyMemberListCancleBtn' value='✕'>"
		     				     					table += "</div>";
		     				     					
		     					     					if(responsedata.length < 1){
		     					     						table += "<p class='ApplyMemberListTitle'>지원목록</p>"
		     					     						table += "<div class='NomemberBox'>";
		     					     						table += "<p>아직 지원한 회원이 없습니다.</p>"
		     					     						table += "</div>";
		     					     					}else{
		     					     						table += "<p class='ApplyMemberListTitle'>["+ responsedata[0].applypositionname + "] 지원목록</p>"
		     					    	     				table += "<table class='ProjectApplyMemberListBox'>"
		     					    	    					
		     				    	     					table += "<tr class='ApplyMemberTr''><th colspan='2'>회원정보</th><th>상태</th><th>관리</th></tr>";
		     					     						
		     						     					$.each(responsedata, function(i, elt) {
		     						     						
		     						     					table += "<tr>";
		     						     					table += "<td class='td_rigth'><div class='LeaderImg_Box'>"
		     					     						table += "<img src='/resources/upload/" + elt.member_image + "'>"
		     					     						table += "</div></td>";
		     					     						table += "</td>";
		     						     					table += "<td>";
		     						     					table += "<a href='../member/memberdetailpage?memberid=" + elt.member_id +"' target='_blank' >" + elt.member_nickname + "</a>";		     					
		     						     					table += "</td>";
		     						     					table += "<td>";
		     							     					if(elt.apply_ok == "0"){
		     							     						table += "<p class='applystate_0'>멤버 수락 대기중</p>"
		     							     					}else if(elt.apply_ok == "1"){
		     						  	     						table += "<p class='applystate_1'>승인</p>"
		     							     					}else if(elt.apply_ok == "2"){
		     							     						table += "<p class='applystate_2'>거절</p>"
		     							     					}else if(elt.apply_ok == "3"){
		     							     						table += "<p class='applystate_2'>추방</p>"
		     							     					}
		     						     					table += "</td>";
		     						     					table += "<td>";
		     					     						table += "<div class='ApplyMemberListBtn_Box'>";
		     						     						if(elt.apply_ok == "0"){
		     						     							table += "<input type='button' value='수락' class='ApplyMemberListBtn_Ok'><input type='button' value='거절' class='ApplyMemberListBtn_No'>"; 
		     						     							table += "<input type='text' value='" + elt.member_id +"' hidden>";
		     						     							table += "<input type='text' value='" + elt.apply_position_id +"' hidden>";
		     						     								
		     							     					}else{
		     						  	     						table += "<input type='button' value='처리완료' class='successBtn'>";
		     							     					}
		     					     						
		     					     						table += "</div>";
		     						     					table += "</td>";
		     						     					table += "</tr>"
		     						     					
		     						     				})  
		     				   						}
		     					     					
		     					     				table += "</table>"
		     					     				table += "<div class='ApplyPbox'>"
		     				     					table += "<p class='Apply_p'><b>유의사항</b></p>"	
		     				     					table += "<p class='Project_p Apply_p'>- 받은 요청에 거절 할 경우 해당 회원은 본 프로젝트에 더 이상 지원이 불가능 합니다.</p>"
		     				     					table += "<p class='Project_p Apply_p'>- 프로젝트내의 분쟁사항은 저희 사이코딩에서 절대 책임지지 않습니다.</p>"	
		     					     				table += "</div>";
		     				     					
		     					     				table += "</div></form>";
		     					     				
		     					     				$('.Project_Apply_modal').append(table);
		     					     				$('.Project_Apply_modal').show(); 
		     					     				
		     					     				/* ------------------------------------------------------------------------------ */
		     					     				
		     					     				// 모달 창 닫기
		     					    			     $('.ApplyMemberListCancleBtn').unbind('click').bind('click',function(){
		     					     			    	 $('.Project_Apply_modal').empty();
		     					     			    	 $('.Project_Apply_modal').hide();
		     					     			    	 $('#memberEdit').trigger('click');
		     					     			    	 
		     					     			     });
		     					     				
		     					     				// 승인 버튼
		     					    			     $('.ApplyMemberListBtn_Ok').unbind('click').bind('click',function(){
		     					    			    	 var Applymember_id = $(this).next().next().val();
		     					    			    	 var ApplyPosition = $(this).next().next().next().val();
		     					    			    	 var divBox = $(this).parent();
		     					    			    	 var divBoxstate = $(this).parent().parent().prev();
		     					    			    	 
		     					    			    	
		     					    			    	 var data = {"project_id":project_id,
		     					    			    				"member_id":Applymember_id,
		     					    			    				"position_id":ApplyPosition}
		     					    			    	 
		     					    			    	  $.ajax({
		     					      			     		url:"/ajaxproject/applyMemberOk",
		     					      			     		dataType:"html",
		     					      			     		data: data,
		     					      			     		success: function(responsedata){    
		     					      			     			
		     					      			     			
		     					      			     			if(responsedata == "checkd"){
		     					      			     				swal("요구하는 멤버수가 가득찼습니다.","추가로 모집 할 경우 멤버수를 늘려주세요.","warning");
		     					      			     				return false;
		     					      			     			}else if(responsedata == "true"){
		     					      			     				
		     						      			     			 divBox.empty();
		     						    	    			    	 divBoxstate.empty();
		     						    	    			    	 
		     						    	    			    	 divBoxstate.append("<p class='applystate_1'>승인</p>");
		     						    		     				 divBox.append("<input type='button' value='처리완료' class='successBtn'>");
		     						    		     				 
		     						    		     				swal("멤버로 승인 하셨습니다.","","success");
		     					      			     				
		     					      			     			}else{
		     					      			     				swal("오류가 발생하였습니다.","잠시후 다시 시도해주세요.","error");
		     					      			     				setTimeout(function() {
		     					      		     						document.location.reload(true);
		     					      		     					}, 1000);
		     					      			     			}
		     					      			     			
		     					      			     		}
		     					      			     	}); 
		     					    			    	 
		     					    			    	 
		     					     			     });
		     					     				
		     					    			  	// 거절 버튼
		     					    			     $('.ApplyMemberListBtn_No').unbind('click').bind('click',function(){
		     					    			    	 var Applymember_id = $(this).next().val();
		     					    			    	 var ApplyPosition = $(this).next().next().val();
		     					    			    	 var divBox = $(this).parent();
		     					    			    	 var divBoxstate = $(this).parent().parent().prev();
		     					    			    	 
		     					    			    	
		     					    			    	 var data = {"project_id":project_id,
		     					    			    				"member_id":Applymember_id,
		     					    			    				"position_id":ApplyPosition}
		     					    			    	 
		     					    			    	   $.ajax({
		     					      			     		url:"/ajaxproject/applyMemberNo",
		     					      			     		dataType:"html",
		     					      			     		data: data,
		     					      			     		success: function(responsedata){    
		     					      			     			
		     					      			     			if(responsedata == "true"){
		     					      			     				
		     					      			     				 divBox.empty();
		     					      		    			    	 divBoxstate.empty();
		     					      		    			    	 
		     					      		    			    	 divBoxstate.append("<p class='applystate_2'>거절</p>");
		     					      			     				 divBox.append("<input type='button' value='처리완료' class='successBtn'>");
		     						    		     				 
		     						    		     			     swal("요청이 거절 되었습니다","해당 회원은 더 이상 본 프로젝트에 지원이 불가능합니다.","error");
		     					      			     			}else{
		     					      			     				swal("오류가 발생하였습니다.","잠시후 다시 시도해주세요.","error");
		     					      			     				setTimeout(function() {
		     					      		     						document.location.reload(true);
		     					      		     					}, 1000);
		     					      			     			}
		     					      			     			
		     					      			     		}
		     					      			     	});  
		     					     			     });
		     					     			}
		     					     	});
		     					})
		     					
		     					// 맴버 강퇴버튼
		     					$('.Member_Expulsion_Btn').unbind('click').bind('click', function(){
		     						var getOutMember_id = $(this).children()[1].value;
		     						var getOutMember_position = $(this).children()[2].value;
		     						
		     						var data = {"member_id":getOutMember_id,
		     									"position_id":getOutMember_position,
		     									"project_id":project_id}
		     							
		     						swal({
		     							  title: "해당 멤버를 추방하시겠습니까?",
		     							  text: "추방된 회원은 본 프로젝트에 더 이상 지원 및 참여가 불가능합니다.",
		     							  icon: "warning",
		     							  buttons: true,
		     							  dangerMode: true,
		     							})
		     							.then((willDelete) => {
		     							  if (willDelete) {
		     								  
		     								  $.ajax({
		     							     		url:"/ajaxproject/getOutmember",
		     							     		dataType:"html",
		     							     		data: data,
		     							     		success: function(responsedata){    
		     							     			
		     							     			if(responsedata == "true"){
		     							     				swal("추방 되었습니다.","","success").then((value) => {
		     							     					$('#memberEdit').trigger('click');
		     												});
		     							     				
		     							     			}else{
		     							     				swal("오류가 발생하였습니다.","잠시후 다시 시도해주세요.","error");
		     							     				setTimeout(function() {
		     						    						document.location.reload(true);
		     						    					}, 1000);
		     							     			}
		     							     			
		     							     		}
		     							     	});   
		     								  
		     							  } else {
		     								  return false;
		     							  }
		     							});
		     						
		     						
		     						
		     					})
		     					
		     					// 멤버 위임버튼
		     					$('.handoverAuthority_Btn').unbind('click').bind('click', function(){
		     						var HandOverMember_id = $(this).children()[1].value;
		     						var HandOverMember_NickName = $(this).children()[2].value;
		     						
		     						$('.Project_Apply_modal').empty();
		     						
		     						var table = "<form class='ProjectApply'><div class='ProjectApplyMemberListDiv'>";

		     						table += "<p class='ApplyMemberListTitle centerImpo'>"+ HandOverMember_NickName  +" 님에게 프로젝트 리더를 위임하시겠습니까?</p>"
		     						
		     						table += "<div class='ApplyBtn_Box'>"
		     						table += "<input type='button' value='다음' class='HandOverMember_Next'><input type='button' value='취소' class='HandOverMember_No'>"
		     						table += "</div>"
		     						table += "<div class='ApplyPbox'>"
		     						table += "<p class='Apply_p'><b>유의사항</b></p>"	
		     						table += "<p class='Project_p Apply_p'>- 프로젝트를 위임 시 해당 회원에게 프로젝트가 귀속되며, 철회가 불가능하오니 신중히 <br> 선택하시기 바랍니다.</p>"
		     						table += "<p class='Project_p Apply_p'>- 프로젝트를 위임 시 해당 프로젝트에서 진행 할 분야를 선택하여 하여야합니다.</p>"	
		     						table += "<p class='Project_p Apply_p'>- 프로젝트를 탈퇴를 원할 경우 패널티가 발생하므로 유의하시기 바랍니다.</p>"	
		     						table += "</div>";
		     						
		     						table += "</div></form>";
		     						
		     						$('.Project_Apply_modal').append(table);
		     						$('.Project_Apply_modal').show(); 
		     						/* ------------------------------------------------------------------------------ */
		     						
		     						// 모달 창 닫기
		     					     $('.HandOverMember_No').unbind('click').bind('click',function(){
		     						    	 $('.Project_Apply_modal').empty();
		     						    	 $('.Project_Apply_modal').hide();
		     						     });
		     						
		     					     $('.HandOverMember_Next').unbind('click').bind('click',function(){
		     					    	 $('.Project_Apply_modal').empty();
		     					    	 
		     					    	 $.ajax({
		     						     		url:"/ajaxproject/PositionList",
		     						     		dataType:"html",
		     						     		success: function(responsedata){    
		     						     			
		     						     			responsedata = JSON.parse(responsedata);
		     						     			
		     						     			var HandOverMember_PositionBox = "<form class='ProjectApply'><div class='ProjectApplyMemberListDiv'>";
		     						    
		     						    	    	HandOverMember_PositionBox += "<p class='ApplyMemberListTitle centerImpo'>리더 해임 후 진행할 분야를 선택해주세요.</p>"
		     						        		HandOverMember_PositionBox += "<div>"
		     						    	    	HandOverMember_PositionBox += "<select class='HandOverMember_SelectBox' name='position_code'>"
		     					    	    		$.each(responsedata, function(i, position) {
		     					    	    			if(position.position_enabled == 1 ){
		     					    	    				HandOverMember_PositionBox += "<option value='"+ position.position_id +"'>"+ position.position_name +"</option>";
		     					    	    			}
		     					    	    			
		     					    	    		})
		     						    	    	
		     						    			HandOverMember_PositionBox += "</select>"
		     						        		HandOverMember_PositionBox += "</div>"
		     						    	    	HandOverMember_PositionBox += "<div class='HandOverMemberBtn_Box'>"
		     						    	        HandOverMember_PositionBox += "<input type='button' value='확인' class='HandOverMember_Ok'><input type='button' value='취소' class='HandOverMember_No'>"
		     						    	    	HandOverMember_PositionBox += "</div>"
		     						    	    	HandOverMember_PositionBox += "<div class='ApplyPbox'>"
		     						    	    	HandOverMember_PositionBox += "<p class='Apply_p'><b>유의사항</b></p>"	
		     						    	    	HandOverMember_PositionBox += "<p class='Project_p Apply_p'>- 프로젝트를 위임 시 해당 회원에게 프로젝트가 귀속되며, 철회가 불가능하오니 신중히 <br> 선택하시기 바랍니다.</p>"
		     						    	    	HandOverMember_PositionBox += "<p class='Project_p Apply_p'>- 프로젝트를 위임 시 해당 프로젝트에서 진행 할 분야를 선택하여 하여야합니다.</p>"	
		     						    	    	HandOverMember_PositionBox += "<p class='Project_p Apply_p'>- 프로젝트를 탈퇴를 원할 경우 패널티가 발생하므로 유의하시기 바랍니다.</p>"	
		     						    	    	HandOverMember_PositionBox += "</div>";
		     						    	    	HandOverMember_PositionBox += "</div></form>";
		     						    		 		
		     						    		 	$('.Project_Apply_modal').append(HandOverMember_PositionBox);
		     						    		 	
		     						    		 	$('.HandOverMember_No').unbind('click').bind('click',function(){
		     						   		    	 $('.Project_Apply_modal').empty();
		     						   		    	 $('.Project_Apply_modal').hide();
		     						   		 
		     						   		  	    });
		     						    		 	
		     						    		 	$('.HandOverMember_Ok').unbind('click').bind('click',function(){
		     						    		 		
		     						    		 		var data = {"member_id":HandOverMember_id,
		     						    						"project_id":project_id,
		     						    						"NewMember_id":login_memberid,
		     						    						"position_id":$('.HandOverMember_SelectBox').val()};
		     						    		 		
		     						    		 		swal({
		     						    					  title:"정말로 위임하시겠습니까?",
		     						    					  text: "* 철회가 불가능 하오니 신중히 선택바랍니다.",
		     						    					  icon: "warning",
		     						    					  buttons: true,
		     						    					  dangerMode: true,
		     						    					})
		     						    					.then((willDelete) => {
		     						    					  if (willDelete) {
		     						    						  
		     						    						  $.ajax({
		     						    					     		url:"/ajaxproject/toHandauth",
		     						    					     		dataType:"html",
		     						    					     		data: data,
		     						    					     		success: function(responsedata){    
		     						    					     			
		     						    					     			if(responsedata == "true"){
		     						    					     				swal("리더가 변경 되었습니다.","","success").then((value) => {
		     						    					     					document.location.reload(true);
		     						    										});
		     						    					     				
		     						    					     			}else{
		     						    					     				swal("오류가 발생하였습니다.","잠시후 다시 시도해주세요.","error");
		     						    					     				setTimeout(function() {
		     						    				    						document.location.reload(true);
		     						    				    					}, 1000);
		     						    					     			}
		     						    					     			
		     						    					     		}
		     						    					     	});   
		     						    						  
		     						    					  } else {
		     						    						  return false;
		     						    					  }
		     						    					});
		     						    		 		
		     							   		  	    });
		     						     		}
		     						     	});  
		     					     });
		     						
		     					})
		     					
		     		}
		     	});
			
			
		}
		// -----------------------------------------------------------------------------
		
		$(this).attr('class','menuliClick');
		
	})
	
	// 페이지 시작 시 포르젝트 인포 보여주기
	$('#project_info').trigger('click');
	
})