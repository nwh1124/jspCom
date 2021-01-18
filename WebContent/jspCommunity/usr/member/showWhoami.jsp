<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="로그인 중인 회원 정보"/>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>

<hr />
regDate :
${member.regDate}
<hr />
ID :
${member.loginId}
<hr />
Name :
${member.name}
<hr />
Nickname :
${member.nickname}
<hr />
Email :
${member.nickname}
<hr />
PhoneNumber :
${member.nickname}
<hr />
	
 <input type="button" value="뒤로가기" onclick="history.back();">

<%@ include file="../../part/foot.jspf" %>