package com.Pocari.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.My_favlistDao;
import com.Pocari.dto.FavlistAndReviewBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AddReview implements ICmd {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String path = req.getServletContext().getRealPath("/upload");
		System.out.println(path);
		
		int maxSize = 1024*1024*10;
		String enc = "EUC-KR";
		MultipartRequest mreq = new MultipartRequest(req, path, maxSize, enc, new DefaultFileRenamePolicy());
		
		int midx = 2;
		
		My_favlistDao dao = new My_favlistDao();
		FavlistAndReviewBean bean = new FavlistAndReviewBean();
		int mfl_idx = Integer.parseInt(mreq.getParameter("resIdx"));
		//System.out.println(mfl_idx);
		bean.setMfl_idx(mfl_idx);
		bean.setComment(mreq.getParameter("comment"));
		bean.setStar(Integer.parseInt(mreq.getParameter("total")));
		bean.setAtmosphere(Integer.parseInt(mreq.getParameter("atmosphere")));
		bean.setService(Integer.parseInt(mreq.getParameter("service")));
		bean.setSanitary(Integer.parseInt(mreq.getParameter("sanitary")));
		bean.setFlavor(Integer.parseInt(mreq.getParameter("flavor")));
		bean.setPortions(Integer.parseInt(mreq.getParameter("portions")));
		bean.setPrice(Integer.parseInt(mreq.getParameter("price")));
		//bean.setReviewimg(mreq.getParameter("r_img1"));
		bean.setR_tag(mreq.getParameter("r_tag"));
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
		Date time = new Date();
		String today = format.format(time);
		
		bean.setDate(today);
		int result = dao.saveOnlyReview(bean);
		
		System.out.println(mreq.getParameter("comment"));
		String cmnt = mreq.getParameter("comment");
		System.out.println(cmnt+"string?");
		/*Vector<FavlistAndReviewBean> drix_bean = dao.getDRIdxbean(cmnt);*/
		int review_idx = dao.getDRIdx(cmnt);
		System.out.println(review_idx+"****");
		
		Enumeration<String> en = mreq.getFileNames();
		while(en.hasMoreElements()){
			
			String paramName = (String)en.nextElement();
			String reviewimg = mreq.getFilesystemName(paramName);
			dao.saveRimg(review_idx, reviewimg);
			System.out.println(reviewimg);
		}
		
		
		
		if(result>0){
			return "/resdetail.do?mfl_idx="+mfl_idx;
		}else{
			return "/resdetail.do?mfl_idx="+mfl_idx;
		}
		
	}

}
