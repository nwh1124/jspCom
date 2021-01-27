<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 수정"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout>
	<jsp:attribute name="contentBody">
	<style>
		form{
			width:100%;
			padding-bottom:20px;
		}
	</style>
	<script>
		let doModifyForm__submitted = false;
	
		function doModifyForm__submit(form) {
			if(doModifyForm__submitted){
				alert('처리중입니다.')
				return;
			}
			
			if (form.title.value == "") {
				alert("수정할 제목을 입력해주세요.");
				form.title.focus();
				return false;
			}

			form.submit();
			doModifyForm__submitted = true;
		}
	</script>
	
		<h1><c:out value="${pageTitle}" /></h1>
		<form action="doModify" method="POST" onsubmit="return doModifyForm__submit(this); return false;">
		  <input type="hidden" value="${param.id}" name="articleId">
		  <div>수정할 제목</div>
		  <br>
		  <input type="text" name="title" size="80" maxlength="80" placeholder="제목을 입력해주세요.">
		  <hr>
		  <br>
		  <div>수정할 내용</div>
		  <br>
		  <script type="text/x-template"></script>
		  <div class="toast-ui-editor"></div>
		  <hr>
		  <input type="submit" value="수정">
		  <input type="button" value="뒤로가기" onclick="history.back();">
		</form>
	</jsp:attribute>
</t:layout>



<%@ include file="../../part/foot.jspf" %>