<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
<link type="text/css"
	href="${pageContext.request.contextPath}/css/wishProject.css"
	rel="stylesheet">
</head>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	<c:set var="teamLeaderList" value="${teamLeaderList}" />
	<c:set var="teamMemberList" value="${teamMemberList}" />
	
	<div class="wish_container">
		<div class="wish_section apply_sec">
			<p class="wish_title">MY PROJECT</p>
			<div class="wish_project_list">
					<div class="table_sec">
					<!-- 프로젝트목록 -->
					<!-- 지원목록 영역 -->
					<div class="info_text_sec">
						<p class="table_name_text">회원 목록</p>
					</div>
					<table class="table wish_table apply_table">
						<thead>
							<tr class="table_head">
								<th>분야</th>
								<th>프로젝트명</th>
								<th>포지션</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody class="apply_table_sec">
							<c:forEach var="L_project" items="${teamLeaderList}">
								<c:if test="${L_project.p_state eq '모집중' || L_project.p_state eq '진행중'}">
									<tr>
										<td>${L_project.field_name}</td>
										<td><a href="/project/detail?project_id=${L_project.project_id}">${L_project.p_title}</a></td>
										<td>팀장 <i class="fas fa-crown leaderIcon"></i></td>
										<c:if test="${L_project.p_state eq '진행중'}">
											<td><p class="state_end">진행중</p></td>
										</c:if>
										<c:if test="${L_project.p_state eq '모집중'}">
											<td><p class="state_end">모집중</p></td>
										</c:if>
									</tr>
								</c:if>
							</c:forEach>
							<c:forEach var="M_project" items="${teamMemberList}">
								<c:if test="${M_project.p_state eq '모집중' || M_project.p_state eq '진행중'}">
									<tr>
										<td>${M_project.field_name}</td>
										<td><a href="/project/detail?project_id=${M_project.project_id}">${M_project.p_title}</a></td>
										<td>${M_project.position_name}</td>
										<c:if test="${M_project.p_state eq '진행중'}">
											<td><p class="state_end">진행중</p></td>
										</c:if>
										<c:if test="${M_project.p_state eq '모집중'}">
											<td><p class="state_end">모집중</p></td>
										</c:if>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<div class="marginBox"></div>
					
					<!-- 마감된 플젝 -->
					<div class="info_text_sec">
						<p class="table_name_text">완료된 프로젝트</p>
					</div>
					<table class="table wish_table apply_table">
						<thead>
							<tr class="table_head">
								<th>분야</th>
								<th>프로젝트명</th>
								<th>포지션</th>
								<th>후기</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="L_project" items="${teamLeaderList}">
								<c:if test="${L_project.p_state eq '완료'}">
									<tr>
										<td>${L_project.field_name}</td>
										<td><a href="/project/detail?project_id=${L_project.project_id}">${L_project.p_title}</a></td>
										<td>팀장 <i class="fas fa-crown leaderIcon"></i></td>
										<!-- 여기 채워야됨 -->
										<td><p class="state_ban">작성완료</p></td>
									</tr>
								</c:if>
							</c:forEach>
							<c:forEach var="M_project" items="${teamMemberList}">
								<c:if test="${M_project.p_state eq '완료'}">
									<tr>
										<td>${M_project.field_name}</td>
										<td><a href="/project/detail?project_id=${M_project.project_id}">${M_project.p_title}</a></td>
										<td>${M_project.position_name}</td>
										<!-- 여기 채워야돼~~ -->
										<td><a href="#reviewModal"><p class="state_ing">작성하기</p></a></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<div class="info_text_sec">
						<p class="info_text_point">
							후기를 작성하시면 10포인트를 드려요!
						</p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="wish_section bookmark_sec">
			<p class="wish_title">REVIEW</p>
				<!-- 리뷰 div -->
				<div id="review" class="details">
					<div class="reviewBox">
					
					<c:set var="last_flag" value="true"/>
					<!-- list_size : reviewList의 크기 -->
					<c:set var="list_size" value="${fn:length(reviewList)}"/>
					
					<!-- 리뷰가 1개도 없는 경우 문구 출력 -->
					<c:if test="${list_size == 0}">
						<div class="review_nothing">
							<p> 아직 남겨진 리뷰가 없습니다. </p>
						</div>
					</c:if>
					
					<!-- 리뷰 리스트 뿌리기 -->
						<c:forEach var="reviewList" items="${reviewList}" varStatus="status" begin="0" end="3">
							<c:set var="last_flag" value="false"/>
							<!-- if문을 통해 현재 index가 project_list의 끝인지 검사 -->
							<c:if test="${status.count eq list_size}">
								<c:set var="last_flag" value="true"/>
							</c:if>
							
							<!-- 리뷰 start -->
									<div class="col-12 reviews">
										<h5 class="reviewWriter"><c:out value="${reviewList.member_nickname}" /></h5>
										<div class="star-rate">
											<c:forEach begin="1" step="1" end="${reviewList.review_grade}">
												<i class="fas fa-star review-star"></i>
											</c:forEach>
											
										</div>
										<p class="review-content"><c:out value="${reviewList.review_content}" /></p>
									</div>
						</c:forEach>
						<!-- 리뷰 end -->
						
					</div>
					
						<div class="moreSec">
						<!-- 리뷰 끝나면 더보기 버튼 안보이게하기 -->
							<c:if test="${not last_flag}">
								<p class="moreLink" id="moreBtn"> + 더보기</p>
							</c:if>
						</div>
				</div>
				<!-- 리뷰 div end -->
				<!-- 탑버튼 -->
				<img id="topBtn" src="${pageContext.request.contextPath}/assets/img/ain_test/topBtn.png">
		</div>
	</div>
	
	<div id="reviewModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<p id="modal-title">후기 작성하기</p>
				</div>
				<div id="modal-body">
					<div id="contentarea">
						
						
						
						
						
						
					</div>
					<div id="buttonarea">
						<a href="#reviewModal" class="trigger-btn" data-toggle="modal">
							<button id="cancel_quit">닫기</button>
						</a>
						<a href="#quit_modal" class="trigger-btn" data-toggle="modal">
							<button id="quit">작성</button>
						</a>
					</div>

				</div>


			</div>
		</div>
	</div>
</body>

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
<script type="text/javascript">
	/* js로 보내주기 */
	var reviewList = ${reviewList};
</script>
<script src="${pageContext.request.contextPath}/assets/js/memberdetail.js?ver=1"></script>
</html>