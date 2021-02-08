<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@tag description="layout" language="java" pageEncoding="UTF-8" isELIgnored="false"%>

<%@attribute name="bodyContent" fragment="true"%>

<html>

<body>

<div class="body-content">
  <header class="top-bar con-min-width">
    <div class="con flex height-100p">
    <c:if test="${ isUsingTempPassword == 1 }">
    	<div class="warningBar con">
    		<span>임시 비밀번호를 사용 중입니다. 변경해주세요.</span>
    	</div>
    </c:if>
    <c:if test="${ isNeedToModifyOldLoginPw == 1 }">
    	<div class="warningBar con">
    		<span>비밀번호를 변경한 지 90일 이상 지났습니다. 보안을 위해 변경해주세요.</span>
    	</div>
    </c:if>          
      <div class="top-bar__title-logo flex flex-ai-c flex-jc-c flex-grow-1">
        <a href="../home/main" class="logo">
          <span><i class="fas fa-globe"></i></span>
          <span>Path of Atlas</span>
        </a>
      </div>

      <nav class="top-bar__menu-box-1">
        <ul class="flex height-100p">
          <li>
            <a href="../home/main" class="flex flex-ai-c height-100p">
              <span><i class="fas fa-home"></i></span>
              <span class="visible-md-up">HOME</span>
            </a>    
          </li>
          <li>
            <a class="flex flex-ai-c height-100p">
              <span><i class="far fa-comment-alt"></i></span>
              <span class="visible-md-up">BOARD</span>
            </a>
            <ul class="visible-md-up">
              <li>             
             	<span>
             		<i class="far fa-comments"></i>
               		<span>Boards</span>               		
				</span>
                <ul>
                  <li>
                    <a href="../article/list?boardId=2">
                    	<i class="fas fa-exclamation-circle"></i>
                      <span>Notice Board</span>
                    </a>
                  </li>
                  <li>
                    <a href="../article/list?boardId=1">
                    	<i class="far fa-comment-dots"></i>
                      <span>Free Board</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li>
                <a href="../article/list?boardId=3">
                	<i class="fas fa-scroll"></i>
                  <span>GuestBook</span>
                </a>
              </li>
            </ul>
          </li> 
        
          <c:if test="${loginedMemberId > 0 }">
          <li> 
            <a href="../member/whoami" class="flex flex-ai-c height-100p">
              <span><i class="fas fa-user-plus"></i></span>
              <span class="visible-md-up">MEMBER</span>
            </a>
          </li>
          </c:if> 
          <li>
          <c:if test="${loginedMemberId <= 0 }">
            <a href="../member/login" class="flex flex-ai-c height-100p">
              <span><i class="fas fa-lock"></i></span>
              <span class="visible-md-up">LOGIN</span>
            </a>
          </c:if>  
          <c:if test="${loginedMemberId > 0 }">
            <a href="../member/logout" class="flex flex-ai-c height-100p">
              <span><i class="fas fa-lock-open"></i></span>
              <span class="visible-md-up">LOGOUT</span>
            </a>
          </c:if>
          </li>           
        </ul>        
      </nav>
    </div>
  </header>
 <main>
  
  	<jsp:invoke fragment="bodyContent"/>

 </main>
  <footer class="bottom-bar con-min-width">
    <div class="con height-100p">
      <div class="bottom-bar__copyright flex flex-jc-c flex-ai-c flex-column height-100p">
        <div class="logo">
          <span><i class="fas fa-globe"></i></span>
          <span>Path of Atlas</span>
        </div>
        <div class="info">
          <span>
            Copyright 2021.PathofAtlas.All rights reserved.
          </span>
        </div>
      </div>
    </div>
  </footer>
</div>
</body>

</html>