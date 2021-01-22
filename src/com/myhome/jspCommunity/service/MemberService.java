package com.myhome.jspCommunity.service;

import java.util.List;
import java.util.Map;

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

	public Member getMemberById(int loginedMemberId) {
		return memberDao.getMemberById(loginedMemberId);
	}

	public void doJoin(Map<String, Object> joinArgs) {
		memberDao.doJoin(joinArgs);
		
	}

	public void doDelete(int memberId) {
		memberDao.doDelete(memberId);		
	}

	public Member getMemberByLoginId(String loginId) {
		return memberDao.getMemberByLoginId(loginId);
	}
	
	

}
