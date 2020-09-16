package com.Pocari.controller;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.My_favlistDao;
import com.Pocari.dao.NamebarDao;
import com.Pocari.dto.CategoryBean;
import com.Pocari.dto.FavlistAndReviewBean;

public class Eatout implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		CategoryBean bean = new CategoryBean();
		NamebarDao dao = new NamebarDao();
		Vector<CategoryBean> v = dao.getFoodlist();
		
		req.setAttribute("foodList", v);
		
		String pageidx = "1";
		
		FavlistAndReviewBean beanL = new FavlistAndReviewBean();
		My_favlistDao daoL = new My_favlistDao();
		Vector<FavlistAndReviewBean> vl = daoL.getAllRes(pageidx);
		
		req.setAttribute("resList", vl);
		
		return "/eatout.jsp";
	}

}
