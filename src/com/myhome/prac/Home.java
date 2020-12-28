package com.myhome.prac;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Home")
public class Home extends HttpServlet {

	protected void doSet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String lang = request.getParameter("lang");
		String hello = "";
		int count = request.getParameter("count") == null ? 1 : Integer.parseInt(request.getParameter("count")); 
		
		if(request.getParameter("lang") == null) {
			response.getWriter().append("<h1>안녕하세요!</h1>");
			return;
		}
				
		if( lang.equals("일본어") ) {
			hello = "<h1>こんにちは!</h1>";
		}else if( lang.equals("영어") ) {
			hello = "<h1>Hello!</h1>";
		}else {
			hello = "<h1>안녕하세요!</h1>";
		}
		
		for(int i = 0; i < count; i++) {
			response.getWriter().append(hello);
		}
		
	}

}
