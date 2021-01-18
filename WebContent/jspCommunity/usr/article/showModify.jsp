<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 수정"/>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>
<form action="doModify" target="_blank">
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