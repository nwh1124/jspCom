package com.myhome.jspCommunity.dao;

import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;
import com.sbs.example.jspCommunity.mysqlutil.SecSql;

public class BoardDao {

	public String getBoardNameByBoardId(int boardId) {		
		SecSql sql = new SecSql();

		sql.append("SELECT name");
		sql.append("FROM board");
		sql.append("WHERE id = ?", boardId);
		
		return MysqlUtil.selectRowStringValue(sql);
	}

}
