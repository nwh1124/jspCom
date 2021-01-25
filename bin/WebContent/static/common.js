// 유튜브 플러그인 시작
function youtubePlugin() {
  toastui.Editor.codeBlockManager.setReplacer('youtube', youtubeId => {
    // Indentify multiple code blocks
    const wrapperId = `yt${Math.random().toString(36).substr(2, 10)}`;

    // Avoid sanitizing iframe tag
    setTimeout(renderYoutube.bind(null, wrapperId, youtubeId), 0);

    return `<div id="${wrapperId}"></div>`;
  });
}

function renderYoutube(wrapperId, youtubeId) {
  const el = document.querySelector(`#${wrapperId}`);

  el.innerHTML = `<div class="toast-ui-youtube-plugin-wrap"><iframe src="https://www.youtube.com/embed/${youtubeId}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>`;
}
// 유튜브 플러그인 끝

// 모바일 사이드바 버튼 
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
// 모바일 사이드바 버튼 

activesideBarBtnClose();
activesideBarBtnOpen();
