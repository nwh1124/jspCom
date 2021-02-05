package com.myhome.jspCommunity.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.service.ReplyService;
import com.myhome.util.Util;

public class UsrReplyController extends Controller{
	
	ReplyService replyService = Container.replyService;

	public String doWrite(HttpServletRequest req, HttpServletResponse resp) {
		int memberId = Util.getAsInt(req.getParameter("memberId"), 0);
		int relId = Util.getAsInt(req.getParameter("relId"), 0);
		String relTypeCode = req.getParameter("relTypeCode");
		String body = req.getParameter("replyBody");
		
		replyService.doWriteReply(relTypeCode, relId, body, memberId);
		Container.articleService.updateArticleRecommendsCountPlus(relId);
		
		return msgAndReplace(req, "댓글이 등록되었습니다.", "../article/detail?id=" + relId);
	}

	public String doModify(HttpServletRequest req, HttpServletResponse resp) {
		
		int memberId = Util.getAsInt(req.getParameter("memberId"), 0);
		int relId = Util.getAsInt(req.getParameter("relId"), 0);
		int replyId = Util.getAsInt(req.getParameter("replyId"), 0);
		String relTypeCode = req.getParameter("relTypeCode");
		String body = req.getParameter("replyBody");
		
		replyService.doModifyReply(replyId, relTypeCode, relId, body, memberId);
		
		return msgAndReplace(req, "댓글이 수정되었습니다", "../article/detail?id=" + relId);
		
	}

	public String doDelete(HttpServletRequest req, HttpServletResponse resp) {
		
		int memberId = Util.getAsInt(req.getParameter("memberId"), 0);
		int relId = Util.getAsInt(req.getParameter("relId"), 0);
		int replyId = Util.getAsInt(req.getParameter("replyId"), 0);
		String relTypeCode = req.getParameter("relTypeCode");
		String body = req.getParameter("replyBody");		
		
		replyService.doDeleteReply(replyId, relTypeCode, relId, body, memberId);
		return msgAndReplace(req, "댓글이 삭제되었습니다", "../article/detail?id=" + relId);
	}
	
}
