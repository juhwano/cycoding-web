<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>

<link type="text/css" href="${pageContext.request.contextPath}/css/ProjectDetail.css?ver=1" rel="stylesheet">
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp"></jsp:include>
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
						<img width="20px" height="20px" src="${pageContext.request.contextPath}/assets/img/ain_test/1.jpg">
					</div>
					<span class="right Txt userId">
						<span class="userIdTxt">닉네임</span>
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
				모집현황 소개 등등 이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵
				<div class="testBox"> 
				안ㅇㅔ 디브 넣을 수 있나용
				<button>버튼도?</button>
				</div>
				이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵
				이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵
				<hr>
				이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵
				이러쿵저러쿵이러쿵저러쿵
				이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵이러쿵저러쿵
			</div>
			<div id="tab-2" class="tab-content">
				---- ---- ★------ ---- ----
				---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- --------
				---- ---- ---- ★-- ---- ---- ------★ ---- ---- ---- ---- ---- ----
				-------- ---- ---- ---- ---- ---- ---- ★------ ---- ---- ---- ----
			</div>

		</div>
		<!--  -->

	
	<%-- <script src="${pageContext.request.contextPath}/assets/js/js파일명"></script> --%>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
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