<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="${pageContext.request.contextPath}/css/findAccount.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<div class="check-container">
		<div class="check-box">
			<div class="check-text">
				<div class="check-form">
					<div class="findEmailBox">
					<i class="fas fa-lock checkIcon"></i>
						<p> 이메일 찾기 </p>
					</div>
					<div class="findEmailBox">
							<input class="check-input" id="userName" placeholder="이름" name="userName" type="text">
							<input class="check-input" id="userPhone" placeholder="핸드폰번호" name="userPhone" type="text">
					</div>
					<button type="button" class="checkBtn" id="findEmailBtn">찾기</button>
				</div>
			</div>
		</div>
		<div class="check-box">
			<div class="check-text">
				<div class="check-form">
					<i class="fas fa-key checkIcon"></i>
					<p> 비밀번호 찾기 </p>
						<input class="check-input" id="userEmail" placeholder="이메일" name="userEmail" type="password">
				</div>
			</div>
		</div>
	</div>
	
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
<script src="${pageContext.request.contextPath}/assets/js/findAccount.js"></script>
</html>