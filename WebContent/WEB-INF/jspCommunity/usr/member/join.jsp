<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="Member Join"/>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<t:layout>
	<jsp:attribute name="bodyContent">
	<script>
			
		let doJoinForm__submited = false;
		let doJoinForm__checkedLoginId="";

		function doJoinForm__checkLoginIdDup(el){

			// from은 function을 호출한 엘리먼트의 부모의 첫 번째 자식(loginId)
			const from = $(el).closest('form').get(0);	
			const loginId = from.loginId.value;

			console.log(loginId);
			
			$.get(

					"getLoginIdDup",
					{						
						loginId
						// == loginId : loginId
						// loginId(문자열 의미) : loginId (위에서 설정한 변수)
						// loginId라는 문자열에 loginId라는 변수의 값을 넣는다
					},
					function(data){
						if( data.msg ){
							alert(data.msg);
						}						
						
						if( data.success ){							
							doJoinForm__checkedLoginId = data.body.loginId;
						}
						
					},
					"json"					
			);
		
		}
		
		function doJoinForm__submit(form) {

			if (doJoinForm__submited) {
				alert("처리중입니다.");
				return;
			}
			
			form.loginId.value = form.loginId.value.trim();
			
			if (form.loginId.value.length == 0) {
				alert("ID를 입력해주세요.");
				form.loginId.focus();
				return false;

			}
									
			if (form.loginId.value != doJoinForm__checkedLoginId) {
				alert("중복 체크를 해주세요.");
				form.btnLoginIdDupCheck.focus();
				return false;

			}
			
			form.loginPw.value = form.loginPw.value.trim();
			
			if (form.loginPw.value.length == 0) {
				alert("PASSWORD를 입력해주세요.");
				form.loginPw.focus();
				return false;
				
			}
			
			form.loginPwCh.value = form.loginPwCh.value.trim();
			
			if (form.loginPwCh.value == 0) {
				alert("PASSWORD Check를 입력해주세요.");
				form.loginPwCh.focus();
				return false;

			}
				
			form.loginPwCh.value = form.loginPwCh.value.trim();
			
			if (form.loginPwCh.value != form.loginPw.value) {
				alert("PASSWORD가 일치하지 않습니다.");
				form.loginPwCh.focus();
				return false;
				
			}
			
			form.name.value = form.name.value.trim();
			
			if (form.name.value == 0) {
				alert("이름을 입력해주세요.");
				form.name.focus();
				return false;
				
			}
			
			form.nickname.value = form.nickname.value.trim();
			
			if (form.nickname.value == 0) {
				alert("닉네임을 입력해주세요.");
				form.nickname.focus();
				return false;
				
			}
			
			form.email.value = form.email.value.trim();
			
			if (form.email.value == 0) {
				alert("email을 입력해주세요.");
				form.email.focus();
				return false;
				
			}
			
			form.phoneNum.value = form.phoneNum.value.trim();
			
			if (form.phoneNum.value == 0) {
				alert("휴대폰 번호를 입력해주세요.");
				form.phoneNum.focus();
				return false;

			}

			form.loginPwReal.value = sha256(form.loginPw.value);
			form.loginPw.value = "";
			form.loginPwCh.value = "";

			form.submit();
			doJoinForm__submited = true;
		}
	</script>

   <div class="title-bar padding-0-10 con-min-width">
     <h1 class="con">
       <span><i class="fas fa-user-plus"></i></span>
       <span>${pageTitle }</span>
     </h1>
   </div>
		
		<form class="con member-join" action="doJoin" method="POST" onsubmit="return doJoinForm__submit(this); return false;">
		  <input type="hidden" name="loginPwReal"/>
		  <div>ID</div>
		  <input type="text" placeholder="아이디를 입력해주세요." name="loginId">
		  <button class="btn" onclick="doJoinForm__checkLoginIdDup(this);" name="btnLoginIdDupCheck" type="button">중복체크</button>
		  <div>Password</div>
		  <input type="password" placeholder="비밀 번호를 입력해주세요." name="loginPw">
		  <div>Password Check</div>
		  <input type="password" placeholder="비밀 번호를 입력해주세요." name="loginPwCh">
		  <div>Name</div>
		  <input type="text" placeholder="이름을 입력해주세요." name="name">
		  <div>Nickname</div>
		  <input type="text" placeholder="닉네임을 입력해주세요." name="nickname">
		  <div>Email</div>
		  <input type="email" placeholder="Email 주소를 입력해주세요." name="email">
		  <div>Phone Number</div>
		  <input type="number" placeholder="휴대폰 번호를 입력해주세요." name="phoneNum">
		  <div class="btn-wrap">
			  <input class="btn" type="submit" value="가입">
			  <input class="btn" type="button" value="뒤로가기" onclick="history.back();">
		  </div>
		</form>
	</jsp:attribute>
</t:layout>




<%@ include file="../../part/foot.jspf" %>