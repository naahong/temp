package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Pocari.dao.RecipeDAO;
import com.Pocari.dto.CategoryBean;
import com.Pocari.dto.RecipeBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class insertRecipe implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println(11111+"*******");
		RecipeDAO dao = new RecipeDAO();
		RecipeBean recipebean = new RecipeBean();
		CategoryBean categoryBean = new CategoryBean();
		HttpSession session = req.getSession();
		String midx = session.getAttribute("midx")+"";
		
		String path = req.getServletContext().getRealPath("/image");
		System.out.println(path);
		int maxSize = 1024*1024*10;
		String enc = "EUC-KR";
		MultipartRequest mreq = new MultipartRequest(req, path, maxSize, enc, new DefaultFileRenamePolicy());
		
		recipebean.setRecipename(mreq.getParameter("recipename"));
		recipebean.setImgpath(mreq.getOriginalFileName("imgpath"));
		recipebean.setLevel(mreq.getParameter("level"));
		recipebean.setTime(mreq.getParameter("hour") + "H" + mreq.getParameter("minute") + "M");
		recipebean.setIngredient(mreq.getParameter("ingredient").replace("\r\n", "<br>"));
		recipebean.setSeasoning(mreq.getParameter("seasoning").replace("\r\n", "<br>"));
		recipebean.setTools(mreq.getParameter("tools").replace("\r\n", "<br>"));
		recipebean.setContents(mreq.getParameter("contents").replace("\r\n", "<br>"));
		
		categoryBean.setParent_cate("recipe");
		categoryBean.setCategory(mreq.getParameter("category"));
		categoryBean.setFoodname(mreq.getParameter("foodname"));
		categoryBean.setRecipecate(mreq.getParameter("recipecate"));
		
		int cate_idx = dao.insertCategory(categoryBean);
		dao.insertRecipe(recipebean, cate_idx,midx);
		
		return "recipeMain.do";
	}

}
