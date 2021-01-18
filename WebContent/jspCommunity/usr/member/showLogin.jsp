<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="로그인"/>

<%@ include file="../../part/head.jspf" %>

<h1><c:out value="${pageTitle}"/></h1>
<form action="doLogin" target="_blank">
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