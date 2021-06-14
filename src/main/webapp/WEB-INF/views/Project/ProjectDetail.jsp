<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>

<link type="text/css"
	href="${pageContext.request.contextPath}/css/ProjectDetail.css?ver=1"
	rel="stylesheet">
</head>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	<div class="projectPageHeaderWrap">
		<div class="projectPurposeWrap">
			<div>
				<span class="rightTxt">안드로이드</span>
			</div>
		</div>
		<div class="ProjectPageHeaderContent">
			<h3 class="projectTit">프로젝트이름</h3>
			<li class="projectLeaderWrap">
				<div class="userIdWrap">
					<div class="leaderImg">
						<img width="20px" height="20px"
							src="${pageContext.request.contextPath}/assets/img/ain_test/1.jpg">
					</div>
					<span class="right Txt userId"> <span class="userIdTxt">팀장닉네임</span>
					</span>
				</div>
			</li>
			<div class="statusTagWrap">
				<span class="statusTag">모집중</span>
			</div>
		</div>
	</div>

	<!--  -->
	<div class="container">

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
							<li><span class="positionTxt">안드로이드</span> <span
								class="positionNum">0/2</span>
								<button value="지원" class="positionApplyBtn">지원</button></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="tab-2" class="tab-content">---- ---- ★------ ---- ----
			---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- --------
			---- ---- ---- ★-- ---- ---- ------★ ---- ---- ---- ---- ---- ----
			-------- ---- ---- ---- ---- ---- ---- ★------ ---- ---- ---- ----
		</div>
		
		<div class="projectRightBox">
			<div class="projectRightInfoWrap">
				<div class="basicInfoWrap infoWrap">
					<p class="checkBoxTit"> ✔ 리더 정보 </p>
					<div class="leaderInfo">
						<div class="leaderImg">
							<img width="20px" height="20px"
							src="${pageContext.request.contextPath}/assets/img/ain_test/1.jpg">
						</div>
						<div class="rightBox">
							<span class="userIdTxt">팀장닉네임</span>
						</div>
					</div>
				</div>
				<div class="projectDate infoWrap">
					<p class="checkboxTit">프로젝트 기간</p>
					<p class="tabTxt">1~3개월</p>
				</div>
				<div class="infoWrap">
					<p class="checkboxTit">프로젝트 분야</p>
					<p class="rightTxt tabTxt"> 안드로이드 </p>
				</div>
			</div>
		</div>

	</div>
	<!--  -->


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