<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="Member Info"/>
<c:set var="member" value="${loginedMember }"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="bodyContent">
	
	<style>
	main{
	display:flex;
	flex-direction:column;'
	}
	</style>
	
  	<div class="title-bar padding-0-10 con-min-width">
      <h1 class="con ">
        <span><i class="fas fa-user-plus"></i></span>
        <span>${pageTitle }</span>
      </h1>
    </div>
    
 	<div class="member-whoami padding-0-10 con-min-width flex flex-column flex-grow-1">
      <div class="con flex-grow-1">
        <ul class="member-whoami__info flex-grow-1">
          <li>
            <span>
            등록일 
            </span> 
            <span>
            ${member.getRegDate() }
            </span>
          </li>
          <li>
            <span>
            아이디
            </span>
            <span>              
            ${member.getLoginId() }
            </span>
          </li>
          <li>
            <span>
            이름
            </span>
            <span>
            ${member.getName() }
            </span>
          </li>
          <li>
            <span>
            닉네임
            </span>
            <span>
            ${member.getNickname() }
            </span>
          </li>
          <li>
            <span>
            Email
            </span>
            <span>              
            ${member.getEmail() }
            </span>
          </li>
          <li>
            <span>
            전화번호
            </span>
            <span>
            ${member.getPhoneNumber() }
            </span>
          </li>
        </ul>        
  
	     <div class="btn-wrap flex">
	       <a href="../member/memberModify?memberId=${sessionScope.loginedMemberId}" class="btn">회원 정보 수정</a>
	      <input class="btn" type="button" value="뒤로가기" onclick="history.back();">
	     </div> 
	</div>  
   </div>
    
	</jsp:attribute>
</t:layout>

<%@ include file="../../part/foot.jspf" %>