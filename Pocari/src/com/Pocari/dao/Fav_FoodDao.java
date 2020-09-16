package com.Pocari.dao;

import com.Pocari.dto.FavFoodBean;

public class Fav_FoodDao extends DbcpCon{
	public int addFavFood(FavFoodBean food){
		
		int result = 0;
		String sql = "insert into fav_food value(NULL,?,?,?,NULL,NULL,NULL)";
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, food.getMidx());
			pstmt.setString(2, food.getCategory());
			pstmt.setString(3, food.getPref());
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();		
		}finally{
			freeCon(con, pstmt);
		}
		return result;
		}
	}
