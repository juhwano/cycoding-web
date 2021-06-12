<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>

<!--  -->
<style>
body {
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}

.container {
	width: 500px;
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content {
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}

.top_area{
	width: 100%;
	height: 400px;
}

.testBox{
	width:80%;
	height: 100px;
	background-color: white;
}
</style>

<link type="text/css" href="css/ProjectDetail.css" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	<div class="top_area">
	</div>
	
		<!--  -->
		<div class="container">

			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">정보</li>
				<li class="tab-link" data-tab="tab-2">Q&A</li>
				<li class="tab-link" data-tab="tab-3">멤버관리</li>
				<li class="tab-link" data-tab="tab-4">수정</li>
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
			<div id="tab-2" class="tab-content">---- ---- ★------ ---- ----
				---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- --------
				---- ---- ---- ★-- ---- ---- ------★ ---- ---- ---- ---- ---- ----
				-------- ---- ---- ---- ---- ---- ---- ★------ ---- ---- ---- ----</div>
			<div id="tab-3" class="tab-content">---- ★-- -------- ---- ----
				---- -★- ---- ---- -------- ---- -★★- ---- ---- ---- ---- --------
				---- ---- ---- ---- ---- --★ -------- ★-- ---- ---- ---- ---- ----
				-------- ---- ---- --★ ---- ---- ---- -------- ---- ---- ---- --★</div>
			<div id="tab-4" class="tab-content">---- ★-- ------★-- ---★- ----
				--★-- -★★- ---- ---- ----★---- ---- -★- ---- ---- ---- --★-- --------
				---- --★-- ---- ---- ---- --★ -------- ★-- ---- --★-- ---- ---- ----
				-------- ---- ---- --★ ---- ---- ---- -------- ---- ---- ---- --★</div>

		</div>
		<!--  -->

	
	<%-- <script src="${pageContext.request.contextPath}/assets/js/js파일명"></script> --%>
</body>
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