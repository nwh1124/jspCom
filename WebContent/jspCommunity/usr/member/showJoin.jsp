<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원 가입"/>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>
<form action="doJoin" target="_blank">
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
  <input type="text" placeholder="Email 주소를 입력해주세요." name="email">
  <hr>
  <div>Phone Number</div>
  <br>
  <input type="text" placeholder="휴대폰 번호를 입력해주세요." name="phoneNum">
  <hr>
  <input type="submit" value="가입">
  <input type="button" value="뒤로가기" onclick="history.back();">
</form>

<%@ include file="../../part/foot.jspf" %>