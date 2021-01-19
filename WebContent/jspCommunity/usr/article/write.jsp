<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 등록"/>

<script>
function check(){
	if( writeForm.title.value == "" ){
		alert("제목을 입력해주세요.");
		writeForm.title.focus();
		return false;
	}else if( writeForm.body.value == "" ){
		alert("내용을 입력해주세요.");
		writeForm.body.focus();
		return false;
	}else {
		return true;
	}
}
</script>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>
<form action="doWrite" onsubmit="return check()" name="writeForm">
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

<%@ include file="../../part/foot.jspf" %>