package com.Pocari.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.Pocari.dto.FavFoodBean;
import com.Pocari.dto.FavRecipeBean;

public class Fav_RecipeDao {
	InitialContext initialContext = null;
	DataSource ds = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public int addRecipeFood (FavRecipeBean recipe){
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
		String sql = "insert into fav_recipe value(NULL,?,?,?,NULL,NULL,NULL)";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);	
			pstmt.setInt(1, recipe.getMidx());
			pstmt.setString(2, recipe.getCategory());
			pstmt.setString(3, recipe.getPref());
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
