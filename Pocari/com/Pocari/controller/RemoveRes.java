package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.My_favlistDao;

public class RemoveRes implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		My_favlistDao dao = new My_favlistDao();
		
		int mfl_idx = Integer.parseInt(req.getParameter("resIdx"));
		int result = dao.deleteRes(mfl_idx);
		
		if(result>0){
			return "/eatout.do";
		}else{
			return "";
		}
		
		
	}

}
