package com.Pocari.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.Pocari.dto.CategoryBean;
import com.Pocari.dto.FavlistAndReviewBean;
import com.Pocari.dto.MemberBean;
import com.Pocari.dto.Save_Bean;

public class My_favlistDao {
	
	
	DataSource ds = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int result = 0;
	
	int totalpage = 0;
	int pagerow = 10;
	
	public My_favlistDao(){
		
		try {
			InitialContext initialContext = new InitialContext();
			ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/dbcp");			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void freeConnection(Connection con, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null){ rs.close(); }
            if (pstmt != null){ pstmt.close(); }
            if (con != null){ con.close(); }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection con, PreparedStatement pstmt) {
        try {
        	if (pstmt != null){ pstmt.close(); }
            if (con != null){ con.close(); }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public  Vector<FavlistAndReviewBean> getAllRes(String pageidx){
    	
    	Vector<FavlistAndReviewBean> v = new Vector<FavlistAndReviewBean>();
    	
    	int currentPage = (Integer.parseInt(pageidx)-1)*pagerow;
    	String sql = "select * from  my_favlist limit ?, ?";
    	
    	try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, currentPage);
			pstmt.setInt(2, pagerow);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FavlistAndReviewBean bean = new FavlistAndReviewBean();
				String loca = rs.getString(4);
				String[] lo = loca.split("/");
				bean.setMfl_idx(rs.getInt(1));
				bean.setStorename(rs.getString(3));
				bean.setSido1(lo[0]);
				bean.setGugun1(lo[1]);
				bean.setCategory(rs.getString(5));
				bean.setTel(rs.getString(6));
				bean.setImgpath(rs.getString(7));
				bean.setS_tag(rs.getString(8));
				v.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeConnection(con, pstmt, rs);
		}
    	
		return v;
    	
    }
    
    public int saveFavRes(FavlistAndReviewBean bean){
		
		String sql = "insert into my_favlist values(null,1,?,?,?,?,?,?,null,null,null)";
		//    mfl_idx, midx, storename, location, category, tel, imgpath, tag, c1, c2, c3
		try {		
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getStorename());
			pstmt.setString(2, bean.getSido1()+"/"+bean.getGugun1());
			pstmt.setString(3, bean.getCategory());
			pstmt.setString(4, bean.getTel());
			pstmt.setString(5, bean.getImgpath());
			pstmt.setString(6, bean.getS_tag());
			result=pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeConnection(con, pstmt);
		}
		return result;
		
	}
    
    public int saveResReview(FavlistAndReviewBean bean){
		
		String sql = "insert into my_review values(null,?,2,?,?,?,?,?,?,?,?,?,?,null,null,null)";
		//    review_idx, mfl_idx, midx, star, comment, atmosphere, service, sanitary, flavor, price, portions, tag, date, c1, c2, c3
		try {		
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getMfl_idx());
			pstmt.setInt(2, bean.getStar());
			pstmt.setString(3, bean.getComment());
			pstmt.setInt(4, bean.getAtmosphere());
			pstmt.setInt(5, bean.getService());
			pstmt.setInt(6, bean.getSanitary());
			pstmt.setInt(7, bean.getFlavor());
			pstmt.setInt(8, bean.getPrice());
			pstmt.setInt(9, bean.getPortions());
			pstmt.setString(10, bean.getR_tag());
			pstmt.setString(11, bean.getDate());
			result=pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeConnection(con, pstmt);
		}
		return result;
		
	}
    
   public int getMflIdx(int midx, String storename, String sido1, String gugun1){
    	
    	String sql = "select mfl_idx from my_favlist where midx=? and storename=? and location=?";
    	
    	try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, midx);
			pstmt.setString(2, storename);
			pstmt.setString(3, sido1+"/"+gugun1);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeConnection(con, pstmt, rs);
		}
		return result;
    	
    }
    
    public int getTotalPage(){
		
		String sql = "select count(mfl_idx) from my_favlist";
		
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				totalpage = rs.getInt(1);
			}
			totalpage = (int)Math.ceil(totalpage/(float)pagerow);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return totalpage;
	}
    
    public FavlistAndReviewBean getResDetail(int idx){
    	
    	FavlistAndReviewBean bean = new FavlistAndReviewBean();
    	String sql = "select * from my_favlist where mfl_idx =?";
    	
    	try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bean.setImgpath(rs.getString(7));
				bean.setStorename(rs.getString(3));
				String loca = rs.getString(4);
				String[] lo = loca.split("/");
				bean.setSido1(lo[0]);
				bean.setGugun1(lo[1]);
				bean.setCategory(rs.getString(5));
				bean.setTel(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeConnection(con, pstmt, rs);
		}
    	
		return bean;
    	
    }
    
    public Vector<FavlistAndReviewBean> getReple(int idx){
		
    	Vector<FavlistAndReviewBean> v = new Vector<FavlistAndReviewBean>();
		String sql = "select * from my_review where mfl_idx = ?";
    	
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				FavlistAndReviewBean bean = new FavlistAndReviewBean();
				bean.setMfl_idx(rs.getInt(2));
				bean.setMidx(rs.getInt(3));
				bean.setDate(rs.getString(13));
				bean.setAtmosphere(rs.getInt(6));
				bean.setService(rs.getInt(7));
				bean.setSanitary(rs.getInt(8));
				bean.setFlavor(rs.getInt(9));
				bean.setPrice(rs.getInt(10));
				bean.setPortions(rs.getInt(11));
				bean.setStar(rs.getInt(4));
				String str = rs.getString(5);
				String contents = str.replaceAll("\r\n", "<br>");
				bean.setComment(contents);
				bean.setR_tag(rs.getString(12));
				v.add(bean);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeConnection(con, pstmt, rs);
		}
		
		return v;
		
	}
    
    public String getMemberId(int idx){
		
    	String result = "";
		String sql = "select id from memberlist where midx =?";
    	
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeConnection(con, pstmt, rs);
		}
		
		return result;
		
	}
    
    public int saveOnlyReview(FavlistAndReviewBean bean){
		
		String sql = "insert into my_review values(null,?,2,?,?,?,?,?,?,?,?,?,?,null,null,null)";
		//    review_idx, mfl_idx, midx, star, comment, atmosphere, service, sanitary, flavor, price, portions, tag, date, c1, c2, c3
		try {		
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getMfl_idx());
			pstmt.setInt(2, bean.getStar());
			pstmt.setString(3, bean.getComment());
			pstmt.setInt(4, bean.getAtmosphere());
			pstmt.setInt(5, bean.getService());
			pstmt.setInt(6, bean.getSanitary());
			pstmt.setInt(7, bean.getFlavor());
			pstmt.setInt(8, bean.getPrice());
			pstmt.setInt(9, bean.getPortions());
			pstmt.setString(10, bean.getR_tag());
			pstmt.setString(11, bean.getDate());
			result=pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeConnection(con, pstmt);
		}
		return result;
		
	}
    
    public int deleteRes(int idx){
		
		String sql = "delete from my_favlist where mfl_idx =?";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql); //PreparedStatement´Â create¾ÈÇÔ
			pstmt.setInt(1, idx);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeConnection(con, pstmt);
		}
		return result;
		
	}

	public int saveStore(Save_Bean bean) {
		
		String sql = "insert into save_store values(2,?,null,null,null)";
		//midx, mfl_idx, c1, c2, c3
		
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getMfl_idx());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeConnection(con, pstmt);
		}
		
		return result;
	}

	public Vector<FavlistAndReviewBean> getSearchRes(String keyword) {
		
		String sql = "select * from my_favlist where storename like ? or location like ? or category like ?";
		
		Vector<FavlistAndReviewBean> v = new Vector<FavlistAndReviewBean>();
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			pstmt.setString(3, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				FavlistAndReviewBean bean = new FavlistAndReviewBean();
				bean.setStorename(rs.getString(3));
				bean.setImgpath(rs.getString(7));
				bean.setCategory(rs.getString(5));
				String loca = rs.getString(4);
				String[] lo = loca.split("/");
				bean.setSido1(lo[0]);
				bean.setGugun1(lo[1]);
				v.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeConnection(con, pstmt, rs);
		}
		
		return v;
	}
    
	public Vector<CategoryBean> getFoodlist() {
		
		String sql = "select foodname from category where parent_cate='food'";
		
		Vector<CategoryBean> v = new Vector<CategoryBean>();
		
		try {
			con = ds.getConnection();
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
			freeConnection(con, pstmt, rs);
		}
		
		return v;
	}
	
	public int getRIdx(int midx, int mfl_idx, String date){
    	
    	String sql = "select review_idx from my_favlist where midx=? and mfl_idx=? and date=?";
    	
    	try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, midx);
			pstmt.setInt(2, mfl_idx);
			pstmt.setString(3, date);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeConnection(con, pstmt, rs);
		}
		return result;
    	
    }

	public int saveRimg(int review_idx, String temp) {
		
		String sql = "insert into review_img values(?,?,null,null,null)";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_idx);
			pstmt.setString(2, temp);
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
}
