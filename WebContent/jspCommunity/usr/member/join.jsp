<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원 가입"/>

<script>
function check(){
	if( form.loginId.value == "" ){
		alert("ID를 입력해주세요.");
		form.loginId.focus();
		return false;	
		
	} else if( form.loginPw.value == "" ){
		alert("PASSWORD를 입력해주세요.");
		form.loginPw.focus();
		return false;	
		
	} else if( form.name.value == "" ){
		alert("이름을 입력해주세요.");
		form.name.focus();
		return false;	
		
	} else if( form.nickname.value == "" ){
		alert("닉네임을 입력해주세요.");
		form.nickname.focus();
		return false;	
		
	} else if( form.email.value == "" ){
		alert("email을 입력해주세요.");
		form.email.focus();
		return false;	
		
	} else if( form.phoneNum.value == "" ){
		alert("휴대폰 번호를 입력해주세요.");
		form.phoneNum.focus();
		return false;	
		
	} 

	else {
		alert("test");		
		return false;
	}
}
</script>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>
<form action="doJoin" onsubmit="return check()" name="form">
  <div>ID</div>
  <br>  
  <input type="text" placeholder="아이디를 입력해주세요." name="loginId">
  <hr>
  <div>Password</div>
  <br>
  <input type="text" placeholder="비밀 번호를 입력해주세요." name="loginPw">
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


<%@ include file="../../part/foot.jspf" %>