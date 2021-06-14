<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CYCO 커뮤니티</title>
<script>
// 글쓰기 유효성검사
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
// 이미지 파일이면 미리보기
function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;

  //ie일때(IE8 이하에서만 작동)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error가 있으면 delete
			}

			var img = document.getElementById(View_area); //이미지가 뿌려질 곳

			//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		} catch (e) {
			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}
  //ie가 아닐때(크롬, 사파리, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '300px'; 
			img.style.height = '300px';
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_"
						+ View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
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
						
						<input type="file" id="uploadfile" name="uploadfile" multiple="" onchange="previewImage(this,'View_area')"/>
						<div id='View_area' style='position:relative; width: 300px; height: 300px; color: black; border: 0px solid black; dispaly: inline; '></div>
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
