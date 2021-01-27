<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원 정보"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="contentBody">
	
	<style>
	.content-body__whoami{
		width:100%;
		display:flex;
		flex-direction:column;
		align-items:flex-start;
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
	
		<h1><c:out value="${pageTitle}"/></h1>
		<div class="content-body__whoami">
			<span>
			등록일 :
			${member.regDate}
			</span>
			<span>
			아이디 :
			${member.loginId}
			</span>
			<span>
			이름 :
			${member.name}
			</span>
			<span>
			닉네임 :
			${member.nickname}
			</span>
			<span>
			Email :
			${member.email}
			</span>
			<span>
			PhoneNumber :
			${member.phoneNumber}
			</span>
		</div>

		<form action="../member/memberModify?memberId=${sessionScope.loginedMemberId}" value="회원 정보 수정">
			<input type="submit" value="회원 정보 수정"/>
		</form>
		<input type="button" value="뒤로가기" onclick="history.back();">
	</jsp:attribute>
</t:layout>

<%@ include file="../../part/foot.jspf" %>