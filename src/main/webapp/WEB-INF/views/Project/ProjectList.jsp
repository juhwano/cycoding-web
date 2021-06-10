<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<!-- member CSS -->
<link type="text/css"
	href="${pageContext.request.contextPath}/css/ProjectList.css"
	rel="stylesheet">
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
	<c:set var="project_list" value="${project_list}" />
	<c:set var="adr_list" value="${adr_list}" />
	<c:set var="field_list" value="${field_list}" />
	<c:set var="skill_list" value="${skill_list}" />
	<!-- 탑버튼 -->
	<img id="topBtn"
		src="${pageContext.request.contextPath}/assets/img/ain_test/topBtn.png">

	<div class="top_area">
		<img id="projectListHeader"
			src="${pageContext.request.contextPath}/assets/img/ain_test/projectListHeader.png">
	</div>
	<div class="container">
	
	<div class="section section-md">

		<div class="p_container">

			<div class="select_section">
				<!-- select 필터링 -->
				<!-- 지역 -->
				<select class="form-select p_sel" id="inlineFormCustomSelectPref"
					aria-label="Default select example">
					<option value="">지역: 전체</option>
					<c:forEach var="adr" items="${adr_list}">
	                     <option value="${adr.adr_code}">${adr.adr_name}</option>
	               </c:forEach>
				</select>
				<!-- 분야 -->
				<select class="form-select p_sel" id="inlineFormCustomSelectPref"
					aria-label="Default select example">
					<option value="">분야: 전체</option>
					<c:forEach var="field" items="${field_list}">
	                  <c:if test="${field.field_enabled eq '1'}">
	                     <option value="${field.field_code}">${field.field_name}</option>
	                  </c:if>
	               </c:forEach>
				</select>
				<!-- 주언어 -->
				<select class="form-select p_sel" id="inlineFormCustomSelectPref"
					aria-label="Default select example">
					<option value="">주언어: 전체</option>
					<c:forEach var="skill" items="${skill_list}">
	                  <c:if test="${skill.skill_enabled eq '1'}">
	                     <option value="${skill.skill_code}">${skill.skill_name}</option>
	                  </c:if>
	               </c:forEach>
				</select>
				<!-- 상태 -->
				<select class="form-select p_sel" id="inlineFormCustomSelectPref"
					aria-label="Default select example">
					<option value="">상태: 전체</option>
					<option value="모집중">모집중</option>
					<option value="진행중">진행중</option>
					<option value="완료">완료</option>
				</select>

				<!-- 프로젝트이름검색 -->
				<div class="input-group p_search">
					<input type="text" class="form-control" id="" placeholder="프로젝트이름"
						aria-label="Search" aria-describedby="basic-addon2"> <span
						class="input-group-text" id="memberSearch"> <span
						class="fas fa-search"></span>
					</span>
				</div>
			</div>

			<div class="row mb-5" id="card_section">
				<!-- 프로젝트카드  -->
				<!-- cardNum은 마지막 더보기버튼 사라지게 하기 위해 넣은 class -->
				<div class="col-12 col-md-6 col-lg-4 mb-5 cardNum">
					<div class="card shadow">
						<!-- 카드헤더: 모집상태,분야,조회수 -->
						<div class="card-header">
							<div class="p_state">모집상태-분야</div>
							<div class="p_views"><i class="fas fa-eye"> 365 </i></div>
						</div>
						<!-- 프로젝트이미지 -->
						<div class="m_img">
						   <div class="m_img_top">
						  	 <i class="far fa-heart bookmark"></i>
						   </div>
                           <img class="m_img_size" src="${pageContext.request.contextPath}/assets/img/ain_test/3.jpg">
                        </div>
                        <!-- 프로젝트이름, 주언어 -->
						<div class="card-body">
							<h3 class="h5 card-title mt-3">프로젝트명</h3>
							<div class="p_footer">
								<p class="card-text p_skill">주언어: </p>
								<p class="card-text p_team_memNum">모집인원: 0/0 </p>
							</div>
						</div>
					</div>
				</div>
				<!-- 프로젝트카드end -->
				
				<!-- 프로젝트카드  -->
				<!-- cardNum은 마지막 더보기버튼 사라지게 하기 위해 넣은 class -->
				<div class="col-12 col-md-6 col-lg-4 mb-5 cardNum">
					<div class="card shadow">
						<!-- 카드헤더: 모집상태,분야,조회수 -->
						<div class="card-header">
							<div class="p_state">모집상태-분야</div>
							<div class="p_views"><i class="fas fa-eye"> 365 </i></div>
						</div>
						<!-- 프로젝트이미지 -->
						<div class="m_img">
						   <div class="m_img_top">
						  	 <i class="far fa-heart bookmark"></i>
						   </div>
                           <img class="m_img_size" src="${pageContext.request.contextPath}/assets/img/ain_test/3.jpg">
                        </div>
                        <!-- 프로젝트이름, 주언어 -->
						<div class="card-body">
							<h3 class="h5 card-title mt-3">프로젝트명</h3>
							<div class="p_footer">
								<p class="card-text p_skill">주언어: </p>
								<p class="card-text p_team_memNum">모집인원: 0/0 </p>
							</div>
						</div>
					</div>
				</div>
				<!-- 프로젝트카드end -->
				
				<!-- 프로젝트카드  -->
				<!-- cardNum은 마지막 더보기버튼 사라지게 하기 위해 넣은 class -->
				<div class="col-12 col-md-6 col-lg-4 mb-5 cardNum">
					<div class="card shadow">
						<!-- 카드헤더: 모집상태,분야,조회수 -->
						<div class="card-header">
							<div class="p_state">모집상태-분야</div>
							<div class="p_views"><i class="fas fa-eye"> 365 </i></div>
						</div>
						<!-- 프로젝트이미지 -->
						<div class="m_img">
						   <div class="m_img_top">
						  	 <i class="far fa-heart bookmark"></i>
						   </div>
                           <img class="m_img_size" src="${pageContext.request.contextPath}/assets/img/ain_test/3.jpg">
                        </div>
                        <!-- 프로젝트이름, 주언어 -->
						<div class="card-body">
							<h3 class="h5 card-title mt-3">프로젝트명</h3>
							<div class="p_footer">
								<p class="card-text p_skill">주언어: </p>
								<p class="card-text p_team_memNum">모집인원: 0/0 </p>
							</div>
						</div>
					</div>
				</div>
				<!-- 프로젝트카드end -->
			</div>

			<!-- 더보기버튼 -->
			<div class="more_sec">
				<button class="moreBtn" type="button">더보기</button>
			</div>
		</div>
	</div>
	</div>
</body>
</html>