<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원 정보 수정"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="bodyContent">
	
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
		
		form.loginPw.value = form.loginPw.value.trim();
		form.loginPwCh.value = form.loginPwCh.value.trim();
		form.name.value = form.name.value.trim();
		form.nickname.value = form.nickname.value.trim();
		form.email.value = form.email.value.trim();
		form.phoneNumber.value = form.phoneNumber.value.trim();
		
		if( form.loginPw.value.length == 0 
				&& form.name.value.length == 0 
				&& form.nickname.value.length == 0 
				&& form.email.value.length == 0 
				&& form.phoneNumber.value.length == 0 ){
			alert("수정 사항을 입력해주세요.");
			
			return false;
		}
			
		if (form.loginPw.value.length > 0) {
			if (form.loginPwCh.value != form.loginPw.value) {
				alert("PASSWORD와 PASSWORD_CHECK가 일치하지 않습니다.");
				form.loginPwCh.focus();
				return false;
				
			}

			if(form.loginPwCh.value.trim().length == 0){
			alert("PASSWORD Check를 입력해주세요.");
			form.loginPw.focus();
			return false;
			}
			
		}
		
		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = "";
		form.loginPwCh.value = "";
		
		form.submit();
		doMemberModifyForm__submited = true;
		
	}
	</script>
	
   <div class="title-bar padding-0-10 con-min-width">
     <h1 class="con">
       <span><i class="fas fa-user-edit"></i></span>
       <span><c:out value="${pageTitle}"/></span>
     </h1>
   </div>
	<div class="con-min-width">
		<form class="con member-modify" action="doMemberModify" onsubmit="return doMemberModifyForm__submit(this); return false;">
			<input type=hidden name="memberId" value="${sessionScope.loginedMemberId}">
			<input type=hidden name="loginPwReal">
			<span>비밀번호</span>
			<input type="password" name="loginPw" placeholder="수정할 비밀번호를 입력해주세요." size="30">
			<span>비밀번호 확인</span>
			<input type="password" name="loginPwCh" placeholder="비밀번호를 한 번 더 입력해주세요.">
			<span>이름</span>
			<input type="text" name="name" placeholder="수정할 이름을 입력해주세요.">
			<span>닉네임</span>
			<input type="text" name="nickname" placeholder="수정할 닉네임을 입력해주세요.">
			<span>email</span>
			<input type="email" name="email" placeholder="수정할 email주소를 입력해주세요.">
			<span>PhoneNumber</span>
			<input type="tel" name="phoneNumber" placeholder="수정할 번호를 입력해주세요.">
			
		  <div class="btn-wrap">
			  <input class="btn" type="submit" value="수정">
			  <input class="btn" type="button" value="뒤로가기" onclick="history.back();">
		  </div>
		</form>
		</div>
	</jsp:attribute>
</t:layout>

<%@ include file="../../part/foot.jspf" %>