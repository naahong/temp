package com.Pocari.dto;

public class Save_Bean { //save_recipe, save_store 테이블
	private int idx;
	private int midx; //회원 idx / memberlist 외래키
	private int recipe_idx; //레시피 idx / recipe 외래키
	private String note; // 좋아요, 스크랩 구분
	private int mfl_idx; // 맛집idx / my_favlist 외래키
	public Save_Bean(){};
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
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getMfl_idx() {
		return mfl_idx;
	}
	public void setMfl_idx(int mfl_idx) {
		this.mfl_idx = mfl_idx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
}
