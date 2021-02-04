<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원 목록"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="bodyContent">
		<h1><c:out value="${pageTitle}"/></h1>
		<a href="../../usr/article/list?boardId=3">게시물 목록</a>
		<hr>
		<c:forEach var="member" items="${members}">
		<a href="delete?memberId=${member.id}">삭제</a>
		<br>
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
	</jsp:attribute>
</t:layout>



	
<%@ include file="../../part/foot.jspf" %>