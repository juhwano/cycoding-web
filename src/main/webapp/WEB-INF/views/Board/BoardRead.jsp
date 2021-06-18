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
.fa-plus{color:#CA8FAB;}
.section-header{
	background-image: url("../assets/img/board/read.jpg");
	background-repeat: no-repeat;
    background-size: cover;
    background-size: 100%;
    background-position: center;
}

header{
 	margin-bottom: 20px;
}
.REPLY_CONTENT{
	overflow: auto;
}
.fa-trash-alt{
 	color:#94A7AE;
}
.fa-pencil-alt{
	color:#94A7AE;
}
#replySpace{
	margin-top:30px;
}
.imgBtn {
	border: none;
	background-color: #FFFFFF;
}
</style>

<script type="text/javascript">
//댓글 Byte 수 체크 제한
function fnChkByte(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4)
        {
            rbyte += 2;                                         //한글2Byte
        }
        else
        {
            rbyte++;                                            //영문 등 나머지 1Byte
        }


        if(rbyte <= maxByte)
        {
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }


     if(rbyte > maxByte)
     {
  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
  alert("댓글은 최대 " + maxByte + "byte를 초과할 수 없습니다.")
  str2 = str.substr(0,rlen);                                  //문자열 자르기
  obj.value = str2;
  fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo').innerText = rbyte;
     }
}

//수정 댓글 Byte 수 체크 제한
function fnChkByte1(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4)
        {
            rbyte += 2;                                         //한글2Byte
        }
        else
        {
            rbyte++;                                            //영문 등 나머지 1Byte
        }


        if(rbyte <= maxByte)
        {
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }


     if(rbyte > maxByte)
     {
  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
  alert("댓글은 최대 " + maxByte + "byte를 초과할 수 없습니다.")
  str2 = str.substr(0,rlen);                                  //문자열 자르기
  obj.value = str2;
  fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo1').innerText = rbyte;
     }
}
//대댓글 Byte 수 체크 제한
function fnChkByte2(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4)
        {
            rbyte += 2;                                         //한글2Byte
        }
        else
        {
            rbyte++;                                            //영문 등 나머지 1Byte
        }


        if(rbyte <= maxByte)
        {
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }


     if(rbyte > maxByte)
     {
  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
  alert("댓글은 최대 " + maxByte + "byte를 초과할 수 없습니다.")
  str2 = str.substr(0,rlen);                                  //문자열 자르기
  obj.value = str2;
  fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo2').innerText = rbyte;
     }
}
// 댓글유효성검사
function fn_formSubmit(){
// 	var validateMEMBER_ID = document.form1.MEMBER_ID.value.replace(/\s|　/gi, '');
	var validateREPLY_CONTENT = document.form1.REPLY_CONTENT.value.replace(/\s|　/gi, '');
	var form1 = document.form1;
	
// 	if (validateMEMBER_ID == "") {
// 		alert("작성자를 입력해주세요.");
// 		form1.MEMBER_ID.focus();
// 		return;
// 	}
	if (validateREPLY_CONTENT == "") {
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
	var validateREPLY_CONTENT = document.form2.REPLY_CONTENT.value.replace(/\s|　/gi, '');
	var form = document.form2;
	if (validateREPLY_CONTENT == "") {
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
// (빈공간에 div 만들기)
function hideDiv(id){
	var div = document.getElementById(id);
	div.style.display = "none";
	document.getElementById("replySpace").appendChild(div);
}

function fn_replyReply(REPLY_ID){
	hideDiv("replyDiv");
	
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
	var validateREPLY_CONTENT = document.form3.REPLY_CONTENT.value.replace(/\s|　/gi, '');
	var form = document.form3;
	
// 	if (form.MEMBER_ID.value=="") {
// 		alert("작성자를 입력해주세요.");
// 		form.MEMBER_ID.focus();
// 		return;
// 	}
	if (validateREPLY_CONTENT =="") {
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
			<h2>
				<span><c:out value="${boardInfo.FREE_TITLE}"/><br/></span>
			</h2>
			<div>
					<span><c:out value="${boardInfo.MEMBER_NICKNAME}"/></span>&nbsp; | &nbsp;<span><fmt:formatDate value="${boardInfo.FREE_DATE }" pattern="yyyy.MM.dd hh:mm:ss" /></span>
			</div>
			<div class="text-right">		
					<span>조회&nbsp;<c:out value="${boardInfo.FREE_VIEWS}"/></span><br/>
			</div>			
		</div>
	</header>			
	<hr/>
	<div class="form-group">
		<textarea class="form-control" cols="120" rows="15" readonly="readonly" disabled><c:out value="${boardInfo.FREE_CONTENT}" escapeXml="false"/></textarea>
	</div>	
	<br/>
	<div class="form-group" style="margin-bottom:10px">
			<label for="fileno">첨부파일</label>
			<c:if test="${sessionScope.nickname ne null}">
						<c:forEach var="listview" items="${listview}" varStatus="status">	
            				<a class="form-control" href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
 							<c:out value="${listview.filename}"/></a><%-- <c:out value="${listview.size2String()}"/> --%>
						</c:forEach><br/>
		</c:if>				
	</div>			
	<hr id="replyHr">
	<label>댓글</label>
        <c:if test="${sessionScope.nickname ne null}">
        <div>
			<form name="form1" action="replysave" method="post">
				<div class="form-group">
				<input type="hidden" name="FREE_ID" value="<c:out value="${boardInfo.FREE_ID}"/>">
				<input type="hidden" name="MEMBER_ID" value="${sessionScope.member_id }">
				<textarea name="REPLY_CONTENT" class="form-control" rows="3" cols="120" onKeyUp="javascript:fnChkByte(this,'80')" placeholder="댓글을 작성해주세요."></textarea>
				<span id="byteInfo">0</span>/ 80byte
				<div class="text-right">
					<button type="button" onclick="fn_formSubmit()" class="btn btn-outline-primary text-right">저장</button>
				</div>
				</div>
			</form>
		</div>
		<hr/>
		</c:if>
		<c:forEach var="replylist" items="${replylist}" varStatus="status">
			<div class="form-group" style="margin-top: 5px; position: relative; background:transparent; clear:both; display:block;
					margin-left: <c:out value="${20*replylist.DEPT}"/>px;">
					<c:choose>
					<c:when test="${replylist.DEPT eq '0'}">
					<div style="float:left; width:132px; margin-left:10px; margin-right:20px; margin-top:3px;">
						<c:out value="${replylist.MEMBER_NICKNAME}"/> 
					</div>
					<div id="reply<c:out value="${replylist.REPLY_ID}"/>" style="float:left; margin-top:3px;">
						<c:out value="${replylist.REPLY_CONTENT}"/>
					</div>
					 </c:when>
					 <c:otherwise>
					<div style="float:left; width:132px; margin-left:10px; margin-right:20px; margin-top:3px;">
						<img alt="replyIcon" src="../assets/img/board/reply.png" width="10" height="10">&nbsp;<c:out value="${replylist.MEMBER_NICKNAME}"/> 
					</div> 
					 <div id="reply<c:out value="${replylist.REPLY_ID}"/>" style="float:left; margin-top:3px;">
					<c:out value="${replylist.REPLY_CONTENT}"/>
					</div>
					 </c:otherwise>
					 </c:choose>
					 <c:if test="${sessionScope.nickname eq replylist.MEMBER_NICKNAME}">
					<div style="float:right; margin-top:3px;">
						<fmt:formatDate value="${replylist.REPLY_DATE }" pattern="MM.dd hh:mm:ss" />
						<button class="imgBtn" onclick="fn_replyReply('<c:out value="${replylist.REPLY_ID}"/>')">&nbsp;<i class="fas fa-plus"></i></button>&nbsp;<button class="imgBtn" onclick="fn_replyUpdate('<c:out value="${replylist.REPLY_ID}"/>')" >&nbsp;<i class="fas fa-pencil-alt"></i></button>&nbsp;<button class="imgBtn" onclick="fn_replyDelete('<c:out value="${replylist.REPLY_ID}"/>')">&nbsp;<i class="fas fa-trash-alt"></i></button>
					</div>	
					</c:if>
					<c:if test="${sessionScope.nickname ne replylist.MEMBER_NICKNAME}">
						<div style="float:right; margin-top:3px; margin-right: 125px">
						<fmt:formatDate value="${replylist.REPLY_DATE }" pattern="MM.dd hh:mm:ss" />
						</div>
					</c:if>
<%-- 				<a href="#" onclick="fn_replyDelete('<c:out value="${replylist.REPLY_ID}"/>')">삭제</a> --%>
<%-- 				<a href="#" onclick="fn_replyUpdate('<c:out value="${replylist.REPLY_ID}"/>')">수정</a> --%>
<%-- 				<a href="#" onclick="fn_replyReply('<c:out value="${replylist.REPLY_ID}"/>')">대댓글</a> --%>
			</div><br/>
		</c:forEach>
		<div id="replySpace"></div>
		<br/>
		<!-- 댓글 수정 -->
		<div id="replyDiv" style="width: 99%; display:none">
			<form name="form2" action="replysave" method="post">
				<input type="hidden" name="FREE_ID" value="<c:out value="${boardInfo.FREE_ID}"/>"> 
				<input type="hidden" name="REPLY_ID"> 
				<textarea name="REPLY_CONTENT" class="form-control" rows="3" cols="120" onKeyUp="javascript:fnChkByte1(this,'80')" placeholder="수정할 댓글을 작성해주세요."></textarea>
				<span id="byteInfo1">0</span>/ 80byte
				<button onclick="fn_replyUpdateSave()" class="btn btn-outline-primary text-right">저장</button>
				<button type="button" onclick="fn_replyUpdateCancel()" class="btn btn-default text-right">취소</button>
			</form>
				
		</div>
		<!-- 대댓글 -->
		<br/>
		<div id="replyDialog" style="width: 99%; display:none">
			<form name="form3" action="replysave" method="post">
				<input type="hidden" name="FREE_ID" value="<c:out value="${boardInfo.FREE_ID}"/>"> 
				<input type="hidden" name="REPLY_ID">
				<input type="hidden" name="REPLY_REF">
				<input type="hidden" name="MEMBER_ID" value="${sessionScope.member_id}">
				<textarea name="REPLY_CONTENT" class="form-control" rows="3" cols="120" onKeyUp="javascript:fnChkByte2(this,'80')" placeholder="댓글을 작성해주세요."></textarea>
				<span id="byteInfo2">0</span>/ 80byte
				<button onclick="fn_replyReplySave()" class="btn btn-outline-primary text-right">저장</button>
				<button type="button" onclick="fn_replyReplyCancel()" class="btn btn-default text-right">취소</button>
			</form>
		</div>
		<br/>
</div>
<div class="container text-right" style="margin-bottom:30px">
	<c:if test="${sessionScope.nickname eq boardInfo.MEMBER_NICKNAME}">
			<a href="form?FREE_ID=<c:out value="${boardInfo.FREE_ID}"/>" class="btn btn-outline-primary">수정</a>
	        <a href="delete?FREE_ID=<c:out value="${boardInfo.FREE_ID}"/>" class="btn btn-outline-black">삭제</a>
	        <a href="list" class="btn btn-outline-black">취소</a>
	 </c:if>
	 <c:if test="${sessionScope.nickname ne boardInfo.MEMBER_NICKNAME}">
			<a href="list" class="btn btn-outline-black">취소</a>
	</c:if>		
</div>
</body>
</html>