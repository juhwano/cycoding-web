<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<c:set var="result" value='${mmp.result}'></c:set>
<c:set var="url" value='${mmp.url}'></c:set>
<c:set var="icon" value='${mmp.icon}'></c:set>
<c:if test="${msg!=null && url!=null }">
<script>
$(document).ready(function() {

	console.log("리다이렉트 페이지");
	
	swal({
		text : '${result}',
		icon : '${icon}'
	}).then(()=>{
		 location.href='${url}'; 
	});
	

});
	
			
	    
	</script>
</c:if>