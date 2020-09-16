package com.Pocari.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.Pocari.dto.BoardBean;

public class QnaDao {
	InitialContext initialContext = null;
	DataSource ds = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Vector<BoardBean> v= new Vector<BoardBean>();
	BoardBean bean = new BoardBean();
	
	int totalPage = 0; 
	int pageRow = 10; 

	public int postQna(BoardBean board){
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
		String sql = "insert into notice value(NULL,?,?,?,now(),null,null,null)";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());			
			pstmt.setString(2, board.getContents());
			pstmt.setString(3, board.getId());
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
		}finally{
			FreeCon.freeConn(pstmt,con);
		}
		return result;
		}
	
	public Vector<BoardBean> getAllData(String pageidx){
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
		
		int currentPage = (Integer.parseInt(pageidx)-1)*pageRow;
		String sql = "select * from qna ORDER BY idx desc limit ?,?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, currentPage);
			pstmt.setInt(2, pageRow);
			rs=pstmt.executeQuery();
			while(rs.next()){
				BoardBean board = new BoardBean();
				board.setIdx(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContents(rs.getString(3));
				board.setId(rs.getString(4));
				board.setDate(rs.getString(5));
				v.add(board);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			FreeCon.freeConn(con, pstmt, rs);
		}
		
		return v;
	}
	
	public BoardBean selectData(String idx){
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
		String sql = "select * from qna where idx=?";
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(idx));
			rs=pstmt.executeQuery();
			
			if(rs.next()){				
				bean.setTitle(rs.getString(2));
				bean.setContents(rs.getString(3));
				bean.setId(rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			FreeCon.freeConn(con, pstmt, rs);
		}
		return bean;
	}
	
	public int getAllPage(){
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
		String sql = "select count(idx) from qna";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				totalPage=rs.getInt(1);
			}
			totalPage = (int)Math.ceil(totalPage/(float)pageRow);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			FreeCon.freeConn(con, pstmt, rs);
		}
		return totalPage;
	}
}