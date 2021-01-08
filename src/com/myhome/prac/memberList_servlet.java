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

@WebServlet("/jspCommunity/usr/article/list")

public class memberList_servlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardId = 0;
		String boardCode = request.getParameter("boardCode") == null ? "notice" : request.getParameter("boardCode");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MysqlUtil.setDBInfo("127.0.0.1", "sbsst", "sbs123414", "jspCommunity");
		
		SecSql sql = new SecSql();

		sql.append("SELECT id");
		sql.append("FROM board");
		sql.append("WHERE code = ?", boardCode);
		
		boardId = MysqlUtil.selectRowIntValue(sql);
		
		sql = new SecSql();
				
		sql.append("SELECT *");
		sql.append("FROM article");
		sql.append("WHERE boardId = ?", boardId);
						
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
				
		MysqlUtil.closeConnection();
		
		request.setAttribute("boardCode", boardCode);
		request.setAttribute("listMap", listMap);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jspCommunity/usr/article/list.jsp");
		rd.forward(request, response);
		
	}
	
}
