package com.Pocari.dto;

public class Re_Bean { //recipe_re, qna_re ���̺�
	private int reidx; //recipe_re idx
	private int midx; //ȸ��idx / memberlist �ܷ�Ű
	private int recipe_idx; //������idx / recipe �ܷ�Ű
	private String contents;
	private String date;

	private int idx; //qna��۹�ȣ
	private int qidx; //qna�۹�ȣ /qna�ܷ�Ű
	private String id; //qna (������)
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