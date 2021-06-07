<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<!-- member CSS -->
<link type="text/css" href="../css/member.css" rel="stylesheet">
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
	<!-- http://localhost:8090/memberlist.cy -->
	
	<!-- 탑버튼 -->
	<img id="topBtn" src="../assets/img/ain_test/topBtn.png">

	<div class="top_area">
		<img id="memberListHeader" src="../assets/img/ain_test/MemberListHeader.png">
	</div>

	<c:set var="memberList" value="${memberList}" />
	<c:set var="positionList" value="${positionList}" />

	<div class="section section-md">

		<div class="m_container">

			<div class="select_section">
				<!-- select 필터링 -->
				<select class="form-select m_sel" id="inlineFormCustomSelectPref"
					aria-label="Default select example">
					<option value="">선호포지션: 전체</option>
					<c:forEach var="position" items="${positionList}">
						<c:if test="${position.position_enable eq '1'}">
							<option value="${position.position_name}">${position.position_name}</option>
						</c:if>
					</c:forEach>
				</select>
				<!-- 닉네임검색 -->
				<div class="input-group m_search">
					<input type="text" class="form-control" id="memberNickname" placeholder="회원 닉네임" aria-label="Search" aria-describedby="basic-addon2">
					<span class="input-group-text" id="memberSearch">
						<span class="fas fa-search"></span>
					</span>
				</div>
			</div>
			
			

			<div class="row mb-5" id="card_section">
				<!-- 회원카드 -->
				<c:forEach var="member" items="${memberList}">
					<div class="col-12 col-md-6 col-lg-4 mb-5">
						<div class="card shadow">
							<img src="../assets/img/ain_test/${member.m_image}">
							<div class="card-body">
								<h3 class="h5 card-title mt-3">${member.m_nick}</h3>
								<p class="card-text">
									- 선호포지션: ${member.position} <br> - 기술스택: ${member.skill}
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 회원카드end -->

			</div>
		</div>
	</div>
</body>
<!-- js파일로 빼기 -->
<script type="text/javascript">
		/* 회원카드 공간 */
		var card_section = $('#card_section');

		/* 포지션select */
		$(".m_sel").change(function() {
			console.log('셀렉트')
			
			
			card_section.empty();
			
			var position = $(".m_sel").val()
			
			console.log(position)
			
			$.ajax({
				url: "memberPosition/"+position+".cy",
				//data: {position:position},
				type: 'get',
				//dataType: 'text',
				success: function(memberList) {
					console.log(memberList);
					
					$.each(memberList, function(index,member) {
						var card = "<div class='col-12 col-md-6 col-lg-4 mb-5'>";
							card += "<div class='card shadow'> <img src='../assets/img/ain_test/"+member.m_image+"'>";
							card +=	"<div class='card-body'>";
							card +=	"<h3 class='h5 card-title mt-3'>"+member.m_nick+"</h3>";
							card +=	"<p class='card-text'>";
							card +=	"- 선호포지션: "+member.position+" <br> - 기술스택:"+member.skill;
							card +=	"</p> </div> </div> </div>";
							$(card_section).append(card);
					})
				}
				
			})
			
		})
		
		/* 닉네임검색 */
		$("#memberSearch").click(function() {
			console.log('닉네임검색')
			
			card_section.empty();
			
			var memberNickname = $("#memberNickname").val()
			console.log("검색할닉네임: "+memberNickname);
			
			var searchurl = "memberSearch/"+memberNickname+".cy";
			
			$.ajax({
				url: searchurl,
				type: 'get',
				success: function(memberList) {
					console.log(memberList);
					
					$.each(memberList, function(index,member) {
						var card = "<div class='col-12 col-md-6 col-lg-4 mb-5'>";
							card += "<div class='card shadow'> <img src='../assets/img/ain_test/"+member.m_image+"'>";
							card +=	"<div class='card-body'>";
							card +=	"<h3 class='h5 card-title mt-3'>"+member.m_nick+"</h3>";
							card +=	"<p class='card-text'>";
							card +=	"- 선호포지션: "+member.position+" <br> - 기술스택:"+member.skill;
							card +=	"</p> </div> </div> </div>";
							$(card_section).append(card);
					})
				}
				
			})
			 
		})
		
		/* 탑버튼 */
		$(function() {
		    $(window).scroll(function() {
		        if ($(this).scrollTop() > 280) {
		            $('#topBtn').fadeIn();
		        } else {
		            $('#topBtn').fadeOut();
		        }
		    });
		    $("#topBtn").click(function() {
		        $('html, body').animate({
		            scrollTop : 0
		        }, 10);
		        return false;
		    });
		});
</script>
</html>