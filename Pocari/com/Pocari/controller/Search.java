package com.Pocari.controller;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.My_favlistDao;
import com.Pocari.dto.FavlistAndReviewBean;

public class Search implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String keyword = req.getParameter("search");
		
		FavlistAndReviewBean bean = new FavlistAndReviewBean();
		My_favlistDao dao = new My_favlistDao();
		Vector<FavlistAndReviewBean> v = dao.getSearchRes(keyword);
		
		req.setAttribute("searchR", v);
		
		return "/eatout.jsp";
	}

}
