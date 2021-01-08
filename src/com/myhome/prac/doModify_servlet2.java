package com.myhome.prac;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.example.mysqlutil.MysqlUtil;
import com.sbs.example.mysqlutil.SecSql;

@WebServlet("/jspCommunity/usr/article/doModify")

public class doModify_servlet2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
				
		int id = 0;
		String title = "";
		String body = "";
		boolean input = false;
		
		title = request.getParameter("title");
		body = request.getParameter("body");
		
		try {
			id = Integer.parseInt(request.getParameter("id"));
		}
		catch(Exception e) {
			System.out.println("== 게시물 번호 입력 없음 ==");
		}
		
		if(title != null && body != null && id > 0) {
			input = true;
		}
		
		if(title != null && body != null) {
		
			MysqlUtil.setDBInfo("127.0.0.1", "sbsst", "sbs123414", "jspCommunity");
			
			SecSql sql = new SecSql();
			
			sql.append("update article");
			sql.append("SET updateDate = NOW()");
			sql.append(", title = ?", title);
			sql.append(", body = ?", body);
			sql.append("WHERE id = ?", id);
			
			MysqlUtil.update(sql);
					
			MysqlUtil.closeConnection();
		
		}
		
		request.setAttribute("input", input);
		request.setAttribute("title", title);
		request.setAttribute("body", body);
		request.setAttribute("id", id);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jspCommunity/usr/article/doModify.jsp");
		rd.forward(request, response);
		
	}
	
}
