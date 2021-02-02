<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="아이디 찾기"/>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<t:layout>
	<jsp:attribute name="bodyContent">
	<script>
			
		let doFindLoginPwForm__submited = false;
		
		function doFindLoginPwForm__submit(form) {

			if (doFindLoginPwForm__submited) {
				alert("처리중입니다.");
				return;
			}
			
			form.name.value = form.name.value.trim();
			if (form.name.value == 0) {
				alert("이름을 입력해주세요.");
				form.name.focus();
				return false;			

			}

			form.email.value = form.email.value.trim();
			if (form.email.value == 0) {
				alert("email을 입력해주세요.");
				form.email.focus();
				return false;

			}

			form.submit();
			doLoginIdForm__submited = true;
		}
	</script>
	
   <div class="title-bar padding-0-10 con-min-width">
     <h1 class="con">
       <span><i class="fas fa-search"></i></span>
       <span><c:out value="${pageTitle}"/></span>
     </h1>
   </div>
   <div class="con con-min-width">
   		<form class="member-findLoginId" action="doFindLoginId" method="POST" onsubmit="return doFindLoginPwForm__submit(this); return false;">
		  <div>Name</div>
		  <input type="text" placeholder="이름을 입력해주세요." name="name">
		  <div>Email</div>
		  <input type="email" placeholder="Email 주소를 입력해주세요." name="email">
		  <div class="btn-wrap">
			  <input class="btn" type="submit" value="아이디 찾기">
			  <input class="btn" type="button" value="뒤로가기" onclick="history.back();">
		  </div>
		</form>
	</div>
	</jsp:attribute>
</t:layout>




<%@ include file="../../part/foot.jspf" %>