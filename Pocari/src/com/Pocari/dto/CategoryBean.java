package com.Pocari.dto;

public class CategoryBean { //category, fav_food, fav_recipe,fav_data ���̺�
	private int cate_idx;
	private String parent_cate; //�ܽ�, ������ ����
	private String category; //�ѽ� ��� �߽� ä�� Ȩ����ŷ ���..
	private String foodname; //������, ���� ��
	private int idx;
	private int midx; //ȸ�� idx / memberlist �ܷ�Ű
	private String pref; //��ȣ����
	private String recipecate;
	private String birth;

	public CategoryBean(){};
	public String getRecipecate() {
		return recipecate;
	}
	public void setRecipecate(String recipecate) {
		this.recipecate = recipecate;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getCate_idx() {
		return cate_idx;
	}
	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}
	public String getParent_cate() {
		return parent_cate;
	}
	public void setParent_cate(String parent_cate) {
		this.parent_cate = parent_cate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
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
	public String getPref() {
		return pref;
	}
	public void setPref(String pref) {
		this.pref = pref;
	}
	
}