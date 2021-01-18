package com.myhome.jspCommunity.service;

import java.util.List;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dao.MemberDao;
import com.myhome.jspCommunity.dto.Member;

public class MemberService {
	
	MemberDao memberDao;
	
	public MemberService() {
		memberDao = Container.memberDao;
	}

	public List<Member> getMembers() {		
		return memberDao.getMembers();
	}

	public String getMemberNameById(int memberId) {
		return memberDao.getMemberNameById(memberId);
	}

	public void doJoin(String loginId, String loginPw, String name, String nickname, String email, String phoneNum) {
		memberDao.doJoin(loginId, loginPw, name, nickname, email, phoneNum);		
	}

	public Member getMemberById(int loginedMemberId) {
		return memberDao.getMemberById(loginedMemberId);
	}
	
	

}
