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
							<a href="${pageContext.request.contextPath}/member/memberdetailpage?memberid=${project.member_id}" target="_blank">
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
		
	<!-- 텝  -->	
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
	<!-- -->
		
	<!-- 안에 정보들만 바꾸기 -->	
	<!-- 본문 -->
	<div class="ChangeContentBox">	
	</div>

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
				<p class="Project_p Apply_p">- 프로젝트내의 분쟁사항은 저희 사이코딩에서 절대 책임지지 않습니다.</p>	
				<p class="Project_p Apply_p">- 프로젝트의 리더의 선택으로 지원이 거절 될 수 있습니다.</p>	
				<p class="Project_p Apply_p">- 지원이 거절 될 시 본 프로젝트에 더이상 지원이 불가능합니다.</p>	
				
				</div>		
				</div>
			</form>	
		</div>		
		<div class="Project_Apply_modal">	
		</div>
			
       </div> 

	</div>
	
</body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
<script type="text/javascript">
	var project_id = "${project.project_id}";
	var login_memberid = "${sessionScope.member_id}";
</script>
<script src="${pageContext.request.contextPath}/assets/js/projectdetail.js" ></script>
</html>