<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<% String title = (String)request.getAttribute("title"); %>
<% String body = (String)request.getAttribute("body"); %>
<% int id = Integer.parseInt(request.getAttribute("id").toString()); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
	<h1>게시물 수정</h1>	
	<div>번호 : <%= id%></div>
	<br>	
	<div>제목 : <%= title%></div>
	<br>
	<div>내용 : <%= body%></div>
	<br>
	<div>게시물이 수정되었습니다</div>
</body>
</html>