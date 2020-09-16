package com.Pocari.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Boarddao {
	InitialContext initialContext = null;
	DataSource ds = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int totalpage = 0;
	int pagerow = 10;

	public Connection getCon(){
		try {
			initialContext = new InitialContext();
			ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/dbcp");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void freeCon(Connection con, PreparedStatement pstmt, ResultSet rs){
        if (con != null) try { con.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	}

	public void freeCon(Connection con, PreparedStatement pstmt) {
        if (con != null) try { con.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	}
	
	public int saveNotice(String title, String contents, String id){
		con = getCon();
		int res = 0;
		String sql = "INSERT INTO notice VALUES(NULL,?,?,?,NOW(),null,null,null)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setString(3, id);
			res = pstmt.executeUpdate();
			if(res>0){
				System.out.println("글 등록 완료");
			}else{
				System.out.println("문제발생!! 입력안됨");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt);
		}
		return res;
	}
	
	public int saveQna(int midx, String title, String contents, String islock){
		con = getCon();
		int res = 0;
		String sql = "INSERT INTO qna VALUES(NULL,?,?,?,?,NOW(),null,null,null)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, midx);
			pstmt.setString(2, title);
			pstmt.setString(3, contents);
			pstmt.setString(4, islock);
			res = pstmt.executeUpdate();
			if(res>0){
				System.out.println("글 등록 완료");
			}else{
				System.out.println("문제발생!! 입력안됨");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt);
		}
		return res;
	}
	
	public int saveQnaRe(int qidx, String id, String contents){
		con = getCon();
		int res = 0;
		String sql = "INSERT INTO qna_re VALUES(NULL,?,?,?,NOW(),null,null,null)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qidx);
			pstmt.setString(2, id);
			pstmt.setString(3, contents);
			res = pstmt.executeUpdate();
			if(res>0){
				System.out.println("댓글 등록 완료");
			}else{
				System.out.println("문제발생!! 입력안됨");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt);
		}
		return res;
	}
	
	public int saveRecipeRe(String tablename, int midx, int idx2, String contents){ //idx2=recipe_idx,reidx
		con = getCon();
		int res = 0; //recipe_re, recipe_rere 테이블에 쓰는 메소드
		String sql = "INSERT INTO "+tablename+" VALUES(NULL,?,?,?,NOW(),null,null,null)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, midx);
			pstmt.setInt(2, idx2);
			pstmt.setString(3, contents);
			res = pstmt.executeUpdate();
			if(res>0){
				System.out.println("댓글 등록 완료");
			}else{
				System.out.println("문제발생!! 입력안됨");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt);
		}
		return res;
	}

	public int getTotalPage(String tablename){
		con = getCon();
		String query = "select count(idx) from "+tablename;
		try {
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()){
				totalpage = rs.getInt(1);
			}
			totalpage = (int)Math.ceil(totalpage/(float)pagerow);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt);
		}
		return totalpage;
	}
}
