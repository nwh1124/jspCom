<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="게시물 목록"/>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<style>
.main-content__articleListSubMenu{
  display:flex;
  width:100%;
  justify-content:space-between;
  align-items:center;
  margin-bottom:10px;
}

.main-content__articleListSubMenu + ul {
  display:flex;
  flex-direction:column;
  align-items:center;
  width:100%;
}

.main-content__articleListSubMenu + ul > li{
  display:block;
  text-align:center;
  width:100%;
  border-top:1px solid #dadada;
  padding:10px 0;  
}

.main-content__articleListSubMenu + ul > li > span{
  display:inline-block;
}

.main-content__articleListSubMenu + ul > li > span:first-child{
  width:10%;
}
.main-content__articleListSubMenu + ul > li > span:nth-child(2){
  width:20%;
}

.main-content__articleListSubMenu + ul > li > span:nth-child(3){
  width:5%;  
}

.main-content__articleListSubMenu + ul > li > span:nth-child(4){
  width:45%;  
  text-align:left;
}

.main-content__articleListSubMenu + ul > li > span:nth-child(5){
  width:6%;  
}

.main-content__articleListSubMenu + ul > li > span:nth-child(6){
  width:10%; 
  text-align:left; 
}
</style>

<t:layout >
	<jsp:attribute name="contentBody">
	<h1><c:out value="${pageTitle}"/></h1>
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
		${article.regDate}
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
	</jsp:attribute>
</t:layout>


	
<%@ include file="../../part/foot.jspf" %>