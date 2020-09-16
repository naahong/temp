package com.Pocari.dao;

import java.sql.SQLException;
import java.util.Vector;

import com.Pocari.dto.BoardBean;

public class QnaDao extends DbcpCon {
	Vector<BoardBean> v= new Vector<BoardBean>();
	BoardBean bean = new BoardBean();
	
	int totalPage = 0; 
	int pageRow = 10; 
	public int postqna(BoardBean board){
		int result = 0;
		String sql = "insert into qna value(NULL,?,?,?,?,now(),null,null,null)";
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getMidx());			
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContents());
			pstmt.setString(4, board.getIslock());
			result = pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();		
		}finally{
			freeCon(con,pstmt);
		}
		return result;
	}
	
	public Vector<BoardBean> getAllData(String pageidx){
		int currentPage = (Integer.parseInt(pageidx)-1)*pageRow;
		String sql = "select * from qna ORDER BY qidx desc limit ?,?";
		try {
			con=getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, currentPage);
			pstmt.setInt(2, pageRow);
			rs=pstmt.executeQuery();
			while(rs.next()){
				BoardBean board = new BoardBean();
				board.setQidx(rs.getInt(1));
				board.setTitle(rs.getString(3));
				board.setContents(rs.getString(4));
				board.setIslock(rs.getString(5));
				board.setDate(rs.getString(6));
				v.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeCon(con, pstmt, rs);
		}
		return v;
	}
	
	public BoardBean selectData(String qidx){
		String sql = "select * from qna where qidx=?";
		try {
			con=getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(qidx));
			rs=pstmt.executeQuery();
			
			if(rs.next()){	
				bean.setMidx(rs.getInt(2));
				bean.setTitle(rs.getString(3));
				bean.setContents(rs.getString(4));
				bean.setIslock(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return bean;
	}
	
	public int getAllPage(){
		String sql = "select count(Qidx) from qna";
		
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				totalPage=rs.getInt(1);
			}
			totalPage = (int)Math.ceil(totalPage/(float)pageRow);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return totalPage;
	}
}