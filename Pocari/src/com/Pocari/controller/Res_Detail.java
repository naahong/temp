package com.Pocari.controller;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Pocari.dao.My_favlistDao;
import com.Pocari.dto.FavlistAndReviewBean;

public class Res_Detail implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		int idx = Integer.parseInt(req.getParameter("mfl_idx"));
		System.out.println(idx+"********");
		
		My_favlistDao dao = new My_favlistDao();
		FavlistAndReviewBean bean = dao.getResDetail(idx);
		req.setAttribute("resDetail", bean);
		
		Vector<FavlistAndReviewBean> vl = dao.getReple(idx);
		req.setAttribute("revList", vl);
		
		/*int midx = vl.get(0).getMidx();
		String id = dao.getMemberId(midx);
		req.setAttribute("writer", id);*/
		
		Vector<String> vid = new Vector<String>();
		
		for(int i = 0; i<vl.size(); i++){
			int midx = vl.get(i).getMidx();
			vid.add(dao.getMemberId(midx));
		}
		req.setAttribute("writer", vid);
		
		return "/res_details.jsp";
	}
}
