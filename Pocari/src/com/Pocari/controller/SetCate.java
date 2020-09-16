package com.Pocari.controller;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.My_favlistDao;
import com.Pocari.dao.NamebarDao;
import com.Pocari.dto.CategoryBean;
import com.Pocari.dto.FavlistAndReviewBean;

public class SetCate implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String cate = req.getParameter("selcate");
		
		System.out.println(cate);
		
		String cateN = null;
		
		switch(cate){
		
			case "korean": cateN = "한식";
				break;
			case "western": cateN = "양식";
				break;
			case "chinese": cateN = "중식";
				break;
			case "japanese": cateN = "일식";
				break;
			case "cafe": cateN = "카페";
				break;
			case "bakerynd": cateN = "베이커리/디저트";
				break;
			case "vege": cateN = "채식";
				break;
			case "etc": cateN = "기타";
				break;
		
		}
		
		CategoryBean bean = new CategoryBean();
		NamebarDao dao = new NamebarDao();
		Vector<CategoryBean> v = dao.getDetailedFoodlist(cateN);
		
		req.setAttribute("detailedfoodL", v);
		
		return "/eatout.jsp";
	}

}
