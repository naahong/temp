package com.Pocari.controller;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Pocari.dao.MySectionDao;
import com.Pocari.dao.MypageDao;
import com.Pocari.dto.CategoryBean;
import com.Pocari.dto.FavlistAndReviewBean;
import com.Pocari.dto.MemberBean;
import com.Pocari.dto.RecipeBean;

public class Mypage implements ICmd {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginid");
		String midx = session.getAttribute("midx")+"";
		String pageidx = req.getParameter("pageidx")==null ? "1" : req.getParameter("pageidx");
		String tablename = req.getParameter("where");
		String keyword = req.getParameter("keyword");
		String whatpage = req.getParameter("sectionis")==null ? "recipe" : req.getParameter("sectionis");
		String url="";
		
		MypageDao dao = new MypageDao(id,midx);
		MemberBean b = dao.getMemberinfo();
		
		MySectionDao dao2 = new MySectionDao(midx);
		
		switch(whatpage){
			case "restaurant":
				int mfl_totalpage;
				Vector<FavlistAndReviewBean> favlistV;
				if(tablename!=null && keyword!=null){
					mfl_totalpage = dao2.getTotalPage("my_favlist");
					favlistV = dao2.getMyfavlistSearch(keyword,pageidx);
					url = "mypage.jsp?sectionis=restaurant&pageidx="+pageidx;
					req.setAttribute("keyword", keyword);
				}else{
					mfl_totalpage = dao2.getTotalPage("my_favlist");
					favlistV = dao2.getMyfavlist(pageidx);
					url = "mypage.jsp?sectionis=restaurant&pageidx="+pageidx;
				}
				req.setAttribute("myfavlist", favlistV);
				req.setAttribute("mfl_totalpage", mfl_totalpage);
				break;
				
			case "recipe":
				int re_totalpage = dao2.getTotalPage("recipe");
				Vector<RecipeBean> myrecipeV = dao2.getMyRecipes(pageidx);
				url= "mypage.jsp?sectionis=recipe&pageidx="+pageidx;
				
				req.setAttribute("re_totalpage", re_totalpage);
				req.setAttribute("myrecipes", myrecipeV);
				break;
				
			case "review":
				int rv_totalpage = dao2.getTotalPage("my_review");
				Vector<FavlistAndReviewBean> myreviewsV = dao2.getMyReviews(pageidx);
				url = "mypage.jsp?sectionis=review&pageidx="+pageidx;
				
				req.setAttribute("rv_totalpage", rv_totalpage);
				req.setAttribute("myreviews", myreviewsV);
				break;
				
			case "likerecipe":
				int lire_totalpage = dao2.getTotalPage("save_recipe","like");
				Vector<RecipeBean> likeRecipeV = dao2.getOtherRecipes("like",pageidx);
				url = "mypage.jsp?sectionis=likerecipe&pageidx="+pageidx;
				
				req.setAttribute("lire_totalpage", lire_totalpage);
				req.setAttribute("likerecipe", likeRecipeV);
				break;
				
			case "scraprecipe":
				int scre_totalpage = dao2.getTotalPage("save_recipe","scrap");
				Vector<RecipeBean> scrapRecipeV = dao2.getOtherRecipes("scrap",pageidx);
				url = "mypage.jsp?sectionis=scraprecipe&pageidx="+pageidx;
				
				req.setAttribute("scre_totalpage", scre_totalpage);
				req.setAttribute("scraprecipe", scrapRecipeV);
				break;
				
			case "savestore":
				int ss_totalpage;
				Vector<FavlistAndReviewBean> savestoreV;
				if(tablename!=null && keyword!=null){
					ss_totalpage = dao2.getTotalPage("save_store");
					savestoreV = dao2.getSaveStorelistSearch(keyword,pageidx);
					url = "mypage.jsp?sectionis=savestore&pageidx="+pageidx;
					req.setAttribute("keyword", keyword);
				}else{
					ss_totalpage = dao2.getTotalPage("save_store");
					savestoreV = dao2.getSaveStorelist(pageidx);
					url = "mypage.jsp?sectionis=savestore&pageidx="+pageidx;
				}
				req.setAttribute("ss_totalpage", ss_totalpage);
				req.setAttribute("save_store", savestoreV);
				break;
				
			case "updateinfo":
				// 전체 카테고리 가져오기
				Vector<String> foodCateV = dao.getCategory("food");
				Vector<String> recipeCateV = dao.getCategory("recipe");
				// 로그인 한 아이디의 선호 카테고리 가져오기
				Vector<String> favFoodCateV = dao.getFavCategory("fav_food");
				Vector<String> favRecipeCateV = dao.getFavCategory("fav_recipe");
				
				// 전체 카테고리에 선호여부 체크해서 담기
				Vector<CategoryBean> fcategoryV = new Vector<CategoryBean>();
				for(String cate: foodCateV){
					CategoryBean bean = new CategoryBean();
					bean.setCategory(cate);
					for(String favcate: favFoodCateV){
						if(cate.equals(favcate)){
							bean.setPref("like");
							break;
						}
					}
					fcategoryV.add(bean);
				}
				Vector<CategoryBean> rcategoryV = new Vector<CategoryBean>();
				for(String cate: recipeCateV){
					CategoryBean bean = new CategoryBean();
					bean.setCategory(cate);
					for(String favcate: favRecipeCateV){
						if(cate.equals(favcate)){
							bean.setPref("like");
							break;
						}
					}
					rcategoryV.add(bean);
				}
				url = "mypage.jsp?sectionis=updateinfo";
				
				req.setAttribute("foodcate", fcategoryV);
				req.setAttribute("recipecate", rcategoryV);
				break;
		}
		req.setAttribute("memberinfo", b);
		return url;
	}
}