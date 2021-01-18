package com.myhome.jspCommunity.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dto.Member;
import com.myhome.jspCommunity.service.MemberService;

public class MemberController {
	MemberService memberService;
	
	public MemberController() {
		memberService = Container.memberService;
		
	}

	public String showList(HttpServletRequest req, HttpServletResponse resp) {		
		List<Member> members = memberService.getMembers();
		
		req.setAttribute("members", members);
		
		return "admin/member/list";
		
	}

	public String showJoin(HttpServletRequest req, HttpServletResponse resp) {
		return "usr/member/showJoin";
	}

	public String doJoin(HttpServletRequest req, HttpServletResponse resp) {
		
		List<Member> members = memberService.getMembers();
		
		if( req.getParameter("loginId") == "" || req.getParameter("loginPw") == "" || req.getParameter("name") == "" 
				|| req.getParameter("nickname") == "" || req.getParameter("email") == "" || req.getParameter("phoneNum") == "" ) {
			req.setAttribute("alertMsg", "회원 정보를 모두 입력해주세요.");
			req.setAttribute("historyBack", true);		
			return "common/redirect";
		}
		
		for(Member member : members) {		
			if( req.getParameter("loginId").equals(member.getLoginId()) ) {
				req.setAttribute("alertMsg", "이미 존재하는 아이디입니다.");
				req.setAttribute("historyBack", true);		
				return "common/redirect";
			}
		}
		
		String loginId = (String)req.getParameter("loginId");
		String loginPw = (String)req.getParameter("loginPw");
		String name = (String)req.getParameter("name");
		String nickname = (String)req.getParameter("nickname");
		String email = (String)req.getParameter("email");
		String phoneNum = (String)req.getParameter("phoneNum");
		
		memberService.doJoin(loginId, loginPw, name, nickname, email, phoneNum);
		
		req.setAttribute("alertMsg", "회원으로 등록되었습니다.");
		req.setAttribute("historyBack", true);		
		return "common/redirect";
	}

	public String showLogin(HttpServletRequest req, HttpServletResponse resp) {
		return "usr/member/showLogin";
	}

	public String doLogin(HttpServletRequest req, HttpServletResponse resp) {
		
		if( Container.session.getIsLogined() == true ) {
			req.setAttribute("alertMsg", "이미 로그인 중입니다.");
			req.setAttribute("replaceUrl", "../article/list?boardId=3");			
			return "common/redirect";
		}
		
		List<Member> members = memberService.getMembers();
		
		if( req.getParameter("loginId") == "" || req.getParameter("loginPw") == "" ) {
			req.setAttribute("alertMsg", "아이디와 비밀번호를 입력해주세요.");
			req.setAttribute("replaceUrl", "login");			
			return "common/redirect";
		}
		
		for(Member member : members) {		
			if( req.getParameter("loginId").equals(member.getLoginId()) ) {				
				if( req.getParameter("loginPw").equals(member.getLoginPw()) ) {
					Container.session.setLoginedMemberId(member.getId());
					Container.session.setLogined(true);
					req.setAttribute("alertMsg", "로그인 되었습니다.");
					req.setAttribute("replaceUrl", "../article/list?boardId=3");			
					return "common/redirect";
					
				}else {
					req.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
					req.setAttribute("replaceUrl", "login");			
					return "common/redirect";					
				}				
			}
		}
		
		req.setAttribute("alertMsg", "존재하지 않는 아이디입니다.");
		req.setAttribute("replaceUrl", "login");			
		return "common/redirect";
	}

	public String showWhoami(HttpServletRequest req, HttpServletResponse resp) {
		if( Container.session.getIsLogined() == false ) {
			req.setAttribute("alertMsg", "비회원입니다.");
			req.setAttribute("replaceUrl", "login");
			return "common/redirect";
		}
		
		Member member = memberService.getMemberById(Container.session.getLoginedMemberId());
		
		req.setAttribute("member", member);
		
		return "usr/member/showWhoami";
	}

}
