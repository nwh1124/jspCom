<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="boardName" value="${boardName}"/>
<c:set var="memberName" value="${memberName}"/>
<c:set var="pageTitle" value="게시물 상세"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="contentBody">
	
	<script>
		.content-body__article-detail__subMenu{
			flex-grow:0;
		}
	</script>

		<h1><c:out value="${pageTitle}"/></h1>
		<div class="content-body__article-detail__subMenu">
			<c:if test="${ sessionScope.loginedMemberId > 0 && isWriter}">
				<a href="modify?id=${article.id}">수정</a>
				<a href="delete?id=${article.id}">삭제</a>
			</c:if>
			<a href="list?boardId=${article.boardId}">목록</a>
		</div>
		<div class="content-body__article-detail">
			<div class="article-detail__subInfo">
				<span>번호 : ${article.id}</span>
				<span>작성일 : ${article.regDate.substring(2,10)}</span>
				<span>작성자 : <c:out value="${memberName}"/></span>
				<span>게시판 : <c:out value="${boardName}"/> 게시판</span>
				<span>조회수 : ${article.hitsCount}</span>
				<span>추천수 : ${article.likesCount}</span>
				<span>댓글수 : ${article.commentsCount}</span>
			</div>
			<span class="article-detail__title">제목 : ${article.title}</span>
			<div class="article-detail__body">
			<span hidden>${article.body}</span> 
			<div class="toast-ui-viewer">
			</div>
			</div>
		</div>
	</jsp:attribute>
</t:layout>


	
<%@ include file="../../part/foot.jspf" %>