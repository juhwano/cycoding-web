<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CYCO 커뮤니티</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<body>
        <table border="1" style="width:600px">
            <caption>CYCO 커뮤니티</caption>
            <colgroup>
                <col width='15%' />
                <col width='*%' />
            </colgroup>
            <tbody>
            	<tr>
                    <td>글번호</td>
                    <td><c:out value="${boardInfo.FREE_ID}"/></td>
                </tr>
                <tr>
                    <td>작성일</td>
                    <td><fmt:formatDate value="${boardInfo.FREE_DATE }"
					 pattern="yyyy.MM.dd hh:mm:ss" /></td>
                </tr>
                <tr>
                    <td>글쓴이</td>
                    <td><c:out value="${boardInfo.MEMBER_ID}"/></td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><c:out value="${boardInfo.FREE_TITLE}"/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><c:out value="${boardInfo.FREE_CONTENT}" escapeXml="false"/></td>
                </tr>
                <tr>
                    <td>조회</td>
                    <td><c:out value="${boardInfo.FREE_VIEWS}"/></td>
                </tr>
                <tr>
					<td>첨부</td> 
					<td>
						<c:forEach var="listview" items="${listview}" varStatus="status">	
            				<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
							<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
						</c:forEach>					
					</td> 
				</tr>
            </tbody>
        </table>   
        <a href="delete?FREE_ID=<c:out value="${boardInfo.FREE_ID}"/>">삭제</a>
        <a href="form?FREE_ID=<c:out value="${boardInfo.FREE_ID}"/>">수정</a>
        <a href="#" onclick="history.back(-1)">취소</a>
        <p>&nbsp;</p>
        
        <div style="border: 1px solid; width: 600px; padding: 5px">
			<form name="form1" action="replysave" method="post">
				<input type="hidden" name="FREE_ID" value="<c:out value="${boardInfo.FREE_ID}"/>">
				작성자: <input type="text" name="MEMBER_ID" size="20" maxlength="20"> <br/>
				<textarea name="REPLY_CONTENT" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
				<a href="#" onclick="fn_formSubmit()">저장</a>
			</form>
		</div>
		
		<c:forEach var="replylist" items="${replylist}" varStatus="status">
			<div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; 
					margin-left: <c:out value="${20*replylist.DEPT}"/>px; display: inline-block">	
					<c:out value="${replylist.MEMBER_ID}"/> <fmt:formatDate value="${replylist.REPLY_DATE }" pattern="MM.dd hh:mm:ss" /> 
				<a href="#" onclick="fn_replyDelete('<c:out value="${replylist.REPLY_ID}"/>')">삭제</a>
				<a href="#" onclick="fn_replyUpdate('<c:out value="${replylist.REPLY_ID}"/>')">수정</a>
				<a href="#" onclick="fn_replyReply('<c:out value="${replylist.REPLY_ID}"/>')">댓글</a>
				<br/>
				<div id="reply<c:out value="${replylist.REPLY_ID}"/>"><c:out value="${replylist.REPLY_CONTENT}"/></div>
			</div><br/>
		</c:forEach>
		
		<div id="replyDiv" style="width: 99%; display:none">
			<form name="form2" action="replysave" method="post">
				<input type="hidden" name="FREE_ID" value="<c:out value="${boardInfo.FREE_ID}"/>"> 
				<input type="hidden" name="REPLY_ID"> 
				<textarea name="REPLY_CONTENT" rows="3" cols="60" maxlength="500"></textarea>
				<a href="#" onclick="fn_replyUpdateSave()">저장</a>
				<a href="#" onclick="fn_replyUpdateCancel()">취소</a>
			</form>
		</div>
		
		<div id="replyDialog" style="width: 99%; display:none">
			<form name="form3" action="replysave" method="post">
				<input type="hidden" name="FREE_ID" value="<c:out value="${boardInfo.FREE_ID}"/>"> 
				<input type="hidden" name="REPLY_ID"> 
				<input type="hidden" name="REPLY_REF"> 
				작성자: <input type="text" name="MEMBER_ID" size="20" maxlength="20"> <br/>
				<textarea name="REPLY_CONTENT" rows="3" cols="60" maxlength="500" placeholder="수정할 댓글을 달아주세요."></textarea>
				<a href="#" onclick="fn_replyReplySave()">저장</a>
				<a href="#" onclick="fn_replyReplyCancel()">취소</a>
			</form>
		</div>				

</body>
</html>