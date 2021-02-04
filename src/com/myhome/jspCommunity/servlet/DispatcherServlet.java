	package com.myhome.jspCommunity.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dto.Member;
import com.myhome.util.Util;
import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;

public abstract class DispatcherServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		run(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}	

	public void run(HttpServletRequest req, HttpServletResponse resp)  throws ServletException, IOException{
		
		Map<String, Object> doBeforeActionRs = doBeforeAction(req, resp);
		
		if ( doBeforeActionRs == null ) {
			return;
		}
		
		String jspPath = doAction(req, resp, (String)doBeforeActionRs.get("controllerName"), (String)doBeforeActionRs.get("actionMethodName"));
		
		if( jspPath == null ) {
			resp.getWriter().append("jsp 정보가 없습니다.");
			return;
		}
		
		doAfterAction(req, resp, jspPath);
		
	}

	private Map<String, Object> doBeforeAction(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String requestUri = req.getRequestURI();
		String[] requestUriBits = requestUri.split("/");
		
		if(requestUriBits.length < 5) {
			resp.getWriter().append("<h1>올바른 요청이 아닙니다</h1>");
			return null;
		}
		
//		MysqlUtil.setDBInfo("127.0.0.1", "sbsst", "sbs123414", "jspCommunity");
//		서버 연결 전까지 쓰이던 간단한 연결법
		
		String profilesActive = System.getProperty("spring.profiles.active");
		
		boolean isProductionMode = false;

		if (profilesActive != null && profilesActive.equals("production")) {
		  isProductionMode = true;
		}
				
		if ( isProductionMode ) {
		  MysqlUtil.setDBInfo("127.0.0.1", "sbsstLocal", "sbs123414", "jspCommunity");
		}
		else {
		  MysqlUtil.setDBInfo("127.0.0.1", "sbsst", "sbs123414", "jspCommunity");			
		}
		
		// 마리아DB 서버 연결 이후 연결법

		String controllerTypeName = requestUriBits[2];
		String controllerName = requestUriBits[3];
		String actionMethodName = requestUriBits[4];
		
		String actionUrl = "/" + controllerTypeName + "/" + controllerName + "/" + actionMethodName;
		
		// 데이터 추가 인터셉터 시작
		
		boolean isLogined = false;
		int loginedMemberId = 0;
		Member loginedMember = null;
		
		HttpSession session = req.getSession();
		
		if ( session.getAttribute("loginedMemberId") != null ){
			isLogined = true;
			loginedMemberId = (int)session.getAttribute("loginedMemberId");
			loginedMember = Container.memberService.getMemberById(loginedMemberId);
		}
		
		req.setAttribute("isLogined", isLogined);
		req.setAttribute("loginedMemberId", loginedMemberId);
		req.setAttribute("loginedMember", loginedMember);
		
		String currentUri = req.getRequestURI();
		
		if (req.getQueryString() != null) {
			currentUri += "?" + req.getQueryString();
		}
		
		String encodedCurrentUri = Util.getUriEncoded(currentUri);
		
		req.setAttribute("currentUri", currentUri);
		req.setAttribute("encodedCurrentUri", encodedCurrentUri);
		
		// 데이터 추가 인터셉터 끝
		// 로그인 요구 필터링 시작
		
		List<String> needToLoginActionUrls = new ArrayList<>();

		needToLoginActionUrls.add("/usr/article/write");
		needToLoginActionUrls.add("/usr/article/modify");
		needToLoginActionUrls.add("/usr/article/delete");
		needToLoginActionUrls.add("/usr/article/doWrite");
		needToLoginActionUrls.add("/usr/article/doModify");
		needToLoginActionUrls.add("/usr/member/logout");
		needToLoginActionUrls.add("/usr/member/whoami");
		needToLoginActionUrls.add("/usr/member/memberModify");
		needToLoginActionUrls.add("/usr/member/doMemberModify");
		
		if( needToLoginActionUrls.contains(actionUrl) ) {
			
			if( (boolean)req.getAttribute("isLogined") == false ) {
				req.setAttribute("alertMsg", "로그인 후 이용해주세요.");
				req.setAttribute("replaceUrl", "../member/login?afterLoginUrl=" + encodedCurrentUri);
				
				RequestDispatcher rd = req.getRequestDispatcher("/jspCommunity/common/redirect.jsp");
				rd.forward(req, resp);
			}
			
		}
		
		// 로그인 요구 필터링 끝
		
		// 로그인 거부 필터링 시작
		
		List<String> needToLogoutActionUrls = new ArrayList<>();
		needToLogoutActionUrls.add("/usr/member/login");
		needToLogoutActionUrls.add("/usr/member/doLogin");
		needToLogoutActionUrls.add("/usr/member/join");
		needToLogoutActionUrls.add("/usr/member/doJoin");
		needToLogoutActionUrls.add("/usr/member/findLoginId");
		needToLogoutActionUrls.add("/usr/member/doFindLoginId");
		needToLogoutActionUrls.add("/usr/member/findLoginPw");
		needToLogoutActionUrls.add("/usr/member/doFindLoginPw");
		
		if ( needToLogoutActionUrls.contains(actionUrl) ) {
			
			if( (boolean)req.getAttribute("isLogined") == true) {
				req.setAttribute("alertMsg", "로그아웃 후 이용해주세요.");
				req.setAttribute("replaceUrl", "../home/main");
				
				RequestDispatcher rd = req.getRequestDispatcher("/jspCommunity/common/redirect.jsp");
				rd.forward(req, resp);
			}
			
		}
		
		// 로그인 거부 필터링 끝
				
		Map<String, Object> rs = new HashMap<>();
		rs.put("controllerName", controllerName);
		rs.put("actionMethodName", actionMethodName);
		
		return rs;
	}

	protected abstract String doAction(HttpServletRequest req, HttpServletResponse resp, String controllerName, String actionMethodName);
	
	private void doAfterAction(HttpServletRequest req, HttpServletResponse resp, String jspPath) throws ServletException, IOException {
		MysqlUtil.closeConnection();		
		
		RequestDispatcher rd = req.getRequestDispatcher("/jspCommunity/" + jspPath + ".jsp");
		rd.forward(req, resp);
	}
	
}
