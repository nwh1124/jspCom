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

}
