<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="Article Write"/>

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
	
	if ( body.trim().length == 0 ) {
		alert('내용을 입력해주세요.');
		editor.focus();
		
		return false;
	}
	
	form.body.value = body;

	form.submit();
	doWriteForm__submited = true;
	
}
</script>

<t:layout >
	<jsp:attribute name="bodyContent">
	
    <div class="title-bar padding-0-10 con-min-width">
      <h1 class="con">
        <span><i class="fas fa-edit"></i></span>
        <span>게시물 작성</span>
      </h1>      
    </div>
	
    <div class="write-form-box form-box padding-0-10 con-min-width">	
		<form class="con" action="doWrite" onsubmit="return doWriteForm__submit(this); return false;">
		  <input type="number" value="${loginedMemberId}" name="memberId" hidden>
		  <input type="number" value="3"name="boardId" hidden>
		  <input type="hidden" name="body"/>
		  <input class="write-title" type="text" name="title" width="100" maxlength="50" placeholder="제목을 입력해주세요.">
		  <script type="text/x-template"></script>
		  <div class="toast-ui-editor"></div>
		  <div class="btn-wrap">
			  <input class="btn-success btn" type="submit" value="등록">
			  <input class="btn" type="button" value="뒤로가기" onclick="history.back();">
		  </div>
		</form>
	</div>
		
	</jsp:attribute>
</t:layout>



<%@ include file="../../part/foot.jspf" %>