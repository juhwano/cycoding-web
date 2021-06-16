<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="member" value="${aboutmember}" />
<c:set var="skills" value="${skills}" />
<c:set var="position" value="${position}" />
<c:set var="durations" value="${durations}" />
<c:set var="experiences" value="${experiences}" />



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>

<link type="text/css" href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<body>
	<main>

		<div id="wrap">
			<div id="profile_img">
				<!-- <img src="assets/img/member_detail/cycoding_img.png"> -->
				<img id ="target_img" src="${pageContext.request.contextPath}/resources/upload/${member.MEMBER_IMAGE}">
				<form action="editprofile" method="post" enctype="multipart/form-data" id="img_form">
				<input type="hidden" id="id" name="id" value="${member.MEMBER_EMAIL}">
				<input type="file" id="file" name="uploadFile" style="display:none;">
								    <input type="hidden" name="target_url">
				</form>
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

			<div id="detail_box">

				<div id="persnal" class="details">
					<p class="cycoder_title">
						ABOUT<br>CYCODER
					</p>
					<input type="hidden" id="m_id" name="m_id"
						value="${member.MEMBER_ID}">
					<ul>

						<li class="itemlist"><span class="item">이메일</span><input
							type="text" class="info" id="m_email"
							value="${member.MEMBER_EMAIL}" readonly>
							<button type="button" class="modify_items m-btn hid" disabled>NONE</button></li>
						<li class="itemlist"><span class="item">비밀번호</span><input
							type="password" class="info" value="password"
							readonly>
							<button type="button" class="modify_items m-btn">수정</button></li>
						<li class="itemlist"><span class="item">닉네임</span><input
							type="text" class="info" id="nick"
							value="${member.MEMBER_NICKNAME}" readonly>
							<button type="button" class="modify_items m-btn">수정</button></li>
						<li class="itemlist"><span class="item">이름</span><input
							type="text" class="info" value="${member.MEMBER_NAME}" readonly>
							<button type="button" class="modify_items m-btn hid" disabled>NONE</button></li>
						<li class="itemlist"><span class="item">휴대폰</span><input
							type="text" class="info" value="${member.MEMBER_PHONE}" readonly>
							<button type="button" class="modify_items m-btn">수정</button></li>
						<li class="itemlist"><span class="item">포인트</span><input
							type="text" class="info" value="${member.HAVE_POINT}점" readonly>
							<button type="button" class="modify_items point-btn">충전</button></li>

					</ul>

				</div>


				<div id="info" class="details">
					<p class="cycoder_title">DETAIL</p>
					<p class="sub_title">모든 항목을 입력해야 프로젝트에 지원할 수 있어요!</p>

					<div class="infolist">

						<div class="detail_section">

							<div class="detail_title">
								<span class="item">보유기술</span>
							</div>
							<!-- 스탯 입력 안 했으면 -->


							<div class="moerdetails skillarea" onclick="edit_modal('skill')">
								<c:choose>


									<c:when test="${empty skills}">
										<a href="#m_stat" class="trigger-btn" data-toggle="modal">
											<div class="insert">입력하기</div>
										</a>
									</c:when>
									<c:otherwise>
										<c:forEach var="sarr" items="${skills}" varStatus="status">
											<c:choose>
												<c:when test="${status.index eq 0 }">
													<a href="#m_stat" class="trigger-btn" data-toggle="modal">
														<!-- <span id="star">★</span> -->
														<i class="fa fa-star" id=star></i>
														<div class="info_tags main_skill skill">

															<c:out value="${sarr.skill_name}" />

														</div>
													</a>
												</c:when>
												<c:otherwise>
													<a href="#m_stat" class="trigger-btn" data-toggle="modal">
														<div class="info_tags skill">
															<c:out value="${sarr.skill_name}" />
														</div>
													</a>
												</c:otherwise>
											</c:choose>

										</c:forEach>


									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="detail_section itmelist">

							<div class="detail_title">

								<span class="item">프로젝트 경험</span>

							</div>
							<!-- 스탯 입력 안 했으면 -->
							<div class="moerdetails experience" id="exlistarea"
								onclick="edit_modal('experience')">
								<c:choose>

									<c:when test="${empty experiences}">

										<div id="ex_btn"
											style="display: flex; align-items: center; width: 350px; margin: auto; justify-content: space-btween;">
											<div class="insert experience" id="never">없음</div>
											<a href="m_experience" class="trigger-btn" data-toggle="modal">
												<div class="insert experience" id="have">있음</div>
											</a>
										</div>


									</c:when>
									<c:when test="${experiences eq 'none'}">

										<div
											style="display: flex; align-items: center; width: 350px; margin: auto; justify-content: space-btween;" id="ex_toggle">
											<div class="info_tags experience" id="never" style="margin:10px auto">없음</div>
										</div>
									</c:when>
									<c:otherwise>
									
									<div id="exlist">
									
									<c:forEach var="experiences" items="${experiences}" varStatus="status">
										<div class="ex_box" id="${experiences.ex_count}">
										
										<div class="ex ex_titlebox">
											<div id="exicons">
												<i class="fas fa-edit"></i>
												<i class="fas fa-eraser del_exbox"></i>
											</div>
											
											<span class="ex_count">#${status.count}</span><span class="ex_title">${experiences.EXP_TITLE}</span>
										</div>
										<div class="ex">${experiences.EX_POSITION}</div>
										<div class="ex">${experiences.EX_SKILL}</div>
										<div class="ex">${experiences.EX_DURATION}</div>
										<div class="ex">${experiences.EX_CONTENT}</div>
									
										</div>
										</c:forEach>
										
										<a href="#m_experience" class="trigger-btn" data-toggle="modal">
												<div class="add experience" id="have">추가</div>
											</a> 
									</div>
									
									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="detail_section">
							<div class="detail_title">

								<span class="item">선호 포지션</span>

							</div>
							<!-- 스탯 입력 안 했으면 -->
							<div class="moerdetails positionarea"
								onclick="edit_modal('position')">
								<c:choose>


									<c:when test="${empty position}">

										<a href="#m_stat" class="trigger-btn" data-toggle="modal">
											<div class="insert">입력하기</div>
										</a>

									</c:when>
									<c:otherwise>

										<c:forEach var="position" items="${position}">
											<a href="#m_stat" class="trigger-btn" data-toggle="modal">
												<div class="info_tags position">
													<c:out value="${position.position_name}" />
												</div>
											</a>
										</c:forEach>

									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="detail_section">

							<div class="detail_title">

								<span class="item">선호 프로젝트 기간</span>

							</div>

							<!-- 기간 입력 안 했으면 -->
							<div class="moerdetails durationarea"
								onclick="edit_modal('duration')">
								<c:choose>
									<c:when test="${empty durations}">

										<a href="#m_stat" class="trigger-btn" data-toggle="modal">
											<div class="insert">입력하기</div>
										</a>

									</c:when>
									<c:otherwise>


										<c:forEach var="darr" items="${durations}">
											<a href="#m_stat" class="trigger-btn" data-toggle="modal">
												<div class="info_tags duration">
													<c:out value="${darr.du_date}" />
												</div>
											</a>
										</c:forEach>

									</c:otherwise>
								</c:choose>
							</div>
						</div>

					</div>

				</div>
				<div id="ex">
					<a href="#quit_modal" class="trigger-btn" data-toggle="modal"><button type="button" id="quit-btn">회원탈퇴</button></a>
				</div>

			</div>
		</div>

	</main>

	<!-- 기술 스택 모달창 -->
	<div id="m_stat" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<p id="modal-title"></p>
				</div>
				<div id="modal-body">
					<input type="hidden" id="stat"> <input type="hidden"
						id="first"> <input type="hidden" id="second"> <input
						type="hidden" id="third">

					<div id="contentarea">
						<div id="tagarea"></div>
						<div id="selectedarea"></div>
					</div>
					<div id="buttonarea">
						<a href="#m_stat" class="trigger-btn" data-toggle="modal">
							<button id="edit-btn" class="insert_ex">수정</button>
						</a> <a href="#m_stat" class="trigger-btn" data-toggle="modal">
							<button id="cancel">닫기</button>
						</a>
					</div>

				</div>


			</div>
		</div>
	</div>
	
	
	<div id="m_experience" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<p id="modal-title">경험하신 프로젝트에 대해 알려주세요</p>
				</div>
				<div id="modal-body">

					<div id="ex_contentarea">
					
				        <form class="ex_form" method="post" action="ajax/insertexperiences">
				               
				        </form>

					</div>
					<div id="buttonarea">
						<a href="#m_experience" class="trigger-btn" data-toggle="modal">
							<button id="insert_ex" disabled>대기</button>
						</a> <a href="#m_experience" class="trigger-btn" data-toggle="modal">
							<button id="cancel">닫기</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="quit_modal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<p id="modal-title">CYCODING 회원탈퇴</p>
				</div>
				<div id="modal-body">

					<div id="contentarea">
						<p>탈퇴하시더라도 ${member.MEMBER_NICKNAME}님께서 사이코딩에서 활동하신 모든 프로젝트,<br> 작성하신 게시물, 댓글 등은 삭제되지 않으니<br>
						삭제를 원하신다면 탈퇴 전에 미리 삭제 부탁드립니다.</p>
						<p>탈퇴 신청 후 7일 이내 로그인시 탈퇴가 취소지만<br>탈퇴하시게 되면 더 이상 사이코딩의 모든 서비스는 이용이 불가능합니다<br>
						 정말 탈퇴하시겠습니까?</p>
					</div>
					<div id="buttonarea">
					
						<a href="#quit_modal" class="trigger-btn" data-toggle="modal">
							<button id="cancel_quit">닫기</button>
							
							
						</a>
						<%-- <input type="hidden" name="quit_id" id="quit_id" value="${member.MEMBER_ID}" > --%>
						<a href="#quit_modal" class="trigger-btn" data-toggle="modal">
							<button id="quit">탈퇴</button>
						</a>

					</div>

				</div>


			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/assets/js/mypage.js?ver=1"></script>
</body>
</html>