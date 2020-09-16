package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.RecipeDAO;
import com.Pocari.dto.CategoryBean;
import com.Pocari.dto.RecipeBean;

public class insertRecipe implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		RecipeDAO dao = new RecipeDAO();
		RecipeBean recipebean = new RecipeBean();
		CategoryBean categoryBean = new CategoryBean();
		
		recipebean.setRecipename(req.getParameter("recipename"));
		recipebean.setImgpath(req.getParameter("imgpath"));
		recipebean.setLevel(req.getParameter("level"));
		recipebean.setTime(req.getParameter("hour") + "H" + req.getParameter("minute") + "M");
		recipebean.setIngredient(req.getParameter("ingredient").replace("\r\n", "<br>"));
		recipebean.setSeasoning(req.getParameter("seasoning").replace("\r\n", "<br>"));
		recipebean.setTools(req.getParameter("tools").replace("\r\n", "<br>"));
		recipebean.setContents(req.getParameter("contents").replace("\r\n", "<br>"));
		
		categoryBean.setParent_cate("recipe");
		categoryBean.setCategory(req.getParameter("category"));
		categoryBean.setFoodname(req.getParameter("foodname"));
		categoryBean.setRecipecate(req.getParameter("recipecate"));
		
		int cate_idx = dao.insertCategory(categoryBean);
		dao.insertRecipe(recipebean, cate_idx);
		
		return "recipeMain.do";
	}

}
