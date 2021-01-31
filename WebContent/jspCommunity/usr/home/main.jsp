<%@ page language="java" 
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="홈페이지"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="bodyContent">
	    
	    <div class="title-bar padding-0-10 con-min-width">
	      <h1 class="con">
	        <span><i class="fas fa-home"></i></span>
	        <span>HOME</span>
	      </h1>      
	    </div>
	    
	    <div class="index">
	      <div class="con">
	        <div class="index__latest-articles flex flex-column">
	          <div class="index__lastest-articles__subtitle">
	            <span>최신 글 목록</span>
	          </div>
	          <ul class="index__latest-articles__articles">
              <c:forEach var="article" items="${latestArticles }">
	            <li>
	              <a href="../article/detail?id=${article.getId() }">
	              	<span>
	                  ${article.getTitle() }
	                </span>
	                <span>
	                  ${article.getBody() }
	                </span>	              
	               </a>
	            </li>
              </c:forEach>
	          </ul>
	          <div class="loadMore">
	            <input type="submit" class="btn btn-wrap" onclick="indexLastestArticles__loadMore(this);" name="btnLoadMore" value="더 보기"/>
	          </div>
	        </div>
	      </div>
	    </div>
	    
	</jsp:attribute>
</t:layout>
	
<%@ include file="../../part/foot.jspf" %>