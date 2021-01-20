package com.myhome.jspCommunity.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dto.Member;
import com.myhome.jspCommunity.service.MemberService;

public class AdmMemberController {
	MemberService memberService;
	
	public AdmMemberController() {
		memberService = Container.memberService;
		
	}

	public String showList(HttpServletRequest req, HttpServletResponse resp) {		
		List<Member> members = memberService.getMembers();
		
		req.setAttribute("members", members);
		
		return "adm/member/list";
		
	}

	public String doDelete(HttpServletRequest req, HttpServletResponse resp) {
		
		int memberId = Integer.parseInt((String)req.getParameter("memberId"));
		
		memberService.doDelete(memberId);
		
		req.setAttribute("alertMsg", memberId + "번 회원이 삭제되었습니다.");
		req.setAttribute("replaceUrl", "list");
		return "common/redirect";
	}

}
