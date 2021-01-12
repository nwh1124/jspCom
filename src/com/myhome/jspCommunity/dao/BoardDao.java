package com.myhome.jspCommunity.dao;

import java.util.Map;

import com.myhome.jspCommunity.dto.Board;
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

	public Board getBoardByBoardId(int boardId) {
		SecSql sql = new SecSql();

		sql.append("SELECT *");
		sql.append("FROM board");
		sql.append("WHERE id = ?", boardId);
		
		Map<String, Object> map = MysqlUtil.selectRow(sql);
		
		return new Board(map);
	}

}
