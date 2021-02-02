package com.myhome.jspCommunity.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dto.Member;
import com.myhome.jspCommunity.dto.ResultData;
import com.myhome.jspCommunity.service.MemberService;
import com.myhome.jspCommunity.session.Session;
import com.myhome.util.Util;

public class UsrMemberController extends Controller {
	MemberService memberService;
	
	public UsrMemberController() {
		memberService = Container.memberService;
		
	}

	public String showJoin(HttpServletRequest req, HttpServletResponse resp) {
		return "usr/member/join";
	}

	public String doJoin(HttpServletRequest req, HttpServletResponse resp) {
		
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
		
		return msgAndReplace(req, "회원으로 등록되었습니다", "../home/main");
	}

	public String showLogin(HttpServletRequest req, HttpServletResponse resp) {
		return "usr/member/login";
	}

	public String doLogin(HttpServletRequest req, HttpServletResponse resp) {		
		HttpSession session = req.getSession();
		
		List<Member> members = memberService.getMembers();
		
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if ( member == null ) {
			return msgAndBack(req, "존재하지 않는 회원 아이디입니다.");
		}
		
		if ( member.getLoginPw().equals(loginPw) == false ) {
			return msgAndBack(req, "비밀번호가 일치하지 않습니다.");
		}
		
		session.setAttribute("loginedMemberId", member.getId());
		session.setAttribute("loginedMember", member);
		session.setAttribute("isLogined", true);

		String alertMsg = String.format("%s 님 환영합니다.", member.getNickname());
		String replaceUrl = "../home/main";
		
		if( Util.isEmpty(req.getParameter("afterLoginUrl")) == false ) {
			replaceUrl = req.getParameter("afterLoginUrl");
		}
		
		boolean isUsingTempPassword = memberService.isUsingTempPassword(member.getId());
		
		if( isUsingTempPassword ) {
			alertMsg = "현재 임시 비밀번호를 사용 중입니다. 변경해주세요.";
			session.setAttribute("isUsingTempPassword", 1);
			replaceUrl = "../member/memberModify";
		}
		
		boolean isNeedToModifyOldLoginPw = memberService.isNeedToModifyOldLoginPw(member.getId());

		if (isNeedToModifyOldLoginPw == false) {
			int oldPasswordDays = memberService.getOldPasswordDays();
			alertMsg = String.format("가장 마지막 비밀번호 변경일로부터 " + oldPasswordDays + "일이 경과하였습니다. 비밀번호를 변경해주세요.", member.getNickname());
			session.setAttribute("isNeedToModifyOldLoginPw", 1);
			replaceUrl = "../member/memberModify";
		}
			
		return msgAndReplace(req, alertMsg, replaceUrl);
		
	}

	public String showWhoami(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		req.setAttribute("member", (Member)session.getAttribute("loginedMember"));
		
		return "usr/member/whoami";
	}

	public String doLogout(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		session.setAttribute("loginedMember", null);
		session.setAttribute("loginedMemberId", null);
		session.setAttribute("islogined", false);
		session.setAttribute("isUsingTempPassword", 0);
		session.setAttribute("isNeedToModifyOldLoginPw", 0);	


		return msgAndReplace(req, "로그아웃 되었습니다.", "../home/main");
	}

	public String getLoginIdDup(HttpServletRequest req, HttpServletResponse resp) {
		
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

		return json(req, new ResultData(resultCode, msg, "loginId", loginId));
	}

	public String showFindLoginId(HttpServletRequest req, HttpServletResponse resp) {		
		return "/usr/member/findLoginId";
	}

	public String doFindLoginId(HttpServletRequest req, HttpServletResponse resp) {
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		Member member = memberService.getMemberByNameAndEamil(name, email);
		
		if ( member == null ) {
			return msgAndBack(req, "일치하는 회원이 존재하지 않습니다.");
		}
		
		return msgAndReplace(req, String.format("로그인 아이디는 %s입니다", member.getLoginId()), "../member/login");		
	}

	public String showFindLoginPw(HttpServletRequest req, HttpServletResponse resp) {
		return "/usr/member/findLoginPw";
	}

	public String doFindLoginPw(HttpServletRequest req, HttpServletResponse resp) {
		
		String loginId = req.getParameter("loginId");
		String email = req.getParameter("email");
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if( member == null ) {			
			return msgAndReplace(req, "일치하는 회원이 존재하지 않습니다.", "../member/login");
		}
		
		if( member.getEmail().equals(email) == false) {			
			return msgAndReplace(req, "이메일 주소가 일치하지 않습니다.", "../member/login");
		}
		
		ResultData sendTempLoginPwToEmailRs = memberService.sendTempLoginPwToEmail(member);
		
		if( sendTempLoginPwToEmailRs.isFail() ) {			
			return msgAndBack(req, sendTempLoginPwToEmailRs.getMsg());
		}
		
		return msgAndReplace(req, sendTempLoginPwToEmailRs.getMsg(), "../member/login");
	}

	public String showMemberModify(HttpServletRequest req, HttpServletResponse resp) {
		return "/usr/member/memberModify";
	}

	public String doMemberModify(HttpServletRequest req, HttpServletResponse resp) {
		
		int memberId = Integer.parseInt((String)req.getParameter("memberId"));
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");
		String name = req.getParameter("name");
		String nickname = req.getParameter("nickname");
		String email = req.getParameter("email");
		String phoneNumber = req.getParameter("phoneNumber");
		
		if( loginPw.trim().length() > 0) {
			req.getSession().setAttribute("isUsingTempPassword", 0);
			req.getSession().setAttribute("isNeedToModifyOldLoginPw", 0);			
		}
		
		memberService.doModify(memberId, loginId, loginPw, name, nickname, email, phoneNumber);
		
		return msgAndReplace(req, memberId + " 번 회원의 정보가 수정되었습니다.", "../member/whoami");
	}

}

