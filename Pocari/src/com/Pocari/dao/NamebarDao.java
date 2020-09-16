package com.Pocari.dao;

import java.sql.SQLException;
import java.util.Vector;

import com.Pocari.dto.CategoryBean;

public class NamebarDao extends DbcpCon {
	int result = 0;
	String rst = null;
	
	int totalpage = 0;
	int pagerow = 10;
	 
    public Vector<CategoryBean> getFoodlist() {
		
		String sql = "select foodname from category where parent_cate='food' order by foodname";
		
		Vector<CategoryBean> v = new Vector<CategoryBean>();
		
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				CategoryBean bean = new CategoryBean();
				bean.setFoodname(rs.getString(1));
				v.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return v;
	}

	public String getBirth(int midx) {
		
		String sql = "select birth from memberlist where midx =?";
		
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				rst = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return rst;
	}

	public int saveFavdata(String birthY, String foodname) {
		
		String sql = "insert into fav_data values(null, ?, ?)";
		
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, birthY);
			pstmt.setString(2, foodname);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt);
		}
		return result;
	}

	public Vector<CategoryBean> getDetailedFoodlist(String cateN) {

		String sql = "select foodname from category where parent_cate='food' and category= ?";
		
		Vector<CategoryBean> v = new Vector<CategoryBean>();
		
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cateN);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				CategoryBean bean = new CategoryBean();
				bean.setFoodname(rs.getString(1));
				v.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return v;
	}
    
}
