<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CYCO 커뮤니티</title>
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
<body>
	<table border="1" style="width:600px">
		<caption>CYCO 커뮤니티</caption>
		<colgroup>
			<col width='8%' />
			<col width='*%' />
			<col width='15%' />
			<col width='15%' />
			<col width='10%' />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th> 
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>조회</th>
				<th>첨부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="listview" items="${listview}" varStatus="status">	
				<c:url var="link" value="read">
					<c:param name="FREE_ID" value="${listview.FREE_ID}" />
				</c:url>		
				
				<tr>
					<td>
						<c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/>					
					</td>
					<td style="border: 1px solid black; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
					<a href="${link}"><c:out value="${listview.getShortTitle(35)}"/></a>
					</td>
					<td><c:out value="${listview.MEMBER_ID}"/></td>
					<td><fmt:formatDate value="${listview.FREE_DATE }"
					 pattern="MM.dd" /></td>
					<td><c:out value="${listview.FREE_VIEWS}"/></td>
					<td><c:out value="${listview.filecnt}"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div>
		<a href="form">글쓰기</a>
	</div>
	
	<form id="form1" name="form1"  method="post">
		<!-- 페이징 호출2 -->
	    <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
	    
		<div>
			<input type="checkbox" name="searchType" onclick="checkOnlyOne(this)" value="FREE_TITLE" <c:if test="${fn:indexOf(searchVO.searchType, 'FREE_TITLE')!=-1}">checked="checked"</c:if>/>
			<label class="chkselect" for="searchType1">제목</label>
			<input type="checkbox" name="searchType" onclick="checkOnlyOne(this)" value="FREE_CONTENT" <c:if test="${fn:indexOf(searchVO.searchType, 'FREE_CONTENT')!=-1}">checked="checked"</c:if>/>
			<label class="chkselect" for="searchType2">내용</label>
			<input type="text" name="searchKeyword" style="width:150px;" maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>' onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">
			<input name="btn_search" value="검색" class="btn_sch" type="button" onclick="fn_formSubmit()" />
		</div>
	</form>	   
</body>
</html>
