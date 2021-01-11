<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<% int id = Integer.parseInt(request.getAttribute("id").toString()); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제</title>
</head>
<body>
	<h1>게시물 삭제</h1>
	<div><%= id%>번 게시물이 삭제되었습니다</div>
</body>
</html>