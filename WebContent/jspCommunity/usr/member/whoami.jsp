<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="로그인 중인 회원 정보"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="contentBody">
		<h1><c:out value="${pageTitle}"/></h1>
		<span>
		regDate :
		${member.regDate}
		</span>
		<span>
		ID :
		${member.loginId}
		</span>
		<span>
		Name :
		${member.name}
		</span>
		<span>
		Nickname :
		${member.nickname}
		</span>
		<span>
		Email :
		${member.email}
		</span>
		<span>
		PhoneNumber :
		${member.phoneNumber}
		</span>
			
		 <input type="button" value="뒤로가기" onclick="history.back();">
	</jsp:attribute>
</t:layout>

<%@ include file="../../part/foot.jspf" %>