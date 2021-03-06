package com.myhome.jspCommunity.dto;

import java.util.Map;

import com.myhome.util.Util;

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
	private int pointSum;
		
	public Recommend() {
		
	}

	public Recommend(Map<String, Object> map) {		

		this.id = (int)map.get("id");
		this.regDate = (String)map.get("regDate");
		this.updateDate = (String)map.get("updateDate");
		this.relTypeCode = (String)map.get("relTypeCode");
		this.memberId = (int)map.get("memberId");
		this.relId = (int)map.get("relId");

		if( map.get("point") == null || map.isEmpty() ) {
			this.point = -1;			
		}
		else {
			this.point = (int)map.get("point");			
		}

		if( map.get("pointSum") == null || map.isEmpty() ) {
			this.pointSum = -1;			
		}
		else {
			this.pointSum = (int) map.get("pointSum");			
		}
			

	}

}
