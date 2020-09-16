<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
String loginid = session.getAttribute("loginid")== null ? null:(String)session.getAttribute("loginid");
%>

        <ul>
            <li onclick="location.href='introducePage.do'">Ȩ������ �Ұ�</li>
            <li onclick="location.href='noticePage.do'">��������</li>
            <li id="help">������
                <ul>
                    <li onclick="location.href='helpPage.do'">����</li>
                    <li onclick="location.href='qnaPage.do'">QnA</li>
                </ul>
            </li>
        </ul>
        <%if(loginid==null || loginid.equals("null")){ %>
        <ul>
            <li onclick="location.href='loginPage.do'">�α���</li>
            <li onclick="location.href='registerPage.do'">ȸ������</li>
        </ul>
        <%}else{ %>
        <ul>
        	<li onclick="location.href='logoutPage.do'">�α׾ƿ�</li>
            <li onclick="location.href='mypage.do?sectionis=updateinfo'">����������</li>
        </ul>
        <%} %>
        <ul id="menubar">
            <li>
                <i class="fas fa-bars"></i><i class="fas fa-times"></i>
                <ul id="subbar">
                <%if(loginid==null || loginid.equals("null")){ %>
                    <li onclick="location.href='loginPage.do'"><i class="fas fa-user-alt"></i>�α���</li>
                    <li onclick="location.href='registerPage.do'"><i class="fas fa-user-plus"></i>ȸ������</li>
                <%}else{ %>
                	<li onclick="location.href='logoutPage.do'"><i class="fas fa-user-check"></i>�α׾ƿ�</li>
                    <li onclick="location.href='mypage.do?sectionis=updateinfo'"><i class="fas fa-user-edit"></i>����������</li>
                <%} %>
                    <li onclick="location.href='noticePage.do'"><i class="fas fa-exclamation-triangle"></i>��������</li>
                    <li onclick="location.href='helpPage.do'"><i class="fas fa-info-circle"></i>����</li>
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