<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원 목록"/>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>
<a href="../article/list?boardId=3">게시물 목록</a>
<br>
<c:forEach var="member" items="${members}">
	번호 :
	${member.id}
	<br />
	작성일 :
	${member.regDate}
	<br />
	아이디 :
	${member.loginId}
	<br />
	이름 :
	${member.name}
	<br />
	닉네임 :
	${member.nickname}
	<hr />
</c:forEach>

	
<%@ include file="../../part/foot.jspf" %>