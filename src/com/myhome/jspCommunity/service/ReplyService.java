package com.myhome.jspCommunity.service;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dao.ReplyDao;
import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;
import com.sbs.example.jspCommunity.mysqlutil.SecSql;

public class ReplyService {
	ReplyDao replyDao;
	
	public ReplyService(){
		replyDao = Container.replyDao; 
	}

	public void doWriteReply(String relTypeCode, int relId, String body, int memberId) {
		replyDao.doWriteReply(relTypeCode, relId, body, memberId);
	}

	public void doModifyReply(int replyId, String relTypeCode, int relId, String body, int memberId) {
		replyDao.doModifyReply(replyId, relTypeCode, relId, body, memberId);
	}

	public void doDeleteReply(int replyId, String relTypeCode, int relId, String body, int memberId) {
		replyDao.doDeleteReply(replyId, relTypeCode, relId, body, memberId);
	}

}
