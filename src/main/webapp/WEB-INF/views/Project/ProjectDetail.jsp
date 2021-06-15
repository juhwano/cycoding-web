<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="project" value="${project}"/>
<c:set var="pmcountlist" value="${pmcountlist}"/>
<c:set var="pmlist" value="${pmlist}"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>

<link type="text/css"
	href="${pageContext.request.contextPath}/css/ProjectDetail.css"
	rel="stylesheet"> 
	<%-- <link type="text/css" href="${pageContext.request.contextPath}/css/ProjectDetail.css" rel="sytlesheet"> --%>
</head>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp"></jsp:include>
<body>


	<div class="projectPageHeaderWrap">
		<div class="projectPurposeWrap">
			<div>
				<span class="rightTxt">${project.field_name}</span>
			</div>
		</div>
		<div class="ProjectPageHeaderContent">
			<h3 class="projectTit">${project.p_title }</h3>
			<li class="projectLeaderWrap">
			<a href="#"><%-- "/memberdetailpage?memberid=${project.member_id }"> --%>
				<div class="userIdWrap">
					<div class="leaderImg">
						<img width="20px" height="20px"
							src="${pageContext.request.contextPath}/assets/img/ain_test/${project.p_image}">
					</div>
					<span class="userIdTxt">${project.member_nickname }</span>
					
				</div>
			</a>
			</li>
			<div class="statusTagWrap">
				<span class="statusTag">${project.p_state }</span>
			</div>
		</div>
	</div>

	<!--  -->
	
	<div class="rootcontainer">
	 <div class="containe">

		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">정보</li>
			<li class="tab-link" data-tab="tab-2">Q&A</li>
		</ul>

		<div id="tab-1" class="tab-content current">
			<div class="projectDatailWrap">
				<div class="projectTab projectInfoTabContents active">
					<div class="section statusSection">
						<h3 class="tabTit">모집 현황</h3>
						<ul>
						<c:forEach var="position" items="${pmcountlist}">
							<li><span class="positionTxt">${position.position_name}</span>
							<span class="positionNum">
							${position.curr}/${position.max}</span>
								<button value="지원" class="positionApplyBtn">지원</button></li>
						</c:forEach>
						</ul>
						
					</div>
					<div class="section statusSection">
						<h3 class="tabTit">프로젝트 소개</h3>
						<span>${project.p_content}</span>
					</div>
				</div>
				
				
			</div>
			
		</div>

		<div id="tab-2" class="tab-content">---- ---- ★------ ---- ----
			---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- --------
			---- ---- ---- ★-- ---- ---- ------★ ---- ---- ---- ---- ---- ----
			-------- ---- ---- ---- ---- ---- ---- ★------ ---- ---- ---- ----
		</div>
	</div> 

	<div class="projectRightInfoContetns">
			<div class="projectRightInfoWrap">
				<div class="basicInfoWrap infoWrap">
					<p class="checkBoxTit"> ✔ 리더 정보 </p>
					<div class="leaderInfo">
						<div class="leaderImg">
							<img width="20px" height="20px"
							src="${pageContext.request.contextPath}/assets/img/ain_test/1.jpg">
						</div>
						<div class="rightBox">
							<span class="userIdTxt">${project.member_nickname}</span>
						</div>
					</div>
				</div>
				<div class="projectDate infoWrap">
					<h3 class="tabTit">프로젝트 기간</h3>
					<p class="tabTxt">${project.duration_date }</p>
				</div>
				<div class="projectDate infoWrap">
					<h3 class="tabTit">분야</h3>
					<p class="rightTxt tabTxt">${project.field_name }</p>
				</div>
			</div>
		</div>
	</div>



	<!--  -->
	<%-- 
	<div class="container">
                <div class="row justify-content-center">
                    	<div class="ProjectPage">
                    	
            			<form action="" method="post" enctype="multipart/form-data" class="Project_createForm">
                    		<div class="ProjectHeader">
                    			<div class="ProjectHeader_Left">
                    				<p></p>
									<p class="Project_title_p">프로젝트 명</p>
									<p class="Project_p ma-l"><b style="color:red;">*</b> 직관적인 프로젝트명을 사용하시면 클릭률이 올라갑니다.</p>
	                    			<input class="ProjectTitle form-control" type="text" placeholder="제목을 입력해주세요." name="p_title">  
	                    			<p></p>
                    			</div>
                    			
                    			
                    			<div class="ProjectHeader_Right">
                    			<p>대표 이미지</p>
								<p class="Project_p"><b style="color:red;">*</b> 프로젝트 썸네일에 사용될 이미지를 선택해주세요.</p>
								
                    			<img id ="target_img" src="${pageContext.request.contextPath}/assets/img/project/Project_defalutImg.png">
								    <input type="file" id="file" name="uploadFile" style="display:none;" onchange="changeValue(this)" >
								    <input type="hidden" name = "target_url">
                    			</div>
                    			
                    		</div>
                    		
                    		<div class="ProjectMember">
                    			<p>모집인원</p>
                    			
                    			<p class="Project_p"><b style="color:red;">*</b> 원하는 분야를 추가하여 모집해보세요. (추후 추가/수정 가능합니다.)</p>
                    			<hr>
                    			
                    			
                    			<div id="PositionBox">
                    			<div class="PositionBtn">
								<input type="button" value="추가" class="PositionAdd"> <input type="button" value="삭제" class="PositionDel">
								</div>	
                    				
                    			<div class="project_boxdiv">
                    			<select class="Project_SelectBox">
							    	<c:forEach items="${positionvo}" var="position">
							    		 <c:if test="${position.position_enabled eq 1}">
									 	 	<option value="${position.position_id}">${position.position_name}</option>
									 	 </c:if>	
									</c:forEach>
								</select>
									<div class="BtnWarp">
									<input type="button" class="Up_num" value="+" >
										<p class="number">1</p>
									<input type="button" class="Down_num" value="-">
									</div>
                    			</div>
                    			
                    			</div>
                    		</div>
                    		
                    		<div class="NavBox"> 
                    		  <div class="ProjectNav">
                    			<div class="Leader_Detail">  
                    				<p>✔️ 리더 정보</p>
                    				<p class="Project_p"><b style="color:red;">*</b> 리더 정보는 마이페이지를 통해서 수정하시기 바랍니다.</p>
                    				<input type="text" value="${membervo.MEMBER_EMAIL}" name="member_id" hidden>
                    				<div class="Leader_DetailBox">
                    				<div class="LeaderImg_Box">
                    				<img src="${pageContext.request.contextPath}/assets/img/defalutimg.jpeg">
                    				</div>
                    				<p><b>${membervo.MEMBER_NICKNAME}</b></p>
                    				</div>
                    				
                    			</div>
                    			<div class="Nav_Detail">
                    				<hr>
                    				<p>프로젝트 지역</p>
                    				<p class="Project_p"><b style="color:red;">*</b> 프로젝트를 진행하는 지역은 어디인가요?</p>
    								<select class="Project_SelectBox" name="adr_code">
								    	<c:forEach items="${adrvo}" var="adr">
										 	 <option value="${adr.adr_code}">${adr.adr_name}</option>
										</c:forEach>
									</select> 
                    				<hr>
                    				<p>프로젝트 기간</p>
                    				<p class="Project_p"><b style="color:red;">*</b> 프로젝트의 예상 기간을 선택해주세요.</p>
    								<select class="Project_SelectBox" name="duration_id">
								    	<c:forEach items="${durationvo}" var="duration">
										 	 <option value="${duration.duration_id}">${duration.duration_date}</option>
										</c:forEach>
									</select>                				
                    				<hr>
                    				<p>프로젝트 분야</p>
                    				<p class="Project_p"><b style="color:red;">*</b> 어떤 분야의 프로젝트를 진행할 것인지 선택해주세요.</p>
                    				<select class="Project_SelectBox" name="field_code">
	                    				<c:forEach items="${fieldvo}" var="field">
	                    				  <c:if test="${field.field_enabled eq 1}">
										 	 <option value="${field.field_code}">${field.field_name} 개발</option>
										  </c:if>
										</c:forEach>	
									</select>
                    			</div>
                    		  </div>
                    		  
                    		</div>
                    		
                    		<div class="ProjectContent">
                    			<p>프로젝트 내용</p>
                    			<p class="Project_p"><b style="color:red;">*</b> 설명이 풍부한 프로젝트는, 아닌 프로젝트에 비해 지원율이 50% 높습니다.</p>
                    			<hr>
                    			<textarea rows="" cols="" placeholder="내용을 입력해주세요." name="p_content"></textarea>
                    		</div>
                    		
                    		<div class="ProjectSkill">
                    			<p>기술 스텍</p>
                    			<p class="Project_p"><b style="color:red;">*</b> 프로젝트를 진행하는데 필요한 기술 스텍을 선택하세요.</p>
                   				<hr>
								<div id="m_skill">
									<div>
										<div id="tagarea">
											<c:forEach items="${skillvo}" var="skill">
										 	 	<c:if test="${skill.skill_enabled eq 1}">
									 				<div class="tags">${skill.skill_name}</div>
												</c:if>
											</c:forEach>
										</div>
										<hr>
										<p class="Project_p"><b style="color:red;">*</b> 추후 수정이 가능합니다.</p>
										<div id="selectedarea" name="skill_code"></div>
									</div>
								</div>
							</div>
							
							<div class="CreateBtn_box">
								<input type="button" class="CreateBtn" value="프로젝트 생성하기">
								<p class="Project_p"><b style="color:red;">*</b> 프로젝트 생성시 50포인트가 소모됩니다.</p>
							</div>
							
						</form>
                   	</div>
             </div>
         </div> --%>


	<%-- <script src="${pageContext.request.contextPath}/assets/js/js파일명"></script> --%>
</body>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})
</script>
</html>