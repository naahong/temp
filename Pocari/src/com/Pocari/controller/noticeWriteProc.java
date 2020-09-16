package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.noticeDao;
import com.Pocari.dto.BoardBean;

public class noticeWriteProc implements ICmd {
	
	BoardBean board = null;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		BoardBean board = new BoardBean();
		board.setId(req.getParameter("id"));
		board.setTitle(req.getParameter("title"));
		board.setContents(req.getParameter("content"));
		
		noticeDao boardDao = new noticeDao();
		int result = boardDao.postNotice(board);
		
		System.out.println(board.getTitle());
		System.out.println(board.getContents());
		System.out.println(board.getId());
		
		
		return "noticePage.do";
	}

}
