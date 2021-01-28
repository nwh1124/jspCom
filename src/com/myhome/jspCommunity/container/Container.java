package com.myhome.jspCommunity.container;

import com.myhome.jspCommunity.controller.UsrArticleController;
import com.myhome.jspCommunity.controller.UsrHomeController;
import com.myhome.jspCommunity.controller.UsrMemberController;
import com.myhome.jspCommunity.controller.AdmMemberController;

import com.myhome.jspCommunity.dao.ArticleDao;
import com.myhome.jspCommunity.dao.AttrDao;
import com.myhome.jspCommunity.dao.MemberDao;
import com.myhome.jspCommunity.dao.BoardDao;

import com.myhome.jspCommunity.service.ArticleService;
import com.myhome.jspCommunity.service.AttrService;
import com.myhome.jspCommunity.service.MemberService;
import com.myhome.jspCommunity.service.EmailService;
import com.myhome.jspCommunity.session.Session;
import com.myhome.jspCommunity.service.BoardService;

public class Container {
	
	public static Session session;
	
	public static AttrDao attrDao;
	public static ArticleDao articleDao;
	public static MemberDao memberDao;
	public static BoardDao boardDao;

	public static AttrService attrService;
	public static EmailService emailService;	
	public static ArticleService articleService;
	public static MemberService memberService;
	public static BoardService boardService;
	
	public static UsrArticleController articleController;
	public static UsrMemberController memberController;	
	public static AdmMemberController admMemberController;
	public static UsrHomeController homeController;

	
	static {
		
		session = new Session();
		
		attrDao = new AttrDao();
		articleDao = new ArticleDao();
		memberDao = new MemberDao();
		boardDao = new BoardDao();
		
		attrService = new AttrService();
		emailService = new EmailService();
		articleService = new ArticleService();
		memberService = new MemberService();
		boardService = new BoardService();
		
		articleController = new UsrArticleController();
		memberController = new UsrMemberController();
		admMemberController = new AdmMemberController();
		homeController = new UsrHomeController();
		
	}

}
