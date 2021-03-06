package com.myhome.jspCommunity.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.controller.UsrArticleController;
import com.myhome.jspCommunity.controller.UsrHomeController;
import com.myhome.jspCommunity.controller.UsrMemberController;
import com.myhome.jspCommunity.controller.UsrRecommendController;
import com.myhome.jspCommunity.controller.UsrReplyController;
import com.myhome.jspCommunity.dto.Member;
import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;

@WebServlet("/usr/*")

public class UsrDispatcherServlet extends DispatcherServlet {

	@Override
	protected String doAction(HttpServletRequest req, HttpServletResponse resp, String controllerName, String actionMethodName) {
			
		String jspPath = null;	
		
		if( controllerName.equals("home")) {
			UsrHomeController homeController = Container.homeController;
			
			if(actionMethodName.equals("main")) {
				jspPath = homeController.showMain(req,resp);
			}
			
		}
		
		if( controllerName.equals("member")) {
			UsrMemberController memberController = Container.memberController;
			
			if(actionMethodName.equals("join")) {
				jspPath = memberController.showJoin(req,resp);
			}else if(actionMethodName.equals("doJoin")) {
				jspPath = memberController.doJoin(req,resp);
			}else if(actionMethodName.equals("login")) {
				jspPath = memberController.showLogin(req,resp);
			}else if(actionMethodName.equals("doLogin")) {
				jspPath = memberController.doLogin(req,resp);
			}else if(actionMethodName.equals("logout")) {
				jspPath = memberController.doLogout(req,resp);
			}else if(actionMethodName.equals("whoami")) {
				jspPath = memberController.showWhoami(req,resp);
			}else if(actionMethodName.equals("getLoginIdDup")) {
				jspPath = memberController.getLoginIdDup(req,resp);
			}else if(actionMethodName.equals("findLoginId")) {
				jspPath = memberController.showFindLoginId(req,resp);
			}else if(actionMethodName.equals("doFindLoginId")) {
				jspPath = memberController.doFindLoginId(req,resp);
			}else if(actionMethodName.equals("findLoginPw")) {
				jspPath = memberController.showFindLoginPw(req,resp);
			}else if(actionMethodName.equals("doFindLoginPw")) {
				jspPath = memberController.doFindLoginPw(req,resp);
			}else if(actionMethodName.equals("memberModify")) {
				jspPath = memberController.showMemberModify(req,resp);
			}else if(actionMethodName.equals("doMemberModify")) {
				jspPath = memberController.doMemberModify(req,resp);
			}
			
		}else if(controllerName.equals("article")) {
			UsrArticleController articleController = Container.articleController;
			
			if(actionMethodName.equals("list")) {
				jspPath = articleController.showList(req,resp);
			}else if(actionMethodName.equals("doWrite")) {
				jspPath = articleController.doWrite(req,resp);
			}else if(actionMethodName.equals("doModify")) {
				jspPath = articleController.doModify(req,resp);
			}else if(actionMethodName.equals("delete")) {
				jspPath = articleController.doDelete(req,resp);
			}else if(actionMethodName.equals("detail")) {
				jspPath = articleController.showDetail(req,resp);
			}else if(actionMethodName.equals("write")) {
				jspPath = articleController.showWrite(req,resp);
			}else if(actionMethodName.equals("modify")) {
				jspPath = articleController.showModify(req,resp);
			}
			
		}else if(controllerName.equals("reply")) {
			UsrReplyController replyController = Container.replyController;
			
			if(actionMethodName.equals("doWrite")) {
				jspPath = replyController.doWrite(req,resp);
			}else if(actionMethodName.equals("doModify")) {
				jspPath = replyController.doModify(req,resp);
			}else if(actionMethodName.equals("doDelete")) {
				jspPath = replyController.doDelete(req,resp);
			}else if(actionMethodName.equals("getReReplys")) {
				jspPath = replyController.getReReplys(req,resp);
			}
			
		}else if(controllerName.equals("recommend")) {
			UsrRecommendController recommendController = Container.recommendController;
			
			if(actionMethodName.equals("doRecommend")) {
				jspPath = recommendController.doRecommend(req,resp);
			}else if(actionMethodName.equals("doCancelRecommend")) {
				jspPath = recommendController.doCancelRecommend(req,resp);
			}
		}
		
		return jspPath;
		
	}
	
}
