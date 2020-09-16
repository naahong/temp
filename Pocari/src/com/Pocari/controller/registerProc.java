package com.Pocari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.Fav_FoodDao;
import com.Pocari.dao.Fav_RecipeDao;
import com.Pocari.dao.RegisterDao;
import com.Pocari.dto.FavFoodBean;
import com.Pocari.dto.FavRecipeBean;
import com.Pocari.dto.MemberBean;


public class registerProc implements ICmd {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		MemberBean bean = new MemberBean();
		bean.setId(req.getParameter("userID"));
		bean.setPw(req.getParameter("userPw"));
		bean.setEmail(req.getParameter("userEmail"));
		bean.setBirth(req.getParameter("userBirth"));
		bean.setGender(req.getParameter("gender"));
	
		RegisterDao dao = new RegisterDao();
		int result = dao.registInfo(bean);
		
		System.out.println(bean.getMidx());
		System.out.println(bean.getId());
		System.out.println(bean.getPw());
		System.out.println(bean.getEmail());
		System.out.println(bean.getBirth());
		System.out.println(bean.getGender());
		
		
		String id = (req.getParameter("userID"));
		RegisterDao sel = new RegisterDao();
		MemberBean read =sel.selectMidxData(id);
		
		System.out.println(read.getMidx());
		

		FavFoodBean food = new FavFoodBean();
		food.setMidx((read.getMidx()));
		food.setCategory(req.getParameter("outEatChk"));
		food.setPref(req.getParameter("eatChkAccept"));
		
		Fav_FoodDao foodDao = new Fav_FoodDao();
		int result1 = foodDao.addFavFood(food);
		
		System.out.println(food.getMidx());
		System.out.println(food.getCategory());
		System.out.println(food.getPref());

		
		FavRecipeBean recipe = new FavRecipeBean();
		recipe.setMidx((read.getMidx()));
		recipe.setCategory(req.getParameter("recipeChk"));
		recipe.setPref(req.getParameter("recipeChkAccept"));
		
		Fav_RecipeDao recipeDao = new Fav_RecipeDao();
		int result2 = recipeDao.addRecipeFood(recipe);

		System.out.println(recipe.getMidx());
		System.out.println(recipe.getCategory());
		System.out.println(recipe.getPref());
		
		return "loginPage.do";
	
	}
}