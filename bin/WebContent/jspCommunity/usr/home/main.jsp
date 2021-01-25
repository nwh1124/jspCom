<%@ page language="java" 
    pageEncoding="UTF-8" isELIgnored="false"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="홈페이지"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="contentBody">
		<div>
			<a href="../article/write?boardId=3">게시물 작성</a>
			<a href="../article/list?boardId=3">게시물 목록</a>
			<a href="../member/login">로그인</a>
			<a href="../member/logout">로그아웃</a>
			<a href="../member/whoami">회원정보</a>
		</div>
	</jsp:attribute>
</t:layout>
	
<%@ include file="../../part/foot.jspf" %>