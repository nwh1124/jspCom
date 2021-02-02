package com.myhome.jspCommunity.dto;


import java.util.Map;

import lombok.Data;

@Data
public class Reply {
	
	private int id;
	private String regDate;
	private String updateDate;
	private String relTypeCode;
	private int relId;
	private int memberId;
	private String body;
	private String delDate;
	private int delStatus;
	
	private String extra__nickname;
		
	public Reply() {
		
	}

	public Reply(Map<String, Object> map) {		

		this.id = (int)map.get("id");
		this.regDate = (String)map.get("regDate");
		this.updateDate = (String)map.get("updateDate");
		this.relTypeCode = (String)map.get("relTypeCode");
		this.relId = (int)map.get("relId");
		this.memberId = (int)map.get("memberId");
		this.body = (String)map.get("body");
		this.delDate = (String)map.get("delDate");
		this.delStatus = (int)map.get("delStatus");
		
		this.extra__nickname = (String)map.get("nickname");
		
	}

}

