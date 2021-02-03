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

	public Member getMemberById(int loginedMemberId) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT *");
		sql.append("FROM member");
		sql.append("WHERE id = ?", loginedMemberId);
				
		return new Member(MysqlUtil.selectRow(sql));
	}

	public void doJoin(Map<String, Object> joinArgs) {
		
		String loginId = (String)joinArgs.get("loginId");
		String loginPw = (String)joinArgs.get("loginPw");
		String name = (String)joinArgs.get("name");
		String nickname = (String)joinArgs.get("nickname");
		String email = (String)joinArgs.get("email");
		String phoneNum = (String)joinArgs.get("phoneNum");
		
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

	public void doDelete(int memberId) {
		
		SecSql sql = new SecSql();
		
		sql.append("DELETE FROM member");
		sql.append("WHERE id = ?", memberId);
		
		MysqlUtil.update(sql);
		
	}

	public Member getMemberByLoginId(String loginId) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT *");
		sql.append("FROM member");
		sql.append("WHERE loginId = ?", loginId);
		sql.append("ORDER BY email DESC");
		sql.append("LIMIT 1");
		
		Map<String, Object> map = MysqlUtil.selectRow(sql);		
		
		if( map.isEmpty() ) {
			return null;
		}
		
		Member member = new Member(map);
				
		return member;		
	}

	public Member getMemberByNameAndEmail(String name, String email) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT *");
		sql.append("FROM member");
		sql.append("WHERE name = ?", name);
		sql.append("AND email = ?", email);
		sql.append("ORDER BY email DESC");
		sql.append("LIMIT 1");
		
		Map<String, Object> map = MysqlUtil.selectRow(sql);		
		
		if( map.isEmpty() ) {
			return null;
		}
		
		Member member = new Member(map);
		
		return member;
	}

	public int modify(Map<String, Object> args) {
		
		SecSql sql = new SecSql();
		sql.append("UPDATE member");
		sql.append("SET updateDate = NOW()");
		
		boolean needToUpdate = false;

		if (args.get("loginPw") != null) {
			needToUpdate = true;
			sql.append(", loginPw = ?", args.get("loginPw"));
		}

		if (args.get("name") != null) {
			needToUpdate = true;
			sql.append(", `name` = ?", args.get("name"));
		}
		
		if (args.get("nickname") != null) {
			needToUpdate = true;
			sql.append(", nickname = ?", args.get("nickname"));
		}
		
		if (args.get("email") != null) {
			needToUpdate = true;
			sql.append(", email = ?", args.get("email"));
		}
		
		if (args.get("cellphoneNo") != null) {
			needToUpdate = true;
			sql.append(", cellphoneNo = ?", args.get("cellphoneNo"));
		}
		
		if (args.get("authLevel") != null) {
			needToUpdate = true;
			sql.append(", authLevel = ?", args.get("authLevel"));
		}
		
		if (args.get("authLevel") != null) {
			needToUpdate = true;
			sql.append(", authLevel = ?", args.get("authLevel"));
		}
		
		if ( needToUpdate == false ) {
			return 0;
		}

		sql.append("WHERE id = ?", args.get("id"));

		return MysqlUtil.update(sql);
		
	}

	public void doModify(int memberId, String loginPw, String name, String nickname, String email,
			String phoneNumber) {		
		
		SecSql sql = new SecSql();
		
		sql.append("UPDATE member");
		sql.append("SET regDate = now()");
		
		if( loginPw.trim().length() > 0 ) {	
			sql.append(", loginPw = ?", loginPw);
		}
		if( name.trim().length() > 0 ) {	
			sql.append(", name = ?", name);
		}
		if( nickname.trim().length() > 0 ) {	
			sql.append(", nickname = ?", nickname);
		}
		if( email.trim().length() > 0 ) {	
			sql.append(", email = ?", email);
		}
		if( phoneNumber.trim().length() > 0 ) {	
			sql.append(", phoneNumber = ?", phoneNumber);
		}
		
		sql.append("WHERE id = ?", memberId);

		MysqlUtil.update(sql);
		
		if( loginPw.trim().length() > 0) {
			
			sql = new SecSql();
			
			sql.append("UPDATE attr");
			sql.append("SET `value` = 0");
			sql.append("WHERE relTypeCode = 'member'");
			sql.append("AND relId = ?", memberId);
			sql.append("AND typeCode = 'extra'");
			sql.append("AND type2Code = 'isUsingTempPassword'");
			
			MysqlUtil.update(sql);
		}
		
	}
	
}
