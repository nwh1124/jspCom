package com.myhome.prac;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Googoodan_servlet")
public class Googoodan_servlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int dan;
		int limit;
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		dan = request.getParameter("dan") == null ? 1 : Integer.parseInt(request.getParameter("dan"));
		limit = request.getParameter("limit") == null ? 9 : Integer.parseInt(request.getParameter("limit"));
		
		response.getWriter().append("<h1>구구단 " + dan + "단</h1>");
		
		for( int i = 1; i <= limit; i++ ) {
			response.getWriter().append(dan + " * " + i + " = " + (dan * i) + "<br>");
		}
		
	}

}
