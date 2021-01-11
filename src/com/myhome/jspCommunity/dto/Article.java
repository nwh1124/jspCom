package com.myhome.jspCommunity.dto;

import java.util.Map;

public class Article {
	
	public int id;
	public String regDate;
	public String updateDate;
	public String title;
	public String body;
	public int memberId;
	public int boardId;
	public int hitsCount;
	public int likesCount;
	public int commentsCount;
		
	public Article() {
		
	}

	public Article(Map<String, Object> map) {		

		this.id = (int)map.get("id");
		this.regDate = (String)map.get("regDate");
		this.updateDate = (String)map.get("updateDate");
		this.title = (String)map.get("title");
		this.body = (String)map.get("body");
		this.memberId = (int)map.get("memberId");
		this.boardId = (int)map.get("boardId");
		this.hitsCount = (int)map.get("hitsCount");
		this.hitsCount = (int)map.get("likesCount");
		this.hitsCount = (int)map.get("commentsCount");
		
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", regDate=" + regDate + ", updateDate=" + updateDate + ", title=" + title
				+ ", body=" + body + ", memberId=" + memberId + ", boardId=" + boardId + ", hitsCount=" + hitsCount
				+ "]";
	}

}
