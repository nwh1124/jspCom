package com.myhome.jspCommunity.container;

import com.myhome.jspCommunity.dao.ArticleDao;
import com.myhome.jspCommunity.dao.MemberDao;
import com.myhome.jspCommunity.dao.BoardDao;

import com.myhome.jspCommunity.service.ArticleService;
import com.myhome.jspCommunity.service.MemberService;
import com.myhome.jspCommunity.session.Session;
import com.myhome.jspCommunity.service.BoardService;

import com.myhome.jspCommunity.controller.ArticleController;
import com.myhome.jspCommunity.controller.MemberController;

public class Container {
	
	public static Session session;
	
	public static ArticleDao articleDao;
	public static MemberDao memberDao;
	public static BoardDao boardDao;

	public static ArticleService articleService;
	public static MemberService memberService;
	public static BoardService boardService;
	
	public static ArticleController articleController;
	public static MemberController memberController;				
	
	static {
		
		session = new Session();
		
		articleDao = new ArticleDao();
		memberDao = new MemberDao();
		boardDao = new BoardDao();
		
		articleService = new ArticleService();
		memberService = new MemberService();
		boardService = new BoardService();
		
		articleController = new ArticleController();
		memberController = new MemberController();
		
	}

}
