<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="Member Login"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<t:layout >
	<jsp:attribute name="bodyContent">
	
	<script>
	
	doLoginForm__submited = false;
	
	function doLoginForm__submit(form){

		if( doLoginForm__submited ){
			alert("처리중입니다");
			return false;
		}
		
		form.loginId.value = form.loginId.value.trim();
		if( form.loginId.value.length == 0 ){
			alert("아이디를 입력해주세요.");
			form.loginId.focus();
			
			return false;
		}
		form.loginPw.value = form.loginPw.value.trim();
		if( form.loginPw.value.length == 0 ){
			alert("비밀번호를 입력해주세요.");
			form.loginPw.focus();
			
			return false;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
	
		form.submit();
		doLoginForm__submited = true;
		
	}
	</script>
	
   	<div class="title-bar padding-0-10 con-min-width">
      <h1 class="con">
        <span><i class="fas fa-sign-in-alt"></i></span>
        <span>${pageTitle }</span>
      </h1>
    </div>
    
    <div class="login-form-box form-box padding-0-10 con-min-width">
      <form class="con" action="doLogin" method="POST" onsubmit="return doLoginForm__submit(this); return false;">
      	<input type="hidden" name="loginPwReal"/>
      	<input type="hidden" name="encodedCurrentUri" value="${param.afterLoginUrl }"/>
        <table>
          <colgroup>
            <col width="150">
          </colgroup>
          <tbody>
            <tr>
              <th>
                <span>
                  로그인아이디
                </span>
              </th>
              <td>
                <div>
                  <input type="text" name="loginId" placeholder="로그인아이디를 입력해주세요.">
                </div>
              </td>
            </tr>
            <tr>
              <th>
                <span>
                  로그인비밀번호
                </span>
              </th>
              <td>
                <div>
                  <input type="password" name="loginPw" placeholder="로그인비밀번호를 입력해주세요.">
                </div>
              </td>
            </tr>
            <tr>
              <th>
                <span>
                  로그인
                </span>
              </th>
              <td>
                <div>
                  <div class="btn-wrap">
                    <input class="btn btn-success" type="submit" value="LOGIN"/>
                    <input class="btn btn-info" type="button" onclick="history.back();" value="BACK"/>
                  </div>
                </div>
              </td>
            </tr>
            <tr>
            	<th>
            		<span>회원 가입</span>
            	</th>
            	<td>
            		<a class="btn" href="../member/join">JOIN</a>                    
            	</td>
            </tr>
            <tr>
            	<th>
            		<span>회원 정보 찾기</span>
            	</th>
            	<td>
            		<div class="btn-wrap">            		
	                    <a class="btn btn-danger" href="../member/findLoginId">Find ID</a>
	                    <a class="btn btn-danger" href="../member/findLoginPw">Find PW</a>
	                </div>                   
            	</td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
<!-- 
		<h1><c:out value="${pageTitle}"/></h1>
		<form action="doLogin" method="POST" onsubmit="return doLoginForm__submit(this); return false;">
		  <input type="hidden" name="loginPwReal"/>
		  <div>ID</div>
		  <br>  
		  <input type="text" placeholder="아이디를 입력해주세요." name="loginId">
		  <hr>
		  <div>Password</div>
		  <br>
		  <input type="password" placeholder="비밀 번호를 입력해주세요." name="loginPw">
		  <hr>
		  <input type="submit" value="로그인">
		  <input type="button" value="뒤로가기" onclick="history.back();">
		</form> 
-->
	</jsp:attribute>
</t:layout>


<%@ include file="../../part/foot.jspf" %>