package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Pocari.dao.MypageDao;
import com.Pocari.dto.MemberBean;

public class UpdateMeminfo implements ICmd {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");
		String midx = (String) session.getAttribute("midx");
		
		MemberBean b = new MemberBean();
		b.setId(req.getParameter("id"));
		b.setPw(req.getParameter("pw"));
		b.setEmail(req.getParameter("email"));
		b.setBirth(req.getParameter("birth"));
		b.setGender(req.getParameter("gender"));
		
		MypageDao dao = new MypageDao(id,midx);
		int result = dao.updateMeminfo(b);
		
		String[] fcate = req.getParameterValues("category");
		String[] rcate = req.getParameterValues("recipecate");
		int res2 = dao.deleteCateinfo("fav_food"); //등록된 선호 지우기
		int res3 = dao.deleteCateinfo("fav_recipe");
		int res4=0;
		for(String str : fcate){ //새로 선호카테고리 등록하기
			res4 = dao.saveCateinfo("fav_food", str);
		}
		for(String str : rcate){
			res4 = dao.saveCateinfo("fav_recipe", str);
		}
		
		
		if(result+res2+res3+res4>0){
			System.out.println("수정됨");
		}else{
			System.out.println("수정 안됨");
		}
		return "mypage.jsp?sectionis=updateinfo";
	}
}
