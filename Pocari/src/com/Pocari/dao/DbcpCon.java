package com.Pocari.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbcpCon {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Statement stmt=null;
	public Connection getCon(){
		try {
			InitialContext initialContext = new InitialContext();
			DataSource ds = (DataSource) initialContext.lookup("java:comp/env/jdbc/dbcp");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void freeCon(Connection con, PreparedStatement pstmt, ResultSet rs){
		try {
			if (con != null) con.close();
			if (pstmt != null) pstmt.close();
			if (rs != null) rs.close();
    	} catch(SQLException ex) {}
	}

	public void freeCon(Connection con, PreparedStatement pstmt) {
		try {
			if (con != null) con.close();
			if (pstmt != null) pstmt.close();
    	} catch(SQLException ex) {}
	}
	public void freeCon(Connection con, Statement stmt, ResultSet rs){
		try {
			if (con != null) con.close();
			if (stmt != null) stmt.close();
			if (rs != null) rs.close();
    	} catch(SQLException ex) {}
	}
}