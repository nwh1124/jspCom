<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="boardName" value="${boardName}"/>
<c:set var="memberName" value="${memberName}"/>
<c:set var="pageTitle" value="게시물 상세"/>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>
<div>
	<a href="modify?id=${article.id}">수정</a>
	<a href="delete?id=${article.id}">삭제</a>
	<a href="list?boardId=${article.boardId}">목록</a>
</div>
<br><div>번호 : ${article.id}</div>
<br><div>작성일 : ${article.regDate}</div>
<br><div>작성자 : <c:out value="${memberName}"/></div>
<br><div>제목 : ${article.title}</div>
<br><div>내용 : ${article.body}</div>
<br><div>게시판 : <c:out value="${boardName}"/> 게시판</div>
<br><div>조회수 : ${article.hitsCount}</div>
<br><div>추천수 : ${article.likesCount}</div>
<br><div>댓글수 : ${article.commentsCount}</div>
	
<%@ include file="../../part/foot.jspf" %>