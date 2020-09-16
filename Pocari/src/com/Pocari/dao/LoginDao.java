package com.Pocari.dao;

import com.Pocari.dto.MemberBean;

public class LoginDao extends DbcpCon {
	public boolean memberLogin(String id, String pw){
		boolean result = false;
		String sql = "select * from memberlist where id=? and pw=?";
		try {
			con = getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();		
		}finally{
			freeCon(con, pstmt, rs);
		}
		return result;
	}
	
	public MemberBean membermidx(String idx){
		MemberBean readMidx = new MemberBean();
		int result=0;
		String sql = "select midx from memberlist where id=?";
		try {
			con = getCon();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				readMidx.setMidx(rs.getInt(1));		
			}
		} catch (Exception e) {
			e.printStackTrace();		
		}finally{
			freeCon(con, pstmt, rs);
		}
		return readMidx;
	}
}

