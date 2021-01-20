package com.myhome.jspCommunity.controller;

import java.io.IOException;
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
		
		int boardId = Integer.parseInt((String)req.getParameter("boardId"));				
		List<Article> articles = articleService.getArticlesByBoardId(boardId);
		Board board = boardService.getBoardByBoardId(boardId);
		
		if ( articles == null ) {
			req.setAttribute("alertMsg", boardId + "번 게시판은 존재하지 않습니다.");
			req.setAttribute("replaceUrl", "../home/main");
			return "common/redirect";
		}	
		
		req.setAttribute("articles", articles);
		req.setAttribute("board", board);
		
		return "usr/article/list";
	}

	public String doDelete(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		if( session.getAttribute("loginedMember")  == null ) {
			req.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			req.setAttribute("replaceUrl", "../member/login");
			return "common/redirect";
		}
		
		Member loginedMember =  (Member)session.getAttribute("loginedMember");
		
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
		
		int id = Integer.parseInt((String)req.getParameter("id"));
		Article article = articleService.getArticleById(id);
		
		if( article == null ) {
			req.setAttribute("alertMsg", id + " 번 게시물은 존재하지 않습니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}
		
		String memberName = memberService.getMemberNameById(article.getMemberId());
		String boardName = boardService.getBoardNameByBoardId(article.getBoardId());
		
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
		
		int articleId = Integer.parseInt(req.getParameter("articleId").toString());
		String title = req.getParameter("title").toString();
		String body = req.getParameter("body").toString();
		
		articleService.doModify(articleId, title, body);
		
		req.setAttribute("alertMsg", "수정되었습니다.");
		req.setAttribute("replaceUrl", "detail?id=" + articleId);
		return "common/redirect";
		
	}

	public String showWrite(HttpServletRequest req, HttpServletResponse resp) {		
		HttpSession session = req.getSession();
		
		if( session.getAttribute("loginedMember")  == null ) {
			req.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			req.setAttribute("replaceUrl", "../member/login");
			return "common/redirect";
		}
		
		Member member = (Member)session.getAttribute("loginedMember");
		session.setAttribute("memberId", member.getId());
		
		return "usr/article/write";
	}

	public String showModify(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		
		if( session.getAttribute("loginedMember")  == null ) {
			req.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			req.setAttribute("replaceUrl", "../member/login");
			return "common/redirect";
		}
		
		Member loginedMember =  (Member)session.getAttribute("loginedMember");
		
		int articleMemberId = articleService.getArticleMemberIdById(Integer.parseInt(req.getParameter("id")));
		if ( articleMemberId != loginedMember.getId()) {
			req.setAttribute("alertMsg", "권한이 없습니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}
		
		return "usr/article/modify";
	}

}
