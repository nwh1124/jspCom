package com.myhome.jspCommunity.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.myhome.jspCommunity.dto.Reply;
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

	public static List<Reply> getReReplys(String relTypeCode, int relId) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT *");
		sql.append("FROM reply");
		sql.append("WHERE 1");
		sql.append("AND relTypeCode = ?", relTypeCode);
		sql.append("AND relId = ?", relId);
		
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
		
		if (listMap == null) {
			return null;
		}
		
		List<Reply> replys = new ArrayList<>();
				
		for(Map<String, Object> map : listMap) {
			replys.add(new Reply(map));
		}
		
		return replys;
	}

	public static List<Reply> getReReplysByArticleId(String relTypeCode, int relId) {
		
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT *");
		sql.append("FROM reply");
		sql.append("WHERE 1");
		sql.append("AND relTypeCode = ?", relTypeCode);
		sql.append("AND relId = ?", relId);
		
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
		
		if (listMap == null) {
			return null;
		}
		
		List<Reply> replys = new ArrayList<>();
				
		for(Map<String, Object> map : listMap) {
			replys.add(new Reply(map));
		}
		
		return replys;
	}

	public static List<Reply> getReReplys() {
		
		SecSql sql = new SecSql();

		sql.append("SELECT R.*, M.nickname");
		sql.append("FROM reply AS R");
		sql.append("LEFT JOIN `member` AS M");
		sql.append("ON M.id = R.memberId");
		sql.append("WHERE 1");
		sql.append("AND relTypeCode = 'reply'");
		
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
		
		if (listMap == null) {
			return null;
		}
		
		List<Reply> replys = new ArrayList<>();
				
		for(Map<String, Object> map : listMap) {
			replys.add(new Reply(map));
		}
		
		return replys;
		
	}

}
