package com.myhome.jspCommunity.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dto.Article;
import com.myhome.jspCommunity.dto.Board;
import com.myhome.jspCommunity.dto.Member;
import com.myhome.jspCommunity.dto.Reply;
import com.myhome.jspCommunity.service.ArticleService;
import com.myhome.jspCommunity.service.BoardService;
import com.myhome.jspCommunity.service.MemberService;
import com.myhome.jspCommunity.dto.ResultData;
import com.myhome.util.Util;

public class UsrArticleController extends Controller {
	
	private ArticleService articleService;
	private MemberService memberService;
	private BoardService boardService;
	
	public UsrArticleController() {
		articleService = Container.articleService;
		memberService = Container.memberService;
		boardService = Container.boardService;
	}

	public String showList(HttpServletRequest req, HttpServletResponse resp) {
		
		if ( req.getParameter("boardId") == null ) {			
			return msgAndReplace(req, "게시판 번호를 입력해주세요.", "list?boardId=3");
		}
		
		String searchKeyword = req.getParameter("searchKeyword");
		String searchKeywordType = req.getParameter("searchKeywordType");

		int boardId = Integer.parseInt((String)req.getParameter("boardId"));
		int totalCount = articleService.getArticlesCountByBoardId(boardId, searchKeyword, searchKeywordType);
		
		int itemsInAPage = 11;
		int page = Util.getAsInt(req.getParameter("page"), 1);
		int limitStart = (page - 1) * itemsInAPage;

		Board board = boardService.getBoardByBoardId(boardId);
		req.setAttribute("board", board);

		List<Article> articles = articleService.getArticlesByBoardId(boardId, limitStart, itemsInAPage, searchKeyword, searchKeywordType);
		
		int totalPage = (int) Math.ceil(totalCount / (double) itemsInAPage);
		
		int pageBoxSize = 10;

		// 현재 페이지 박스 시작, 끝 계산
		
		int previousPageBoxesCount = (page - 1) / pageBoxSize;
		int pageBoxStartPage = pageBoxSize * previousPageBoxesCount + 1;
		int pageBoxEndPage = pageBoxStartPage + pageBoxSize - 1;

		if (pageBoxEndPage > totalPage) {
			pageBoxEndPage = totalPage;
		}

		// 이전버튼 페이지 계산
		int pageBoxStartBeforePage = pageBoxStartPage - 1;
		if (pageBoxStartBeforePage < 1) {
			pageBoxStartBeforePage = 1;
		}

		// 다음버튼 페이지 계산
		int pageBoxEndAfterPage = pageBoxEndPage + 1;

		if (pageBoxEndAfterPage > totalPage) {
			pageBoxEndAfterPage = totalPage;
		}

		// 이전버튼 노출여부 계산
		boolean pageBoxStartBeforeBtnNeedToShow = pageBoxStartBeforePage != pageBoxStartPage;
		// 다음버튼 노출여부 계산
		boolean pageBoxEndAfterBtnNeedToShow = pageBoxEndAfterPage != pageBoxEndPage;
		
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("articles", articles);
		req.setAttribute("board", board);
		
		req.setAttribute("pageBoxStartBeforeBtnNeedToShow", pageBoxStartBeforeBtnNeedToShow);
		req.setAttribute("pageBoxEndAfterBtnNeedToShow", pageBoxEndAfterBtnNeedToShow);
		req.setAttribute("pageBoxStartBeforePage", pageBoxStartBeforePage);
		req.setAttribute("pageBoxEndAfterPage", pageBoxEndAfterPage);
		req.setAttribute("pageBoxStartPage", pageBoxStartPage);
		req.setAttribute("pageBoxEndPage", pageBoxEndPage);
		
		return "usr/article/list";
	}

	public String doDelete(HttpServletRequest req, HttpServletResponse resp) {
		
		int id = Util.getAsInt(req.getParameter("id"), 0);
		
		articleService.doDelete(id);
		
		return msgAndReplace(req, "삭제되었습니다.", "../home/main");
	}

	public String showDetail(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		int id = Util.getAsInt(req.getParameter("id"), 0);
		int boardId = Util.getAsInt(req.getParameter("boardId"), 0);
		int articleBoardIdCnt = 0;
		int memberGivePointBefore = 0;
		
		if(session.getAttribute("loginedMemberId") != null) {
			memberGivePointBefore = Container.recommendService.isAlraedyRecommend("article", id, Util.getAsInt(session.getAttribute("loginedMemberId"), 0));
		}		
		
		articleService.updateHitsCount(id);
		List<Reply> replys = articleService.getReplyByArticleId(id);
		Article article = articleService.getArticleById(id);
		
		if( article == null ) {
			return msgAndBack(req, id + " 번 게시물은 존재하지 않습니다.");
		}
				
		List<Article> articles = articleService.getArticlesByBoardId(boardId);
		
		for(int i = 0; i < articles.size(); i++) {
			if(article.getId() == articles.get(i).getId()) {
				articleBoardIdCnt = i;
			}
		};
		
		Article prevArticle = null;
		int prevArticleIndex = articleBoardIdCnt + 1;
		int prevArticleId = 0;
		
		if( prevArticleIndex < articles.size()) {
			prevArticle = articles.get(articleBoardIdCnt + 1);
			prevArticleId = prevArticle.getId();
		}
		
		Article nextArticle = null;
		int nextArticleIndex = articleBoardIdCnt;
		int nextArticleId = 0;
		
		if(nextArticleIndex > 0) {
			nextArticle = articles.get(articleBoardIdCnt - 1);
			nextArticleId = nextArticle.getId();
		}
			
		req.setAttribute("prevArticle", prevArticle);
		req.setAttribute("prevArticleId", prevArticleId);
		req.setAttribute("nextArticle", nextArticle);
		req.setAttribute("nextArticleId", nextArticleId);
		
		req.setAttribute("article", article);
		req.setAttribute("replys", replys);
		req.setAttribute("memberGivePointBefore", memberGivePointBefore);
		
		return "usr/article/detail";
	}

	public String doWrite(HttpServletRequest req, HttpServletResponse resp) {
		
		if( req.getParameter("memberId") == null || req.getParameter("boardId") == null ) {
			return msgAndBack(req, "잘못된 접속입니다 : 회원 번호 또는 게시판 번호 누락");
		}		
				
		int memberId = Util.getAsInt(req.getParameter("memberId"), 0);
		int boardId = Util.getAsInt(req.getParameter("boardId"), 0);
		
		String title = req.getParameter("title");
		String body = req.getParameter("body");
			
		articleService.doWrite(title, body, memberId, boardId);
		
		return msgAndReplace(req, "등록되었습니다.", "list?boardId=" + boardId);
		
	}

	public String doModify(HttpServletRequest req, HttpServletResponse resp) {
				
		int articleId = Util.getAsInt(req.getParameter("articleId"), 0);
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		
		articleService.doModify(articleId, title, body);
		
		return msgAndReplace(req, "수정되었습니다.", "detail?id=" + articleId);
		
	}

	public String showWrite(HttpServletRequest req, HttpServletResponse resp) {
		return "usr/article/write";
	}

	public String showModify(HttpServletRequest req, HttpServletResponse resp) {
		return "usr/article/modify";
	}

}
