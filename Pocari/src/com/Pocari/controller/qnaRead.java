package com.Pocari.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Pocari.dao.QnaDao;
import com.Pocari.dto.BoardBean;

public class qnaRead implements ICmd {
	
	BoardBean bean = null;

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		String qidx = req.getParameter("qidx");
		QnaDao read = new QnaDao();
		BoardBean bean = read.selectData(qidx);
		
		System.out.println(bean.getTitle());
		System.out.println(bean.getContents());
		System.out.println(bean.getIslock());
		
		session.setAttribute("qidx", qidx);
		session.setAttribute("midxChk", bean.getMidx());
		session.setAttribute("readTitle", bean.getTitle());
		session.setAttribute("readContents", bean.getContents());
		session.setAttribute("chkLock", bean.getIslock());
		
		return "qnaRead.jsp";
	}

}
