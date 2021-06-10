<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<body>
	<div class="main_">
		<!-- Project main -->
		<div class="main_area_l">
		
			<div class="container main_center">
				<p>나와 맞는 <br> 프로젝트를 찾아보세요.</p>

				<a href="/project/list"><img src="${pageContext.request.contextPath}/assets/img/main_page/Project_arrow.png"></a>


			</div>
		</div>
		
		<!-- Member main -->
		<div class="main_area_r">
			
			<div class="container main_center">
				<p>함께 할<br> 팀원을 찾아보세요.</p>
				<a href="mypage.cy?useremail=${LoginUser}"><img src="${pageContext.request.contextPath}/assets/img/main_page/Member_arrow.png"></a>

			</div>
		</div>
	</div>
</body>
</html>