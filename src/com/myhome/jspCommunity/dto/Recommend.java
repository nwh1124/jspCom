package com.myhome.jspCommunity.dto;

import java.util.Map;

import lombok.Data;

@Data
public class Recommend {
	
	private int id;
	private String regDate;
	private String updateDate;
	private String relTypeCode;
	private int memberId;
	private int relId;
	private int point;
		
	public Recommend() {
		
	}

	public Recommend(Map<String, Object> map) {		

		this.id = (int)map.get("id");
		this.regDate = (String)map.get("regDate");
		this.updateDate = (String)map.get("updateDate");
		this.relTypeCode = (String)map.get("relTypeCode");
		this.memberId = (int)map.get("memberId");
		this.relId = (int)map.get("relId");
		this.point = (int)map.get("point");

	}

}
