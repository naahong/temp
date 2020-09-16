package com.Pocari.dto;

public class CategoryBean { //category, fav_food, fav_recipe,fav_data 테이블
	private int cate_idx;
	private String parent_cate; //외식, 레시피 구분
	private String category; //한식 양식 중식 채식 홈베이킹 등등..
	private String foodname; //마라탕, 삼겹살 등
	private int idx;
	private int midx; //회원 idx / memberlist 외래키
	private String pref; //선호여부
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