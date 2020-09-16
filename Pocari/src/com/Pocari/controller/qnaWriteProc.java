package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.QnaDao;
import com.Pocari.dto.BoardBean;

public class qnaWriteProc implements ICmd {
	
	BoardBean board = null;
			
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		board = new BoardBean();
		
		board.setMidx(Integer.parseInt(req.getParameter("midx")));
		board.setTitle(req.getParameter("title"));
		board.setContents(req.getParameter("content"));
		board.setIslock(req.getParameter("lockChk"));
		
		QnaDao qnaDao = new QnaDao();
		int result = qnaDao.postqna(board);
		
		System.out.println(board.getMidx());
		System.out.println(board.getTitle());
		System.out.println(board.getContents());
		System.out.println(board.getIslock());
		
		return "qnaPage.do";
	}

}
