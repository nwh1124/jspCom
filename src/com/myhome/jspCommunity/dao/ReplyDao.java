package com.myhome.jspCommunity.dao;

import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;
import com.sbs.example.jspCommunity.mysqlutil.SecSql;

public class ReplyDao {

	public void doWriteReply(String relTypeCode, int relId, String body, int memberId) {
		
		SecSql sql = new SecSql();
		
		sql.append("INSERT INTO reply");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", memberId = ?", memberId);
		sql.append(", relTypeCode = ?", relTypeCode);
		sql.append(", relId = ?", relId);
		sql.append(", body = ?", body);
		
		MysqlUtil.update(sql);
		
	}

	public void doModifyReply(int replyId, String relTypeCode, int relId, String body, int memberId) {
		
		SecSql sql = new SecSql();
		
		sql.append("UPDATE reply");
		sql.append("SET regDate = NOW()");
		sql.append(", `body` = ? ", body);
		sql.append("WHERE memberId = ?", memberId);
		sql.append("AND relTypeCode = ?", relTypeCode);
		sql.append("AND relId = ?", relId);
		sql.append("AND id = ?", replyId);
		
		MysqlUtil.update(sql);
		
	}

	public void doDeleteReply(int replyId, String relTypeCode, int relId, String body, int memberId) {
		
		SecSql sql = new SecSql();
		
		sql.append("UPDATE reply");
		sql.append("SET delDate = NOW()");
		sql.append(", delStatus = 1");
		sql.append("WHERE memberId = ?", memberId);
		sql.append("AND relTypeCode = ?", relTypeCode);
		sql.append("AND relId = ?", relId);
		sql.append("AND id = ?", replyId);
		
		MysqlUtil.update(sql);
		
	}

}
