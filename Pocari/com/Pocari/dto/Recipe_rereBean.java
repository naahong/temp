package com.Pocari.dto;

public class Recipe_rereBean {
	private int idx;
	private int midx; //ȸ��idx / memberlist �ܷ�Ű
	private int reidx; //�����Ǵ�� idx / recipe_re �ܷ�Ű
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
