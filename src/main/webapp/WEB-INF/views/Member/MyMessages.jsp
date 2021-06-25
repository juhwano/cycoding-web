<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="tolist" value="${tolist}" />
<c:set var="fromlist" value="${fromlist}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>

<link type="text/css"
	href="${pageContext.request.contextPath}/css/mymessages.css"
	rel="stylesheet">


</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<body>
	<main>

		<div class="wish_container">
			<div class="wish_section apply_sec">
				<p class="wish_title">MESSAGES</p>
				<div class="wish_project_list">
					<div class="table_sec">
						<div class="info_text_sec">
							<p class="table_name_text">받은 쪽지</p>
						</div>

						<table class="table wish_table apply_table" id="newalarms">
							<thead>

								<tr class="table_head">
									<th>READ</th>
									<th>FROM</th>
									<th>MESSAGE</th>
									<th>DATE</th>
									<th><input type="checkbox" class="all"></th>
								</tr>

							</thead>
							<c:forEach var="tolist" items="${tolist}">
								<c:choose>
									<c:when test="${not empty tolist}">

										<tbody class="apply_table_sec">
											<c:choose>

												<c:when test="${tolist.NOTE_OK eq '0'}">
													<tr class="new" id="to${tolist.NOTE_ID}">
														<td class="isread"><i class="far fa-envelope"></i></td>
														<td class="sender"><a
															href="/member/memberdetailpage?memberid=${tolist.MEMBER_FROM}">${tolist.MEMBER_NICKNAME}</a></td>
														<td class="content"><a href="#to_note_modal"
															class="trigger-btn msg-trigger" data-toggle="modal">${tolist.NOTE_CONTENT}</a>
															<input type="hidden" value="${tolist.NOTE_CONTENT}">
														</td>
														<td class="date">${tolist.NOTE_DATE}</td>
														<td class="del_check"><input type="checkbox"
															class="del_received"></td>
													</tr>

												</c:when>

												<c:when test="${tolist.NOTE_OK eq '1'}">
													<tr class="read" id="to${tolist.NOTE_ID}">
														<td class="isread"><i
															class="fas fa-envelope-open-text"></i></td>
														<td class="sender"><a
															href="/member/memberdetailpage?memberid=${tolist.MEMBER_FROM}">${tolist.MEMBER_NICKNAME}</a></td>
														<td class="content"><a href="#to_note_modal"
															class="trigger-btn msg-trigger" data-toggle="modal">${tolist.NOTE_CONTENT}</a>
															<input type="hidden" value="${tolist.NOTE_CONTENT}">
														</td>
														<td class="date">${tolist.NOTE_DATE}</td>
														<td class="del_check"><input type="checkbox"
															class="del_received"></td>
													</tr>
												</c:when>

											</c:choose>



										</tbody>
									</c:when>
									<c:otherwise>
										<tbody class="apply_table_sec">
											<tr>
												<td>받은 쪽지가 없습니다</td>
											</tr>

										</tbody>

									</c:otherwise>

								</c:choose>
							</c:forEach>
						</table>

						<div class="info_text_sec">
							<p class="info_text">
								<i class="fas fa-cut"></i> 클릭하면 해당 쪽지를 삭제할 수 있어요!
							</p>
						</div>
						<div class="marginBox"></div>


						<div class="info_text_sec">
							<p class="table_name_text">보낸 쪽지</p>
						</div>
						<table class="table wish_table apply_table" id="newalarms">
							<thead>

								<tr class="table_head">
									<th>SEND</th>
									<th>TO</th>
									<th>MESSAGE</th>
									<th>DATE</th>
									<th><input type="checkbox" class="all"></th>
								</tr>

							</thead>
							<c:forEach var="fromlist" items="${fromlist}">
								<c:choose>
									<c:when test="${not empty fromlist}">

										<tbody class="apply_table_sec">
											<tr class="sended" id="from${fromlist.NOTE_ID}">
												<td class="isread"><i class="fas fa-paper-plane"></i></td>
												<td class="sender"><a
													href="/member/memberdetailpage?memberid=${fromlist.MEMBER_TO}">${fromlist.MEMBER_NICKNAME}</a></td>
												<td class="content"><a href="#from_note_modal"
													class="trigger-btn msg-trigger" data-toggle="modal">${fromlist.NOTE_CONTENT}</a>
													<input type="hidden" value="${fromlist.NOTE_CONTENT}">
												</td>
												<td class="date">${fromlist.NOTE_DATE}</td>
												<td class="del_check"><input type="checkbox"
													class="del_send"></td>
											</tr>
										</tbody>
									</c:when>
									<c:otherwise>

										<tbody class="apply_table_sec">
											<tr>
												<td>보낸 쪽지가 없습니다</td>
											</tr>

										</tbody>

									</c:otherwise>

								</c:choose>
							</c:forEach>
						</table>
						<div class="info_text_sec">
							<p class="info_text">
								<i class="fas fa-cut"></i> 클릭하면 해당 쪽지를 삭제할 수 있어요!
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>

	<!-- 수신 창 -->
	<div id="to_note_modal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<p id="modal-title">MESSAGE</p>
				</div>
				<div id="modal-body">
					<!-- <div id="msg_img"></div> -->
					<div class="messagearea">
						<div class="msg_content"></div>
					</div>
					<div class="msg_buttonarea">

						<a href="#to_note_modal" class="trigger-btn" data-toggle="modal">
							<button class="msg_btn" id="reply_btn">답장하기</button>
						</a>
						<a href="#to_note_modal" class="trigger-btn" data-toggle="modal">
							<button class="close_modal">닫기</button>
						</a>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- 발신 창 -->
	<div id="from_note_modal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<p id="modal-title">MESSAGE</p>
				</div>
				<div id="modal-body">
					<!-- <div id="msg_img"></div> -->
					<div class="messagearea">
						<div class="msg_content"></div>
					</div>
					<div class="msg_buttonarea">

						<a href="#from_note_modal" class="trigger-btn" data-toggle="modal">
							<button class="close_modal" id="msg_btn">닫기</button>
						</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/mymessages.js"></script>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>