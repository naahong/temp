package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.RecipeDAO;
import com.Pocari.dto.RecipeBean;

public class SearchRequirement implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String search = req.getParameter("search");
		RecipeDAO dao = new RecipeDAO();
		RecipeBean bean = new RecipeBean();
		
		return "/recipeSearch.jsp";
	}

}
