package com.myhome.jspCommunity.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.service.RecommendService;
import com.myhome.util.Util;

public class UsrRecommendController extends Controller{
	
	RecommendService recommendService;
	
	public UsrRecommendController(){
		recommendService = Container.recommendService;
	}

	public String doRecommend(HttpServletRequest req, HttpServletResponse resp) {
		
		int relId = Util.getAsInt(req.getParameter("id"), 0);
		int memberId = Util.getAsInt(req.getParameter("memberId"), 0);
		int point = Util.getAsInt(req.getParameter("point"), 0);
		String relTypeCode = req.getParameter("relTypeCode");		

		int memberGivePointBefore = recommendService.isAlraedyRecommend(relTypeCode, relId, memberId);

		if ( memberGivePointBefore == 1 ) {	
			return msgAndBack(req, "이미 추천한 게시물입니다.");
		}

		if ( memberGivePointBefore == 2 ) {
			return msgAndBack(req, "이미 비추천한 게시물입니다.");
		}
		
		if ( memberGivePointBefore == -1 ) {
			recommendService.doRecommend(relTypeCode, relId, memberId, point);
			
			if(point == 1) {
				return msgAndReplace(req, "추천되었습니다.", String.format("../article/detail?id=%d", relId));
			}
			if(point == 2) {
				return msgAndReplace(req, "비추천되었습니다.", String.format("../article/detail?id=%d", relId));
			}			
			
		}
		
		return msgAndBack(req, "잘못된 접근입니다.");
	}

	public String doCancelRecommend(HttpServletRequest req, HttpServletResponse resp) {
		
		int relId = Util.getAsInt(req.getParameter("id"), 0);
		int memberId = Util.getAsInt(req.getParameter("memberId"), 0);
		int point = Util.getAsInt(req.getParameter("point"), 0);
		String relTypeCode = req.getParameter("relTypeCode");		

		int memberGivePointBefore = recommendService.isAlraedyRecommend(relTypeCode, relId, memberId);
		
		if( memberGivePointBefore == -1 ) {
			return msgAndBack(req, "추천/비추천한 게시물만 취소할 수 있습니다.");
		}
		
		if( memberGivePointBefore == 1 ) {
			if(point == 2) {
				return msgAndBack(req, "추천한 게시물만 추천 취소할 수 있습니다.");
			}
			if(point == 1) {
				recommendService.cancelRecommend(relTypeCode, relId, memberId, point);
				return msgAndReplace(req, "추천이 취소되었습니다.", String.format("../article/detail?id=%d", relId));
			}
		}
		
		if( memberGivePointBefore == 2 ) {
			if(point == 1) {
				return msgAndBack(req, "비추천한 게시물만 비추천을 취소할 수 있습니다.");
			}
			if(point == 2) {
				recommendService.cancelRecommend(relTypeCode, relId, memberId, point);
				return msgAndReplace(req, "비추천이 취소되었습니다.", String.format("../article/detail?id=%d", relId));
			}
		}
		
		return msgAndBack(req, "잘못된 접근입니다.");
	}

}
