<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 상세"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ include file="../../part/head.jspf" %>

<t:layout >
	<jsp:attribute name="bodyContent">
	
	<style>
	main{
		display:flex;
		flex-direction:column;
	}
	</style>
	
	
	
   <div class="title-bar padding-0-10 con-min-width">
     <h1 class="con">
       <span><i class="fas fa-edit"></i></span>
       <span>게시물 상세</span>
     </h1>      
   </div>
   
   <div class="article-detail flex flex-column flex-grow-1">
   	<div class="con flex flex-column flex-grow-1">			
      <table class="article-detail__subInfoTable">
         <colgroup>
           <col width="150">
           <col width="250">
           <col width="300">
           <col width="170">
           <col width="170">
           <col width="170">
         </colgroup>
         <thead>
           <tr>
             <th>번호</th>
             <th>작성일</th>
             <th>작성자</th>
             <th>조회수</th>
             <th>추천수</th>
             <th>댓글수</th>
           </tr>
         </thead>        
         <tbody>         
          <tr>
             <td>
               <span class="article-detail-box__id">
               ${article.getId() }
               </span>
             </td>
             <td>
               <span class="article-detail-box__reg-date">
               ${article.getRegDate() }
               </span>
             </td>
             <td>
               <span class="article-detail-box__writer">
                 ${article.getExtra__nickname() }
               </span>
             </td>
            <td>
              <span class="article-detail-box__hitsCount">
              ${article.getHitsCount() }
              </span>
            </td>
            <td>
              <span class="article-detail-box__recommendsCount">
              ${article.getLikesCount() }
              </span>
            </td>
            <td>
              <span class="article-detail-box__commentsCount">
              ${article.getCommentsCount() }
              </span>
            </td>
           </tr>
           </tbody>
      </table>
      
      <div class="article-detail__title">
        <span>제목 | </span>
        <span>${article.getTitle() }</span>
      </div>
      
      <div class="article-detail__body flex flex-grow-1">
        <span hidden>${article.body}</span> 
		<div class="toast-ui-viewer"></div>
      </div>
      
      <div class="article-detail__reply-view">
         <ul class="article-detail__reply-view__writer-info flex flex-column">
         <c:forEach var="reply" items="${replys}">
           <li class="">             
             <span>${reply.getExtra__nickname() }</span>
             <span>${reply.getRegDate() }</span>
             <div>${reply.getBody() }</div>
           </li>         
         </c:forEach>
         </ul>
       </div>
         
       <div class="article-detail__reply-write">
         
       </div>
           
		<div class="btn-wrap">
			<c:if test="${loginedMemberId == article.getMemberId() }">
				<a class="btn-warning btn" href="../article/modify?id=${article.getId() }&title=${article.getTitle() }&body=${article.getBody()}" type="submit">Modify</a>
			    <a class="btn-danger btn" href="../article/delete?id=${article.getId() }">Delete</a>
			</c:if>
	        <a class="btn btn-success" href="../article/list?boardId=3">List</a>
	        
	        <c:if test="${loginedMemberId > 0}">
	        
	        	<c:if test="${memberGivePointBefore == -1 }">        		
		        	<a class="article-detail__recommend btn" href="../article/recommend?relTypeCode=article&id=${article.getId() }&memberId=${loginedMemberId}&point=1">Recommend</a>
		        	<a class="article-detail__recommend btn btn-danger" href="../article/recommend?relTypeCode=article&id=${article.getId() }&memberId=${loginedMemberId}&point=2">DisRecommend</a>
	        	</c:if>
	        	
	        	<c:if test="${memberGivePointBefore == 1 }">        		
		        	<a class="article-detail__recommend btn" href="../article/cancelRecommend?relTypeCode=article&id=${article.getId() }&memberId=${loginedMemberId}&point=1">Cancel Recommend</a>		        	
	        	</c:if>
	        	
	        	<c:if test="${memberGivePointBefore == 2 }">
		        	<a class="article-detail__recommend btn btn-danger" href="../article/cancelRecommend?relTypeCode=article&id=${article.getId() }&memberId=${loginedMemberId}&point=2">Cancel DisRecommend</a>
	        	</c:if>
	        	
	        </c:if>
	        
		</div>
	  </div>
	</div>
    
	</jsp:attribute>
</t:layout>


	
<%@ include file="../../part/foot.jspf" %>