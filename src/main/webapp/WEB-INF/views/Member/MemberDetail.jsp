<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 스프링 시큐리티 설정 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>

<c:set var="member" value="${memberdetail}"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>


	<link type="text/css" href="css/mypage.css" rel="stylesheet">
</head>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
<main>

	<div id="wrap">
		<div id="profile_img">
			<img src="assets/img/member_detail/cycoding_img.png">
		</div>
		<div id="cycoder">
			<p>${member.MEMBER_NICKNAME}</p>
		</div>
		
		<div id="modals">
			<ul>
				<li>지원내역</li>
				<li>프로젝트</li>
			</ul>
		</div>
		<se:authentication property="name" var="LoginUser" />
		
		<div id="detail_box">

			<div id="persnal" class="details">
				<p class="cycoder_title">ABOUT<br>CYCODER</p>
				<input type="hidden" id="m_id" name="m_id" value="${member.MEMBER_ID}">
				<ul>
					
					<%-- <li class="itemlist"><span class="item">이메일</span><span class="info"> ${LoginUser}</span></span><button type="button" class="modify_items m-btn hid">수정</button></li>
					<li class="itemlist"><span class="item">비밀번호</span><span class="info">****</span><button type="button" class="modify_items m-btn">수정</button></li>
					<li class="itemlist"><span class="item">닉네임</span><span class="info">${member.m_nick}</span><button type="button" class="modify_items m-btn">수정</button></li>
					<li class="itemlist"><span class="item">이름</span><span class="info">${member.MEMBER_NAME}</span><button type="button" class="modify_items m-btn hid">수정</button></li>
					<li class="itemlist"><span class="item">휴대폰</span><span class="info">${member.MEMBER_PHONE}</span><button type="button" class="modify_items m-btn">수정</button></li>
					<li class="itemlist"><span class="item">포인트</span><span class="info">${member.HAVE_POINT}점</span><button type="button" class="modify_items point-btn">충전</button></li> --%>
					
					<li class="itemlist"><span class="item">이메일</span><input type="text" class="info" value="${member.MEMBER_EMAIL}" readonly><button type="button" class="modify_items m-btn hid" disabled>NONE</button></li>
					<li class="itemlist"><span class="item">비밀번호</span><input type="password" class="info" value="${member.MEMBER_PWD}" readonly><button type="button" class="modify_items m-btn">수정</button></li>
					<li class="itemlist"><span class="item">닉네임</span><input type="text" class="info" id="nick" value="${member.MEMBER_NICKNAME}" readonly><button type="button" class="modify_items m-btn">수정</button></li>
					<li class="itemlist"><span class="item">이름</span><input type="text" class="info" value="${member.MEMBER_NAME}" readonly><button type="button" class="modify_items m-btn hid" disabled>NONE</button></li>
					<li class="itemlist"><span class="item">휴대폰</span><input type="text" class="info" value="${member.MEMBER_PHONE}" readonly><button type="button" class="modify_items m-btn">수정</button></li>
					<li class="itemlist"><span class="item">포인트</span><input type="text" class="info" value="${member.HAVE_POINT}점" readonly><button type="button" class="modify_items point-btn">충전</button></li>
				
				</ul>
				
			</div>

			
			<div id="info" class="details">
			<p class="cycoder_title">DETAIL</p>
			
			<ul>
				
					<li class="itemlist"><span class="item">보유 기술</span><span class="info"></span>
					<a href="#m_skill" class="trigger-btn" data-toggle="modal"><button type="button" class="modify_p_info" >수정</button></a></li>
					<li class="itemlist"><span class="item">프로젝트 경험 여부</span><span class="info"></span><button type="button" class="modify_p_info">수정</button></li>
					<li class="itemlist"><span class="item">선호 포지션</span><span class="info"></span><button type="button" class="modify_p_info">수정</button></li>
					<li class="itemlist"><span class="item">선호 프로젝트 기간</span><span class="info"></span>
					<a href="#m_duration" class="trigger-btn" data-toggle="modal"><button type="button" class="modify_p_info" >수정</button></a></li>
				
				</ul>
			
			</div>
			
		</div>
	</div>
	
	


</main>


<!-- 기술 스택 모달창 -->
    <div id="m_skill" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<p id="modal-title">보유하고 계신 기술을 골라주세요</p>

			</div>
			<div id="modal-body">
			<div class="tagarea"></div>
			</div>
		</div>
	</div>
</div> 


<!-- 선호 기간 모달창 -->
    <div id="m_duration" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">				
				<p id="modal-title">선호하시는 프로젝트 기간을 골라주세요</p>
			</div>
			<div id="modal-body">
			<div class="tagarea"></div>
			</div>
		</div>
	</div>
</div> 


<script src="${pageContext.request.contextPath}/assets/js/memberdetail.js"></script>
</body>
</html>