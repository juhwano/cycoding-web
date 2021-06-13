<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CYCO 커뮤니티</title>
<script>
function fn_formSubmit(){
	var form = document.form;
	
	if (form.MEMBER_ID.value=="") {
		alert("작성자를 입력해주세요.");
		form.MEMBER_ID.focus();
		return;
	}
	if (form.FREE_TITLE.value=="") {
		alert("글 제목을 입력해주세요.");
		form.FREE_TITLE.focus();
		return;
	}
	if (form.FREE_CONTENT.value=="") {
		alert("글 내용을 입력해주세요.");
		form.FREE_CONTENT.focus();
		return;
	}
	document.form.submit();	
} 
</script>
</head>
<body>
	<form name="form" action="save" method="post" enctype="multipart/form-data">
		<table border="1" style="width:600px">
			<caption>CYCO 커뮤니티</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>글쓴이</td> 
					<td><input type="text" name="MEMBER_ID" size="20" maxlength="20" value="<c:out value="${boardInfo.MEMBER_ID}"/>"></td> 
				</tr>
				<tr>
					<td>제목</td> 
					<td><input type="text" name="FREE_TITLE" size="70" maxlength="250" value="<c:out value="${boardInfo.FREE_TITLE}"/>"></td> 
				</tr>
				<tr>
					<td>내용</td> 
					<td><textarea name="FREE_CONTENT" rows="5" cols="60"><c:out value="${boardInfo.FREE_CONTENT}"/></textarea></td> 
				</tr>
				<tr>
					<td>첨부</td> 
					<td>
						<c:forEach var="listview" items="${listview}" varStatus="status">
							<input type="checkbox" name="fileno" value="<c:out value="${listview.fileno}"/>">	
            				<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
							<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
						</c:forEach>					
						
						<input type="file" name="uploadfile" multiple="" />
					</td> 
				</tr>
			</tbody>
		</table>    
		<input type="hidden" name="FREE_ID" value="<c:out value="${boardInfo.FREE_ID}"/>"> 
		<a href="#" onclick="fn_formSubmit()">등록</a>
		<a href="#" onclick="history.back(-1)">취소</a>
	</form>	
</body>
</html>
