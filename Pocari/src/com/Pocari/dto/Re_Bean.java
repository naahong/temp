package com.Pocari.dto;

public class Re_Bean { //recipe_re, qna_re 테이블
	private int reidx; //recipe_re idx
	private int midx; //회원idx / memberlist 외래키
	private int recipe_idx; //레시피idx / recipe 외래키
	private String contents;
	private String date;

	private int idx; //qna댓글번호
	private int qidx; //qna글번호 /qna외래키
	private String id; //qna (관리자)
	public Re_Bean(){};
	public int getReidx() {
		return reidx;
	}
	public void setReidx(int reidx) {
		this.reidx = reidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getRecipe_idx() {
		return recipe_idx;
	}
	public void setRecipe_idx(int recipe_idx) {
		this.recipe_idx = recipe_idx;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getQidx() {
		return qidx;
	}
	public void setQidx(int qidx) {
		this.qidx = qidx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}