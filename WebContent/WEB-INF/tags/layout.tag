<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@tag description="layout" language="java" pageEncoding="UTF-8" isELIgnored="false"%>

<%@attribute name="bodyContent" fragment="true"%>

<html>

<body>

<div class="body-content">
  <header class="top-bar con-min-width">
    <div class="con flex height-100p">      
      <div class="top-bar__title-logo flex flex-ai-c flex-jc-c flex-grow-1">
        <a href="#" class="logo">
          <span><i class="fas fa-globe"></i></span>
          <span>Path of Atlas</span>
        </a>
      </div>

      <nav class="top-bar__menu-box-1">
        <ul class="flex height-100p">
          <li>
            <a href="../home/main" class="flex flex-ai-c height-100p">
              <span><i class="fas fa-home"></i></span>
              <span>HOME</span>
            </a>    
          </li>
          <li>
            <a href="../article/list?boardId=3" class="flex flex-ai-c height-100p">
              <span><i class="far fa-comment-alt"></i></span>
              <span>BOARD</span>
            </a>
          </li> 
          <c:if test="${loginedMemberId > 0 }">
          <li> 
            <a href="../member/whoami" class="flex flex-ai-c height-100p">
              <span><i class="fas fa-user-plus"></i></span>
              <span>MEMBER</span>
            </a>
          </li>
          </c:if> 
          <li>
          <c:if test="${loginedMemberId <= 0 }">
            <a href="../member/login" class="flex flex-ai-c height-100p">
              <span><i class="fas fa-lock"></i></span>
              <span>LOGIN</span>
            </a>
          </c:if>  
          <c:if test="${loginedMemberId > 0 }">
            <a href="../member/logout" class="flex flex-ai-c height-100p">
              <span><i class="fas fa-lock-open"></i></span>
              <span>LOGOUT</span>
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