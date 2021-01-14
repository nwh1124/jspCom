<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
<h1>게시물 수정</h1>
<form action="localhost:8080/jspCommunity/usr/article/modify" target="_blank">
	<div>게시물 번호</div>
  <input type="number" value="1" name="articleId">
  <input type="number" value="3"name="memberId" hidden>
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
</form>
</body>
</html>