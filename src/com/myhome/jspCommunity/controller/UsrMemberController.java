package com.myhome.jspCommunity.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dto.Member;
import com.myhome.jspCommunity.service.MemberService;
import com.myhome.jspCommunity.session.Session;
import com.myhome.util.Util;

public class UsrMemberController {
	MemberService memberService;
	
	public UsrMemberController() {
		memberService = Container.memberService;
		
	}

	public String showJoin(HttpServletRequest req, HttpServletResponse resp) {
		return "usr/member/join";
	}

	public String doJoin(HttpServletRequest req, HttpServletResponse resp) {
		
		List<Member> members = memberService.getMembers();
				
		for(Member member : members) {		
			if( req.getParameter("loginId").equals(member.getLoginId()) ) {
				req.setAttribute("alertMsg", "이미 존재하는 아이디입니다.");
				req.setAttribute("historyBack", true);		
				return "common/redirect";
			}
		}
		
		String loginId = (String)req.getParameter("loginId");
		String loginPw = (String)req.getParameter("loginPwReal");
		String name = (String)req.getParameter("name");
		String nickname = (String)req.getParameter("nickname");
		String email = (String)req.getParameter("email");
		String phoneNum = (String)req.getParameter("phoneNum");
		
		Map<String, Object> joinArgs = new HashMap<>();
		
		joinArgs.put("loginId", loginId);
		joinArgs.put("loginPw", loginPw);
		joinArgs.put("name", name);
		joinArgs.put("nickname", nickname);
		joinArgs.put("email", email);
		joinArgs.put("phoneNum", phoneNum);
		
		memberService.doJoin(joinArgs);
		
		req.setAttribute("alertMsg", "회원으로 등록되었습니다.");
		req.setAttribute("replaceUrl", "../home/main");		
		return "common/redirect";
	}

	public String showLogin(HttpServletRequest req, HttpServletResponse resp) {
		return "usr/member/login";
	}

	public String doLogin(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		List<Member> members = memberService.getMembers();
		
		for(Member member : members) {		
			if( req.getParameter("loginId").equals(member.getLoginId()) ) {				
				if( req.getParameter("loginPw").equals(member.getLoginPw()) ) {
					
					session.setAttribute("loginedMemberId", member.getId());
					
					req.setAttribute("alertMsg", "로그인 되었습니다.");
					req.setAttribute("replaceUrl", "../home/main");			
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
		HttpSession session = req.getSession();
		
		Member member = memberService.getMemberById((int)session.getAttribute("loginedMemberId"));
		
		if( member == null ) {
			req.setAttribute("alertMsg", "비회원입니다.");
			req.setAttribute("replaceUrl", "login");
			return "common/redirect";
		}
				
		req.setAttribute("member", member);
		
		return "usr/member/whoami";
	}

	public String doLogout(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		session.setAttribute("loginedMember", null);
		session.setAttribute("islogined", false);
		session.setAttribute("loginedMemberId", null);
		Container.session.setLogined(false);
		Container.session.setLoginedMemberId(-1);

		req.setAttribute("alertMsg", "로그아웃 되었습니다.");
		req.setAttribute("replaceUrl", "../home/main");
		return "common/redirect";
	}

	public String getLoginIdDup(HttpServletRequest req, HttpServletResponse resp) {
		
		Map<String, Object> rs = new HashMap<>();
		
		String loginId = req.getParameter("loginId");		
		String resultCode = null;
		String msg = null;
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if( member != null ) {
			resultCode = "F-1";
			msg = "이미 존재하는 아이디입니다.";
			
		}else {
			resultCode = "S-1";
			msg = "사용 가능한 아이디입니다.";
			
		}
		
		rs.put("resultCode", resultCode);
		rs.put("msg", msg);
		rs.put("loginId", loginId);

		req.setAttribute("data", Util.getJsonText(rs));
		return "common/pure";
	}

	public String showFindLoginId(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		return "/usr/member/findLoginId";
	}

	public String doFindLoginId(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		Member member = memberService.getMemberByNameAndEamil(name, email);
		
		return null;
	}

}
