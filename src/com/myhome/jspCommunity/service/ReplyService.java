package com.myhome.jspCommunity.service;

import java.util.List;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dao.ReplyDao;
import com.myhome.jspCommunity.dao.RecommendDao;
import com.myhome.jspCommunity.dto.Recommend;
import com.myhome.jspCommunity.dto.Reply;
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

	public List<Reply> getReReplys(String relTypeCode, int relId) {
		return ReplyDao.getReReplys(relTypeCode, relId);
	}

	public List<Reply> getReReplysByArticleId(String string, int id) {
		return ReplyDao.getReReplysByArticleId("article", id);
	}

	public List<Reply> getReReplys() {
		return ReplyDao.getReReplys();
	}

}
