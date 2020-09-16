package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Pocari.dao.MypageDao;
import com.Pocari.dto.MemberBean;

public class Withdraw implements ICmd {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");
		String midx = (String) session.getAttribute("midx");
		String url="";
		
		MypageDao dao = new MypageDao(id,midx);
		int result = dao.deleteMem();
		if(result>0){
			url = "logoutPage.do";
			
		}else{
			url = "mypage.jsp?sectionis=updateinfo";
		}
		return url;
	}
}
