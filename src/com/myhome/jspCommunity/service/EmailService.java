package com.myhome.jspCommunity.service;

import com.myhome.util.Util;

public class EmailService {
	private static String gmailId;
	private static String gmailPw;
	private static String from;
	private static String fromName;

	public void init(String gmailId, String gmailPw, String from, String fromName) {
		this.gmailId = gmailId;
		this.gmailPw = gmailPw;
		this.from = from;
		this.fromName = fromName;
	}

	public static int send(String to, String title, String body) {
		return Util.sendMail(gmailId, gmailPw, from, fromName, to, title, body);
	}

}
