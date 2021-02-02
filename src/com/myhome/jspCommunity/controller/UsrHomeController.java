package com.myhome.jspCommunity.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.myhome.jspCommunity.container.Container;

import com.myhome.jspCommunity.dto.Article;
import com.myhome.util.Util;

public class UsrHomeController {

	public String showMain(HttpServletRequest req, HttpServletResponse resp) {
		
		int loadMoreArticles = Util.getAsInt(req.getParameter("loadMoreArticles"), 5);
		
		List<Article> articles = Container.articleService.getLatestArticlesForPrint(loadMoreArticles);
		
		req.setAttribute("latestArticles", articles);
		
		return "usr/home/main";
	}

}

//// 데이터베이스에 변수 선언한다는 느낌
//Container.attrService.setValue("member__1__extra__isUsingTempPassword", "17", null);
//
//// 선언한 변수를 지운다
//Container.attrService.remove("member__1__extra__isUsingTempPassword");
//
//// 선언해둔 변수의 값을 가져온다
//String value = Container.attrService.getValue("member__1__extra__isUsingTempPassword");
//
//req.setAttribute("data", value);
