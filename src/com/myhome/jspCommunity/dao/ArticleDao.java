package com.myhome.jspCommunity.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.myhome.jspCommunity.dto.Article;
import com.myhome.jspCommunity.dto.Reply;
import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;
import com.sbs.example.jspCommunity.mysqlutil.SecSql;

public class ArticleDao {

	public int getBoardIdByCode(String boardCode) {

		SecSql sql = new SecSql();

		sql.append("SELECT id");
		sql.append("FROM board");
		sql.append("WHERE code = ?", boardCode);
		
		return MysqlUtil.selectRowIntValue(sql);		
		
	}

	public List<Article> getArticlesByBoardId(int boardId) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT *");
		sql.append("FROM article");
		sql.append("WHERE boardId = ?", boardId);
						
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
		
		if ( listMap.isEmpty() ) {
			return null;
		}
		
		List<Article> articles = new ArrayList<>();
		
		for(Map<String, Object> map : listMap) {
			articles.add(new Article(map));
		}
		
		return articles;
		
	}

	public void doWrite(String title, String body, int boardId) {
		SecSql sql = new SecSql();
		
		sql.append("INSERT INTO article");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", title = ?", title);
		sql.append(", body = ?", body);
		sql.append(", memberId = 1");
		sql.append(", boardId = ?", boardId);
		
		MysqlUtil.update(sql);		
	}

	public void doModify(int id, String title, String body) {
		
		SecSql sql = new SecSql();
		
		sql.append("UPDATE article");
		sql.append("SET updateDate = NOW()");
		sql.append(", title = ?", title);
		sql.append(", body = ?", body);
		sql.append("WHERE id = ?", id);
		
		MysqlUtil.update(sql);
		
	}

	public void doDelete(int id) {
		
		SecSql sql = new SecSql();
		
		sql.append("DELETE");
		sql.append("FROM article");
		sql.append("WHERE id = ?", id);
		
		MysqlUtil.update(sql);
		
	}

	public Article getArticleById(int id) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT A.*");
		sql.append(", M.name as extra__writer");
		sql.append(", M.nickname as extra__nickname");
		sql.append(", B.name as extra__boardName");
		sql.append(", B.code as extra__boardCode");
		sql.append("FROM article as A");
		sql.append("INNER JOIN member as M");
		sql.append("ON A.memberId = M.id");
		sql.append("INNER JOIN board as B");
		sql.append("ON A.boardId = B.id");
		sql.append("WHERE A.id = ?", id);
		
		Map<String, Object> map = MysqlUtil.selectRow(sql);		
		
		if ( map.isEmpty() ) {
			return null;
		}
		
		Article article = new Article(map);
						
		return article;
	}

	public void doWrite(String title, String body, int memberId, int boardId) {
		SecSql sql = new SecSql();
		
		sql.append("INSERT INTO article");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", title = ?", title);
		sql.append(", body = ?", body);
		sql.append(", memberId = ?", memberId);
		sql.append(", boardId = ?", boardId);
		
		MysqlUtil.update(sql);				
	}

	public int getArticleMemberIdById(int id) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT memberId");
		sql.append("FROM article");
		sql.append("WHERE id = ?", id);		
		
		return MysqlUtil.selectRowIntValue(sql);
	}

	public int getArticlesCountByBoardId(int boardId, String searchKeyword, String searchKeywordType) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT COUNT(*) AS cnt");
		sql.append("FROM article as A");
		sql.append("WHERE 1");
		if( boardId != 0 ) {	
			sql.append("AND boardId = ?", boardId);
		}
		if(searchKeyword != null) {
			if(searchKeywordType == null || searchKeywordType.equals("title")) {
				sql.append("AND A.title LIKE CONCAT('%', ?, '%')", searchKeyword);
			}
			else if ( searchKeywordType.equals("body") ) {
				sql.append("AND A.body LIKE CONCAT('%', ?, '%')", searchKeyword);
			}
			else if ( searchKeywordType.equals("titleAndBody") ) {
				sql.append("AND (A.title LIKE CONCAT('%', ?, '%') OR A.body LIKE CONCAT('%', ?, '%')) ", searchKeyword, searchKeyword);
			}
		}
		
		return MysqlUtil.selectRowIntValue(sql);
	}

	public List<Article> getArticlesByBoardId(int boardId, String searchKeyword, String searchKeywordType) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT A.*");
		sql.append(", M.name as extra__writer");
		sql.append(", M.nickname as extra__nickname");
		sql.append(", B.name as extra__boardName");
		sql.append(", B.code as extra__boardCode");
		sql.append("FROM article as A");
		sql.append("INNER JOIN member as M");
		sql.append("ON A.memberId = M.id");
		sql.append("INNER JOIN board as B");
		sql.append("ON A.boardId = B.id");
		sql.append("WHERE 1");
		
		if(boardId != 0) {
			sql.append("AND A.boardId = ?", boardId);
		}
		
		if(searchKeyword != null) {
			if(searchKeywordType == null || searchKeywordType.equals("title")) {
				sql.append("AND A.title LIKE CONCAT('%', ?, '%')", searchKeyword);
			}
			else if ( searchKeywordType.equals("body") ) {
				sql.append("AND A.body LIKE CONCAT('%', ?, '%')", searchKeyword);
			}
			else if ( searchKeywordType.equals("titleAndBody") ) {
				sql.append("AND (A.title LIKE CONCAT('%', ?, '%') OR A.body LIKE CONCAT('%', ?, '%')) ", searchKeyword, searchKeyword);
			}
		}
		sql.append("ORDER BY A.id DESC");
		
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
		
		List<Article> articles = new ArrayList<>();
		
		for(Map<String, Object> map : listMap) {
			articles.add(new Article(map));
		}
		
		return articles;
	}

	public List<Article> getArticlesByBoardId(int boardId, int limitStart, int limitCount, String searchKeyword,
			String searchKeywordType) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT A.*");
		sql.append(", M.name as extra__writer");
		sql.append(", M.nickname as extra__nickname");
		sql.append(", B.name as extra__boardName");
		sql.append(", B.code as extra__boardCode");
		sql.append("FROM article as A");
		sql.append("INNER JOIN member as M");
		sql.append("ON A.memberId = M.id");
		sql.append("INNER JOIN board as B");
		sql.append("ON A.boardId = B.id");
		sql.append("WHERE 1");
		
		if(boardId != 0) {
			sql.append("AND A.boardId = ?", boardId);
		}
		
		if(searchKeyword != null) {
			if(searchKeywordType == null || searchKeywordType.equals("title")) {
				sql.append("AND A.title LIKE CONCAT('%', ?, '%')", searchKeyword);
			}
			else if ( searchKeywordType.equals("body") ) {
				sql.append("AND A.body LIKE CONCAT('%', ?, '%')", searchKeyword);
			}
			else if ( searchKeywordType.equals("titleAndBody") ) {
				sql.append("AND (A.title LIKE CONCAT('%', ?, '%') OR A.body LIKE CONCAT('%', ?, '%')) ", searchKeyword, searchKeyword);
			}
		}
		sql.append("ORDER BY A.id DESC");
		
		if( limitCount != -1 ) {
			sql.append("LIMIT ?, ?", limitStart, limitCount);
		}
		
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
		
		List<Article> articles = new ArrayList<>();
		
		for(Map<String, Object> map : listMap) {
			articles.add(new Article(map));
		}
		
		return articles;
	}

	public List<Article> getLatestArticlesForPrint(int input) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT *");
		sql.append("FROM article");
		sql.append("ORDER BY id DESC");
		sql.append("limit ?", input);
		
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
		
		if( listMap.isEmpty() ) {
			return null;
		}
		
		List<Article> articles = new ArrayList<>();
		
		for(Map<String, Object> map : listMap) {
			articles.add(new Article(map));
		}
		
		return articles;
		
	}

	public void updateHitsCount(int id) {
		
		SecSql sql = new SecSql();
		
		sql.append("UPDATE article");
		sql.append("SET hitsCount = hitsCount + 1");
		sql.append("WHERE id = ?", id);
		
		MysqlUtil.update(sql);
		
	}

	public void doRecommend(String relTypeCode, int relId, int memberId, int point) {
		
		SecSql sql = new SecSql();
		
		sql.append("INSERT INTO recommend");
		sql.append("SET updateDate = NOW()");
		sql.append(", regDate = NOW()");
		sql.append(", point = ?", point);
		sql.append(", relTypeCode = ?", relTypeCode);
		sql.append(", relId = ?", relId);
		sql.append(", memberId = ?", memberId);
		
		MysqlUtil.insert(sql);
		
		sql = new SecSql();
		
		sql.append("UPDATE article");
		if(point == 1) {
			sql.append("SET likesCount = likesCount + 1");
		} 
		else if(point == 2) {
			sql.append("SET likesCount = likesCount - 1");
		}
		sql.append("WHERE id = ?", relId);		
		
		MysqlUtil.update(sql);
		
	}

	public int isAlraedyRecommend(String relTypeCode, int relId, int memberId) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT point");
		sql.append("FROM recommend");
		sql.append("WHERE relTypeCode = ");
		sql.append("?", relTypeCode);
		sql.append("AND relId = ?", relId);
		sql.append("AND memberId = ?", memberId);
						
		return MysqlUtil.selectRowIntValue(sql);
		
	}

	public void cancelRecommend(String relTypeCode, int relId, int memberId, int point) {
		
		SecSql sql = new SecSql();
		
		sql.append("DELETE FROM recommend");
		sql.append("WHERE relId = ?", relId);
		sql.append("AND relTypeCode = ?", relTypeCode);
		sql.append("AND memberId = ?", memberId);
		sql.append("AND point = ?", point);		
						
		MysqlUtil.update(sql);
		
		sql = new SecSql();
		
		sql.append("UPDATE article");
		
		if(point == 1) {
			sql.append("SET likesCount = likesCount - 1");
		} 
		else if(point == 2) {
			sql.append("SET likesCount = likesCount + 1");
		}
		
		sql.append("WHERE id = ?", relId);		
						
		MysqlUtil.update(sql);
		
	}

	public List<Reply> getReplyByArticleId(int id) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT R.*, M.nickname");
		sql.append("FROM reply AS R");
		sql.append("LEFT JOIN `member` AS M");
		sql.append("ON R.memberId = M.id");
		sql.append("WHERE relTypeCode = 'article'");
		sql.append("AND relId = ?", id);
						
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
		
		if ( listMap.isEmpty() ) {
			return null;
		}
		
		List<Reply> replys = new ArrayList<>();
		
		for(Map<String, Object> map : listMap) {
			replys.add(new Reply(map));
		}
		
		return replys;

	}

	public void updateArticleRecommendsCountPlus(int relId) {
				
		SecSql sql = new SecSql();
		
		sql.append("UPDATE article");
		sql.append("SET commentsCount = commentsCount + 1");
		sql.append("WHERE id = ?", relId);
		
		MysqlUtil.update(sql);
		
	}

}
