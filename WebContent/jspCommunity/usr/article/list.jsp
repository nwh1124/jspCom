<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 목록"/>
<c:set var="itemsInAPage" value="10"/>
<c:set var="btnsInAPageIndex" value="10"/>
<c:set var="articleCount" value="${articles.size() }"/>
<c:set var="totalPage" value="${articleCount / itemsInAPage }"/>
<c:set var="page" value="${param.page}"/>
<c:if test="${param.page == null }">
	<c:set var="page" value="1"/>
</c:if>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout >
<jsp:attribute name="bodyContent">

   <div class="title-bar padding-0-10 con-min-width">
     <h1 class="con">
       <span><i class="fas fa-list"></i></span>
       <span>게시물 리스트</span>
     </h1>
   </div>

   <div class="article-list-box padding-0-10 con-min-width">
     <div class="con">
       <table>
         <colgroup>
           <col width="100">
           <col width="200">
           <col width="150">
         </colgroup>
         <thead>
           <tr>
             <th>번호</th>
             <th>날짜</th>
             <th>작성자</th>
             <th>제목</th>
           </tr>
         </thead>
         <tbody>
         
         <c:forEach var="article" items="${articles}">
         
          <tr>
             <td>
               <span class="article-list-box__id">${article.getId() }</span>
             </td>
             <td>
               <span class="article-list-box__reg-date">
                 ${article.getRegDate() }
               </span>
             </td>
             <td>
               <span class="article-list-box__writer">
                 ${article.getExtra__nickname()}
               </span>
             </td>
             <td>
               <a href="../article/detail?id=${article.id }" class="article-list-box__title article-list-box__title--pc hover-link">
                 ${article.getBody() }
               </a>
             </td>
             <td class="visible-sm-down">
               <div class="flex">
                 <span class="article-list-box__id article-list-box__id--mobile">${article.getId() }</span>

                 <a href="#" class="article-list-box__title article-list-box__title--mobile flex-grow-1 hover-link">
                 ${article.getBody() }
			  </a>
               </div>

               <div class="flex">
                 <span class="article-list-box__writer article-list-box__writer--mobile">${article.getExtra__nickname() }</span>
                 <span>|</span>
                 <span class="article-list-box__reg-date article-list-box__reg-date--mobile">${article.getRegDate() }</span>
               </div>
             </td>
           </tr>
           
           </c:forEach>
           
<!--       <tr>             
             <td class="visible-sm-down">
               <div class="flex">
                 <span class="article-list-box__id article-list-box__id--mobile"></span>

                 <a href="#" class="article-list-box__title article-list-box__title--mobile flex-grow-1 hover-link"></a>
               </div>

               <div class="flex">
                 <span class="article-list-box__writer article-list-box__writer--mobile"></span>
                 <span>|</span>
                 <span class="article-list-box__reg-date article-list-box__reg-date--mobile"></span>
               </div>
             </td>
           </tr>
           <tr>
             <td>
               <span class="article-list-box__id"></span>
             </td>
             <td>
               <span class="article-list-box__reg-date">
               </span>
             </td>
             <td>
               <span class="article-list-box__writer">
               </span>
             </td>
             <td>
               <a href="#" class="article-list-box__title article-list-box__title--pc hover-link">
               </a>
             </td>
             <td class="visible-sm-down">
               <div class="flex">
                 <span class="article-list-box__id article-list-box__id--mobile"></span>

                 <a href="#" class="article-list-box__title article-list-box__title--mobile flex-grow-1 hover-link"></a>
               </div>

               <div class="flex">
                 <span class="article-list-box__writer article-list-box__writer--mobile"></span>
                 <span>|</span>
                 <span class="article-list-box__reg-date article-list-box__reg-date--mobile"></span>
               </div>
             </td>
           </tr>
-->
         </tbody>
       </table>
     </div>
   </div>

   <div class="article-btn-box padding-0-10 con-min-width">
     <div class="con btn-wrap">
       <a class="btn btn-primary" href="../article/write">WRITE</a>
       <a class="btn btn-info" href="#">LIST</a>
     </div>
   </div>


<!-- 
	<div class="main-content__articleListSubMenu">
		<div class="main-content__subBtn">
			<a href="write?boardId=${board.id}">
				<i class="fas fa-edit"></i>
				<span>게시물 작성</span>
			</a>
		</div>
		<div>
			총 게시물 수 : ${totalCount}
		</div>	
		<div>			
			<script>
			let	doSearchForm__submited = false;
			
			function doSearchForm__submit(form){
		
				if( doSearchForm__submited ){
					alert("처리중입니다");
					return;
				}
		
				if( form.searchKeyword.value.length == 0 ){
					alert('검색어를 입력해주세요.')
					form.searchKeyword.focus();
		
					retrun;			
				}
			
				form.submit();
				doSearchForm__submited = true;
				
			}
			</script>
				<form action="" name="doSearchForm" onsubmit="doSearchForm__submit(this); return false;">
					<input type="hidden" name="boardId" value="${param.boardId }">
					
					<select name="searchKeywordType">
						<option value="titleAndBody">제목 + 본문</option>
						<option value="title">제목</option>
						<option value="body">본문</option>
					</select>
					<script>
						const param__searchKeywordType = '${param.searchKeywordType}';
		
						if( param__searchKeywordType ){
							$('select[name="searchKeywordType"]').val('${param.searchKeywordType}');	
						} else {
							$('select[name="searchKeywordType"]').val('titleAndBody');
						}				
					</script>
					
					<input type="text" name="searchKeyword" value="${param.searchKeyword }" placeholder="검색어를 입력해주세요.">
					
					<input type="submit" value="검색"></input>
				</form>
		</div>		
	</div>
	
	<ul>
		<c:forEach var="article" items="${articles}">
		<li>
			<span>	
			번호 :
			${article.id}
			</span>
			<span>		
			작성일 :
			${article.regDate.substring(5,10)}
			</span>
			<span>	
			제목 :
			</span>
			<span>
			<a href="detail?id=${article.id}&boardId=${article.boardId}">${article.title}</a>
			</span>
			<span>		
			작성자 :
			</span>
			<span>
			${article.extra__nickname}
			</span>
		</li>
		</c:forEach>
	</ul>
 -->

	<style>
	.articleListPageBtns {
	height:40px;
	text-align:center;
	}

	.articleListPageBtns > a{
	font-size:1.2rem;
	padding:10px 5px;
	margin-bottom:10px;
	}
	
	.articleListPageBtns > a:hover{
	background-color:black;
	color:white;
	}
</style>

<div class="articleListPageBtns">
<c:if test="${pageBoxStartBeforeBtnNeedToShow}">
	<c:set var="aUrl" value="?page=${pageBoxStartBeforePage}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
	<a href="${aUrl}">◀</a>
</c:if>
<c:forEach var="i" begin="${pageBoxStartPage}" end="${pageBoxEndPage}" step="1">
	<c:set var="aClass" value="${page == i ? 'red' : ''}" />
	<c:set var="aUrl" value="?page=${i}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
	<a class="${aClass}" href="${aUrl}">${i}</a>
</c:forEach>

<c:if test="${pageBoxEndAfterBtnNeedToShow}">
	<c:set var="aUrl" value="?page=${pageBoxEndAfterPage}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
	<a href="${aUrl}">▶</a>
</c:if>
</div>

</jsp:attribute>
</t:layout>



<%@ include file="../../part/foot.jspf" %>