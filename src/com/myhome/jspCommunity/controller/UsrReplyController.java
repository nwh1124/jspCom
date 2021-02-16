package com.myhome.jspCommunity.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dto.Reply;
import com.myhome.jspCommunity.service.ReplyService;
import com.myhome.util.Util;

public class UsrReplyController extends Controller{
	
	ReplyService replyService = Container.replyService;

	public String doWrite(HttpServletRequest req, HttpServletResponse resp) {
		String redirectUrl = req.getParameter("redirectUrl");
		
		int memberId = Util.getAsInt(req.getParameter("memberId"), 0);
		int relId = Util.getAsInt(req.getParameter("relId"), 0);
		String relTypeCode = req.getParameter("relTypeCode");
		String body = req.getParameter("replyBody");
		
		int newArticleId = replyService.doWriteReply(relTypeCode, relId, body, memberId);
		Container.articleService.updateArticleRecommendsCountPlus(relId);
		
		redirectUrl = redirectUrl.replace("[NEW_REPLY_ID]", newArticleId + "");
		
		return msgAndReplace(req, "댓글이 등록되었습니다.", redirectUrl);
	}

	public String doModify(HttpServletRequest req, HttpServletResponse resp) {
		String redirectUrl = req.getParameter("redirectUrl");
		
		int memberId = Util.getAsInt(req.getParameter("memberId"), 0);
		int relId = Util.getAsInt(req.getParameter("relId"), 0);
		int replyId = Util.getAsInt(req.getParameter("replyId"), 0);
		String relTypeCode = req.getParameter("relTypeCode");
		String body = req.getParameter("replyBody");
		
		replyService.doModifyReply(replyId, relTypeCode, relId, body, memberId);
		
		redirectUrl = redirectUrl.replace("[NEW_REPLY_ID]", replyId + "");
		
		return msgAndReplace(req, "댓글이 수정되었습니다", redirectUrl);
		
	}

	public String doDelete(HttpServletRequest req, HttpServletResponse resp) {
		int memberId = Util.getAsInt(req.getParameter("memberId"), 0);
		int relId = Util.getAsInt(req.getParameter("relId"), 0);
		int replyId = Util.getAsInt(req.getParameter("replyId"), 0);
		int boardId = Util.getAsInt(req.getParameter("boardId"), 0);
		String relTypeCode = req.getParameter("relTypeCode");
		String body = req.getParameter("replyBody");		
		
		replyService.doDeleteReply(replyId, relTypeCode, relId, body, memberId);
		return msgAndReplace(req, "댓글이 삭제되었습니다", "../article/detail?id=" + relId + "&boardId=" + boardId);
	}

	public String getReReplys(HttpServletRequest req, HttpServletResponse resp) {
		
		List<String> jsonReReplys = new ArrayList<String>();
		String relTypeCode = req.getParameter("relTypeCode");
		int relId = Util.getAsInt(req.getParameter("relId"), 0);
		
		System.out.println(relTypeCode);
		System.out.println(relId);
		System.out.println("확인");
		
		List<Reply> reReplys = replyService.getReReplys(relTypeCode, relId);
		
		for(int i = 0; i < reReplys.size(); i++) {
			jsonReReplys.set(i, Util.getJsonText(reReplys.get(i)));
			System.out.println(jsonReReplys.get(i));
		}
		
		return null;
	}
	
}
