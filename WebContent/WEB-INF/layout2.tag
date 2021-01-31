<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@tag description="layout" language="java" pageEncoding="UTF-8" isELIgnored="false"%>

<%@attribute name="contentBody" fragment="true"%>

<html>

<head>

<c:choose>
	<c:when test="${loginedMember eq null}">
		<c:set var="loginMenu" value="로그인"/>
		<c:set var="loginMenuUrl" value="../member/login"/>
	</c:when>
	<c:otherwise>
		<c:set var="loginMenu" value="로그아웃"/>
		<c:set var="loginMenuUrl" value="../member/logout"/>
	</c:otherwise>	
</c:choose>
</head>

<body>

<div class="body-all">
  
  <div class="top-bar visible-on-md-up">
    <div class="con">
      <div class="top-bar__logo">
        <i class="far fa-comments"></i>
        <span>Open Square</span>
      </div>
    </div>    
  </div>
  
  <div class="mobile-top-bar visible-on-sm-down">    
    <div class="mobile-con">
      <div class="mobile-top-bar__logo">
        <i class="far fa-comments"></i> 
        <span>Open Square</span>
      </div>
    </div>
  </div>
  
  <div class="menu-bar visible-on-md-up">
    <div class="con">
      <div class="menu-bar__list">
		<ul class="">
			<li>
				<a href="../home/main"> 
				<i class="fas fa-home"></i>
				<span>홈</span>
				</a>
			</li>
			<li>
				<a href="../article/list?boardId=3">
				<i class="fas fa-comment-slash"></i> 
				<span>게시물</span>
				</a>
			</li>
			<li>
				<a href="../member/whoami"> 
				<i class="fas fa-user-check"></i>
				<span>회원</span>
				</a>
			</li>
			<li>				
				<a href="${loginMenuUrl}"> 
				<i class="fas fa-comment-medical"></i> 
				<c:out value="${loginMenu}"/>
				</a>
			</li>
		</ul>
	  </div>
    </div>
  </div>
  
  <div class="mobile-kategorie-bar visible-on-sm-down">
    <div class="mobile-con">
      <div class="mobile-kategorie-bar__kategorie-list">
        <ul class="">          
          <li>
            <a href="#">
              <i class="fas fa-caret-square-up"></i>
              <span>Kategorie 1</span>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="fas fa-caret-square-right"></i>
              <span>Kategorie 2</span>
            </a>          
          </li>
          <li>
            <a href="#">
              <i class="fas fa-caret-square-down"></i>
              <span>Kategorie 3</span>
            </a>          
          </li>
          <li>
            <a href="#">
              <i class="fas fa-caret-square-left"></i>
              <span>Kategorie 4</span>
            </a>          
          </li>
        </ul>
      </div>
    </div>
  </div>
  
  <div class="mobile-side-bar visible-on-sm-down">    
    <div class="mobile-side-bar-btn-close" onclick="activeSideBarBtn">
      <i class="fas fa-plus-square"></i>
    </div>    
    <div class="mobile-side-bar-btn-open" onclick="activeSideBarBtn">
      <i class="fas fa-minus-square"></i>
    </div>
    <div class="mobile-side-bar__hidden-bar">
      <div class="mobile-side-bar__hidden-bar__menu-list">
		<ul class="">
			<li>
				<a href="../home/main"> 
				<i class="fas fa-home"></i>
				<span>홈</span>
				</a>
			</li>
			<li>
				<a href="../article/list?boardId=3">
				<i class="fas fa-comment-slash"></i> 
				<span>게시물</span>
				</a>
			</li>
			<li>
				<a href="../member/whoami"> 
				<i class="fas fa-user-check"></i>
				<span>회원</span>
				</a>
			</li>
			<li>
				<a href="${loginMenuUrl}"> 
				<i class="fas fa-comment-medical"></i> 
				<c:out value="${loginMenu}"/>
				</a>
			</li>
		</ul>
      </div>
    </div>
  </div>
  
  <div class="main-content flex-grow-1 visible-on-md-up">
    <div class="con">
      <div class="main-content__content-body">
        <jsp:invoke fragment="contentBody"/>
      </div>
    </div>
  </div>  
  
  <div class="mobile-main-content flex-grow-1 visible-on-sm-down">
    <div class="mobile-con">
      <div class="mobile-main-content__content-body">
        <jsp:invoke fragment="contentBody"/>
      </div>
    </div>
  </div>
  
</div>

</body>

</html>