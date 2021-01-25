<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 목록"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="contentBody">
	<h1><c:out value="${pageTitle}"/></h1>
	<div class="main-content__subBtn">
		<a href="../home/main">홈페이지</a>
		<a href="write?boardId=${board.id}">게시물 작성</a>
	</div>
	<div>
	총 게시물 수 : ${totalCount}
	</div>
	<ul>
	<c:forEach var="article" items="${articles}">
	<li>
		번호 :
		${article.id}
		작성일 :
		${article.regDate}
		제목 :
		<a href="detail?id=${article.id}&boardId=${article.boardId}">${article.title}</a>
		내용 : 
		${article.body}
	</li>
	</c:forEach>
	</ul>
	</jsp:attribute>
</t:layout>


	
<%@ include file="../../part/foot.jspf" %>