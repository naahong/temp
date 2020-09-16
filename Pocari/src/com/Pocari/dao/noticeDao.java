package com.Pocari.dao;

import java.sql.SQLException;
import java.util.Vector;

import com.Pocari.dto.BoardBean;

public class noticeDao extends DbcpCon {
	Vector<BoardBean> v= new Vector<BoardBean>();
	BoardBean bean = new BoardBean();
	
	int totalPage = 0;
	int pageRow = 10;

	public int postNotice(BoardBean board){
		int result = 0;
		String sql = "insert into notice value(NULL,?,?,?,now(),null,null,null)";
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());			
			pstmt.setString(2, board.getContents());
			pstmt.setString(3, board.getId());
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
		String sql = "select * from notice ORDER BY idx desc limit ?,?";
		try {
			con=getCon();
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
			e.printStackTrace();
		} finally {
			freeCon(con, pstmt, rs);
		}
		return v;
	}
	
	public BoardBean selectData(String idx){
		String sql = "select * from notice where idx=?";
		try {
			con=getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(idx));
			rs=pstmt.executeQuery();
			
			if(rs.next()){				
				bean.setTitle(rs.getString(2));
				bean.setContents(rs.getString(3));
				bean.setId(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return bean;
	}
	
	public int getAllPage(){
		String sql = "select count(idx) from notice";
		
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

