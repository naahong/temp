package com.Pocari.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class FreeCon {

		public static void freeConn(Connection con, PreparedStatement pstmt, ResultSet rs){
		try {
			if(pstmt != null)
			pstmt.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		try {
			if(con != null)
			con.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		try {
			if(rs != null)
			rs.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		
		
	}// free
	
	public void freeConn(Statement stmt, Connection con){
		try {
			if(stmt != null)
			stmt.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		try {
			if(con != null)
			con.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}	
		
	}// free
	
	public static void freeConn(PreparedStatement pstmt, Connection con){
		try {
			if(pstmt != null)
			pstmt.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		try {
			if(con != null)
			con.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}	
		
	}// free
	
	public void freeConn(ResultSet rs, PreparedStatement pstmt, Connection con){
		try {
			if(rs != null)
			rs.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		try {
			if(pstmt != null)
			pstmt.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		try {
			if(con != null)
			con.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}	
		
	}// free 
	
	//===========================================================	
}
