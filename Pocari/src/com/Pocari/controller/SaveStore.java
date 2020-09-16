package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.My_favlistDao;
import com.Pocari.dto.Save_Bean;

public class SaveStore implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		int mfl_idx = Integer.parseInt(req.getParameter("resIdx"));
		
		Save_Bean bean = new Save_Bean();
		My_favlistDao dao = new My_favlistDao();
		bean.setMfl_idx(mfl_idx);
		
		int result = dao.saveStore(bean);
		
		if(result>0){
			return "eatout.do";
		}else{
			return "";
		}
		
		
	}

	
}
