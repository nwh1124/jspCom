<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="비밀번호 찾기"/>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<t:layout>
	<jsp:attribute name="contentBody">
	<script>
			
		let doFindLoginPwForm__submited = false;
		
		function doFindLoginPwForm__submit(form) {

			if (doFindLoginPwForm__submited) {
				alert("처리중입니다.");
				return;
			}
			
			form.loginId.value = form.loginId.value.trim();
			if (form.loginId.value == 0) {
				alert("로그인 아이디를 입력해주세요.");
				form.loginId.focus();
				return false;			

			}

			form.email.value = form.email.value.trim();
			if (form.email.value == 0) {
				alert("email을 입력해주세요.");
				form.email.focus();
				return false;

			}

			return true;
			doLoginPwForm__submited = true;
		}
	</script>

		<h1>
			<c:out value="${pageTitle}" />
		</h1>
		<form action="doFindLoginPw" method="POST" onsubmit="return doFindLoginPwForm__submit(this); return false;" target="_blank">
		  <div>Name</div>
		  <br>
		  <input type="text" placeholder="로그인 아이디를 입력해주세요." name="loginId">
		  <hr>
		  <div>Email</div>
		  <br>
		  <input type="email" placeholder="Email 주소를 입력해주세요." name="email">
		  <hr>
		  <input type="submit" value="비밀번호 찾기">
		  <input type="button" value="뒤로가기" onclick="history.back();">
		</form>
	</jsp:attribute>
</t:layout>




<%@ include file="../../part/foot.jspf" %>