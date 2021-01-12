package com.myhome.jspCommunity.service;

import com.myhome.jspCommunity.container.Container;
import com.myhome.jspCommunity.dao.BoardDao;
import com.myhome.jspCommunity.dto.Board;

public class BoardService {
	
	BoardDao boardDao;
	
	public BoardService() {
		boardDao = Container.boardDao;
	}

	public String getBoardNameByBoardId(int boardId) {		
		return boardDao.getBoardNameByBoardId(boardId);
	}

	public Board getBoardByBoardId(int boardId) {
		return boardDao.getBoardByBoardId(boardId);
	}
	
	

}
