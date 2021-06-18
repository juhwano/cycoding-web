<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>
<link type="text/css"
	href="${pageContext.request.contextPath}/css/ProjectDetail.css"
	rel="stylesheet">
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="project" value="${project}" />
<c:set var="pmcountlist" value="${pmcountlist}" />
<c:set var="pmlist" value="${pmlist}" />
<c:set var="pjsk" value="${pjsk}" />


<body>
	<div class="projectDetail">
	<div class="container">
		<div class="projectPageHeaderWrap">
			<div class="projectPurposeWrap">
				<div class="rightTxt">${project.field_name} 개발</div>
			</div>

			<div class="ProjectPageHeaderContent">
				<table class="statusTagWrap">
					<tr>
					<c:choose>
						<c:when test="${project.p_state eq '모집중'}">
							<td class="statusOpenTag">${project.p_state}</td>
						</c:when>
						<c:when test="${project.p_state eq '진행중'}">
							<td class="statusGoingTag">${project.p_state}</td>
						</c:when>
						<c:when test="${project.p_state eq '완료'}">
							<td class="statusCompletionTag">${project.p_state}</td>
						</c:when>
					</c:choose>
					<td class="projectTit">${project.p_title}</td>
					</tr>
				</table>

				<div class="userIdWrap">
					<div class="leaderImg">
						<img
							src="${pageContext.request.contextPath}/resources/upload/${project.member_image}">
					</div>
					<span class="userIdTxt">${project.member_nickname}</span>
				</div>
			</div>
			
			<div class="m_img_top">
			  	 <i class="far fa-heart bookmark" onclick='location.href="#"'> 찜</i>
		   </div>
		</div>
		
		<div class="NavBox">
			<div class="ProjectNav">
				<div class="Leader_Detail">
					<p>❗️ 리더 정보</p>
					<p class="Project_p"><b style="color: red;">*</b> 현재 프로젝트의 리더입니다.</p>
					<div class="Leader_DetailBox">
						<div class="LeaderImg_Box">
							<img src="${pageContext.request.contextPath}/resources/upload/${project.member_image}">
						</div>
						<p>
							<a href="#">
							<b>${project.member_nickname}</b>
							</a>
						</p>
					</div>
					<p class="Project_p small_p">클릭하여 리더의 정보를 확인해보세요.</p>
					
				</div>
				<div class="Nav_Detail">
					<hr>
					<p>프로젝트 분야</p>
						<p class="Project_p"><b style="color: red;">*</b> 현재 프로젝트의 분야입니다.</p>
						<p class="ProjectDetail_p">${project.field_name} 개발</p>
					<hr>
					<p>프로젝트 지역</p>
						<p class="Project_p"><b style="color: red;">*</b> 현재 프로젝트는 해당 지역에서 진행합니다.</p>
						<p class="ProjectDetail_p">${project.adr_name}</p>
					<hr>
					<p>프로젝트 기간</p>
						<p class="Project_p"><b style="color: red;">*</b> 현재 프로젝트의 예상 기간입니다.</p>
						<p class="ProjectDetail_p">${project.duration_date}</p>
					<hr>
					<p>기술 스텍</p>
					 	<p class="Project_p"><b style="color: red;">*</b> 현재 프로젝트가 요구하는 기술 스텍입니다.</p>
						<ul class="Project_SkillBox">
						<c:forEach items="${pjsk}" var="pjsk">
								<li># ${pjsk.skill_name}</li>
						</c:forEach>
						</ul>
					<hr>
					<p>멤버</p>
						<div class="member_DetailBox">
							<table class="member_list">
						<c:forEach items="${pmlist}" var="pmlist">
							<c:if test="${pmlist.member_id != null}">
								<tr>
								<td width="15%" class="memberImg_Box">
									<img src="${pageContext.request.contextPath}/resources/upload/${pmlist.member_image}">
								</td>
								<td width="35%" class="member_nickname">${pmlist.member_nickname}</td>
								<td width="50%" class="member_skills">_${pmlist.position_name}</td>
								</tr>
							</c:if>	
						</c:forEach>
							</table>
						</div>	
					 <c:if test="${sessionScope.member_id eq project.member_id && project.p_state eq '모집중'}">
					 <div class="ProjectEditBox"><a class="ProjectEditBtn" href="${pageContext.request.contextPath}/project/edit?project_id=${project.project_id}">프로젝트 수정</a></div>
					</c:if>
				</div>
			</div>
			
		</div>
	<!-- 메인 박스 -->	
	<div class="mainBox">
		<div class="m_menubarBox">
				<ul class="Project_menuBar">
					<li class="menuliClick" id="project_info"><p>정보</p></li>
					<li class="menuli" id="Qna"><p>Q & A</p></li>
					
					<c:if test="${sessionScope.member_id eq project.member_id}">
					<li class="menuli" id="memberEdit"><p>멤버관리</p></li>
					</c:if>
				</ul>
		</div>
	<!-- 안에 정보들만 바꾸기 -->	
		<!-- 본문 -->
	<div class="ChangeContentBox">
		
		<div class="Project_info">
		<div class="ProjectMember">
			<p>모집현황</p>
			<p class="Project_p"><b style="color: red;">*</b> 원하는 분야에 지원해보세요!</p>
			<hr>


			<div id="PositionBox">
				<table class="project_boxdiv">
						<c:forEach items="${pmcountlist}" var="pmcountlist">
							<tr class="Project_memberList">
								<td width="50%">${pmcountlist.position_name}</td>
								<c:choose>
								<c:when test="${pmcountlist.curr eq pmcountlist.max}">
									<td class="memberListcurrFull" width="15%">${pmcountlist.curr} / ${pmcountlist.max} </td>
									<td width="30%" class="FullBtnWarp">
										<input type="button" value="마감">
									</td>	
								</c:when>
								<c:otherwise>
									<td class="memberListcurr" width="15%">${pmcountlist.curr} / ${pmcountlist.max} </td>
									<td width="30%" class="BtnWarp">
										<c:if test="${sessionScope.member_id != project.member_id }">
										<input class="ProjectApplyBtn" type="button" value="지원">
										<label for="ProjectApplyBtn" hidden>${pmcountlist.position_id}</label>
										<label for="ProjectApplyBtn" hidden>${pmcountlist.position_name}</label>
										</c:if>
									</td>
								</c:otherwise>
								</c:choose>
							</tr>	
						</c:forEach>
				</table>
			</div>
		</div>


		<div class="ProjectContent">
			<p>- 프로젝트 소개</p>
			
			<p class="Project_content">${project.p_content}</p>
		</div>
		</div>
		
		<!-- QnA Box -->
		<div class="QnABox" style="display:none">
		qnabox
		</div>
		
		
		<!-- MemberEditBox -->
		<div class="MemberEditBox" style="display:none">
			<div class="ProjectMember">
				<p>지원내역</p>
				<p class="Project_p"><b style="color: red;">*</b> 나의 프로젝트에 지원한 멤버 목록입니다.</p>
				<hr>
				<div id="PositionBox">
					<table class="project_boxdiv">
							<c:forEach items="${pmcountlist}" var="pmcountlist">
								<tr class="Project_memberList">
									<td width="50%">${pmcountlist.position_name}</td>
									<c:choose>
									<c:when test="${pmcountlist.curr eq pmcountlist.max}">
										<td class="memberListcurrFull" width="15%">${pmcountlist.curr} / ${pmcountlist.max} </td>
										<td width="30%" class="FullBtnWarp">
											<input type="button" value="마감">
										</td>	
									</c:when>
									<c:otherwise>
										<td class="memberListcurr" width="15%">${pmcountlist.curr} / ${pmcountlist.max} </td>
										<td width="30%" class="BtnWarp">
										
											<input class="ProjectApplyBtn" type="button" value="상세보기">
											<label for="ProjectApplyBtn" hidden>${pmcountlist.position_id}</label>
											<label for="ProjectApplyBtn" hidden>${pmcountlist.position_name}</label>
											
										</td>
									</c:otherwise>
									</c:choose>
								</tr>	
							</c:forEach>
					</table>
				</div>
			</div>
			
		</div>
			
			
			
		</div>
		<!-- changeBoxEnd -->	
	</div>
		<!-- 모달 -->
       	<div class="Project_Detail_modal">
	       <form action="ProjectApply" method = "POST">
	       	<div class="ProjectApplyDiv">
				<div class="ProjectApplyBox">
				
				<p class="ApplyTitle">${project.p_title}에 [<b class="ApplyName"></b>](으)로 지원하시겠습니까?</p>
				<div class="ApplyBtn_Box">
				<input type="button" value="예" class="ApplyBtn_Ok"><input type="button" value="아니요" class="ApplyBtn_No"> 
				</div>
				<p class="Project_p Apply_p"><b style="color: red;">*</b> 예를 누를시 정보제공 및 유의사항에 동의한 것으로 간주됩니다.</p>	
				<p class="Apply_p"><b>유의사항</b></p>	
				<p class="Project_p Apply_p">- 귀하의 프로필 정보가 프로젝트 리더에게 제공됩니다.</p>	
				<p class="Project_p Apply_p">- 프로젝트내의 분쟁사항은 저희 사이코에서 절대 책임지지 않습니다.</p>	
				<p class="Project_p Apply_p">- 프로젝트의 리더의 선택으로 지원이 거절 될 수 있습니다.</p>	
				
				
				</div>		
				</div>
			</form>	
			</div>		
       </div> 

	</div>
	
</body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
<script type="text/javascript">
	
	if($('.member_list').children().length < 1){
		$('.member_list').append("<tr><td class='ProjectDetail_p'>아직 프로젝트 멤버가 없습니다.</td></tr>");
	}
	
	
	$('.Project_menuBar > li ').click(function(){
		
		$('.Project_menuBar > li ').attr('class','menuli');
		
		
		if($(this).attr('id') == "project_info"){
			$('.Project_info').attr('style','display:block');
			$('.QnABox').attr('style','display:none');
			$('.MemberEditBox').attr('style','display:none');
			$('html').scrollTop(0);
			
		}else if($(this).attr('id') == "Qna"){
			$('.QnABox').attr('style','display:block');
			$('.Project_info').attr('style','display:none');
			$('.MemberEditBox').attr('style','display:none');
			$('html').scrollTop(0);
			
		}else if($(this).attr('id') == "memberEdit"){
			$('.MemberEditBox').attr('style','display:block');
			$('.QnABox').attr('style','display:none');
			$('.Project_info').attr('style','display:none');
			$('html').scrollTop(0);
			
		}
		
		$(this).attr('class','menuliClick');
		
	})
	
	
	$('.Project_Detail_modal').hide();
	
	$(document).off("click").on('click', '.ProjectApplyBtn', function(){
		var Applycode = this.nextElementSibling.textContent;
		var Applyname = this.nextElementSibling.nextElementSibling.textContent;
		var checkdata = {"member_id":${sessionScope.member_id},
						"project_id":${project.project_id}};
		
		if('${project.p_state}' != '모집중'){
			swal("지원이 마감되었습니다.","","error");
			return false;
		}
		
		
		$.ajax({
     		url:"/ajaxproject/projectCheckApply",
     		dataType:"html",
     		data: checkdata,
     		success: function(responsedata){    			
     			console.log(responsedata);
     			if(responsedata == "is_project"){
     				swal("현재 진행 중인 프로젝트가 존재합니다.","","warning");
     				return false;
     			}else if(responsedata == "ProjectApply"){
     				swal("현재 프로젝트에 이미 지원 하였습니다.","","warning");
     				return false;
     			}else{
     				
     				var Applydata = {"project_id":${project.project_id},
     								"position_id":Applycode,
     								"member_id":${sessionScope.member_id}};
     				
     				
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
     			     			console.log(responsedata);
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
	
</script>
</html>