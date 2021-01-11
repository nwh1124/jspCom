<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
</head>
<body>
<h1>게시물 등록</h1>
<form action="localhost:8080/jspCommunity/usr/article/write" target="_blank">
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
</form>
</body>
</html>