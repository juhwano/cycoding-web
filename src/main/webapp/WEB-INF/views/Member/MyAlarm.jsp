<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="newlist" value="${newalarmlist}" />
<c:set var="oldlist" value="${oldalarmlist}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>

<link type="text/css"
	href="${pageContext.request.contextPath}/css/myalarm.css"
	rel="stylesheet">


</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<body>
	<main>

		<div class="wish_container">
			<div class="wish_section apply_sec">
				<p class="wish_title">MYNEWS</p>
				<div class="wish_project_list">
					<div class="table_sec">
						<!-- 프로젝트목록 -->
						<!-- 지원목록 영역 -->
						<div class="info_text_sec">
							<p class="table_name_text">새 알림내역</p>
						</div>

						<table class="table wish_table apply_table" id="newalarms">

							<c:forEach var="newlist" items="${newlist}">
								<c:choose>
									<c:when test="${not empty newlist}">
										<thead>

											<tr class="table_head">
												<th>${newlist.ALARM_DATE}</th>
											</tr>

										</thead>
										<tbody class="apply_table_sec">
											<tr id="${newlist.ALARM_ID}">
											
												<c:choose>
												
													<c:when test="${newlist.ALARM_CODE eq 'PR_IN' || newlist.ALARM_CODE eq 'PR_S' || newlist.ALARM_CODE eq 'PR_F' || newlist.ALARM_CODE eq 'PR_UP'}">
														<td class="${newlist.ALARM_CODE}" id="${newlist.URL}"><a href="/project/detail?project_id=${newlist.URL}">${newlist.ALARM_CONTENT}</a></td>
													</c:when>
													
													<c:when test="${newlist.ALARM_CODE eq 'PR_A'}">
														<td class="${newlist.ALARM_CODE}" id="${newlist.URL}"><a href="/member/detail?member_id=${newlist.URL}">${newlist.ALARM_CONTENT}</a></td>
													</c:when>
													
													<c:when test="${newlist.ALARM_CODE eq 'MY_RV'}">
														<td class="${newlist.ALARM_CODE}" id="${newlist.URL}"><a href="#${newlist.URL}">${newlist.ALARM_CONTENT}</a></td>
													</c:when>
													
													<c:when test="${newlist.ALARM_CODE eq 'QNAR'}">
														<td class="${newlist.ALARM_CODE}" id="${newlist.URL}"><a href="#${newlist.URL}">${newlist.ALARM_CONTENT}</a></td>
													</c:when>
													
												</c:choose>

											</tr>

										</tbody>
									</c:when>
									<c:otherwise>
										
										<thead>

											<tr class="table_head">
												<th>CLEAR</th>
											</tr>

										</thead>
										<tbody class="apply_table_sec">
											<tr>
												<td>아직 새 알림이 없어요</td>
											</tr>

										</tbody>
									
									</c:otherwise>

								</c:choose>
							</c:forEach>
						</table>

						<div class="info_text_sec">
							<p class="info_text">
								<i class="fas fa-mouse"></i> 클릭하면 해당 페이지로 이동할 수 있어요!
							</p>
						</div>
						<div class="marginBox"></div>

						<!-- 마감된 플젝 -->
						<div class="info_text_sec">
							<p class="table_name_text">지난 알림내역</p>
						</div>
						<table class="table wish_table apply_table" id="oldalarms">

							<c:forEach var="oldlist" items="${oldlist}">
								<c:choose>
									<c:when test="${not empty oldlist}">
										<thead>

											<tr class="table_head">
												<th>${oldlist.ALARM_DATE}</th>
											</tr>

										</thead>
										<tbody class="apply_table_sec">
											<tr id="${oldlist.ALARM_ID}">
												<td class="${oldlist.ALARM_CODE}" id="${oldlist.URL}">${oldlist.ALARM_CONTENT}
												</td>
											</tr>

										</tbody>
									</c:when>
									<c:otherwise>
										
										<thead>

											<tr class="table_head">
												<th>CLEAR</th>
											</tr>

										</thead>
										<tbody class="apply_table_sec">
											<tr>
												<td>지난 알림이 없어요</td>
											</tr>

										</tbody>
									
									</c:otherwise>

								</c:choose>
							</c:forEach>
						</table>
						<div class="info_text_sec">
						<p class="info_text">
							<i class="fas fa-cut"></i> 클릭하면 해당 알림을 삭제할 수 있어요!
						</p>
					</div>
					</div>
				</div>
			</div>

			<div class="wish_section bookmark_sec">
				<p class="wish_title">MESSAGES</p>
				<div class="wish_project_list">
					<div class="info_text_sec">
						<p class="info_text">
							<i class="fas fa-heart"></i> 버튼을 누르면 북마크를 취소할 수 있어요!
						</p>
					</div>
					<div class="table_sec">
						<!-- 프로젝트목록 -->
						<table class="table wish_table bookmark_table">
							<tbody>
								<c:forEach var="bookmark" items="${bookmark_list}">
									<tr>
										<td><i class="fas fa-heart bookmark marking"
											id="${bookmark.project_id}"
											onclick='BookMarking(${bookmark.project_id})'></i></td>
										<td><a
											href="/project/detail?project_id=${bookmark.project_id}">${bookmark.p_title}</a></td>
										<c:if test="${bookmark.p_state eq '모집중'}">
											<td><p class="state_ing">${bookmark.p_state}</p></td>
										</c:if>
										<c:if test="${bookmark.p_state ne '모집중'}">
											<td><p class="state_end">모집완료</p></td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
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
<script src="${pageContext.request.contextPath}/assets/js/myalarm.js?ver=1"></script>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>