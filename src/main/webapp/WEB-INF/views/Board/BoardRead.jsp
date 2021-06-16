<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CYCO 커뮤니티</title>
<style type="text/css">
.fa-plus{color:#90ee90;}
.fa-eraser{color:red;}
.section-header{
	background-image: url("../assets/img/board/read.jpg");
	background-repeat: no-repeat;
    background-size: cover;
    background-size: 100%;
    background-position: center;
}
</style>

<script type="text/javascript">
// 댓글유효성검사
function fn_formSubmit(){
	var form1 = document.form1;
	
	if (form1.MEMBER_ID.value=="") {
		alert("작성자를 입력해주세요.");
		form1.MEMBER_ID.focus();
		return;
	}
	if (form1.REPLY_CONTENT.value=="") {
		alert("글 내용을 입력해주세요.");
		form1.REPLY_CONTENT.focus();
		return;
	}
	form1.submit();	
}
// 댓글 삭제
function fn_replyDelete(REPLY_ID){
	if (!confirm("삭제하시겠습니까?")) {
		return;
	}
	var form = document.form2;

	form.action="replydelete";
	form.REPLY_ID.value=REPLY_ID;
	form.submit();	
} 
// 댓글 수정 + 취소
var updateReno = updateRememo = null;
function fn_replyUpdate(REPLY_ID){
	hideDiv("replyDialog");
	
	var form = document.form2;
	var reply = document.getElementById("REPLY_ID"+REPLY_ID);
	var replyDiv = document.getElementById("replyDiv");
	replyDiv.style.display = "";
	
	if (updateReno) {
		document.body.appendChild(replyDiv);
		var oldReno = document.getElementById("reply"+updateReno);
		oldReno.innerText = updateRememo;
	} 
	
	form.REPLY_ID.value=REPLY_ID;
	form.REPLY_CONTENT.value = reply.innerText;
	reply.innerText ="";
	reply.appendChild(replyDiv);
	updateReno   = REPLY_ID;
	updateRememo = form.REPLY_CONTENT.value;
	form.REPLY_CONTENT.focus();
} 
// 댓글 수정 유효성검사
function fn_replyUpdateSave(){
	var form = document.form2;
	if (form.REPLY_CONTENT.value=="") {
		alert("글 내용을 입력해주세요.");
		form.REPLY_CONTENT.focus();
		return;
	}
	
	form.action="replysave";
	form.submit();	
} 

function fn_replyUpdateCancel(){
	var form = document.form2;
	hideDiv("replyDiv");
	
	var oldReno = document.getElementById("reply"+updateReno);
	oldReno.innerText = updateRememo;
	updateReno = updateRememo = null;
} 
// 대댓글
function hideDiv(id){
	var div = document.getElementById(id);
	div.style.display = "none";
	document.body.appendChild(div);
}

function fn_replyReply(REPLY_ID){
	var form = document.form3;
	var reply = document.getElementById("REPLY_ID"+REPLY_ID);
	var replyDia = document.getElementById("replyDialog");
	replyDia.style.display = "";
	
	if (updateReno) {
		fn_replyUpdateCancel();
	} 
	
	form.REPLY_CONTENT.value = "";
	form.REPLY_REF.value=REPLY_ID;
	reply.appendChild(replyDia);
	form.MEMBER_ID.focus();
} 
function fn_replyReplyCancel(){
	hideDiv("replyDialog");
} 

function fn_replyReplySave(){
	var form = document.form3;
	
	if (form.MEMBER_ID.value=="") {
		alert("작성자를 입력해주세요.");
		form.MEMBER_ID.focus();
		return;
	}
	if (form.REPLY_CONTENT.value=="") {
		alert("글 내용을 입력해주세요.");
		form.REPLY_CONTENT.focus();
		return;
	}
	
	form.action="replysave";
	form.submit();	
}

</script>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<div class="container">
	<div class="section-header"></div>
	<br/>
	<br/>
	
	<header>
		<div>
			<h3>
				<span><c:out value="${boardInfo.FREE_TITLE}"/><br/></span>
			</h3>
			<div>
					<span><c:out value="${boardInfo.MEMBER_NICKNAME}"/></span>&nbsp; | &nbsp;<span><fmt:formatDate value="${boardInfo.FREE_DATE }" pattern="yyyy.MM.dd hh:mm:ss" /></span>
			</div>
			<div class="text-right">		
					<span>조회&nbsp;<c:out value="${boardInfo.FREE_VIEWS}"/></span><br/>
			</div>			
		</div>
	</header>				
                    <textarea cols="120" rows="8" readonly="readonly" disabled><c:out value="${boardInfo.FREE_CONTENT}" escapeXml="false"/></textarea><hr/><br/>
					첨부파일 : 
						<c:forEach var="listview" items="${listview}" varStatus="status">	
            				<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
							<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
						</c:forEach><br/>
		<hr>
        
        <div style="border: 1px solid; width: 1000px; padding: 5px">
			<form name="form1" action="replysave" method="post">
				<input type="hidden" name="FREE_ID" value="<c:out value="${boardInfo.FREE_ID}"/>">
				작성자: <input type="text" name="MEMBER_ID" size="20" maxlength="20"> <br/>
				<textarea name="REPLY_CONTENT" rows="3" cols="60" maxlength="500" placeholder="댓글을 작성해주세요."></textarea>
				<a href="#" onclick="fn_formSubmit()">저장</a>
			</form>
		</div>
		
		<c:forEach var="replylist" items="${replylist}" varStatus="status">
			<div style="border: 1px solid gray; width: 1000px; padding: 5px; margin-top: 5px; 
					margin-left: <c:out value="${20*replylist.DEPT}"/>px; display: inline-block">	
					<c:out value="${replylist.MEMBER_ID}"/> <div class="text-right"><fmt:formatDate value="${replylist.REPLY_DATE }" pattern="MM.dd hh:mm:ss" /><a href="#" onclick="fn_replyDelete('<c:out value="${replylist.REPLY_ID}"/>')">&nbsp;<i class="fas fa-eraser"></i></a>&nbsp;<a href="#" onclick="fn_replyUpdate('<c:out value="${replylist.REPLY_ID}"/>')">&nbsp;<i class="fas fa-pencil-alt"></i></a>&nbsp;<a href="#" onclick="fn_replyReply('<c:out value="${replylist.REPLY_ID}"/>')">&nbsp;<i class="fas fa-plus"></i></a></div> 
<%-- 				<a href="#" onclick="fn_replyDelete('<c:out value="${replylist.REPLY_ID}"/>')">삭제</a> --%>
<%-- 				<a href="#" onclick="fn_replyUpdate('<c:out value="${replylist.REPLY_ID}"/>')">수정</a> --%>
<%-- 				<a href="#" onclick="fn_replyReply('<c:out value="${replylist.REPLY_ID}"/>')">대댓글</a> --%>
				<div id="reply<c:out value="${replylist.REPLY_ID}"/>"><c:out value="${replylist.REPLY_CONTENT}"/></div>
			</div><br/>
		</c:forEach>
		<br/>
		<div id="replyDiv" style="width: 99%; display:none">
			<form name="form2" action="replysave" method="post">
				<input type="hidden" name="FREE_ID" value="<c:out value="${boardInfo.FREE_ID}"/>"> 
				<input type="hidden" name="REPLY_ID"> 
				<textarea name="REPLY_CONTENT" rows="3" cols="60" maxlength="500" placeholder="수정할 댓글을 작성해주세요."></textarea>
				<a href="#" onclick="fn_replyUpdateSave()">저장</a>
				<a href="#" onclick="fn_replyUpdateCancel()">취소</a>
			</form>
		</div>
		<!-- 대댓글 -->
		<br/>
		<div id="replyDialog" style="width: 99%; display:none">
			<form name="form3" action="replysave" method="post">
				<input type="hidden" name="FREE_ID" value="<c:out value="${boardInfo.FREE_ID}"/>"> 
				<input type="hidden" name="REPLY_ID"> 
				<input type="hidden" name="REPLY_REF"> 
				작성자: <input type="text" name="MEMBER_ID" size="20" maxlength="20"> <br/>
				<textarea name="REPLY_CONTENT" rows="3" cols="60" maxlength="500" placeholder="댓글을 작성해주세요."></textarea>
				<a href="#" onclick="fn_replyReplySave()">저장</a>
				<a href="#" onclick="fn_replyReplyCancel()">취소</a>
			</form>
		</div>
		<br/>
		<div class="text-right">
			<a href="form?FREE_ID=<c:out value="${boardInfo.FREE_ID}"/>" class="btn btn-outline-primary">수정</a>
	        <a href="delete?FREE_ID=<c:out value="${boardInfo.FREE_ID}"/>" class="btn btn-default">삭제</a>
	        <a href="#" onclick="history.back(-1)" class="btn btn-default">취소</a>
        </div>
</div>
</body>
</html>