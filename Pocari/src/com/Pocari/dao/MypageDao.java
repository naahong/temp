package com.Pocari.dao;

import java.sql.SQLException;
import java.util.Vector;

import com.Pocari.dto.FavlistAndReviewBean;
import com.Pocari.dto.MemberBean;
import com.Pocari.dto.RecipeBean;

public class MypageDao extends DbcpCon{
	String id;
	String midx;
	public MypageDao(String loginid,String midx){
		this.id = loginid;
		this.midx = midx;
	}
	
	public MemberBean getMemberinfo(){
		MemberBean b = new MemberBean();
		con = getCon();
		String sql = "select * from memberlist where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				b.setMidx(rs.getInt("midx"));
				b.setId(rs.getString("id"));
				b.setPw(rs.getString("pw"));
				b.setEmail(rs.getString("email"));
				b.setBirth(rs.getString("birth"));
				b.setGender(rs.getString("gender"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return b;
	}
	
	public int updateMeminfo(MemberBean b){
		con = getCon();
		int res = 0;
		String sql = "UPDATE memberlist SET pw=?, email=?, birth=?, gender=? WHERE id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b.getPw());
			pstmt.setString(2, b.getEmail());
			pstmt.setString(3, b.getBirth());
			pstmt.setString(4, b.getGender());
			pstmt.setString(5, b.getId());
			res = pstmt.executeUpdate();
			if(res>0){
				System.out.println("회원 정보 수정 완료");
			}else{
				System.out.println("문제발생!! 수정 안됨");
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
	
	public int deleteCateinfo(String tablename){
		con = getCon();
		int res = 0;
		String sql = "DELETE FROM "+tablename+" WHERE midx=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, midx);
			res = pstmt.executeUpdate();
			if(res>0){
				System.out.println("선호 카테고리 삭제 완료");
			}else{
				System.out.println("문제발생!! 삭제 안됨");
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
	
	public int saveCateinfo(String tablename, String category){
		con = getCon();
		int res = 0;
		String sql = "INSERT INTO "+tablename+" VALUES (NULL,?,?,'like',NULL,NULL,NULL)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, midx);
			pstmt.setString(2, category);
			res = pstmt.executeUpdate();
			if(res>0){
				System.out.println("선호 카테고리 등록 완료");
			}else{
				System.out.println("문제발생!! 등록 안됨");
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
	
	public int deleteMem(){
		con = getCon();
		String sql = "DELETE FROM memberlist WHERE midx=? AND id=?";
		int res = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, midx);
			pstmt.setString(2, id);
			res = pstmt.executeUpdate();
			if(res>0){
				System.out.println("회원 삭제 완료");
			}else{
				System.out.println("문제발생!! 삭제 안됨");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt);
		}
		return res;
	}
	
	public Vector<String> getCategory(String parent_cate){
		Vector<String> v = new Vector<String>();
		con = getCon();
		String sql = "SELECT DISTINCT category FROM category WHERE parent_cate = '"+parent_cate+"'";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				v.add(rs.getString("category"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return v;
	}
	
	public Vector<String> getFavCategory(String tablename){
		Vector<String> v = new Vector<String>();
		con = getCon();
		String sql = "SELECT DISTINCT a.category, b.pref FROM category AS a INNER JOIN "
					+tablename+" AS b ON a.category=b.category "
					+"WHERE b.midx="+midx+" AND b.pref='like';";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				v.add(rs.getString("category"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return v;
	}
	
}