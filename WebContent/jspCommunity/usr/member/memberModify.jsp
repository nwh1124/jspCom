<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원 정보 수정"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="contentBody">
	
	<style>
	.content-body__whoami{
		display:flex;
		flex-direction:column;
	}
	.content-body__whoami > span{
		margin-top:10px;
	}
	
	form{
		display:flex;
		flex-direction:column;
	}
	form > span, input {
		margin:5px 0;
	}
	</style>
	
	<script>
	let doMemberModifyForm__submited = false;
	
	function doMemberModifyForm__submit(form){
	
		if(doMemberModifyForm__submited){
			alert('처리중입니다.');
			return;
		}
		
		form.loginId.value = form.loginId.value.trim(); 
		if( form.loginId.value.length == 0 
				&& form.loginPw.value.length == 0 
				&& form.name.value.length == 0 
				&& form.nickname.value.length == 0 
				&& form.email.value.length == 0 
				&& form.phoneNumber.value.length == 0 ){
			alert("수정 사항을 입력해주세요.");
			form.loginId.focus();
			
			return false;
		}
		
		form.submit();
		doMemberModifyForm__submited = true;
		
	}
	</script>
	
		<h1><c:out value="${pageTitle}"/></h1>

		<form action="doMemberModify" onsubmit="return doMemberModifyForm__submit(this); return false;">
			<input type=hidden name="memberId" value="${sessionScope.loginedMemberId}">
			<span>아이디</span>
			<input type="text" name="loginId" placeholder="수정할 아이디를 입력해주세요." size="30">
			<span>비밀번호</span>
			<input type="password" name="loginPw" placeholder="수정할 비밀번호를 입력해주세요.">
			<span>이름</span>
			<input type="text" name="name" placeholder="수정할 이름을 입력해주세요.">
			<span>닉네임</span>
			<input type="text" name="nickname" placeholder="수정할 닉네임을 입력해주세요.">
			<span>email</span>
			<input type="email" name="email" placeholder="수정할 email주소를 입력해주세요.">
			<span>PhoneNumber</span>
			<input type="tel" name="phoneNumber" placeholder="수정할 번호를 입력해주세요.">
			<input type="submit" value="회원 정보 수정">
		</form>
		<input type="button" value="뒤로가기" onclick="history.back();">
	</jsp:attribute>
</t:layout>

<%@ include file="../../part/foot.jspf" %>