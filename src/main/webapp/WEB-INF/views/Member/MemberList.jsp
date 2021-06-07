<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<!-- member CSS -->
<link type="text/css" href="../css/member.css" rel="stylesheet">
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
	<!-- http://localhost:8090/memberlist.cy -->
	
	<!-- 탑버튼 -->
	<img id="topBtn" src="../assets/img/ain_test/topBtn.png">

	<div class="top_area">
		<img id="memberListHeader" src="../assets/img/ain_test/MemberListHeader.png">
	</div>

	<c:set var="memberList" value="${memberList}" />
	<c:set var="positionList" value="${positionList}" />

	<div class="section section-md">

		<div class="m_container">

			<div class="select_section">
				<!-- select 필터링 -->
				<select class="form-select m_sel" id="inlineFormCustomSelectPref"
					aria-label="Default select example">
					<option value="">선호포지션: 전체</option>
					<c:forEach var="position" items="${positionList}">
						<c:if test="${position.position_enable eq '1'}">
							<option value="${position.position_name}">${position.position_name}</option>
						</c:if>
					</c:forEach>
				</select>
				<!-- 닉네임검색 -->
				<div class="input-group m_search">
					<input type="text" class="form-control" id="memberNickname" placeholder="회원 닉네임" aria-label="Search" aria-describedby="basic-addon2">
					<span class="input-group-text" id="memberSearch">
						<span class="fas fa-search"></span>
					</span>
				</div>
			</div>
			
			

			<div class="row mb-5" id="card_section">
				<!-- 회원카드 -->
				<c:forEach var="member" items="${memberList}">
					<c:if test="${member.rownum <= 6}">
						<div class="col-12 col-md-6 col-lg-4 mb-5 cardNum">
							<div class="card shadow">
								<div class="m_img">
									<img class="m_img_size" src="../assets/img/ain_test/${member.m_image}">
								</div>
								<div class="card-body">
									<h3 class="h5 card-title mt-3">${member.m_nick}</h3>
									<p class="card-text">
										- 선호포지션: ${member.position} <br> - 기술스택: ${member.skill}
									</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<!-- 회원카드end -->
			</div>
				<!-- 더보기버튼 -->
				<div class="more_sec">
					<button class="moreBtn" type="button">더보기</button>
				</div>
		</div>
	</div>
</body>
<!-- MemberList Javascript -->
<script src="../assets/js/memberList.js"></script>
</html>