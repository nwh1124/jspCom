package com.myhome.jspCommunity.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.myhome.jspCommunity.dto.Recommend;
import com.myhome.jspCommunity.dto.Reply;
import com.sbs.example.jspCommunity.mysqlutil.MysqlUtil;
import com.sbs.example.jspCommunity.mysqlutil.SecSql;

public class RecommendDao {

	public static int isAlraedyRecommend(String relTypeCode, int relId, int memberId) {
		
		SecSql sql = new SecSql();
		
		sql.append("SELECT Rec.point");
		sql.append("FROM recommend AS Rec");
		sql.append("WHERE relTypeCode = ?", relTypeCode);
		sql.append("AND relId = ?", relId);
		sql.append("AND memberId = ?", memberId);
						
		return MysqlUtil.selectRowIntValue(sql);
	}

	public static void doRecommend(String relTypeCode, int relId, int memberId, int point) {
		
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

	public static void cancelRecommend(String relTypeCode, int relId, int memberId, int point) {
		
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

	public static List<Recommend> isReplyAlraedyRecommend(int articleId, int memberId) {
		
		SecSql sql = new SecSql();
		
//		sql.append("SELECT R.*, Rec.point");
//		sql.append("FROM reply AS R");
//		sql.append("LEFT JOIN recommend AS Rec");
//		sql.append("ON R.id = Rec.relId");
//		sql.append("WHERE R.relTypeCode = 'article'");		
//		sql.append("AND R.relid = ?", articleId);
//		sql.append("AND R.delDate IS NULL");
//		sql.append("AND R.memberId = ?", memberId);	
		
		sql.append("SELECT R.*");
		sql.append("FROM recommend as R");
		sql.append("WHERE 1");		
		sql.append("AND R.memberId = ?", memberId);	
		sql.append("AND relTypeCode = 'reply'");
						
		List<Map<String, Object>> listMap = MysqlUtil.selectRows(sql);
		
		if(listMap.isEmpty()) {
			return null;
		}
		
		List<Recommend> recommends = new ArrayList<>();
		
		for(Map<String, Object> map : listMap) {
			recommends.add(new Recommend(map));
		}
		
		return recommends;
	}

}

