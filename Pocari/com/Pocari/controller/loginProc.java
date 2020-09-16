package com.Pocari.controller;

import java.io.PrintStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Pocari.dao.LoginDao;
import com.Pocari.dto.MemberBean;

public class loginProc implements ICmd{
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		PrintStream out = System.out;
		
		String idx = req.getParameter("id");
		LoginDao read = new LoginDao();
		MemberBean readMidx = read.membermidx(idx);
		
		HttpSession session = req.getSession();
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");	
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(readMidx.getMidx());
		
		LoginDao dao = new LoginDao();
		boolean result = dao.memberLogin(id, pw);
		
		if(result){ // result==true	
			out.println("okay");
			session.setAttribute("loginid", id);
			session.setAttribute("midx", readMidx.getMidx());
		}else{
			System.out.println("로그인 되었습니다");
		}
		return "mainPage.do";
		}
	}

