package com.Pocari.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.Pocari.dto.BoardBean;
import com.Pocari.dto.MemberBean;


public class RegisterDao {
	InitialContext initialContext = null;
	DataSource ds = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	MemberBean sel = new MemberBean();
	
	public int registInfo(MemberBean bean){
		try {
			initialContext = new InitialContext();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		try {
			ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/dbcp");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		int result = 0;
		String sql = "insert into memberlist value(NULL,?,?,?,?,?,null,null,null)";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());			
			pstmt.setString(2, bean.getPw());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getBirth());
			pstmt.setString(5, bean.getGender());
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();		
		}finally{
			FreeCon.freeConn(pstmt,con);
		}
		return result;
		}
	
	
	public MemberBean selectMidxData(String id){
		try {
			initialContext = new InitialContext();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		try {
			ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/dbcp");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		String sql = "select midx from memberlist where id=?";
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){				
				sel.setMidx(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			FreeCon.freeConn(con, pstmt, rs);
		}
		return sel;
	}
	}
