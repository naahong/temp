<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
String loginid = session.getAttribute("loginid")== null ? null:(String)session.getAttribute("loginid");
%>

        <ul>
            <li onclick="location.href='introducePage.do'">홈페이지 소개</li>
            <li onclick="location.href='noticePage.do'">공지사항</li>
            <li id="help">고객지원
                <ul>
                    <li onclick="location.href='helpPage.do'">도움말</li>
                    <li onclick="location.href='qnaPage.do'">QnA</li>
                </ul>
            </li>
        </ul>
        <%if(loginid==null || loginid.equals("null")){ %>
        <ul>
            <li onclick="location.href='loginPage.do'">로그인</li>
            <li onclick="location.href='registerPage.do'">회원가입</li>
        </ul>
        <%}else{ %>
        <ul>
        	<li onclick="location.href='logoutPage.do'">로그아웃</li>
            <li onclick="location.href='mypage.do?sectionis=updateinfo'">마이페이지</li>
        </ul>
        <%} %>
        <ul id="menubar">
            <li>
                <i class="fas fa-bars"></i><i class="fas fa-times"></i>
                <ul id="subbar">
                <%if(loginid==null || loginid.equals("null")){ %>
                    <li onclick="location.href='loginPage.do'"><i class="fas fa-user-alt"></i>로그인</li>
                    <li onclick="location.href='registerPage.do'"><i class="fas fa-user-plus"></i>회원가입</li>
                <%}else{ %>
                	<li onclick="location.href='logoutPage.do'"><i class="fas fa-user-check"></i>로그아웃</li>
                    <li onclick="location.href='mypage.do?sectionis=updateinfo'"><i class="fas fa-user-edit"></i>마이페이지</li>
                <%} %>
                    <li onclick="location.href='noticePage.do'"><i class="fas fa-exclamation-triangle"></i>공지사항</li>
                    <li onclick="location.href='helpPage.do'"><i class="fas fa-info-circle"></i>도움말</li>
                    <li onclick="location.href='qnaPage.do'"><i class="fas fa-question-circle"></i>QnA</li>
                </ul>
            </li>
        </ul>
        <div id="logo" onclick="location.href='mainPage.do'"><img src="img/logo-white.png"></div>
    
    
    <script>
    $(document).ready(function(){
    	$(".fa-bars").click(function(){
            $("#subbar").animate({
                left:"0px"
            },500);
            $(".fa-bars").css("display","none");
            $(".fa-times").css("display","block");
        });
        $(".fa-times").click(function(){
            $("#subbar").animate({
                left:"-300px"
            },500);
            $(".fa-bars").css("display","block");
            $(".fa-times").css("display","none");
        });
    });
    </script>