<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 등록"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<script>
let doWriteForm__submited = false;

function doWriteForm__submit(form){

	if(doWriteForm__submited){
		alert('처리중입니다.');
		return;
	}
	
	if( form.title.value == "" ){
		alert("제목을 입력해주세요.");
		form.title.focus();
		return false;
	}

	const editor = $(form).find('.toast-ui-editor').data('data-toast-editor');
	const body = editor.getMarkdown().trim();
	
	if ( body.length == 0 ) {
		alert('내용을 입력해주세요.');
		editor.focus();
		
		return;
	}
	
	form.body.value = body;

	form.submit();
	doWriteForm__submited = true;
	
}
</script>

<style>
form{
width:100%;
padding-bottom:20px;
}
</style>

<t:layout >
	<jsp:attribute name="contentBody">
		<h1><c:out value="${pageTitle}"/></h1>
		<form action="doWrite" onsubmit="return doWriteForm__submit(this); return false;">
		  <input type="number" value="${memberId}" name="memberId" hidden>
		  <input type="number" value="3"name="boardId" hidden>
		  <input type="hidden" name="body"/>
		  <br>
		  <br>
		  <input type="text" name="title" size="80" maxlength="80" placeholder="제목을 입력해주세요.">
		  <hr>
		  <br>
		  <div>내용</div>
		  <br>
		  <script type="text/x-template"></script>
		  <div class="toast-ui-editor"></div>
		  <hr>
		  <input type="submit" value="등록">
		  <input type="button" value="뒤로가기" onclick="history.back();">
		</form>
	</jsp:attribute>
</t:layout>



<%@ include file="../../part/foot.jspf" %>