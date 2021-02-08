package com.myhome.jspCommunity.container;

import com.myhome.jspCommunity.controller.UsrArticleController;
import com.myhome.jspCommunity.controller.UsrHomeController;
import com.myhome.jspCommunity.controller.UsrMemberController;
import com.myhome.jspCommunity.controller.UsrRecommendController;
import com.myhome.jspCommunity.controller.UsrReplyController;
import com.myhome.jspCommunity.controller.AdmMemberController;

import com.myhome.jspCommunity.dao.ArticleDao;
import com.myhome.jspCommunity.dao.AttrDao;
import com.myhome.jspCommunity.dao.MemberDao;
import com.myhome.jspCommunity.dao.ReplyDao;
import com.myhome.jspCommunity.dao.BoardDao;

import com.myhome.jspCommunity.service.ArticleService;
import com.myhome.jspCommunity.service.BoardService;
import com.myhome.jspCommunity.service.AttrService;
import com.myhome.jspCommunity.service.MemberService;
import com.myhome.jspCommunity.service.RecommendService;
import com.myhome.jspCommunity.service.EmailService;
import com.myhome.jspCommunity.service.ReplyService;

import com.myhome.jspCommunity.session.Session;

public class Container {
	
	public static Session session;
	
	public static AttrDao attrDao;
	public static ArticleDao articleDao;
	public static MemberDao memberDao;
	public static BoardDao boardDao;
	public static ReplyDao replyDao;

	public static AttrService attrService;
	public static EmailService emailService;	
	public static ReplyService replyService;
	public static RecommendService recommendService;
	public static MemberService memberService;
	public static BoardService boardService;
	public static ArticleService articleService;
	
	public static UsrRecommendController recommendController;
	public static UsrHomeController homeController;
	public static UsrReplyController replyController;
	public static UsrArticleController articleController;
	public static UsrMemberController memberController;
	public static AdmMemberController admMemberController;

		

	
		
	static {
		
		session = new Session();
		
		attrDao = new AttrDao();
		articleDao = new ArticleDao();
		memberDao = new MemberDao();
		boardDao = new BoardDao();
		replyDao = new ReplyDao();
		
		recommendService = new RecommendService();
		attrService = new AttrService();
		emailService = new EmailService();
		articleService = new ArticleService();
		memberService = new MemberService();
		boardService = new BoardService();
		replyService = new ReplyService();
		
		recommendController = new UsrRecommendController();
		articleController = new UsrArticleController();
		memberController = new UsrMemberController();
		admMemberController = new AdmMemberController();
		homeController = new UsrHomeController();
		replyController = new UsrReplyController();
		
	}

}
