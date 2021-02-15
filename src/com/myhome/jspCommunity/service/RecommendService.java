package com.myhome.jspCommunity.service;

import java.util.List;

import com.myhome.jspCommunity.dao.RecommendDao;
import com.myhome.jspCommunity.dto.Recommend;
import com.myhome.jspCommunity.dto.Reply;
import com.myhome.util.Util;

public class RecommendService {

	public int isAlraedyRecommend(String relTypeCode, int relId, int memberId) {
		return RecommendDao.isAlraedyRecommend(relTypeCode, relId, memberId);
	}

	public void doRecommend(String relTypeCode, int relId, int memberId, int point) {
		RecommendDao.doRecommend(relTypeCode, relId, memberId, point);
	}

	public void cancelRecommend(String relTypeCode, int relId, int memberId, int point) {
		RecommendDao.cancelRecommend(relTypeCode, relId, memberId, point);
	}

	public List<Recommend> isReplyAlraedyRecommend(int articleId, int memberId) {
		return RecommendDao.isReplyAlraedyRecommend(articleId, memberId);
	}

}
