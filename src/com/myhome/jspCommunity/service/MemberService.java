package com.myhome.jspCommunity.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myhome.jspCommunity.App;
import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dao.MemberDao;
import com.myhome.jspCommunity.dto.Member;
import com.myhome.util.Util;

public class MemberService {
	
	EmailService emailService = new EmailService();
	
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

	public Member getMemberByNameAndEamil(String name, String email) {
		return memberDao.getMemberByNameAndEmail(name, email);
	}

	public Map<String, Object> sendTempLoginPwToEmail(Member actor) {
		
		// 메일 제목과 내용 만들기
		String siteName = App.getSite();
		String siteLoginUrl = App.getLoginUrl();
		String title = "[" + siteName + "] 임시 패스워드 발송";
		String tempPassword = Util.getTempPassword(6);
		String body = "<h1>임시 패스워드 : " + tempPassword + "</h1>";
		body += "<a href=\"" + siteLoginUrl + "\" target=\"_blank\">로그인 하러가기</a>";
		
		Map<String, Object> rs = new HashMap<>();
		
		// 메일 발송
		int sendRs = emailService.send(actor.getEmail(), title, body);
		
		if(sendRs == 1) {
			rs.put("resultCode", "S-1");
			rs.put("msg", "등록된 " + actor.getEmail() + "으로 임시 비밀번호를 발송했습니다.");
			
			// 고객의 패스워드를 방금 생성한 임시패스워드로 변경
			setTempPassword(actor, tempPassword);
		}
		else {
			rs.put("resultCode", "F-1");
			rs.put("msg", "메일 발송에 실패하였습니다.");
			
		}
		
		return rs;
		
	}

	private void setTempPassword(Member actor, String tempPassword) {
		Map<String, Object> modifyParam = new HashMap<>();
		modifyParam.put("id", actor.getId());
		modifyParam.put("loginPw", Util.sha256(tempPassword));
		modify(modifyParam);
		
	}

	private void modify(Map<String, Object> param) {
		memberDao.modify(param);		
	}
	
	

}
