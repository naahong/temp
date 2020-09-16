package com.Pocari.dao;

import java.util.Vector;

import com.Pocari.dto.Re_Bean;

public class qnaRpyDao extends DbcpCon {
	public int insertReData(String read_qidx, String read_id, String content) {
		int result = 0;
		String sql = "insert into qna_re values (null,?,?,?,now(),null,null,null)";

		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(read_qidx));
			pstmt.setString(2, read_id);
			pstmt.setString(3, content);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeCon(con,pstmt);
		}
		return result;
	}
	
	public Vector<Re_Bean> selectReData(String qidxChk) {
		Vector<Re_Bean> v = new Vector<Re_Bean>();
		String sql = "select * from qna_re where qidx=?";
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(qidxChk));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Re_Bean bean = new Re_Bean();
				bean.setContents(rs.getString(4));
				v.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeCon(con, pstmt, rs);
		}
		return v;
	}

}
