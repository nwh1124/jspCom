<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String pageTitle = "게시물 수정"; %>

<%@ include file="../../part/head.jspf" %>

<h1>게시물 등록</h1>
<form action="doWrite" target="_blank">
  <input type="number" value="1" name="memberId" hidden>
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