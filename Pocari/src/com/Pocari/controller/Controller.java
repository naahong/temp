package com.Pocari.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Pocari")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		commandChk(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		commandChk(request, response);
	}
	
	public void commandChk(HttpServletRequest req, HttpServletResponse res){
		String cmd = req.getParameter("cmd");
		String urlcmd = req.getRequestURI();
		System.out.println("주소줄: "+urlcmd);
		cmd = urlcmd.substring(urlcmd.lastIndexOf("/")+1);
		System.out.println("cmd: "+cmd);
		
		ICmd icmd = null;
		String viewPage=null;
		
		switch(cmd){
			case "*.do": icmd = new mainPage(); break;
			case "mainPage.do": icmd = new mainPage(); break;
			case "loginPage.do": icmd = new loginPage(); break;
			case "loginProc.do": icmd = new loginProc(); break;
			case "logoutPage.do": icmd = new logoutPage(); break;
			case "registerPage.do": icmd = new registerPage(); break;
			case "registerProc.do": icmd = new registerProc(); break;//희곤 메인 로그인 회원가입
			case "introducePage.do": icmd = new introducePage(); break;
			case "noticePage.do": icmd = new noticePage(); break;
			case "noticeWrite.do": icmd = new noticeWrite(); break;
			case "noticeWriteProc.do": icmd = new noticeWriteProc(); break;
			case "noticeRead.do": icmd = new noticeRead(); break; //희곤 공지사항
			case "helpPage.do": icmd = new helpPage(); break;
			case "qnaPage.do": icmd = new qnaPage(); break;
			case "qnaWrite.do": icmd = new qnaWrite(); break;
			case "qnaWriteProc.do": icmd = new qnaWriteProc(); break;
			case "qnaRead.do": icmd = new qnaRead(); break;
			case "qnaReadRe.do": icmd = new qnaReadRe(); break; //희곤 qna
			
			case "recipeMain.do": icmd = new recipeMain(); break;
			case "recipeContent.do": icmd = new recipeContent(); break;
			case "recipeInsert.do": icmd = new recipeInsert(); break; //작성페이지로 이동
			case "recipeSearch.do": icmd = new recipeSearch(); break;
			case "insertRecipe.do": icmd = new insertRecipe(); break; //종헌 레시피
			
			case "eatout.do": icmd = new Eatout(); break;
			case "myfavres.do": icmd = new Myfavres(); break; //맛집 등록
			case "namebar.do": icmd = new SetCate(); break;
			case "resdetail.do": icmd=new Res_Detail();break; //맛집 상세정보
			case "addreview.do": icmd=new AddReview();break;
			case "removeRes.do": icmd=new RemoveRes();break;
			case "saveStore.do": icmd=new SaveStore();break;
			case "search.do": icmd=new Search();break;
			case "putfavdata.do": icmd=new PutFavData();break;
			case "inputres.do": icmd = new InputRes(); break; //나현 외식
			
			case "test.do": icmd = new Test(); break;
			case "mypage.do": icmd = new Mypage(); break;
			case "updateMeminfo.do": icmd = new UpdateMeminfo(); break;
			case "withdraw.do": icmd = new Withdraw(); break; //선정 마이페이지
		}
		
		try {
			viewPage = icmd.process(req,res);
			RequestDispatcher rd = req.getRequestDispatcher(viewPage);
			rd.forward(req, res);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
