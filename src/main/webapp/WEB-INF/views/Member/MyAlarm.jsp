<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="alarmlist" value="${alarmlist}" />




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

			<div id="cycoder">
				<p></p>
			</div>

			<div id="detail_box">

				<div id="news" class="details">
					<p class="cycoder_title">
						MYNEWS
					</p>

              <ul>

                  <li class="itemlist"><span class="item">이메일</span><input
                     type="text" class="info" id="m_email"
                     value="${member.MEMBER_EMAIL}" readonly>
                     <button type="button" class="modify_items m-btn hid" disabled>NONE</button></li>
               </ul>


				</div>


				<div id="messages" class="details">
					<p class="cycoder_title">MESSAGES</p>

					<div class="infolist">

						<div class="detail_section">

							<div class="detail_title">
								<span class="item">보유기술</span>
							</div>
							<!-- 스탯 입력 안 했으면 -->


							<div class="moerdetails skillarea" onclick="edit_modal('skill')">
								
							</div>
						</div>

						<div class="detail_section itmelist">

							<div class="detail_title">

								<span class="item">프로젝트 경험</span>

							</div>
							<!-- 스탯 입력 안 했으면 -->
							<div class="moerdetails experience" id="exlistarea"
								onclick="edit_modal('experience')">
								
							</div>
						</div>

						<div class="detail_section">
							<div class="detail_title">

								<span class="item">선호 포지션</span>

							</div>
							<!-- 스탯 입력 안 했으면 -->
							<div class="moerdetails positionarea"
								onclick="edit_modal('position')">
								
							</div>
						</div>

						<div class="detail_section">

							<div class="detail_title">

								<span class="item">선호 프로젝트 기간</span>

							</div>

							<!-- 기간 입력 안 했으면 -->
							<div class="moerdetails durationarea"
								onclick="edit_modal('duration')">
								
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

</body>
</html>