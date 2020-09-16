<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.Pocari.dto.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="com.Pocari.dao.QnaDao"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc_kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>���� ������? QnA</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" type="text/css" href="headerstyle.css" />
	<link rel="stylesheet" type="text/css" href="footerstyle.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <style>
        /*============��Ÿ ����===============*/
        html, body {
            overflow-x: hidden;
        }
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: �������;
        }
        a:not(.paging){
            text-decoration: none;
            color: white;  
        }
        /*============���� �κ�===============*/
        section{
            position: relative;
            width: 1366px;
            margin: 0 auto;
            left: 0;
            right: 0;
            padding-top: 50px;
            padding-bottom: 130px;
            border-left: 1px solid black;
            border-right: 1px solid black;
        }
        .infoF{
            position: relative;
            width: 100%;
            height: 60px;
            font-weight: bold;
            text-align: center;
            font-size: 40px;
            top: 80px;
        }
        section>table{
            position: relative;
            width: 100%;
            height: 650px;
            text-align: center;
            border-collapse: collapse;
            font-family: 'Nanum Gothic', sans-serif;
            border-bottom: 1px solid black;
            top: 60px;
        }
        .nameForm{
            background-color: rgba(116,116,116,0.5);
        }
        .tbLine{ 
            border-bottom: 2px solid black;
        }
        .paging{
            position: relative;
            width: 100%;
            font-size: 20px;
            text-align: center;
            top: 60px;
        }
        .paging>a{
            color: black;
        }
        .add{
            width: 80px;
            height: 40px;
            bottom: 49px;
            left: 84px;
        }
        /*===================================*/
        @media (max-width: 768px){  
            section{
                position: relative;
                width: 100%;
            }
            .paging{
                position: relative;
                width: 80%;
                height: 50px;
                font-size: 20px;
                left: 100px;
            }
        }
    </style>
</head>
<body>
<header><jsp:include page="header.jsp"/></header>
<section>
<% 
	String pageidx = "1";
	String loginid = (String)session.getAttribute("loginid");
	
	if(request.getParameter("pageidx")!=null){
		pageidx = request.getParameter("pageidx");
	}
	QnaDao qnaRead = new QnaDao();
	Vector<BoardBean> v = qnaRead.getAllData(pageidx);
	int AllPage = qnaRead.getAllPage();
%>	
  <br>
  <%if(session.getAttribute("loginid") == null){ %>
   <p class="infoF">�Խù��� �ۼ� �ϽǷ��� �α����� ���� ���ּ���. </p>
   <%}else{ %>
   <p class="infoF">�ȳ��ϼ��� <%=session.getAttribute("loginid")%> �� </p>
   <p class="infoF">� ������ �ް� ��ʴϱ�?</p>
   <%} %>
   <br>
    <table>
        <tr class="nameForm">
            <th class="tbLine">��ȣ</th>
            <th class="tbLine">����</th>
            <th class="tbLine">����</th>
            <th class="tbLine">��ݼ���</th>
            <th class="tbLine">�ۼ���</th>
        </tr>
        <%for(int i=0; i < v.size(); i++){ %>
        <tr>
            <td><%=v.get(i).getQidx()%></td>
            <td><a href="qnaRead.do?qidx=<%=v.get(i).getQidx() %>" style="color: black"><%=v.get(i).getTitle()%></a></td>
            <td><%=v.get(i).getContents()%></td>
            <%if(loginid.equals("admin")){ %>
            <td>no</td>
            <td><%=v.get(i).getDate()%></td>
            <%}else{ %>
            <td><%=v.get(i).getIslock()%></td>
            <td><%=v.get(i).getDate()%></td>
            <%} %>
        </tr>
        <%} %>
    </table>
    <br>   
<div class="paging">
    	<%int curr = Integer.parseInt(pageidx);%>
    	<%if (curr != 1){ %>
        <a href="qnaPage.do?pageidx=1"><i class="fas fa-angle-double-left"></i></a>&nbsp;&nbsp;
        <a href="qnaPage.do?pageidx=<%=curr-1%>"><i class="fas fa-angle-left"></i></a>&nbsp;&nbsp;
        <%}%>
        <% for(int i=1; i<=AllPage; i++){ %>
        <a href="qnaPage.do?pageidx=<%=i%>">[<%=i %>]</a>&nbsp;&nbsp;
        <%} %>
        <%if(curr != AllPage){ %>
        <a href="qnaPage.do?pageidx=<%=curr+1%>"><i class="fas fa-angle-right"></i></a>&nbsp;&nbsp;
        <a href="qnaPage.do?pageidx=<%=AllPage%>"><i class="fas fa-angle-double-right"></i></a> &nbsp;&nbsp;&nbsp;&nbsp;
        <%} %>
        <button class="add" onclick=""> ���ۼ� </button>
    </div>
</section>
<footer><jsp:include page="footer.jsp"/></footer>
<script>

$(document).ready(function() {
	$('.add').click(function(){
		var session = <%=session.getAttribute("loginid") == null %>;
		
		if(session){
			alert("�α��� ���� �Ͻʽÿ�");
		}else{
			location.href="qnaWrite.do";
		};
	});
	$(".asist").click(function(){
	    $(".list").toggle(500);
	});
});
</script>
</body>
</html>