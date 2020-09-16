package com.Pocari.dao;

import java.sql.SQLException;
import java.util.Vector;

import com.Pocari.dto.FavlistAndReviewBean;
import com.Pocari.dto.RecipeBean;

public class MySectionDao extends DbcpCon{
	String midx;
	public MySectionDao(String midx){
		this.midx = midx;
	}
	public Vector<FavlistAndReviewBean> getMyfavlist(String pageidx){ //내 맛집리스트 가져오기
		Vector<FavlistAndReviewBean> v = new Vector<FavlistAndReviewBean>();
		con = getCon();
		int pagerow = 10;
		int currentPage = (Integer.parseInt(pageidx)-1) * pagerow;
		String sql = "SELECT * FROM storeinfo WHERE midx="+midx+" ORDER BY mfl_idx DESC LIMIT ?,?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, currentPage);
			pstmt.setInt(2, pagerow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				FavlistAndReviewBean b = new FavlistAndReviewBean();
				b.setMfl_idx(rs.getInt(1)); //mfl_idx
				b.setStorename(rs.getString("storename"));
				String[] loc = rs.getString("location").split("/");
				b.setSido1(loc[0]);
				b.setGugun1(loc[1]);
				b.setCategory(rs.getString("category"));
				b.setAvgstar(rs.getString("star"));
				v.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return v;
	}
	
	public Vector<FavlistAndReviewBean> getSaveStorelist(String pageidx){ //찜한 맛집 가져오기
		Vector<FavlistAndReviewBean> v = new Vector<FavlistAndReviewBean>();
		con = getCon();
		int pagerow = 10;
		int currentPage = (Integer.parseInt(pageidx)-1) * pagerow;
		String sql = "SELECT b.* FROM save_store AS a INNER JOIN storeinfo AS b ON a.mfl_idx=b.mfl_idx "
				+"WHERE a.midx="+midx+" ORDER BY mfl_idx LIMIT ?,?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, currentPage);
			pstmt.setInt(2, pagerow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				FavlistAndReviewBean b = new FavlistAndReviewBean();
				b.setMfl_idx(rs.getInt(1)); //mfl_idx
				b.setStorename(rs.getString("storename"));
				String[] loc = rs.getString("location").split("/");
				b.setSido1(loc[0]);
				b.setGugun1(loc[1]);
				b.setCategory(rs.getString("category"));
				b.setAvgstar(rs.getString("star"));
				v.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return v;
	}
	
	public Vector<FavlistAndReviewBean> getMyReviews(String pageidx){ //내 리뷰들 가져오기
		Vector<FavlistAndReviewBean> v = new Vector<FavlistAndReviewBean>();
		con = getCon();
		int pagerow = 10;
		int currentPage = (Integer.parseInt(pageidx)-1) * pagerow;
		String sql = "SELECT a.*,b.storename FROM my_review AS a INNER JOIN my_favlist AS b ON a.mfl_idx=b.mfl_idx "
				+"WHERE a.midx="+midx+" ORDER BY date DESC LIMIT ?,?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, currentPage);
			pstmt.setInt(2, pagerow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				FavlistAndReviewBean b = new FavlistAndReviewBean();
				b.setMfl_idx(rs.getInt(1)); //mfl_idx
				b.setStorename(rs.getString("storename"));
				b.setDate(rs.getString("date"));
				b.setAtmosphere(rs.getInt("atmosphere"));
				b.setService(rs.getInt("service"));
				b.setSanitary(rs.getInt("sanitary"));
				b.setFlavor(rs.getInt("flavor"));
				b.setPortions(rs.getInt("portions"));
				b.setPrice(rs.getInt("price"));
				b.setStar(rs.getInt("star"));
				String str = rs.getString("COMMENT");
				String comment = str.replaceAll("\n", "<br>");
				b.setComment(comment);
				b.setR_tag(rs.getString("tag"));
				v.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return v;
	}
	
	public Vector<RecipeBean> getMyRecipes(String pageidx){ //내 레시피 가져오기
		Vector<RecipeBean> v = new Vector<RecipeBean>();
		con = getCon();
		int pagerow = 8;
		int currentPage = (Integer.parseInt(pageidx)-1) * pagerow;
		String sql = "SELECT * FROM recipe WHERE midx="+midx+" ORDER BY date LIMIT ?,?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, currentPage);
			pstmt.setInt(2, pagerow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				RecipeBean b = new RecipeBean();
				b.setRecipe_idx(rs.getInt("recipe_idx"));
				b.setRecipename(rs.getString("recipename"));
				b.setLevel(rs.getString("level"));
				b.setImgpath(rs.getString("imgpath"));
				v.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return v;
	}
	
	public Vector<RecipeBean> getOtherRecipes(String note, String pageidx){ //좋아요, 스크랩 한 레시피 가져오기
		Vector<RecipeBean> v = new Vector<RecipeBean>();
		con = getCon();
		int pagerow = 8;
		int currentPage = (Integer.parseInt(pageidx)-1) * pagerow;
		String sql="SELECT b.* FROM save_recipe AS a INNER JOIN recipe AS b ON a.recipe_idx=b.recipe_idx "
				+"WHERE a.midx="+midx+" AND a.note='"+note+"' ORDER BY idx LIMIT ?,?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, currentPage);
			pstmt.setInt(2, pagerow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				RecipeBean b = new RecipeBean();
				b.setRecipe_idx(rs.getInt("recipe_idx"));
				b.setRecipename(rs.getString("recipename"));
				b.setLevel(rs.getString("level"));
				b.setImgpath(rs.getString("imgpath"));
				v.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return v;
	}
	
	public int getTotalPage(String tablename){ //섹션 별로 토탈 페이지 구하기
		int totalpage = 0;
		int pagerow = 10;
		con = getCon();
		String idx="";
		switch(tablename){
			case "my_favlist": idx = "mfl_idx"; break;
			case "recipe": idx = "recipe_idx"; pagerow = 8; break;
			case "my_review": idx = "review_idx"; break;
			case "save_store": idx = "mfl_idx"; pagerow = 8; break;
		}
		String sql = "SELECT COUNT("+idx+") FROM "+tablename+" WHERE midx="+midx;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				totalpage = rs.getInt(1);
			}
			totalpage = (int)Math.ceil(totalpage/(float)pagerow);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return totalpage;
	}
	
	public int getTotalPage(String tablename, String note){ //섹션 별로 토탈 페이지 구하기
		int totalpage = 0;
		int pagerow = 8;
		con = getCon();
		String sql = "SELECT COUNT(idx) FROM "+tablename
					+" WHERE midx="+midx+" AND note='"+note+"'";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				totalpage = rs.getInt(1);
			}
			totalpage = (int)Math.ceil(totalpage/(float)pagerow);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return totalpage;
	}
	
	public Vector<FavlistAndReviewBean> getMyfavlistSearch(String keyword,String pageidx){ //내맛집
		Vector<FavlistAndReviewBean> v = new Vector<FavlistAndReviewBean>();
		con = getCon();
		int pagerow = 10;
		int currentPage = (Integer.parseInt(pageidx)-1) * pagerow;
		String sql = "SELECT * FROM storeinfo WHERE midx="+midx+" AND tag LIKE '%"+keyword+"%' ORDER BY mfl_idx DESC LIMIT ?,?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, currentPage);
			pstmt.setInt(2, pagerow);
			rs = pstmt.executeQuery();
			System.out.println(22);
			while(rs.next()){
				System.out.println(3333);
				FavlistAndReviewBean b = new FavlistAndReviewBean();
				b.setMfl_idx(rs.getInt(1)); //mfl_idx
				b.setStorename(rs.getString("storename"));
				String[] loc = rs.getString("location").split("/");
				b.setSido1(loc[0]);
				b.setGugun1(loc[1]);
				b.setCategory(rs.getString("category"));
				b.setAvgstar(rs.getString("star"));
				v.add(b);
				System.out.println(rs.getString("storename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return v;
	}
	
	public Vector<FavlistAndReviewBean> getSaveStorelistSearch(String keyword,String pageidx){ //찜한 맛집
		Vector<FavlistAndReviewBean> v = new Vector<FavlistAndReviewBean>();
		con = getCon();
		int pagerow = 10;
		int currentPage = (Integer.parseInt(pageidx)-1) * pagerow;
		String sql = "SELECT b.* FROM save_store AS a INNER JOIN storeinfo AS b ON a.mfl_idx=b.mfl_idx "
				+"WHERE a.midx="+midx+" AND tag LIKE '%"+keyword+"%' ORDER BY mfl_idx LIMIT ?,?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, currentPage);
			pstmt.setInt(2, pagerow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				FavlistAndReviewBean b = new FavlistAndReviewBean();
				b.setMfl_idx(rs.getInt(1)); //mfl_idx
				b.setStorename(rs.getString("storename"));
				String[] loc = rs.getString("location").split("/");
				b.setSido1(loc[0]);
				b.setGugun1(loc[1]);
				b.setCategory(rs.getString("category"));
				b.setAvgstar(rs.getString("star"));
				v.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			freeCon(con,pstmt,rs);
		}
		return v;
	}
}