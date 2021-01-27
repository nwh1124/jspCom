<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 수정"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout>
	<jsp:attribute name="contentBody">

	<script>
		function doMemberModifyForm__submit(form) {
			if (form.title.value == "") {
				alert("수정할 제목을 입력해주세요.");
				form.title.focus();
				return false;
			} else if (form.body.value == "") {
				alert("수정할 내용을 입력해주세요.");
				form.body.focus();
				return false;
			} else {
				return true;
			}
		}
	</script>
	
		<h1><c:out value="${pageTitle}" /></h1>
		<form action="doMemberModify" method="POST" onsubmit="return doMemberModifyForm__submit(this); return false;">
		  <div>수정할 게시물 번호</div>
		  <br>  
		  <input type="number" value="${param.id}" name="articleId">
		  <hr>
		  <div>수정할 제목</div>
		  <br>
		  <input type="text" name="title">
		  <hr>
		  <br>
		  <div>수정할 내용</div>
		  <br>
		  <textarea name="body"></textarea>
		  <hr>
		  <input type="submit" value="수정">
		  <input type="button" value="뒤로가기" onclick="history.back();">
		</form>
	</jsp:attribute>
</t:layout>



<%@ include file="../../part/foot.jspf" %>