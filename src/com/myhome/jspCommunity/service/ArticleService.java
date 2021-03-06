package com.myhome.jspCommunity.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dao.ArticleDao;
import com.myhome.jspCommunity.dto.Article;
import com.myhome.jspCommunity.dto.Reply;

public class ArticleService {

	private ArticleDao articleDao;
	
	public ArticleService() {
		articleDao = Container.articleDao;
	}

	public int getBoardIdByCode(String boardCode) {		
		return articleDao.getBoardIdByCode(boardCode);		
	}

	public List<Article> getArticlesByBoardId(int boardId) {		
		return articleDao.getArticlesByBoardId(boardId);
	}

	public List<Article> getArticlesByBoardId(int boardId, String searchKeyword, String searchKeywordType) {
		return articleDao.getArticlesByBoardId(boardId, searchKeyword, searchKeywordType);
	}

	public void doWrite(String title, String body, int boardId) {
		articleDao.doWrite(title, body, boardId);
	}

	public void doModify(int id, String title, String body) {
		articleDao.doModify(id, title, body);		
	}

	public void doDelete(int id) {
		articleDao.doDelete(id);
	}

	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
	}

	public void doWrite(String title, String body, int memberId, int boardId) {
		articleDao.doWrite(title, body, memberId, boardId);
	}

	public int getArticleMemberIdById(int id) {
		return articleDao.getArticleMemberIdById(id);
	}

	public int getArticlesCountByBoardId(int boardId, String searchKeyword, String searchKeywordType) {
		return articleDao.getArticlesCountByBoardId(boardId, searchKeyword, searchKeywordType);
	}

	public List<Article> getArticlesByBoardId(int boardId, int limitStart, int limitCount, String searchKeyword,
			String searchKeywordType) {
		return articleDao.getArticlesByBoardId(boardId, limitStart, limitCount, searchKeyword, searchKeywordType);
	}

	public List<Article> getLatestArticlesForPrint(int input) {
		return articleDao.getLatestArticlesForPrint(input);
	}

	public void updateHitsCount(int id) {
		articleDao.updateHitsCount(id);		
	}

	public List<Reply> getReplyByArticleId(int id) {
		return articleDao.getReplyByArticleId(id);
	}

	public void updateArticleRecommendsCountPlus(int relId) {
		articleDao.updateArticleRecommendsCountPlus(relId);		
	}

}
