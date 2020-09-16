package com.Pocari.controller;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.NamebarDao;
import com.Pocari.dto.FavlistAndReviewBean;
import com.Pocari.dto.SaveDataBean;

public class PutFavData implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		SaveDataBean bean = new SaveDataBean();
		NamebarDao dao = new NamebarDao();
		
		int midx = 1;
		
		String foodname = req.getParameter("foodname");
		String birthY = dao.getBirth(midx);
		
		
		int result = dao.saveFavdata(birthY, foodname);
		
		if(result>0){
			return "/eatout.do";
		}else{
			return "";
		}
		
		
	}

}
