package com.myhome.jspCommunity.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myhome.jspCommunity.App;
import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dao.MemberDao;
import com.myhome.jspCommunity.dto.Member;
import com.myhome.jspCommunity.dto.ResultData;
import com.myhome.util.Util;

public class MemberService {
	
	private AttrService attrService = new AttrService();
	private EmailService emailService = new EmailService();
	
	MemberDao memberDao;

	;
	
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

	public ResultData sendTempLoginPwToEmail(Member actor) {
		
		// 메일 제목과 내용 만들기
		String siteName = App.getSite();
		String siteLoginUrl = App.getLoginUrl();
		String title = "[" + siteName + "] 임시 패스워드 발송";
		String tempPassword = Util.getTempPassword(6);
		String body = "<h1>임시 패스워드 : " + tempPassword + "</h1>";
		body += "<a href=\"" + siteLoginUrl + "\" target=\"_blank\">로그인 하러가기</a>";
		
		ResultData rd = null;
		
		// 메일 발송
		int sendRs = emailService.send(actor.getEmail(), title, body);
		
		if(sendRs == 1) {
			// 고객의 패스워드를 방금 생성한 임시패스워드로 변경
			setTempPassword(actor, tempPassword);
			
			return 	rd = new ResultData("S-1", "등록된 " + actor.getEmail() + "으로 임시 비밀번호를 발송했습니다.", "email", actor.getEmail());
			
		}
		else {
			return rd = new ResultData("F-1", "메일 발송에 실패하였습니다.");
			
		}
		
	}

	private void setTempPassword(Member actor, String tempPassword) {
		Map<String, Object> modifyParam = new HashMap<>();
		modifyParam.put("id", actor.getId());
		modifyParam.put("loginPw", Util.sha256(tempPassword));
		modify(modifyParam);
		
		attrService.setValue("member__" + actor.getId() + "__extra__isUsingTempPassword", "1", null);
	}

	private void modify(Map<String, Object> param) {
		memberDao.modify(param);		
	}

	public void doModify(int memberId, String loginId, String loginPw, String name, String nickname, String email,
			String phoneNumber) {
		memberDao.doModify(memberId, loginId, loginPw, name, nickname, email, phoneNumber);
		
	}
	
	

}
