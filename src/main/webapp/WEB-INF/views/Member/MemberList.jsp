<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<!-- member CSS -->
<link type="text/css" href="${pageContext.request.contextPath}/css/member.css?ver=1" rel="stylesheet">
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
   <!-- http://localhost:8090/memberlist.cy -->
   
   <!-- 탑버튼 -->
   <img id="topBtn" src="${pageContext.request.contextPath}/assets/img/ain_test/topBtn.png">

   <div class="top_area">
      <img id="memberListHeader" src="${pageContext.request.contextPath}/assets/img/ain_test/MemberListHeader.png">
   </div>

   <c:set var="memberList" value="${memberList}" />
   <c:set var="positionList" value="${positionList}" />

   <div class="section section-md">

      <div class="m_container">
		
         <div class="select_section">
            <!-- select 필터링 -->
            <select class="form-select m_sel" id="inlineFormCustomSelectPref"
               aria-label="Default select example">
               <option value="전체">선호포지션: 전체</option>
               <c:forEach var="position" items="${positionList}">
                  <c:if test="${position.position_enabled eq '1'}">
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
         	<!-- 카드 test -->
         	<!-- 1 -->
         	<!-- col-12 col-md-6 col-lg-4 mb-5 -->
         	<div class="cardNum">
                     <div class="card shadow">
                        <div class="m_img_test">
                           <img class="m_img_size_test" src="${pageContext.request.contextPath}/assets/img/ain_test/2.jpg">
                        </div>
                        <div class="card-body-test">
                           <h3 class="h5 mt-3 card-title-test">닉네임</h3>
                           <p class="card-text card-text-test">
                              안드로이드
                           </p> 
                           <p class="tags tags-test"># 타임스크립트</p>
                           <a href="" class="card_link">VIEW MORE</a>
                        </div>
                     </div>
             </div>
             <!-- 2 -->
             <div class="cardNum">
                     <div class="card shadow">
                        <div class="m_img_test">
                           <img class="m_img_size_test" src="${pageContext.request.contextPath}/assets/img/ain_test/1.jpg">
                        </div>
                        <div class="card-body-test">
                           <h3 class="h5 mt-3 card-title-test">테스트</h3>
                           <p class="card-text card-text-test">
                              웹서버
                           </p> 
                           <p class="tags tags-test"># 자바</p>
                           <a href="" class="card_link">VIEW MORE</a>
                        </div>
                     </div>
             </div>
             <!-- 3 -->
             <div class="cardNum">
                     <div class="card shadow">
                        <div class="m_img_test">
                           <img class="m_img_size_test" src="${pageContext.request.contextPath}/assets/img/ain_test/3.jpg">
                        </div>
                        <div class="card-body-test">
                           <h3 class="h5 mt-3 card-title-test">테스트</h3>
                           <p class="card-text card-text-test">
                              UXUI디자인
                           </p> 
                           <p class="tags tags-test"># 자바스크립트</p>
                           <a href="" class="card_link">VIEW MORE</a>
                        </div>
                     </div>
             </div>
             <!-- 4 -->
             <div class="cardNum">
                     <div class="card shadow">
                        <div class="m_img_test">
                           <img class="m_img_size_test" src="${pageContext.request.contextPath}/assets/img/ain_test/3.jpg">
                        </div>
                        <div class="card-body-test">
                           <h3 class="h5 mt-3 card-title-test">테스트</h3>
                           <p class="card-text card-text-test">
                              UXUI디자인
                           </p> 
                           <p class="tags tags-test"># 자바스크립트</p>
                           <a href="" class="card_link">VIEW MORE</a>
                        </div>
                     </div>
             </div>
         
            
         </div>
            <!-- 더보기버튼 -->
            <div class="more_sec">
               <button class="moreBtn" type="button">더보기</button>
            </div>
      </div>
   </div>
</body>
<!-- MemberList Javascript -->
<script src="${pageContext.request.contextPath}/assets/js/memberList.js?ver=1"></script>
</html>