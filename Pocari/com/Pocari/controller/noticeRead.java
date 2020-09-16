package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.noticeDao;

public class noticeRead implements ICmd {
	noticeDao noticeRead = null;
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return "noticeRead.jsp";
	}

}
