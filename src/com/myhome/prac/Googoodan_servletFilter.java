package com.myhome.prac;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Googoodan_servletFilter")
public class Googoodan_servletFilter extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int dan;
		int limit;
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		dan = request.getParameter("dan") == null ? 1 : Integer.parseInt(request.getParameter("dan"));
		limit = request.getParameter("limit") == null ? 9 : Integer.parseInt(request.getParameter("limit"));
		
		request.setAttribute("dan", dan);
		request.setAttribute("limit", limit);
		
		RequestDispatcher rd = request.getRequestDispatcher("/user/Googoodan_jsp.jsp");
		rd.forward(request, response);
		
	}
	
}
