package com.Pocari.dto;

public class Save_Bean { //save_recipe, save_store ���̺�
	private int idx;
	private int midx; //ȸ�� idx / memberlist �ܷ�Ű
	private int recipe_idx; //������ idx / recipe �ܷ�Ű
	private String note; // ���ƿ�, ��ũ�� ����
	private int mfl_idx; // ����idx / my_favlist �ܷ�Ű
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
