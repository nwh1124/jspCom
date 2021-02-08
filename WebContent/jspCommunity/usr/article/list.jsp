<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="Article List" />
<c:set var="itemsInAPage" value="10" />
<c:set var="btnsInAPageIndex" value="10" />
<c:set var="articleCount" value="${articles.size() }" />
<c:set var="totalPage" value="${articleCount / itemsInAPage }" />
<c:set var="page" value="${param.page}" />
<c:if test="${param.page == null }">
    <c:set var="page" value="1" />
</c:if>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@ include file="../../part/head.jspf" %>

<t:layout>
    <jsp:attribute name="bodyContent">

        <div class="title-bar padding-0-10 con-min-width">
            <h1 class="con">
                <span><i class="fas fa-list"></i></span>
                <span>${board.getName() } 게시판</span>
            </h1>
        </div>

        <div class="searchForm con">
            <script>
                let doSearchForm__submited = false;

                function doSearchForm__submit(form) {

                    if (doSearchForm__submited) {
                        alert("처리중입니다");
                        return false;
                    }

                    if (form.searchKeyword.value.length == 0) {
                        alert('검색어를 입력해주세요.')
                        form.searchKeyword.focus();

                        return false;
                    }

                    form.submit();
                    doSearchForm__submited = true;

                }
            </script>
            <div class="findArticlesCount">
                <span>
                    총 게시물 |
                </span>
                <span>
                    ${totalCount }
                </span>
            </div>
            <form action="" name="doSearchForm" onsubmit="doSearchForm__submit(this); return false;">
                <input type="hidden" name="boardId" value="${param.boardId }">



                <select class="searchKeywordType" name="searchKeywordType">
                    <option value="titleAndBody">제목 + 본문</option>
                    <option value="title">제목</option>
                    <option value="body">본문</option>
                </select>
                <script>
                    const param__searchKeywordType = '${param.searchKeywordType}';

                    if (param__searchKeywordType) {
                        $('select[name="searchKeywordType"]').val('${param.searchKeywordType}');
                    } else {
                        $('select[name="searchKeywordType"]').val('titleAndBody');
                    }
                </script>

                <input class="searchKeyword" type="text" name="searchKeyword" value="${param.searchKeyword }" placeholder="검색어를 입력해주세요.">

                <input class="btn" type="submit" value="검색"></input>
            </form>
        </div>

        <div class="article-list-box padding-0-10 con-min-width">
            <div class="con">
                <table>
                    <colgroup>
                        <col width="50">
                        <col width="150">
                        <col width="200">
                        <col width="700">
                        <col width="50">
                        <col width="50">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>날짜</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>조회수</th>
                            <th>추천수</th>
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
                                    <a href="../article/detail?id=${article.id }&boardId=${param.boardId}" class="article-list-box__title article-list-box__title--pc hover-link">
                                        <span>${article.getTitle() }</span>
                                        <c:if test="${article.getCommentsCount() > 0 }">
                                        	<span class="article-list-box__title__commentsCount">[${article.getCommentsCount() }]</span>
                                       	</c:if>
                                    </a>
                                </td>
                                <td>
                                    <span class="article-list-box__hitsCount">
                                        ${article.getHitsCount()}
                                    </span>
                                </td>
                                <td>
                                    <span class="article-list-box__hitsCount">
                                        ${article.getLikesCount()}
                                    </span>
                                </td>
                                <td class="visible-sm-down">
                                    <div class="flex">
                                        <span class="article-list-box__id article-list-box__id--mobile">${article.getId() }</span>

                                        <a href="../article/detail?id=${article.id }&boardId=${param.boardId}" class="article-list-box__title article-list-box__title--mobile flex-grow-1 hover-link">
                                            ${article.getTitle() }
                                        </a>
                                    </div>

                                    <div class="flex">
                                        <span class="article-list-box__writer article-list-box__writer--mobile">${article.getExtra__nickname() }</span>
                                        <span>|</span>
                                        <span class="article-list-box__reg-date article-list-box__reg-date--mobile">${article.getRegDate() }</span>
                                        <span>| hit :</span>
                                        <span class="article-list-box__hitsCount article-list-box__hitsCount--mobile">${article.getHitsCount() }</span>
                                        <span>| likes :</span>
                                        <span class="article-list-box__hitsCount article-list-box__likesCount--mobile">${article.getLikesCount() }</span>
                                    </div>
                                </td>
                            </tr>

                        </c:forEach>
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

        <style>
            .articleListPageBtns {
                height: 40px;
                text-align: center;
            }

            .articleListPageBtns>a {
                font-size: 1.2rem;
                padding: 10px 5px;
                margin-bottom: 10px;
            }

            .articleListPageBtns>a:hover {
                background-color: black;
                color: white;
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