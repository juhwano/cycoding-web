<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 스프링 시큐리티 설정 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이좋게 코딩하자</title>
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<main>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	
	
	<div><img src="assets/img/member_detail/cycoding_img.png"></div>
	<button id="listButton">클릭</button>
	
	<div id="#listDiv">
	
		
	
	</div>

	<script>
	
	$(document).on("click",function(){
		ajaxTest();
	});
	
	function ajaxTest(){
	    console.log("클릭");
	    $.get("test.cy", 
	    		//{ species: "고양이", name: "나비", age: 3, }, // 서버가 필요한 정보를 같이 보냄. 
	    		function(data, status) {
	    			console.log(data);
	    			$("#listDiv").html(data + "<br>" + status); // 전송받은 데이터와 전송 성공 여부를 보여줌. 
	    			} 
	    		); 
	    }


</script>

</main>

</body>
</html>