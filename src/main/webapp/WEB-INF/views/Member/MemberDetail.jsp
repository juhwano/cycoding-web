<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 스프링 시큐리티 설정 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


	<link type="text/css" href="css/mypage.css" rel="stylesheet">
</head>
<body>
<main>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<div id="wrap">
		<div id="profile_img">
			<img src="assets/img/member_detail/cycoding_img.png">
		</div>
		
		<div id="modals">
			<ul>
				<li>지원내역</li>
				<li>진행중 프로젝트</li>
			</ul>
		</div>
		<div id="detail_box">
			
			<div id="persnal">
			
			</div>
			
			
			<div id="info">
			
			</div>
			
		</div>
	</div>
	
	


</main>

</body>
</html>