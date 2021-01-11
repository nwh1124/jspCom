package com.myhome.jspCommunity.service;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dao.BoardDao;

public class BoardService {
	
	BoardDao boardDao;
	
	public BoardService() {
		boardDao = Container.boardDao;
	}

	public String getBoardNameByBoardId(int boardId) {		
		return boardDao.getBoardNameByBoardId(boardId);
	}
	
	

}
