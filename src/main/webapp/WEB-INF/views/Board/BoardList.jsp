<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
// 	양식 다시 제출 방지
	response.setHeader("Cache-Control","no-store"); 
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader("Expires",0);
	if (request.getProtocol().equals("HTTP/1.1")){ 
		response.setHeader("Cache-Control", "no-cache");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="width=device-width; initial-scale=1; text/html; charset=utf-8" />
<title>CYCO 커뮤니티</title>


<style type="text/css">
table {
	font-size: 14px;
}
.section-header{
	background-image: url("../assets/img/board/list.jpg");
	background-repeat: no-repeat;
    background-size: cover;
    background-size: 100%;
    background-position: center;
}
</style>
<script>
// 페이징
function fn_formSubmit(){
	document.form1.submit();	
}
// 검색 체크박스 하나만 선택되게
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("searchType");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
}

</script>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<br/>
<div class="container">
<div class="section-header"></div>
<div class="table-responsive-sm" style="overflow-x:auto;">
	<table class="table table-hover" style="width:1300px">
		<colgroup>
<%-- 			<col style="width: 25%;"> --%>
<%-- 			<col width='8%' /> --%>
<%-- 			<col width='*%' /> --%>
<%-- 			<col width='15%' /> --%>
<%-- 			<col width='15%' /> --%>
<%-- 			<col width='10%' /> --%>
		</colgroup>
		<thead>
			<tr>
				<th scope="col" class="text-center">번호</th> 
				<th scope="col" class="text-center">제목</th>
				<th scope="col" class="text-center">글쓴이</th>
				<th scope="col" class="text-center">작성일</th>
				<th scope="col" class="text-center">조회</th>
				<th scope="col" class="text-center">첨부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listview" items="${listview}" varStatus="status">	
				<c:url var="link" value="read">
					<c:param name="FREE_ID" value="${listview.FREE_ID}" />
				</c:url>		
				
				<tr>
					<td align="center">
						<c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/>					
					</td>
					<td>
						<a href="${link}"><c:out value="${listview.getShortTitle(35)}"/></a>
					</td>
					<td align="center"><c:out value="${listview.MEMBER_ID}"/></td>
					<td align="center"><fmt:formatDate value="${listview.FREE_DATE }"
					 pattern="MM.dd" /></td>
					<td align="center"><c:out value="${listview.FREE_VIEWS}"/></td>
					<td align="center"><c:out value="${listview.filecnt}"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
		<div class="text-right">
			<a href="form" class="btn btn-outline-primary">글쓰기</a>
		</div>
	<div class="text-center">
	<form id="form1" name="form1"  method="post">
		<!-- 페이징 호출2 -->
	    	<jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
		<div class="form-group">
			<input type="checkbox" name="searchType" onclick="checkOnlyOne(this)" value="FREE_TITLE" <c:if test="${fn:indexOf(searchVO.searchType, 'FREE_TITLE')!=-1}">checked="checked"</c:if>/>
			<label class="chkselect" for="searchType1">제목</label>
			<input type="checkbox" name="searchType" onclick="checkOnlyOne(this)" value="FREE_CONTENT" <c:if test="${fn:indexOf(searchVO.searchType, 'FREE_CONTENT')!=-1}">checked="checked"</c:if>/>
			<label class="chkselect" for="searchType2">내용</label>
			<input type="text" name="searchKeyword" style="width:200px;" maxlength="50" placeholder="검색" value='<c:out value="${searchVO.searchKeyword}"/>' onkeydown="if(event.keyCode == 13) { fn_formSubmit();}"><button  name="btn_search" style="border:none; color:white; background:#CA8FAB; height:33px;" class="btn_sch input-group-addon" type="button" onclick="fn_formSubmit()"><span class="fas fa-search"></span></button>
		</div>
	</form>
	</div>
</div>
</body>
</html>
