package com.myhome.jspCommunity.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.controller.ArticleController;
import com.myhome.jspCommunity.controller.MemberController;
import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;
import com.sbs.example.jspCommunity.mysqlutil.SecSql;

@WebServlet("/usr/*")

public class dispatcherServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String requestUri = req.getRequestURI();
		String[] requestUriBits = requestUri.split("/");
		
		if(requestUriBits.length < 5) {
			resp.getWriter().append("<h1>올바른 요청이 아닙니다</h1>");
			return;
		}
		
		String controllerName = requestUriBits[3];
		String actionMethodName = requestUriBits[4];
		
		MysqlUtil.setDBInfo("127.0.0.1", "sbsst", "sbs123414", "jspCommunity");
		
		String jspPath = null;
		
		if( controllerName.equals("member")) {
			MemberController memberController = Container.memberController;
			
			if(actionMethodName.equals("list")) {
				jspPath = memberController.showList(req,resp);
			}
		}else if(controllerName.equals("article")) {
			ArticleController articleController = Container.articleController;
			
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
		}
		
		if( jspPath == null ) {
			return;
		}
		
		MysqlUtil.closeConnection();		
		
		RequestDispatcher rd = req.getRequestDispatcher("/jspCommunity/" + jspPath + ".jsp");
		rd.forward(req, resp);
		
	}
	
}