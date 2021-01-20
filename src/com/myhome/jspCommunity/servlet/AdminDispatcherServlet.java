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

@WebServlet("/adm/*")
public class AdminDispatcherServlet extends DispatcherServlet {
	protected String doAction(HttpServletRequest req, HttpServletResponse resp, String controllerName, String actionMethodName) {
		
		String jspPath = null;
		
		if( controllerName.equals("member")) {
			AdmMemberController memberController = Container.admMemberController;
			
			if(actionMethodName.equals("list")) {
				jspPath = memberController.showList(req,resp);
			} else if(actionMethodName.equals("delete")) {
				jspPath = memberController.doDelete(req,resp);
			}
			
		}
		
		return jspPath;
		
	}
}
