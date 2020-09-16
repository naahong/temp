package com.Pocari.dao;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.Pocari.dto.CategoryBean;
import com.Pocari.dto.RecipeBean;

public class RecipeDAO  extends DbcpCon{
	public void setvalue(){
		try {
			con = getCon();
			String sql = "SELECT * FROM jspboard_mem";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
	}
	public RecipeBean[] returnRecipeBean(String search){
		RecipeBean[] recipeBean = null;
		try {
			con = getCon();
			String sql = "SELECT * FROM recipe where recipename like '%" + search + "%'";
			pstmt = con.prepareStatement(sql);
			int i = 0;
			while(rs.next()) {
				recipeBean[i] = new RecipeBean();
				recipeBean[i].setRecipename(rs.getString("recipename"));
				recipeBean[i].setLevel(rs.getString("level"));
				recipeBean[i].setTime(rs.getString("TIME"));
				recipeBean[i].setImgpath(rs.getString("imgpath"));
				recipeBean[i].setLikecount(rs.getInt("likecount"));
				recipeBean[i].setScrapcount(rs.getInt("scrapcount"));
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return recipeBean;
	}
	public CategoryBean[] returnCategoryBean(String search){
		CategoryBean[] CategoryBean = null;
		try {
			con = getCon();
			String sql = "SELECT * FROM recipe where recipename like '%" + search + "%'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()) {
				CategoryBean[i] = new CategoryBean();
				CategoryBean[i].setCategory(rs.getString("category"));
				CategoryBean[i].setRecipecate(rs.getString("recipecate"));
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return CategoryBean;
	}
	public int insertRecipe(RecipeBean recipeBean, int cate_idx, String midx){
		java.sql.Date sqlDate = java.sql.Date.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));
		int result = 0;
		String sql = "insert into recipe(midx,cate_idx,recipename,ingredient,seasoning,level,TIME,tools,contents,imgpath,date) VALUES("+midx+", ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cate_idx);//외래키로 가져오기
			pstmt.setString(2, recipeBean.getRecipename());
			pstmt.setString(3, recipeBean.getIngredient());
			pstmt.setString(4, recipeBean.getSeasoning());
			pstmt.setString(5, recipeBean.getLevel());
			pstmt.setString(6, recipeBean.getTime());
			pstmt.setString(7, recipeBean.getTools());
			pstmt.setString(8, recipeBean.getContents());
			pstmt.setString(9, recipeBean.getImgpath());
			pstmt.setDate(10 , sqlDate);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt);
		}
		return result;
	}
	public int insertCategory(CategoryBean categoryBean){
		int cate_idx = 0;
		int result = 0;
		String parent_cate = categoryBean.getParent_cate();
		String category = categoryBean.getCategory();
		String foodname = categoryBean.getFoodname();
		String recipecate = categoryBean.getRecipecate();
		String sql = "insert into category(parent_cate, category, foodname, recipecate) VALUES(?, ?, ?, ?);";
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, parent_cate);
			pstmt.setString(2, category);
			pstmt.setString(3, foodname);
			pstmt.setString(4, recipecate);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String sql1 = "select * from category where parent_cate = " + "'" + parent_cate + "'" + " and category = " + "'" + category + "'" + " and recipecate = " + "'" + recipecate + "'" + ";";
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cate_idx = rs.getInt("cate_idx");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return cate_idx;
	}
	public String[] imgpath(){
		String[] imgpath = new String[12];
		try {
			con = getCon();
			
			String sql = "SELECT * from recipe";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				imgpath[i] = rs.getString("imgpath");
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return imgpath;
	}
	public String[] imgpath(String search, RecipeBean recipeBean, CategoryBean categoryBean){
		String[] imgpath = null;
		try {
			con = getCon();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "SELECT * from recipe";
			//pstmt = con.prepareStatement(sql);
			boolean search1 = !search.equals("");
			boolean level = recipeBean.getLevel() != null;
			boolean time = !recipeBean.getTime().equals("HM");
			boolean category = categoryBean.getCategory() != null;
			boolean recipecate = categoryBean.getRecipecate() != null;
			if (search1 || level || time || category || recipecate) {
				sql += " where ";
				if(search1){
					sql += "recipename like '%" + search + "%'";
				}
				if (search1 && (level || time || category || recipecate)) {
					sql += " and ";
				}
				if(level){
					sql += "level = '" + recipeBean.getLevel() + "'";
				}
				if (level && (time || category || recipecate)) {
					sql += " and ";
				}
				if(time){
					sql += "time = '" + recipeBean.getTime() + "'";
				}
				if (time && (category || recipecate)) {
					sql += " and ";
				}
				if(category || recipecate) {
					sql += "cate_idx = (SELECT cate_idx FROM category where ";
					if(category){
						sql += "category = '" + categoryBean.getCategory() + "'";
					}
					if (category && recipecate) {
						sql += " and ";
					}
					if(recipecate){
						sql += "recipecate = '" + categoryBean.getRecipecate() + "'";
					}
					sql += ")";
				}
			}
			rs = stmt.executeQuery(sql);
			rs.last();
			int rowcount = rs.getRow();
			rs.first();
			imgpath = new String[rowcount];//수리
			for(int i = 0; i < rowcount;i++){
				imgpath[i] = rs.getString("imgpath");
				rs.next();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, stmt, rs);
		}
		return imgpath;
	}
	public String[] recipe_idx(){
		String[] recipe_idx = new String[12];
		try {
			con = getCon();
			stmt = con.createStatement();
			String sql = "SELECT * from recipe";
			rs = stmt.executeQuery(sql);
			int i = 0;
			while(rs.next()){
				recipe_idx[i] = rs.getString("recipe_idx");
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, stmt, rs);
		}
		return recipe_idx;
	}
	public String[] recipe_idx(String search, RecipeBean recipeBean, CategoryBean categoryBean){
		String[] recipe_idx = null;
		try {
			con = getCon();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "SELECT * from recipe";
			boolean search1 = !search.equals("");
			boolean level = recipeBean.getLevel() != null;
			boolean time = !recipeBean.getTime().equals("HM");
			boolean category = categoryBean.getCategory() != null;
			boolean recipecate = categoryBean.getRecipecate() != null;
			if (search1 || level || time || category || recipecate) {
				sql += " where ";
				if(search1){
					sql += "recipename like '%" + search + "%'";
				}
				if (search1 && (level || time || category || recipecate)) {
					sql += " and ";
				}
				if(level){
					sql += "level = '" + recipeBean.getLevel() + "'";
				}
				if (level && (time || category || recipecate)) {
					sql += " and ";
				}
				if(time){
					sql += "time = '" + recipeBean.getTime() + "'";
				}
				if (time && (category || recipecate)) {
					sql += " and ";
				}
				if(category || recipecate) {
					sql += "cate_idx = (SELECT cate_idx FROM category where ";
					if(category){
						sql += "category = '" + categoryBean.getCategory() + "'";
					}
					if (category && recipecate) {
						sql += " and ";
					}
					if(recipecate){
						sql += "recipecate = '" + categoryBean.getRecipecate() + "'";
					}
					sql += ")";
				}
			}
			rs = stmt.executeQuery(sql);
			System.out.println(sql);
			rs.last();
			int rowcount = rs.getRow();
			rs.first();
			recipe_idx = new String[rowcount];//수리
			for(int i = 0; i < rowcount;i++){
				recipe_idx[i] = rs.getString("recipe_idx");
				rs.next();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, stmt, rs);
		}
		return recipe_idx;
	}
	public RecipeBean getRecipeBean(String recipe_idx){
		RecipeBean recipeBean = new RecipeBean();
		try {
			con = getCon();
			stmt = con.createStatement();
			String sql = "SELECT * FROM recipe where recipe_idx = " + recipe_idx + ";";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				recipeBean.setRecipename(rs.getString("recipename"));
				recipeBean.setLevel(rs.getString("level"));
				recipeBean.setTime(rs.getString("TIME"));
				recipeBean.setImgpath(rs.getString("imgpath"));
				recipeBean.setIngredient(rs.getString("ingredient"));
				recipeBean.setSeasoning(rs.getString("seasoning"));
				recipeBean.setContents(rs.getString("contents"));
				recipeBean.setTools(rs.getString("tools"));
				recipeBean.setLikecount(rs.getInt("likecount"));
				recipeBean.setScrapcount(rs.getInt("scrapcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, stmt, rs);
		}
		return recipeBean;
	}
	public CategoryBean getCategoryBean(String recipe_idx){
		CategoryBean categoryBean = new CategoryBean();
		try {
			con = getCon();
			stmt = con.createStatement();
			String sql = "select * from category where cate_idx = (SELECT cate_idx FROM recipe where recipe_idx = " + recipe_idx + ");";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				categoryBean.setCategory(rs.getString("category"));
				categoryBean.setRecipecate(rs.getString("recipecate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, stmt, rs);
		}
		return categoryBean;
	}
}
