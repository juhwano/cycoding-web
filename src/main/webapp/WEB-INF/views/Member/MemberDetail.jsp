<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="member" value="${aboutmember}" />
<c:set var="skills" value="${skills}" />
<c:set var="position" value="${position}" />
<c:set var="durations" value="${durations}" />

<!-- 배열에서 값 뽑아내기 -->





<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>

<link type="text/css" href="${pageContext.request.contextPath}/css/memberdetail.css" rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<body>
	<main>

		<div id="wrap">
			<div id="profile_img">
				<!-- <img src="assets/img/member_detail/cycoding_img.png"> -->
				<img src="${pageContext.request.contextPath}/resources/${member.MEMBER_IMAGE}">
			</div>
			<div id="cycoder">
				<p>${member.MEMBER_NICKNAME}</p>
			</div>

<!-- 			<div id="modals">
				<ul>
					<li>지원내역</li>
					<li>프로젝트</li>
				</ul>
			</div> -->

			<div id="detail_box">

					<div id="info" class="details">
					<p class="cycoder_title">ABOUT<br>CYCODER
					<p class="sub_title"></p>

					<div class="infolist">

						<div class="detail_section">

							<div class="detail_title">
								<span class="item">보유기술</span>
							</div>
							<!-- 스탯 입력 안 했으면 -->


							<div class="moerdetails skillarea" onclick="edit_modal('skill')">
								<c:choose>


									<c:when test="${empty skills}">

											<div class="none">미입력</div>

									</c:when>
									<c:otherwise>
										<c:forEach var="sarr" items="${skills}" varStatus="status">
											<c:choose>
												<c:when test="${status.index eq 0 }">

														<!-- <span id="star">★</span> -->
														<i class="fa fa-star" id=star></i>
														<div class="info_tags main_skill skill">

															<c:out value="${sarr.skill_name}" />

														</div>
													
												</c:when>
												<c:otherwise>
	
														<div class="info_tags skill">
															<c:out value="${sarr.skill_name}" />
														</div>
												
												</c:otherwise>
											</c:choose>

										</c:forEach>


									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="detail_section itmelist">

							<div class="detail_title">

								<span class="item">프로젝트 경험여부</span>

							</div>
							<!-- 스탯 입력 안 했으면 -->
							<div class="moerdetails experience"
								onclick="edit_modal('experience')">
								<c:choose>




									<c:when test="${empty skills}">


										<div id="ex_btn"
											style="display: flex; align-items: center; width: 350px; margin: auto; justify-content: space-btween;">
											<div class="none experience" id="never">미입력</div>

										</div>


									</c:when>
									<c:otherwise>

										<div
											style="display: flex; align-items: center; width: 350px; margin: auto; justify-content: space-btween;" id="ex_toggle">
																					<div id="ex_btn"
											style="display: flex; align-items: center; width: 350px; margin: auto; justify-content: space-btween;">
											<div class="none experience" id="never">미입력</div>

										</div>

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

					
											<div class="none">미입력</div>
								

									</c:when>
									<c:otherwise>

										<c:forEach var="position" items="${position}">
						
												<div class="info_tags position">
													<c:out value="${position.position_name}" />
												</div>
										
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

						
											<div class="none">미입력</div>
								

									</c:when>
									<c:otherwise>


										<c:forEach var="darr" items="${durations}">
									
												<div class="info_tags duration">
													<c:out value="${darr.du_date}" />
												</div>
									
										</c:forEach>


									</c:otherwise>
								</c:choose>
							</div>
						</div>


					</div>


					<%-- 			<div class="infolist">
			
				<div class="detail_section">
				
					<div class="detail_title">
						<span class="item">보유기술</span>
						<a href="#m_stat" class="trigger-btn" data-toggle="modal">
							<button type="button" class="modify_p_info right-btn" onclick="edit_modal('skill')">수정</button>
						</a>
					</div>
					<div class="moerdetails">
							<c:forEach var="sarr" items="${skills}">
								<div class="info_tags"><c:out value="${sarr.skill_name}"/></div>
							</c:forEach>
						
						</div>
				</div>
				
				<div class="detail_section itmelist">
				
					<div class="detail_title">
					
						<span class="item">프로젝트 경험여부</span><button type="button" class="modify_p_info right-btn">수정</button>
					
					</div>
				</div>
				
				<div class="detail_section">				
					<div class="detail_title">
					
						<span class="item">선호 포지션</span><button type="button" class="modify_p_info">수정</button>
					
					</div>
				</div>
				
				<div class="detail_section">
				
					<div class="detail_title">
					
						<span class="item">선호 프로젝트 기간</span>
						<a href="#m_stat" class="trigger-btn" data-toggle="modal">
							<button type="button" class="modify_p_info right-btn" onclick="edit_modal('duration')">수정</button>
						</a>
					
					</div>
					<div class="moerdetails">
							<c:forEach var="darr" items="${durations}">
								<div class="info_tags"><c:out value="${darr.du_date}"/></div>
							</c:forEach>
						</div>
				</div>
			
						
			</div>  --%>




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
							<button id="edit-btn">수정</button>
						</a> <a href="#m_stat" class="trigger-btn" data-toggle="modal">
							<button id="cancel">닫기</button>
						</a>
					</div>

				</div>


			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/assets/js/memberdetail.js?ver=6"></script>
</body>
</html>