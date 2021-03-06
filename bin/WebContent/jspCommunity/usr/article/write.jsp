<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 등록"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<script>
function doWriteForm__submit(form){
	if( form.title.value == "" ){
		alert("제목을 입력해주세요.");
		form.title.focus();
		return false;
	}else if( form.body.value == "" ){
		alert("내용을 입력해주세요.");
		form.body.focus();
		return false;
	}else {
		return true;
	}
}
</script>

<t:layout >
	<jsp:attribute name="contentBody">
		<h1><c:out value="${pageTitle}"/></h1>
		<form action="doWrite" onsubmit="return doWriteForm__submit(this); return false;">
		  <input type="number" value="${memberId}" name="memberId" hidden>
		  <input type="number" value="3"name="boardId" hidden>
		  <br>
		  <div>제목</div>
		  <br>
		  <input type="text" name="title">
		  <hr>
		  <br>
		  <div>내용</div>
		  <br>
		  <textarea name="body"></textarea>
		  <hr>
		  <input type="submit" value="등록">
		  <input type="button" value="뒤로가기" onclick="history.back();">
		</form>
	</jsp:attribute>
</t:layout>



<%@ include file="../../part/foot.jspf" %>