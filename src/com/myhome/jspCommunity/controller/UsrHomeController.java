package com.myhome.jspCommunity.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myhome.jspCommunity.container.Container;

public class UsrHomeController {

	public String showMain(HttpServletRequest req, HttpServletResponse resp) {
		
//		// 데이터베이스에 변수 선언한다는 느낌
//		Container.attrService.setValue("member__1__extra__isUsingTempPassword", "17", null);
//		
//		// 선언한 변수를 지운다
//		Container.attrService.remove("member__1__extra__isUsingTempPassword");
//		
//		// 선언해둔 변수의 값을 가져온다
//		String value = Container.attrService.getValue("member__1__extra__isUsingTempPassword");
//		
//		req.setAttribute("data", value);
		
		return "usr/home/main";
	}

}
