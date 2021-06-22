<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이좋게 코딩하자 - 프로젝트 수정</title>

</head>
<jsp:include page="../include/header.jsp"></jsp:include>

<!-- project css -->
<link type="text/css"
	href="${pageContext.request.contextPath}/css/admin.css"
	rel="stylesheet">


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="positionList" value="${positionList}"></c:set>
<c:set var="fieldList" value="${fieldList}"></c:set>
<c:set var="skillList" value="${skillList}"></c:set>



<body>
<section class="min-vh-100 d-flex align-items-center border-top" style="background-color: #fdfcfc">
		<div class="Ad_container">
			<div class="row justify-content-center">
				<div class=subject>
					<span>사이트 관리</span>
					
				</div>
			</div>
			<div class="card_list">
			<div class="listname-head">
				<div class="listname">
				<span>기술 목록</span>
				</div>
			<div class="addbox">
			<span>추가 할 기술 목록 : </span>
			<input type="text" class="form-control" id="skillInput" placeholder="Enter로 추가">
			</div>
				
				</div>
				
				<hr>
				<div class="wholearea">
				<p class="Project_p">
					<b style="color: red;">*</b> 활성화 될 목록
				</p>
						<div class = tagarea id="skill_tagarea">
							<c:forEach var="skill" items="${skillList}">
								<c:if test="${skill.skill_enabled eq 1}">
									<div class="tags">
										<input type="text" name="skill_name" value="${skill.skill_name}" readonly="readonly">
										<input type="text" name="skill_enabled" value="${skill.skill_enabled}" hidden="">
										<input type="text" name="skill_code" value="${skill.skill_code}" hidden="">
										
									</div>
								</c:if>
							</c:forEach>
						</div>
						<hr>
						<p class="Project_p">
							<b style="color: red;">*</b> 비 활성화 될 목록
						</p>
						<div class=selectedarea id="skill_selectedarea">
							<c:forEach var="skill" items="${skillList}">
							<c:if test="${skill.skill_enabled eq 0}">
								<div class="clicked">
									<input type="text" name="skill_name" value="${skill.skill_name}" readonly="readonly">
										<input type="text" name="skill_enabled" value="${skill.skill_enabled}" hidden="">
										<input type="text" name="skill_code" value="${skill.skill_code}" hidden="">
								</div>
							</c:if>
							</c:forEach>
						</div>
				
				</div>
			</div>
			<div class="updateContainer">
				<div class="updateWrapper">
					<button class="updateBtn" id="skillBtn">수정하기</button>
				</div>
			</div>
			
			<div class="card_list">
			<div class="listname-head">
				<div class="listname">
				<span>기술 목록</span>
				</div>
			<div class="addbox">
			<input type="text" class="form-control" placeholder="Enter로 추가">
			</div>
				
				</div>
				
				<hr>
				<div>
				<p class="Project_p">
					<b style="color: red;">*</b> 활성화 될 목록
				</p>
					<div>
						<div class="tagarea" id="position_tagarea">
							<c:forEach var="skill" items="${skillList}">
								<c:if test="${skill.skill_enabled eq 1}">
									<div class="tags">
										<input type="text" value="${skill.skill_name}"
											readonly="readonly"> <input type="text"
											value="${skill.skill_code}" hidden="">
									</div>
								</c:if>
							</c:forEach>
						</div>
						<hr>
						<p class="Project_p">
							<b style="color: red;">*</b> 비 활성화 될 목록
						</p>
						<div id="selectedarea">
							<c:forEach var="skill" items="${skillList}">
							<c:if test="${skill.skill_enabled eq 0}">
								<div class="clicked">
									<input type="text" value="${skill.skill_name}"
										readonly="readonly"> <input type="text"
										value="${skill.skill_code}" hidden=""
										name="skill_code">
								</div>
							</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="card_list">
				<div class="listname-head">
					<div class="listname">
					<span>기술 목록</span>
					</div>
					<div class="addbox">
					<input type="text" class="form-control" placeholder="Enter로 추가">
					</div>
					
				</div>
				
				<hr>
				<div>
				<p class="Project_p">
					<b style="color: red;">*</b> 활성화 될 목록
				</p>
					<div>
						<div id="tagarea">
							<c:forEach var="skill" items="${skillList}">
								<c:if test="${skill.skill_enabled eq 1}">
									<div class="tags">
										<input type="text" value="${skill.skill_name}"
											readonly="readonly"> <input type="text"
											value="${skill.skill_code}" hidden="">
									</div>
								</c:if>
							</c:forEach>
						</div>
						<hr>
						<p class="Project_p">
							<b style="color: red;">*</b> 비 활성화 될 목록
						</p>
						<div id="selectedarea">
							<c:forEach var="skill" items="${skillList}">
							<c:if test="${skill.skill_enabled eq 0}">
								<div class="clicked">
									<input type="text" value="${skill.skill_name}"
										readonly="readonly"> <input type="text"
										value="${skill.skill_code}" hidden=""
										name="skill_code">
								</div>
							</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		 </section>
</body>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>


<script
	src="${pageContext.request.contextPath}/assets/js/adminSite.js"></script>
</html>
