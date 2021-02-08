package com.myhome.jspCommunity.service;

import com.myhome.jspCommunity.dao.recommendDao;

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

}
