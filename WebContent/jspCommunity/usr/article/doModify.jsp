<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<% String title = request.getAttribute("title") == null ? "" : (String)request.getAttribute("title"); %>
<% String body = request.getAttribute("body") == null ? "" : (String)request.getAttribute("body"); %>
<% int id = request.getAttribute("id") == null ? 0 : Integer.parseInt((String)request.getAttribute("id")); %>
<% boolean input = (boolean)request.getAttribute("input"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
	<h1>게시물 수정</h1>	
	<%if ( input ) { %>
	<div>번호 : <%= id%></div>
	<br>	
	<div>제목 : <%= title%></div>
	<br>
	<div>내용 : <%= body%></div>
	<br>
	<div>게시물이 수정되었습니다</div>
	
	<% } %>
	<%if( input == false ) {%>
	<div>수정할 정보를 입력해주세요</div>
	<% } %>
</body>
</html>