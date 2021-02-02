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

	private String extra__writer;
	private String extra__nickname;
	private String extra__boardName;
	private String extra__boardCode;
		
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
		this.likesCount = (int)map.get("likesCount");
		this.commentsCount = (int)map.get("commentsCount");

		if( map.get("extra__writer") != null ) {
			this.extra__writer = (String)map.get("extra__writer");
			this.extra__nickname = (String)map.get("extra__nickname");
			this.extra__boardName = (String)map.get("extra__boardName");
			this.extra__boardCode = (String)map.get("extra__boardCode");
		}
	}

}
