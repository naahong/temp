package com.Pocari.dao;

import java.sql.SQLException;

import com.Pocari.dto.MemberBean;


public class RegisterDao extends DbcpCon {
	MemberBean sel = new MemberBean();
	
	public int registInfo(MemberBean bean){
		int result = 0;
		String sql = "insert into memberlist value(NULL,?,?,?,?,?,null,null,null)";
		try {
			con = getCon();
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
			freeCon(con,pstmt);
		}
		return result;
	}
	
	
	public MemberBean selectMidxData(String id){
		String sql = "select midx from memberlist where id=?";
		try {
			con=getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){				
				sel.setMidx(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con, pstmt, rs);
		}
		return sel;
	}
}
