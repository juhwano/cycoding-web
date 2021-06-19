<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<head>
<!-- member CSS -->
<link type="text/css"
	href="${pageContext.request.contextPath}/css/ProjectList.css"
	rel="stylesheet">
<!-- Swiper Css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<!-- Swiper js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<!-- 북마크 -->
<script type="text/javascript" src="/assets/js/bookmark.js?ver=1"></script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	<c:set var="project_list" value="${project_list}" />
	<c:set var="adr_list" value="${adr_list}" />
	<c:set var="field_list" value="${field_list}" />
	<c:set var="skill_list" value="${skill_list}" />
	<c:set var="pjsk_list" value="${pjsk_list}" />
	<c:set var="membercount_list" value="${membercount_list}" />
	<c:set var="bookmark_list" value="${bookmark_list}" />
	
	
	<!-- 탑버튼 -->
	<img id="topBtn"
		src="${pageContext.request.contextPath}/assets/img/ain_test/topBtn.png">

	<div class="top_area">
		<div class="area-img">
		<p>나와 맞는 <br> 프로젝트를 찾아보세요.</p>
      	</div>
	</div>
	
	

	
	<div class="section section-md">

		<div class="p_container">

			<div class="select_section">
				<!-- select 필터링 -->
				<!-- 지역 -->
				<select class="form-select p_sel" id="adrSelect"
					aria-label="Default select example">
					<option value="">지역: 전체</option>
					<c:forEach var="adr" items="${adr_list}">
	                     <option value="${adr.adr_code}">${adr.adr_name}</option>
	               </c:forEach>
				</select>
				<!-- 분야 -->
				<select class="form-select p_sel" id="fieldSelect"
					aria-label="Default select example">
					<option value="">분야: 전체</option>
					<c:forEach var="field" items="${field_list}">
	                  <c:if test="${field.field_enabled eq '1'}">
	                     <option value="${field.field_code}">${field.field_name}</option>
	                  </c:if>
	               </c:forEach>
				</select>
				<!-- 주언어 -->
				<select class="form-select p_sel" id="skillSelect"
					aria-label="Default select example">
					<option value="">주언어: 전체</option>
					<c:forEach var="skill" items="${skill_list}">
	                  <c:if test="${skill.skill_enabled eq '1'}">
	                     <option value="${skill.skill_code}">${skill.skill_name}</option>
	                  </c:if>
	               </c:forEach>
				</select>
				<!-- 상태 -->
				<select class="form-select p_sel" id="stateSelect"
					aria-label="Default select example">
					<option value="">상태: 전체</option>
					<option value="모집중">모집중</option>
					<option value="진행중">진행중</option>
					<option value="완료">완료</option>
				</select>

				<!-- 프로젝트이름검색 -->
				<div class="input-group p_search">
					<input type="text" class="form-control" id="ProjectNameSearch" placeholder="프로젝트이름" name="projectname"
						aria-label="Search" aria-describedby="basic-addon2">
					<span class="input-group-text" id="searchIcon">
						<span class="fas fa-search"></span>
					</span>
				</div>
			</div>
			
	<p id="wouldyoulike">이런 프로젝트는 어떠세요?</p>
	<!-- 추천 리스트 박스 -->
	<div id="slidewrapper">
	<!-- 클래스명은 변경하면 안 됨 -->
	<div class="swiper-container mySwiper">

		<div class="swiper-wrapper">
			<c:forEach var="rcm" items="${rcm_list}">
			<div class="swiper-slide" >
			<!-- 프로젝트카트 start -->

				<div class="col-12 col-md-6 col-lg-4 mb-5 cardNum" id="rcmcard" >
					<div class="card shadow" >
						<!-- 카드헤더: 모집상태,분야,조회수 -->
						
						<!-- 프로젝트이미지 -->

                       
                        <!-- 프로젝트이름, 주언어 -->

						<div class="card-body" id="backimg" style="background-image:url(${pageContext.request.contextPath}/assets/img/projectimg/${rcm.p_image})">
							<a href="/project/detail?project_id=${rcm.project_id}"><h3 class="h5 card-title">${rcm.p_title}</h3></a>

							<p class="card-text recommend_skill" >
								<c:forEach var = "pjsk" items="${pjsk_list}" varStatus="status" > 
									<c:if test="${pjsk.project_id eq rcm.project_id}">
										#${pjsk.skill_name}
									</c:if>
								</c:forEach>
								</p>
							
						</div>

					</div>
				</div>

				<!-- 프로젝트카드end -->
			</div>
			</c:forEach>
		</div>
		

		
	</div>
	<!-- 페이징 -->
			<!-- 네비게이션 -->
		 <div class="swiper-button-next"></div> <!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		 <div class="swiper-button-prev"></div> <!-- 이전 버튼 -->
	<div class="swiper-pagination"></div>
	</div>
			<div class="row mb-5" id="card_section">
				<!-- 프로젝트카드  -->
				<!-- cardNum은 마지막 더보기버튼 사라지게 하기 위해 넣은 class -->
				
				<!-- last_flag : forEach문이 project_list의 끝까지 돌았는지 검사해준다. -->
				<!-- last_flage >>  true : project_list 끝까지 반복문 완료. -->
				<c:set var="last_flag" value="false"/>
				
				<!-- list_size : project_list의 크기 -->
				<c:set var="list_size" value="${fn:length(project_list)}"/>
				
				<!-- ## project_list반복문 시작 >> card만들기 시작 ## -->
				<c:forEach var = "project" items="${project_list}" varStatus="status" begin="0" end="5"> 
				
				<!-- if문을 통해 현재 index가 project_list의 끝인지 검사 -->
				<c:if test="${status.count eq list_size}">
					<c:set var="last_flag" value="true"/>
				</c:if>
				
				<!-- 북마크 for each문 break용 -->
				<c:set var="bookmarking" value="false" />
				
				<!-- 프로젝트카트 start -->
				
				<div class="col-12 col-md-6 col-lg-4 mb-5 cardNum">
					<div class="card shadow">
						<!-- 카드헤더: 모집상태,분야,조회수 -->
						<div class="card-header">
							<div class="p_state">${project.p_state} - ${project.field_name}</div>
							<div class="p_views"><i class="fas fa-eye"> ${project.p_views} </i></div>
						</div>
						<!-- 프로젝트이미지 -->
						
						<div class="m_img" >
						   <div class="m_img_top">
						   <!-- 해당 회원이 마킹했던 프로젝트면 표시해주기 -->
						   <se:authorize access="hasAnyRole('ROLE_PREMEMBER','ROLE_MEMBER','ROLE_ADMIN', 'ROLE_TEAMMANGER', 'ROLE_PENALTY')">
							   <c:forEach var = "bookmark" items="${bookmark_list}" varStatus="mark_status">
									<c:if test="${bookmarking eq false}">
										 <c:choose>
											<c:when test="${bookmark.project_id eq project.project_id}">
											  	<i class="fas fa-heart bookmark marking" id="${project.project_id}" onclick='BookMarking(${project.project_id})'></i>
											  	<c:set var="bookmarking" value="true" />
											</c:when>
										  	<c:when test="${mark_status.last}">
											  	<i class="fas fa-heart bookmark no_marking" id="${project.project_id}" onclick='BookMarking(${project.project_id})'></i>
											</c:when> 
										</c:choose>
									</c:if>
							   </c:forEach>
						   </se:authorize>
						   </div>
                           <a href="/project/detail?project_id=${project.project_id}"><img class="m_img_size" src="${pageContext.request.contextPath}/resources/upload/${project.p_image}"></a>
                        </div>
                       
                        <!-- 프로젝트이름, 주언어 -->
						<div class="card-body">
							<a href="/project/detail?project_id=${project.project_id}"><h3 class="h5 card-title mt-3">${project.p_title}</h3></a>
							<div class="p_footer">
							<p class="card-text p_skill">
								<c:forEach var = "pjsk" items="${pjsk_list}" varStatus="status" > 
									<c:if test="${pjsk.project_id eq project.project_id}">
									 #${pjsk.skill_name}
									</c:if>
								</c:forEach>
								</p>
								<p class="card-text p_team_memNum">모집인원: 
								<c:forEach var = "membercount" items="${membercount_list}" varStatus="status" > 
									<c:if test="${membercount.project_id eq project.project_id}">
										${membercount.m_count} / ${membercount.total_count}
									</c:if>
								</c:forEach> 
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- 프로젝트카드end -->
				</c:forEach>


		</div>
		<div class="zerocontainer">
			<div class="row " >
			<div class="col-md-8 zerowrapper">
			<blockquote class="blockquote text-center shadow" id=zerolist>
				<p>원하시는 프로젝트를 찾을수 없네요...😥</p>
			</blockquote>
			</div>
			</div>
		</div>
			<!-- 더보기버튼 -->
			<!-- last_flag가  true면 버튼은 감춘다.-->
			<div class="more_sec">
				<c:if test="${not last_flag}">
					<button class="moreBtn" id="moreBtn" type="button">더보기</button>
				</c:if>
			</div>
		
	</div>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
<script type="text/javascript">
/* projectList.js에서 필요한 데이터들을 미리 선언 */
 	var membercount_list = ${membercount_list};
 	var pjsk_list = ${pjsk_list};
 	var project_list = ${project_list};
 	
 	<se:authorize access="hasAnyRole('ROLE_PREMEMBER','ROLE_MEMBER','ROLE_ADMIN', 'ROLE_TEAMMANGER', 'ROLE_PENALTY')">
 		var bookmark_list = ${bookmark_list};
 		var loginuser = '${sessionScope.nickname}';
 	</se:authorize>
 	
 	<se:authorize access="!hasAnyRole('ROLE_PREMEMBER','ROLE_MEMBER','ROLE_ADMIN', 'ROLE_TEAMMANGER', 'ROLE_PENALTY')">
 		var loginuser = null;
 	</se:authorize>
 
</script>
<script type="text/javascript" src="/assets/js/projectList.js?ver=2"></script>
</html>