<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.myhome.jspCommunity.dto.Article" %>
<%@ page import="com.myhome.jspCommunity.dto.Board" %>

<%
List<Article> articles = (List<Article>)request.getAttribute("articles");
Board board = (Board)request.getAttribute("board");
%>

<% String pageTitle = "게시물 목록"; %>

<%@ include file="../../part/head.jspf" %>

	<h1><%=pageTitle%></h1>
	<div>
		<a href="write?boardId=<%=board.getId() %>">게시물 작성</a>
		<a href="../member/list">회원 목록</a>
	</div>
	<%
	for (Article article : articles) {
	%>
	<div>
		번호 :
		<%=article.getId()%>
		<br />
		작성일 :
		<%=article.getRegDate()%>
		<br />
		제목 :
		<a href="detail?id=<%=article.getId()%>&boardId=<%=article.getBoardId()%>"><%=article.getTitle()%></a>
		<br />
		내용 :
		<%=article.getBody()%>
		<hr />
	</div>
	<%
	}
	%>
	
<%@ include file="../../part/foot.jspf" %>