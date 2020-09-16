package com.Pocari.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import com.Pocari.dto.CategoryBean;
import com.Pocari.dto.RecipeBean;

public class RecipeDAO {
//	InitialContext initialContext = new InitialContext();
//	DataSource ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/dbcp");
	DBConnectionMgr pool = new DBConnectionMgr();
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	public void setvalue(){
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM jspboard_mem";
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public RecipeBean[] returnRecipeBean(String search){
		RecipeBean[] recipeBean = null;
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM recipe where recipename like '%" + search + "%'";
			rs = stmt.executeQuery(sql);
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
		}
		return recipeBean;
	}
	public CategoryBean[] returnCategoryBean(String search){
		CategoryBean[] CategoryBean = null;
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM recipe where recipename like '%" + search + "%'";
			rs = stmt.executeQuery(sql);
			int i = 0;
			while(rs.next()) {
				CategoryBean[i] = new CategoryBean();
				CategoryBean[i].setCategory(rs.getString("category"));
				CategoryBean[i].setRecipecate(rs.getString("recipecate"));
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return CategoryBean;
	}
	public int insertRecipe(RecipeBean recipeBean, int cate_idx){
		java.sql.Date sqlDate = java.sql.Date.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));
		int result = 0;
		String sql = "insert into recipe(midx,cate_idx,recipename,ingredient,seasoning,level,TIME,tools,contents,imgpath,date) VALUES(1, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			System.out.println(cate_idx+" insertRecipe");
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cate_idx);//외래키로 가져오기
			pstmt.setString(2, recipeBean.getRecipename());
			pstmt.setString(3, recipeBean.getIngredient());
			pstmt.setString(4, recipeBean.getSeasoning());
			pstmt.setString(5, recipeBean.getLevel());
			pstmt.setString(6, recipeBean.getTime());
			System.out.println(recipeBean.getTime());
			pstmt.setString(7, recipeBean.getTools());
			pstmt.setString(8, recipeBean.getContents());
			pstmt.setString(9, recipeBean.getImgpath());
			pstmt.setDate(10 , sqlDate);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
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
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, parent_cate);
			pstmt.setString(2, category);
			pstmt.setString(3, foodname);
			pstmt.setString(4, recipecate);
			result = pstmt.executeUpdate();
			System.out.println(result + " insertCategory1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String sql1 = "select * from category where parent_cate = " + "'" + parent_cate + "'" + " and category = " + "'" + category + "'" + " and recipecate = " + "'" + recipecate + "'" + ";";
		System.out.println(sql1);
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql1);
			if (rs.next()) {
				cate_idx = rs.getInt("cate_idx");
			}
			System.out.println(cate_idx + " insertCategory2");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cate_idx;
	}
	public String[] imgpath(){
		String[] imgpath = new String[12];
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * from recipe";
			rs = stmt.executeQuery(sql);
			int i = 0;
			while(rs.next()){
				imgpath[i] = rs.getString("imgpath");
				System.out.println(imgpath[i]);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imgpath;
	}
	public int[] recipe_idx(){
		int[] recipe_idx = new int[12];
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * from recipe";
			rs = stmt.executeQuery(sql);
			int i = 0;
			while(rs.next()){
				recipe_idx[i] = Integer.parseInt(rs.getString("recipe_idx"));
				System.out.println(recipe_idx[i]);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recipe_idx;
	}
	public RecipeBean getRecipeBean(String recipe_idx){
		RecipeBean recipeBean = new RecipeBean();
		try {
			con = pool.getConnection();
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
		}
		return recipeBean;
	}
	public CategoryBean getCategoryBean(String recipe_idx){
		CategoryBean categoryBean = new CategoryBean();
		try {
			con = pool.getConnection();
			stmt = con.createStatement();
			String sql = "select * from category where cate_idx = (SELECT cate_idx FROM recipe where recipe_idx = " + recipe_idx + ");";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				categoryBean.setCategory(rs.getString("category"));
				categoryBean.setRecipecate(rs.getString("recipecate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categoryBean;
	}
}
