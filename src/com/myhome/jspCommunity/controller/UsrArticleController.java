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
import com.myhome.jspCommunity.service.ArticleService;
import com.myhome.jspCommunity.service.BoardService;
import com.myhome.jspCommunity.service.MemberService;
import com.myhome.util.Util;

public class UsrArticleController {
	
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
			req.setAttribute("alertMsg", "게시판 번호를 입력해주세요.");
			req.setAttribute("replaceUrl", "list?boardId=3");
			return "common/redirect";
		}
		
		String searchKeyword = req.getParameter("searchKeyword");
		String searchKeywordType = req.getParameter("searchKeywordType");

		int boardId = Integer.parseInt((String)req.getParameter("boardId"));
		int totalCount = articleService.getArticlesCountByBoardId(boardId, searchKeyword, searchKeywordType);
		
		int itemsInAPage = 10;
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
				
		Member loginedMember =  (Member)req.getAttribute("loginedMember");
		
		int articleMemberId = articleService.getArticleMemberIdById(Integer.parseInt(req.getParameter("id")));
		if ( articleMemberId != loginedMember.getId()) {
			req.setAttribute("alertMsg", "권한이 없습니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}
		
		int id = Integer.parseInt((String)req.getParameter("id"));
		
		articleService.doDelete(id);
		
		req.setAttribute("alertMsg", "삭제되었습니다.");
		req.setAttribute("replaceUrl", "../home/main");
		return "common/redirect";
	}

	public String showDetail(HttpServletRequest req, HttpServletResponse resp) {
		
		if( req.getParameter("id") == null ) {
			req.setAttribute("alertMsg", "게시물 번호를 입력해주세요.");
			req.setAttribute("replaceUrl", "../home/main");
			return "common/redirect";
		}
		
		HttpSession session = req.getSession();
		
		int id = Integer.parseInt((String)req.getParameter("id"));
		int loginMemberId = 0;
		boolean isWriter = false;
		
		if( session.getAttribute("loginedMemberId") == null ) {
			isWriter = false;
		}else {
			loginMemberId = Integer.parseInt(session.getAttribute("loginedMemberId").toString());
		}
		
		Article article = articleService.getArticleById(id);
		
		if( article == null ) {
			req.setAttribute("alertMsg", id + " 번 게시물은 존재하지 않습니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}
		
		String memberName = memberService.getMemberNameById(article.getMemberId());
		String boardName = boardService.getBoardNameByBoardId(article.getBoardId());
		
		req.setAttribute("isWriter", article.getMemberId() == loginMemberId);
		req.setAttribute("article", article);
		req.setAttribute("memberName", memberName);
		req.setAttribute("boardName", boardName);
		
		return "usr/article/detail";
	}

	public String doWrite(HttpServletRequest req, HttpServletResponse resp) {
		
		int memberId = Integer.parseInt(req.getParameter("memberId").toString());
		int boardId = Integer.parseInt(req.getParameter("boardId").toString());
		String title = req.getParameter("title").toString();
		String body = req.getParameter("body").toString();
			
		articleService.doWrite(title, body, memberId, boardId);
		
		req.setAttribute("alertMsg", "등록되었습니다.");
		req.setAttribute("replaceUrl", "list?boardId=" + boardId);
		return "common/redirect";
		
	}

	public String doModify(HttpServletRequest req, HttpServletResponse resp) {
		
		Member loginedMember =  memberService.getMemberById(Integer.parseInt(req.getSession().getAttribute("loginedMemberId").toString()));
		
		int articleMemberId = articleService.getArticleMemberIdById(Integer.parseInt(req.getParameter("articleId")));
		if ( articleMemberId != loginedMember.getId()) {
			req.setAttribute("alertMsg", "권한이 없습니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}
		
		int articleId = Integer.parseInt(req.getParameter("articleId").toString());
		String title = req.getParameter("title").toString();
		String body = req.getParameter("body").toString();
		
		articleService.doModify(articleId, title, body);
		
		req.setAttribute("alertMsg", "수정되었습니다.");
		req.setAttribute("replaceUrl", "detail?id=" + articleId);
		return "common/redirect";
		
	}

	public String showWrite(HttpServletRequest req, HttpServletResponse resp) {		
		
		Member member = (Member)req.getAttribute("loginedMember");
		req.setAttribute("memberId", member.getId());
		
		return "usr/article/write";
	}

	public String showModify(HttpServletRequest req, HttpServletResponse resp) {
		
		Member loginedMember =  (Member)req.getAttribute("loginedMember");
		
		int articleMemberId = articleService.getArticleMemberIdById(Integer.parseInt(req.getParameter("id")));
		if ( articleMemberId != loginedMember.getId()) {
			req.setAttribute("alertMsg", "권한이 없습니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}
		
		return "usr/article/modify";
	}

}
