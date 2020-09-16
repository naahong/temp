package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.qnaRpyDao;

public class qnaReadRe implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		String read_qidx = req.getParameter("read_qidx");
		System.out.println(read_qidx);
		
		String read_id = req.getParameter("read_id");
		System.out.println(read_id);
		
		String content = req.getParameter("content");
		System.out.println(content);
		
		qnaRpyDao rpy = new qnaRpyDao();
		int result = rpy.insertReData(read_qidx, read_id, content);
	
		return "qnaRead.do?qidx="+read_qidx;
	}
}


