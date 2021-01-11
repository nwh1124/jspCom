package com.myhome.jspCommunity.servlet.old;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dto.Member;
import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;

@WebServlet("/usr/member/old/list")

public class showMemberListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MysqlUtil.setDBInfo("127.0.0.1", "sbsst", "sbs123414", "jspCommunity");
		
		List<Member> members = Container.memberService.getMembers();
				
		MysqlUtil.closeConnection();
		
		request.setAttribute("members", members);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jspCommunity/usr/member/list.jsp");
		rd.forward(request, response);
		
	}
	
}
