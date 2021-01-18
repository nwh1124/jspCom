<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 목록"/>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>
	<div>
		<a href="write?boardId=${board.id}">게시물 작성</a>
		<a href="../member/list">회원 목록</a>
	</div>
	<c:forEach var="article" items="${articles}">
		번호 :
		${article.id}
		<br />
		작성일 :
		${article.regDate}
		<br />
		제목 :
		<a href="detail?id=${article.id}&boardId=${article.boardId}">${article.title}</a>
		<br />
		내용 :
		${article.body}
		<hr />
	</c:forEach>
	
<%@ include file="../../part/foot.jspf" %>