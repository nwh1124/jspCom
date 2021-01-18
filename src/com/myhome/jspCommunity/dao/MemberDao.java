package com.myhome.jspCommunity.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.myhome.jspCommunity.dto.Member;
import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;
import com.sbs.example.jspCommunity.mysqlutil.SecSql;

public class MemberDao {

	public List<Member> getMembers() {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT *");
		sql.append("FROM member");
		
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
		
		List<Member> members = new ArrayList<>();
		
		for(Map<String, Object> map : listMap) {
			members.add(new Member(map));
		}
		
		return members;
	}

	public String getMemberNameById(int memberId) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT name");
		sql.append("FROM member");
		sql.append("WHERE id = ?", memberId);
		
		return MysqlUtil.selectRowStringValue(sql);
	}

	public void doJoin(String loginId, String loginPw, String name, String nickname, String email, String phoneNum) {
		
		SecSql sql = new SecSql();
		
		sql.append("INSERT INTO member");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", loginId = ?", loginId);
		sql.append(", loginPw = ?", loginPw);
		sql.append(", name = ?", name);
		sql.append(", nickname = ?", nickname);
		sql.append(", email = ?", email);
		sql.append(", phoneNumber = ?", phoneNum);
		
		MysqlUtil.update(sql);		
		
	}

	public Member getMemberById(int loginedMemberId) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT *");
		sql.append("FROM member");
		sql.append("WHERE id = ?", loginedMemberId);
				
		return new Member(MysqlUtil.selectRow(sql));
	}

}
