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

function activesideBarBtnClose(){
  $('.mobile-side-bar-btn-close').click(function(){
    let $this = $(this);

    $('.mobile-side-bar__hidden-bar').addClass('active');
    $('.mobile-side-bar-btn-close').addClass('active');
    $('.mobile-side-bar-btn-open').addClass('active');       
  })
}

function activesideBarBtnOpen(){
  $('.mobile-side-bar-btn-open').click(function(){
    let $this = $(this);
    
    $('.mobile-side-bar__hidden-bar').removeClass('active');
    $('.mobile-side-bar-btn-close').removeClass('active');
    $('.mobile-side-bar-btn-open').removeClass('active');
  })
}

activesideBarBtnClose();
activesideBarBtnOpen();