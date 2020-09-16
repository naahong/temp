package com.Pocari.dao;

import com.Pocari.dto.FavRecipeBean;

public class Fav_RecipeDao extends DbcpCon{

	public int addRecipeFood (FavRecipeBean recipe){
		int result = 0;
		String sql = "insert into fav_recipe value(NULL,?,?,?,NULL,NULL,NULL)";
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);	
			pstmt.setInt(1, recipe.getMidx());
			pstmt.setString(2, recipe.getCategory());
			pstmt.setString(3, recipe.getPref());
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();		
		}finally{
			freeCon(con, pstmt);
		}
		return result;
	}
}
