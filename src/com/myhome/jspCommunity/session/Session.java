package com.myhome.jspCommunity.session;

import lombok.Data;

@Data
public class Session {
	
	private boolean isLogined;
	private int loginedMemberId;

	public Session() {
		
		isLogined = false;
		loginedMemberId = -1;
		
	}

	public void setLoginedMemberId(int id) {
		loginedMemberId = id;		
	}

	public boolean getIsLogined() {
		return isLogined;
	}
	
}
