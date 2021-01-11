<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<% String title = (String)request.getAttribute("title"); %>
<% String body = (String)request.getAttribute("body"); %>
<% String boardName = (String)request.getAttribute("boardName"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
</head>
<body>
	<h1>게시물 등록</h1>	
	<div><%= boardName%> 게시판</div>
	<br>
	<div>제목 : <%= title%></div>
	<br>
	<div>내용 : <%= body%></div>
	<br>
	<div>게시물이 등록되었습니다</div>	
</body>
</html>