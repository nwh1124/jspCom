<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="Article Detail" />

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ include file="../../part/head.jspf" %>

<t:layout>
    <jsp:attribute name="bodyContent">

        <style>
            main {
                display: flex;
                flex-direction: column;
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
                
		         <script>	
		             let Id;
		
		             function modifyActive(Id) {
		                 if ($('.article-detail__reply-view__writer-info__body-modify--' + Id).hasClass('block')) {
		                     $('.article-detail__reply-view__writer-info__body-modify--' + Id).removeClass('block');
		                     $('.article-detail__reply-view__writer-info__body-modify__submit--' + Id).removeClass('block');
		                     $('.article-detail__reply-view__writer-info__body-modify__submit--' + Id).removeClass('btn');
		                 } else {
		                     $('.article-detail__reply-view__writer-info__body-modify--' + Id).addClass('block');
		                     $('.article-detail__reply-view__writer-info__body-modify__submit--' + Id).addClass('block');
		                     $('.article-detail__reply-view__writer-info__body-modify__submit--' + Id).addClass('btn');
		                 }
		
		             }		
		             
		             let replyId;
	    			
   		             function writeReReply(replyId) {   			    			
   		                 if ($('.article-detail__reply-view__reply-bottom__reply-write--' + replyId).hasClass('block')) {
   		                     $('.article-detail__reply-view__reply-bottom__reply-write--' + replyId).removeClass('block');
   		                     $('.article-detail__reply-view__reply-bottom__reply-write__submit--' + replyId).removeClass('block');
   		                     $('.article-detail__reply-view__reply-bottom__reply-write__submit--' + replyId).removeClass('btn');
   		                     $('.article-detail__reply-view__reply-bottom__reReplys__reReply--' + replyId).removeClass('block');
   		                 } else {
   		                     $('.article-detail__reply-view__reply-bottom__reply-write--' + replyId).addClass('block');
   		                     $('.article-detail__reply-view__reply-bottom__reply-write__submit--' + replyId).addClass('block');
   		                     $('.article-detail__reply-view__reply-bottom__reply-write__submit--' + replyId).addClass('btn');
   		                     $('.article-detail__reply-view__reply-bottom__reReplys__reReply--' + replyId).addClass('block');
   		                 }
   		
   		             }
		         </script>

                <div class="article-detail__reply-view">
                    <ul class="article-detail__reply-view__writer-info flex flex-column">
                        <c:forEach var="reply" items="${replys}">
                            <c:if test="${reply.getDelStatus() == 0 }">
                            

                                <li class="">
                                    <span>${reply.getExtra__nickname() }</span>
                                    <span>${reply.getRegDate() }</span>  


                                    <c:if test="${reply.getMemberId() == loginedMemberId }">
                                        <a class="article-detail__reply-view__writer-info__modify" style="cursor:pointer" onclick="modifyActive(${reply.getId()});">수정</a>
                                        <a class="article-detail__reply-view__writer-info__delete" href="../reply/doDelete?replyBody=${reply.getBody() }&relTypeCode=${reply.getRelTypeCode()}&relId=${reply.getRelId()}&memberId=${loginedMemberId}&replyId=${reply.getId()}&boardId=${param.boardId}">삭제</a>
                                    </c:if>

                                    <div>${reply.getBody() }</div>
                                    
                                    <form action="../reply/doModify">
                                        <input type="hidden" name="boardId" value="${param.boardId}" />
                                        <input type="hidden" name="relTypeCode" value="${reply.getRelTypeCode()}" />
                                        <input type="hidden" name="relId" value="${reply.getRelId()}" />
                                        <input type="hidden" name="memberId" value="${reply.getMemberId()}" />
                                        <input type="hidden" name="replyId" value="${reply.getId()}" />
                                        <input class="article-detail__reply-view__writer-info__body-modify--${reply.getId() } replyBody" name="replyBody" value="${reply.getBody() }">
                                        <input class="article-detail__reply-view__writer-info__body-modify__submit--${reply.getId() } replyBtn" type="submit" value="수정하기"/>
                                    </form>                                   

                                    
                                    <div class="article-detail__reply-view__reply-bottom">
                                    	<c:if test="${loginedMemberId > 0 }">
                                    		<a class="article-detail__reply-view__reply-bottom__reply-write" style="cursor:pointer" onclick="writeReReply(${reply.getId()});">대댓글</a>
                                    	</c:if>
                                    	<c:if test="${loginedMemberId <= 0 }">
                                    		<a> </a>
                                    	</c:if>
	                                    <div>
	                                    	<c:forEach var="recommend" items="${memberGiveReplyPointBefore }">
                                    			<c:if test="${ recommend.getRelId() == reply.getId() }">
							
							                        <c:if test="${recommend.getPoint() == 1 }">
			                			              <a href="../recommend/doCancelRecommend?relTypeCode=reply&relId=${reply.getId() }&memberId=${loginedMemberId}&point=1&boardId=${param.boardId}&articleId=${article.getId()}">
				                                        <i class="far fa-thumbs-up" style="background-color:red;"></i>
				                                      </a>
							                        </c:if>
							
							                        <c:if test="${recommend.getPoint() == 2 }">
						                              <a href="../recommend/doCancelRecommend?relTypeCode=reply&relId=${reply.getId() }&memberId=${loginedMemberId}&point=2&boardId=${param.boardId}&articleId=${article.getId()}">
				                                        <i class="far fa-thumbs-down" style="background-color:blue;"></i>
				                                      </a> 
							                        </c:if>
							                        
	                                    		</c:if>
	                                    	</c:forEach>
	                                    	
                                   			<c:if test="${recommend.getPoint() <= 0}">
				                              <a href="../recommend/doRecommend?relTypeCode=reply&relId=${reply.getId() }&memberId=${loginedMemberId}&point=1&boardId=${param.boardId}&articleId=${article.getId()}">
		                                        <i class="far fa-thumbs-up"></i>
		                                      </a>
		                                      <a href="../recommend/doRecommend?relTypeCode=reply&relId=${reply.getId() }&memberId=${loginedMemberId}&point=2&boardId=${param.boardId}&articleId=${article.getId()}">
		                                        <i class="far fa-thumbs-down"></i>
		                                      </a>   
					                        </c:if>
					                        
					                                    
	                                                                     		                                  
                                   			<span>좋아요 : 0</span>   
                                    	</div>              
                                  	</div>
                                    	<div>
                                    		<ul class="article-detail__reply-view__reply-bottom__reReplys">
	                                    	<c:forEach var="reReply" items="${reReplys }">
	                                    		<c:if test="${reply.getId() == reReply.getRelId()}">
	                                    			<li class="article-detail__reply-view__reply-bottom__reReplys__reReply--${reply.getId() }">
	                                    				<div class="reReplys__top">
		                                    				<span>${reReply.getExtra__nickname()}</span>
		                                    				<span>${reReply.getRegDate() }</span>
		                                    			</div>
			                                    		<span>${reReply.getBody() }</span>
			                                    	</li>
		                                    	</c:if>
	                                    	</c:forEach>
	                                    	</ul>
                                    	</div>
                                    <form class="reReply-form" action="../reply/doWrite">
                                        <input type="hidden" name="boardId" value="${param.boardId}" />
                                        <input type="hidden" name="relTypeCode" value="reply" />
                                        <input type="hidden" name="relId" value="${reply.getId()}" />
                                        <input type="hidden" name="memberId" value="${loginedMemberId}" />
                                        <input type="hidden" name="articleId" value="${param.id}" />
                                        <input class="article-detail__reply-view__reply-bottom__reply-write--${reply.getId() } reReplyBody" name="replyBody" value="">
                                        <input class="article-detail__reply-view__reply-bottom__reply-write__submit--${reply.getId() } reReplyBtn" type="submit" value="대댓글 쓰기"/>
                                    </form> 
                                </li>
                            </c:if>
                            <c:if test="${reply.getDelStatus() == 1 }">
                                <li class="deletedReply">
                                    <span>삭제된 댓글입니다.</span>
                                </li>
                            </c:if>
                        </c:forEach>
                        <li></li>
                    </ul>
                </div>

                <script>
                    let writeReplyForm__submited = false;

                    function writeReplyForm__submit(form) {

                        if (writeReplyForm__submited) {
                            alert("처리중입니다.");
                            return false;
                        }

                        form.replyBody.value = form.replyBody.value.trim();
                        if (form.replyBody.value.length == 0) {
                            alert("댓글을 입력해주세요.");
                            form.replyBody.focus();
                            return false;

                        }

                        form.submit();
                        writeReplyForm__submited = true;

                    }
                </script>

                <c:if test="${loginedMemberId > 0}">
                    <div class="article-detail__reply-write">
                        <div class="article-detail__reply-write__info">
                            <span>댓글 작성</span>
                        </div>
                        <form class="article-detail__reply-write__form" action="../reply/doWrite" onsubmit="return writeReplyForm__submit(this); return false">
                        
                            <input type="hidden" name="boardId" value="${param.boardId}" />
                            <input name="memberId" value="${loginedMemberId}" hidden>
                            <input name="relId" value="${article.getId() }" hidden>
                            <input name="relTypeCode" value="article" hidden>
                            <input name="articleId" value="${article.getId() }" hidden>
                            <input class="article-detail__reply-write__form-input" name="replyBody" type="text" />
                            <input class="btn article-detail__reply-write__form-btn" type="submit" value="댓글 쓰기">
                        </form>
                    </div>
                </c:if>

                <div class="btn-wrap">
                    <c:if test="${loginedMemberId == article.getMemberId() }">
                        <a class="btn-warning btn" href="../article/modify?id=${article.getId() }&title=${article.getTitle() }&body=${article.getBody()}&boardId=${param.boardId}">Modify</a>
                        <a class="btn-danger btn" href="../article/delete?id=${article.getId() }">Delete</a>
                    </c:if>
                    <a class="btn btn-success" href="../article/list?boardId=3">List</a>

                    <c:if test="${loginedMemberId > 0}">

                        <c:if test="${memberGiveArticlePointBefore == -1 }">
                            <a class="article-detail__recommend btn" href="../recommend/doRecommend?relTypeCode=article&relId=${article.getId() }&articleId=${article.getId() }&memberId=${loginedMemberId}&point=1&boardId=${param.boardId}">Recommend</a>
                            <a class="article-detail__recommend btn btn-danger" href="../recommend/doRecommend?relTypeCode=article&relId=${article.getId() }&articleId=${article.getId() }&memberId=${loginedMemberId}&point=2&boardId=${param.boardId}">DisRecommend</a>
                        </c:if>

                        <c:if test="${memberGiveArticlePointBefore == 1 }">
                            <a class="article-detail__recommend btn" href="../recommend/doCancelRecommend?relTypeCode=article&relId=${article.getId() }&articleId=${article.getId() }&memberId=${loginedMemberId}&point=1&boardId=${param.boardId}">Cancel Recommend</a>
                        </c:if>

                        <c:if test="${memberGiveArticlePointBefore == 2 }">
                            <a class="article-detail__recommend btn btn-danger" href="../recommend/doCancelRecommend?relTypeCode=article&relId=${article.getId() }&articleId=${article.getId() }&memberId=${loginedMemberId}&point=2&boardId=${param.boardId}">Cancel DisRecommend</a>
                        </c:if>

                    </c:if>

                </div>
                <div style="padding-bottom:10px">
                	<c:if test="${nextArticleId != 0 }">
                		<div>
                			<a href="../article/detail?id=${nextArticleId }&boardId=${param.boardId}"> 다음 글 : ${nextArticle.getTitle() }</a>
                		</div>
                	</c:if>
                	<c:if test="${prevArticleId != 0 }">
                		<div>
                			<a href="../article/detail?id=${prevArticleId }&boardId=${param.boardId}"> 이전 글 : ${prevArticle.getTitle() }</a>
                		</div>
                	</c:if>
                </div>
            </div>
        </div>

    </jsp:attribute>
</t:layout>



<%@ include file="../../part/foot.jspf" %>