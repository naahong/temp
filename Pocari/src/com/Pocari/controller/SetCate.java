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
		
			case "korean": cateN = "�ѽ�";
				break;
			case "western": cateN = "���";
				break;
			case "chinese": cateN = "�߽�";
				break;
			case "japanese": cateN = "�Ͻ�";
				break;
			case "cafe": cateN = "ī��";
				break;
			case "bakerynd": cateN = "����Ŀ��/����Ʈ";
				break;
			case "vege": cateN = "ä��";
				break;
			case "etc": cateN = "��Ÿ";
				break;
		
		}
		
		CategoryBean bean = new CategoryBean();
		NamebarDao dao = new NamebarDao();
		Vector<CategoryBean> v = dao.getDetailedFoodlist(cateN);
		
		req.setAttribute("detailedfoodL", v);
		
		return "/eatout.jsp";
	}

}
