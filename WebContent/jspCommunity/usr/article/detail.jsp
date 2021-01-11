<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.myhome.jspCommunity.dto.Article" %>

<% Article article = (Article)request.getAttribute("article"); %>
<% String memberName = request.getAttribute("memberName").toString(); %>
<% String boardName = request.getAttribute("boardName").toString(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세</title>
</head>
<body>
	<h1>게시물 상세</h1>
	<br><div>번호 : <%= article.id%></div>
	<br><div>작성일 : <%= article.regDate%></div>
	<br><div>작성자 : <%= memberName%></div>
	<br><div>제목 : <%= article.title%></div>
	<br><div>내용 : <%= article.body%></div>
	<br><div>게시판 : <%= boardName%> 게시판</div>
	<br><div>조회수 : <%= article.hitsCount%></div>
	<br><div>추천수 : <%= article.likesCount%></div>
	<br><div>댓글수 : <%= article.commentsCount%></div>
</body>
</html>