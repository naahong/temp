package com.Pocari.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.Pocari.dto.FavFoodBean;

public class Fav_FoodDao {
	InitialContext initialContext = null;
	DataSource ds = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public int addFavFood(FavFoodBean food){
		try {
			initialContext = new InitialContext();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/dbcp");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result = 0;
		String sql = "insert into fav_food value(NULL,?,?,?,NULL,NULL,NULL)";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, food.getMidx());
			pstmt.setString(2, food.getCategory());
			pstmt.setString(3, food.getPref());
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
		}finally{
			FreeCon.freeConn(pstmt,con);
		}
		return result;
		}
	}
