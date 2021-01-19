<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 수정"/>

<script>
function check(){
	if( modifyForm.title.value == "" ){
		alert("수정할 제목을 입력해주세요.");
		modifyForm.title.focus();
		return false;
	}else if( modifyForm.body.value == "" ){
		alert("수정할 내용을 입력해주세요.");
		modifyForm.body.focus();
		return false;
	}else {
		return true;
	}
}
</script>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>
<form action="doModify" name="modifyForm" onsubmit="return check()">
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

<%@ include file="../../part/foot.jspf" %>