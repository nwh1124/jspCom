package com.myhome.jspCommunity.servlet.old;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dto.Article;
import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;

@WebServlet("/usr/article/old/list")

public class showArticleListByBoardCodeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
				
		if (request.getParameter("boardCode") == null) {
			response.getWriter().append("<h1>boardCode를 입력해주세요.</h1>");
			return;
		}
		
		int boardId = 0;
		String boardName = "";
		String boardCode = request.getParameter("boardCode");
		
		MysqlUtil.setDBInfo("127.0.0.1", "sbsst", "sbs123414", "jspCommunity");
		
		boardId = Container.articleService.getBoardIdByCode(boardCode);
		
		List<Article> articles = new ArrayList<>();
				
		articles = Container.articleService.getArticlesByBoardId(boardId);
		boardName = Container.boardService.getBoardNameByBoardId(boardId);
				
		MysqlUtil.closeConnection();
		
		request.setAttribute("articles", articles);
		request.setAttribute("boardName", boardName);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jspCommunity/usr/article/list.jsp");
		rd.forward(request, response);
		
	}
	
}
