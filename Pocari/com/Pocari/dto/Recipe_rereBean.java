package com.Pocari.dto;

public class Recipe_rereBean {
	private int idx;
	private int midx; //회원idx / memberlist 외래키
	private int reidx; //레시피댓글 idx / recipe_re 외래키
	private String contents;
	private String date;
	public Recipe_rereBean(){};
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getReidx() {
		return reidx;
	}
	public void setReidx(int reidx) {
		this.reidx = reidx;
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
	
}
