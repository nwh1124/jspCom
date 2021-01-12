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
		
		return "usr/member/list";
		
	}

}