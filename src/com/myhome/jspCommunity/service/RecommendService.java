package com.myhome.jspCommunity.service;

import java.util.List;

import com.myhome.jspCommunity.dao.recommendDao;
import com.myhome.jspCommunity.dto.Recommend;
import com.myhome.jspCommunity.dto.Reply;
import com.myhome.util.Util;

public class RecommendService {

	public int isAlraedyRecommend(String relTypeCode, int relId, int memberId) {
		return recommendDao.isAlraedyRecommend(relTypeCode, relId, memberId);
	}

	public void doRecommend(String relTypeCode, int relId, int memberId, int point) {
		recommendDao.doRecommend(relTypeCode, relId, memberId, point);
	}

	public void cancelRecommend(String relTypeCode, int relId, int memberId, int point) {
		recommendDao.cancelRecommend(relTypeCode, relId, memberId, point);
	}

	public List<Recommend> isReplyAlraedyRecommend(int articleId, int memberId) {
		return recommendDao.isReplyAlraedyRecommend(articleId, memberId);
	}

}
