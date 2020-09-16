package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.RecipeDAO;

public class recipeMain implements ICmd{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		RecipeDAO dao = new RecipeDAO();
		String[] imgpath = dao.imgpath();
		int[] recipe_idx = dao.recipe_idx();
		return "recipeMain.jsp";
	}
}
