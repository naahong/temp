package com.Pocari.dto;

public class FavlistAndReviewBean {
	private int review_idx; //����idx
	private int mfl_idx; // ����idx / my_favlist �ܷ�Ű
	private int star; //���� �� ��ü����
	private String comment;
	private int atmosphere; //������
	private int service; //����
	private int sanitary; //����
	private int flavor; //��
	private int price; //����
	private int portions; //��
	private String r_tag; //�����±�
	private String date;
	private int midx; //ȸ��idx / memberlist�ܷ�Ű
	private String storename;
	private String sido1;
	private String gugun1;
	private String category; //ī�װ� idx / category�ܷ�Ű
	private String tel; //���Կ���ó
	private String imgpath; //���� ���� 1����
	private String s_tag; // �����±�
	private String avgstar; //��ü���� ���
	private String[] reviewimg; //���� �̹�����
	public FavlistAndReviewBean(){}
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public int getMfl_idx() {
		return mfl_idx;
	}
	public void setMfl_idx(int mfl_idx) {
		this.mfl_idx = mfl_idx;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getAtmosphere() {
		return atmosphere;
	}
	public void setAtmosphere(int atmosphere) {
		this.atmosphere = atmosphere;
	}
	public int getService() {
		return service;
	}
	public void setService(int service) {
		this.service = service;
	}
	public int getSanitary() {
		return sanitary;
	}
	public void setSanitary(int sanitary) {
		this.sanitary = sanitary;
	}
	public int getFlavor() {
		return flavor;
	}
	public void setFlavor(int flavor) {
		this.flavor = flavor;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPortions() {
		return portions;
	}
	public void setPortions(int portions) {
		this.portions = portions;
	}
	public String getR_tag() {
		return r_tag;
	}
	public void setR_tag(String r_tag) {
		this.r_tag = r_tag;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getSido1() {
		return sido1;
	}
	public void setSido1(String sido1) {
		this.sido1 = sido1;
	}
	public String getGugun1() {
		return gugun1;
	}
	public void setGugun1(String gugun1) {
		this.gugun1 = gugun1;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getS_tag() {
		return s_tag;
	}
	public void setS_tag(String s_tag) {
		this.s_tag = s_tag;
	}
	public String getAvgstar() {
		return avgstar;
	}
	public void setAvgstar(String avgstar) {
		this.avgstar = avgstar;
	}
	public String[] getReviewimg() {
		return reviewimg;
	}
	public void setReviewimg(String[] reviewimg) {
		this.reviewimg = reviewimg;
	};
	
}
