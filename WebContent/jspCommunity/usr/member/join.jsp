<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원 가입"/>

<script>
let doJoinFormSubmited = false;
function doJoinFormCheck(){

	if( doJoinFormSubmited ){
		alert("처리중입니다.");
		return;
	}
	doJoinForm.loginId.value = doJoinForm.loginId.value.trim();
	if( doJoinForm.loginId.value.length == 0 ){
		alert("ID를 입력해주세요.");
		doJoinForm.loginId.focus();
		return false;	
		
	}
	doJoinForm.loginPw.value = doJoinForm.loginPw.value.trim();
	if( doJoinForm.loginPw.value.length == 0 ){
		alert("PASSWORD를 입력해주세요.");
		doJoinForm.loginPw.focus();
		return false;	
		
	}
	doJoinForm.loginPwCh.value = doJoinForm.loginPwCh.value.trim();
	if( doJoinForm.loginPwCh.value == 0){
		alert("PASSWORD Check를 입력해주세요.");
		doJoinForm.loginPwCh.focus();
		return false;	
		
	}
	if( doJoinForm.loginPwCh.value != doJoinForm.loginPw.value ){
		alert("PASSWORD가 일치하지 않습니다.");
		doJoinForm.loginPwCh.focus();
		return false;	
		
	}
	doJoinForm.name.value = doJoinForm.name.value.trim();
	if( doJoinForm.name.value == 0 ){
		alert("이름을 입력해주세요.");
		doJoinForm.name.focus();
		return false;	
		
	}
	doJoinForm.nickname.value = doJoinForm.nickname.value.trim();
	if( doJoinForm.nickname.value == 0 ){
		alert("닉네임을 입력해주세요.");
		doJoinForm.nickname.focus();
		return false;	
		
	}
	doJoinForm.email.value = doJoinForm.email.value.trim();
	if( doJoinForm.email.value == 0 ){
		alert("email을 입력해주세요.");
		doJoinForm.email.focus();
		return false;	
		
	}
	doJoinForm.phoneNum.value = doJoinForm.phoneNum.value.trim();
	if( doJoinForm.phoneNum.value == 0 ){
		alert("휴대폰 번호를 입력해주세요.");
		doJoinForm.phoneNum.focus();
		return false;	
		
	} 

	return true;
}
</script>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="contentBody">
		<h1><c:out value="${pageTitle}"/></h1>
		<form action="doJoin" onsubmit="return doJoinFormCheck()" name="doJoinForm">
		  <div>ID</div>
		  <br>  
		  <input type="text" placeholder="아이디를 입력해주세요." name="loginId">
		  <hr>
		  <div>Password</div>
		  <br>
		  <input type="password" placeholder="비밀 번호를 입력해주세요." name="loginPw">
		  <hr>
		  <div>Password Check</div>
		  <br>
		  <input type="password" placeholder="비밀 번호를 입력해주세요." name="loginPwCh">
		  <hr>
		  <div>Name</div>
		  <br>
		  <input type="text" placeholder="이름 입력해주세요." name="name">
		  <hr>
		  <div>Nickname</div>
		  <br>
		  <input type="text" placeholder="닉네임을 입력해주세요." name="nickname">
		  <hr>
		  <div>Email</div>
		  <br>
		  <input type="email" placeholder="Email 주소를 입력해주세요." name="email">
		  <hr>
		  <div>Phone Number</div>
		  <br>
		  <input type="number" placeholder="휴대폰 번호를 입력해주세요." name="phoneNum">
		  <hr>
		  <input type="submit" value="가입">
		  <input type="button" value="뒤로가기" onclick="history.back();">
		</form>
	</jsp:attribute>
</t:layout>




<%@ include file="../../part/foot.jspf" %>