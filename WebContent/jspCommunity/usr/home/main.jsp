<%@ page language="java" 
    pageEncoding="UTF-8" isELIgnored="false"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="홈페이지"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<style>
.main-content__index{
width:100%;
display:flex;
justify-content:space-around;
font-size:1.3rem;
padding-top:20px;
}
</style>

<t:layout >
	<jsp:attribute name="contentBody">
		<div class="main-content__index">
			<a href="../article/write?boardId=3">게시물 작성</a>
			<a href="../article/list?boardId=3">게시물 목록</a>
			<a href="../member/login">로그인</a>
			<a href="../member/logout">로그아웃</a>
			<a href="../member/whoami">회원정보</a>
			<a href="../member/join">회원가입</a>
			<a href="../member/findLoginId">아이디 찾기</a>
			<a href="../member/findLoginPw">비밀번호 찾기</a>			
		</div>
		<div>
			<a href="#">${data}</a>
		</div>
	</jsp:attribute>
</t:layout>
	
<%@ include file="../../part/foot.jspf" %>