<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.myhome.jspCommunity.dto.Article" %>
<%@ page import="com.myhome.jspCommunity.dto.Board" %>
<%
List<Article> articles = (List<Article>)request.getAttribute("articles");
Board board = (Board)request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= board.name%> 게시판</title>
</head>
<body>
	<h1><%= board.name%> 게시판</h1>
	<div>
		<a href="write?boardId=<%=board.id %>">게시물 작성</a>
	</div>
	<%
	for (Article article : articles) {
	%>
	<div>
		번호 :
		<%=article.id%>
		<br />
		작성일 :
		<%=article.regDate%>
		<br />
		제목 :
		<a href="detail?id=<%=article.id%>&boardId=<%=article.boardId%>"><%=article.title%></a>
		<br />
		내용 :
		<%=article.body%>
		<hr />
	</div>
	<%
	}
	%>
</body>
</html>