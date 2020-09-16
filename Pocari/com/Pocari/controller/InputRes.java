package com.Pocari.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Pocari.dao.My_favlistDao;
import com.Pocari.dto.FavlistAndReviewBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InputRes implements ICmd {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String path = req.getServletContext().getRealPath("/upload");
		System.out.println(path);
		
		int maxSize = 1024*1024*10;
		String enc = "EUC-KR";
		MultipartRequest mreq = new MultipartRequest(req, path, maxSize, enc, new DefaultFileRenamePolicy());
		
		//System.out.println(mreq.getOriginalFileName("m_imgpath") + "***");
		
		My_favlistDao dao = new My_favlistDao();
		
		int midx = 1;
		
		FavlistAndReviewBean bean = new FavlistAndReviewBean();
		bean.setMidx(midx);
		bean.setStorename(mreq.getParameter("storename"));
		bean.setSido1(mreq.getParameter("sido1"));
		bean.setGugun1(mreq.getParameter("gugun2"));
		bean.setCategory(mreq.getParameter("category"));
		bean.setTel(mreq.getParameter("tel"));
		bean.setImgpath(mreq.getFilesystemName("m_imgpath"));
		bean.setS_tag(mreq.getParameter("s_tag"));
		int result1 = dao.saveFavRes(bean);
		
//		¸ÀÁýÁ¤º¸µî·Ï!======================================================	
		
		if(result1>0){
			int mfl_idx = dao.getMflIdx(midx, mreq.getParameter("storename"), mreq.getParameter("sido1"), mreq.getParameter("gugun2"));
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
			
			Enumeration<String> en = mreq.getFileNames();
			int review_idx = dao.getRIdx(midx, mfl_idx, today);
			
			/*String paramName = (String)en.nextElement();
			String reviewimg = mreq.getFilesystemName(paramName);*/
			
			while(en.hasMoreElements()){
				
				String paramName = (String)en.nextElement();
				String reviewimg = mreq.getFilesystemName(paramName);
				dao.saveRimg(review_idx, reviewimg);
				
		      /*  List<String> ll = Collections.list(en);
		        System.out.println("List elements: " + ll);
		        System.out.println(ll.get(0));*/
		        
		        //String[] reviewImgs = new String[ll.size()];
		        
		        /*for(String temp : reviewimg){
		        	dao.saveRimg(review_idx,temp);
		        }*/
			}
			
			int result2 = dao.saveResReview(bean);
			
			if(result2>0){
				return "eatout.do";
			}else{
				return "";
			}
		}else{
			return "";
		}
		
		
//		¸®ºäµî·Ï!======================================================	
		
		
		
		
		
		
		
	/*	Vector<FavlistAndReviewBean> v = new Vector<FavlistAndReviewBean>();
		req.setAttribute("favres", v);
		
		if(result1>0 && result2>0){
			return "eatout.do";
		}else{
			return "res_detail.do";
		}*/

	}

}
