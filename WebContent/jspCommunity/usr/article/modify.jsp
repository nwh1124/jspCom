<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 수정"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout>
	<jsp:attribute name="bodyContent">
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
				
				return false;
			}	
			
			const editor = $(form).find('.toast-ui-editor').data('data-toast-editor');
			const body = editor.getMarkdown().trim();

			form.body.value = body;

			form.submit();
			doModifyForm__submitted = true;
		}
	</script>
		
		
   <div class="title-bar padding-0-10 con-min-width">
     <h1 class="con">
       <span><i class="fas fa-eraser"></i></span>
       <span><c:out value="${pageTitle}"/></span>
     </h1>
   </div>
   
	<form class="con article-modify" action="doModify" method="POST" onsubmit="return doModifyForm__submit(this); return false;">
	  <input type="hidden" value="${param.id}" name="articleId">
 		  <input type="hidden" name="body">
	  <input class="member-modify__title" type="text" name="title" size="80" maxlength="80" placeholder="제목을 입력해주세요." value="${param.title}">
	  <script type="text/x-template"></script>
	  <div class="toast-ui-editor"></div>
	  <div class="btn-wrap">
		  <input class="btn" type="submit" value="수정">
		  <input class="btn" type="button" value="뒤로가기" onclick="history.back();">
	  </div>
	</form>
	<a class="initBody" hidden>${param.body }</a>
	</jsp:attribute>
</t:layout>



<%@ include file="../../part/foot.jspf" %>