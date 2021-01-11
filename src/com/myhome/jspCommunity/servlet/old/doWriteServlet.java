package com.myhome.jspCommunity.servlet.old;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;
import com.sbs.example.jspCommunity.mysqlutil.SecSql;

@WebServlet("/usr/article/old/doWrite")

public class doWriteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
				
		String title = "";
		String body = "";
		
		title = request.getParameter("title");
		body = request.getParameter("body");
		
		if(title == null || body == null) {
			response.getWriter().append("<h1>title과 body를 입력해주세요</h1>");
			return;
		}
		
		MysqlUtil.setDBInfo("127.0.0.1", "sbsst", "sbs123414", "jspCommunity");
		
		SecSql sql = new SecSql();
		
		sql.append("INSERT INTO article");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", title = ?", title);
		sql.append(", body = ?", body);
		sql.append(", memberId = 1");
		sql.append(", boardId = 3");
		
		MysqlUtil.update(sql);
				
		MysqlUtil.closeConnection();		
		
		request.setAttribute("title", title);
		request.setAttribute("body", body);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jspCommunity/usr/article/doWrite.jsp");
		rd.forward(request, response);
		
	}
	
}
