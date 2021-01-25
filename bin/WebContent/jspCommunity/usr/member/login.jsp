<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="로그인"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="contentBody">
	
	<script>
	function doLoginForm__submit(form){
		form.loginId.value = form.loginId.value.trim();
		if( form.loginId.value.length == 0 ){
			alert("아이디를 입력해주세요.");
			form.loginId.focus();
			return false;
		}
		form.loginPw.value = form.loginPw.value.trim();
		if( form.loginPw.value.length == 0 ){
			alert("비밀번호를 입력해주세요.");
			form.loginPw.focus();
			return false;
		}
	
		return true;
		
	}
	</script>

		<h1><c:out value="${pageTitle}"/></h1>
		<form action="doLogin" method="POST" onsubmit="return doLoginForm__submit(this); return false;">
		  <div>ID</div>
		  <br>  
		  <input type="text" placeholder="아이디를 입력해주세요." name="loginId">
		  <hr>
		  <div>Password</div>
		  <br>
		  <input type="password" placeholder="비밀 번호를 입력해주세요." name="loginPw">
		  <hr>
		  <input type="submit" value="로그인">
		  <input type="button" value="뒤로가기" onclick="history.back();">
		</form>
	</jsp:attribute>
</t:layout>


<%@ include file="../../part/foot.jspf" %>