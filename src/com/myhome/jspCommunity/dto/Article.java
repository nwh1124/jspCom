package com.myhome.jspCommunity.dto;

import java.util.Map;

import lombok.Data;

@Data
public class Article {
	
	private int id;
	private String regDate;
	private String updateDate;
	private String title;
	private String body;
	private int memberId;
	private int boardId;
	private int hitsCount;
	private int likesCount;
	private int commentsCount;
		
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

}
