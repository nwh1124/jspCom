<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.myhome.jspCommunity.dto.Article" %>

<% 
Article article = (Article)request.getAttribute("article");
String memberName = request.getAttribute("memberName").toString();
String boardName = request.getAttribute("boardName").toString(); 
String pageTitle = "게시물 상세";
%>

<%@ include file="../../part/head.jspf" %>

<h1><%=pageTitle%></h1>
<div>
	<a href="modify?id=<%= article.getId()%>">수정</a>
	<a href="delete?id=<%= article.getId()%>">삭제</a>
	<a href="list?boardId=<%= article.getBoardId()%>">목록</a>
</div>
<br><div>번호 : <%= article.getId()%></div>
<br><div>작성일 : <%= article.getRegDate()%></div>
<br><div>작성자 : <%= memberName%></div>
<br><div>제목 : <%= article.getTitle()%></div>
<br><div>내용 : <%= article.getBody()%></div>
<br><div>게시판 : <%= boardName%> 게시판</div>
<br><div>조회수 : <%= article.getHitsCount()%></div>
<br><div>추천수 : <%= article.getLikesCount()%></div>
<br><div>댓글수 : <%= article.getCommentsCount()%></div>
	
<%@ include file="../../part/foot.jspf" %>