package com.myhome.jspCommunity.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.controller.AdmMemberController;
import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;

@WebServlet("/admin/*")
public class AdminDispatcherServlet extends HttpServlet {
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
			AdmMemberController memberController = Container.admMemberController;
			
			if(actionMethodName.equals("list")) {
				jspPath = memberController.showList(req,resp);
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
