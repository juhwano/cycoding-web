<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 스프링 시큐리티 설정 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이좋게 코딩하자</title>

<link type="text/css"
	href="${pageContext.request.contextPath}/css/Charge.css"
	rel="stylesheet">

</head>
<!--  header -->
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	<div class="top_area">
		<div class="area-img">
		<p>Charging</p>
      	</div>
	</div>
	
	
		<main>

		<div id="wrap">
			
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

				<div id="persnal" class="details">
					<p class="cycoder_title">
						나의포인트
					</p>
					<input type="hidden" id="m_id" name="m_id"
						value="${member_id}">
					<ul>
					
						<li><i class="fas fa-coins"></i><span>5000원</span><span>100P</span><button class="charge_btn">충전</button></li>
						<li><i class="far fa-money-bill-alt"></i><span>10000원</span><span>300P</span><button class="charge_btn">충전</button></li>
						<li><i>💰︎</i><span>15000원</span><span>450P</span><button class="charge_btn">충전</button></li>
					
					</ul>
					
					<p>충전 이후에는 환불 및 취소가 불가능합니다</p>

				</div>
				
<!-- 				<div id="buttonarea">
					<button class="charge_btn">충전</button>
				</div> -->

			</div>
		</div>

	</main>
	
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/footer.jsp"></jsp:include>
</html>