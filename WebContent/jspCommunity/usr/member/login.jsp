<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="로그인"/>

<script>
function doLoginFormCheck(){
	doLoginForm.loginId.value = doLoginForm.loginId.value.trim();
	if( doLoginForm.loginId.value.length == 0 ){
		alert("아이디를 입력해주세요.");
		doLoginForm.loginId.focus();
		return false;
	}
	doLoginForm.loginPw.value = doLoginForm.loginPw.value.trim();
	if( doLoginForm.loginPw.value.length == 0 ){
		alert("비밀번호를 입력해주세요.");
		doLoginForm.loginPw.focus();
		return false;
	}

	return true;
	
}
</script>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>
<form action="doLogin" onsubmit="return doLoginFormCheck()" name="doLoginForm">
  <div>ID</div>
  <br>  
  <input type="text" placeholder="아이디를 입력해주세요." name="loginId">
  <hr>
  <div>Password</div>
  <br>
  <input type="text" placeholder="비밀 번호를 입력해주세요." name="loginPw">
  <hr>
  <input type="submit" value="로그인">
  <input type="button" value="뒤로가기" onclick="history.back();">
</form>

<%@ include file="../../part/foot.jspf" %>