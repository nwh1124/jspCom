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