<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.Pocari.dao.noticeDao"%>
<%@page import="com.Pocari.dto.BoardBean"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc_kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘 뭐먹지? 공지사항</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" type="text/css" href="headerstyle.css" />
    <link rel="stylesheet" type="text/css" href="footerstyle.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <style>
        /*============기타 설정===============*/
        html, body {
            overflow-x: hidden;
        }
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 나눔고딕;
        }
        a:not(.paging){
            text-decoration: none;
            color: white;  
        }
        /*============섹션 부분===============*/
        section{
            position: relative;
            width: 1366px;
            height: auto;
            padding-top: 50px;
            padding-bottom: 130px;
            margin: 0 auto;
            left: 0;
            right: 0;
            border-left: 1px solid black;
            border-right: 1px solid black;
        }
        section>table{
            position: relative;
            width: 100%;
            height: 500px;
            text-align: center;
            border-collapse: collapse;
            font-family: 'Nanum Gothic', sans-serif;
            border-bottom: 1px solid gray;
            top: 100px;
            table-layout:fixed;
        }
        td{
			white-space:nowrap;
			overflow:hidden;
			text-overflow:ellipsis;
		}
        .nameForm{
            width: 100px;
            height: 50px;
            background-color: rgba(116,116,116,0.5);
        }
        .tbLine{ 
            border-bottom: 2px solid black;
        }
        .paging{
            position: relative;
            width: 100%;
            height: 60px;
            text-align: center;
            font-size: 20px;
            top: 100px;
        }
        .paging>a{
            color: black;
        }
        .add{
            width: 100px;
            height: 30px;
        }
        .infoF{
            position: relative;
            font-family: bold;
            text-align: center;
            font-size: 40px;
            font-family: 'Nanum Gothic', sans-serif;
            top: 100px;
        }
        /*===================================*/
        
        @media (max-width: 768px){  
            section{
                position: relative;
                width: 100%;
                background-color: white;
                left: 0px;
            }
            table{
                position: relative;
                width: 100%;
                height: 500px;
                background-color: white; 
                top: 100px;
            }
            td{
			    white-space:nowrap;
			    overflow:hidden;
			    text-overflow:ellipsis;
			}
            .paging{
                position: relative;
                width: 80%;
                height: 50px;
                text-align: center;
                font-size: 20px;
                left: 70px;
                top: 90px;
            }
            .infoF{
                position: relative;
                font-family: bold;
                font-size: 50px;
                left: 0px;
                top: 100px;
            }
            
        }
        /*===================================*/
    </style>
</head>
<body>
<header><jsp:include page="header.jsp"/></header>
<section>
<% 
	String pageidx = "1";
	if(request.getParameter("pageidx")!=null){
		pageidx = request.getParameter("pageidx");
	}
	noticeDao notice = new noticeDao();
	Vector<BoardBean> v = notice.getAllData(pageidx);
	int AllPage = notice.getAllPage();
%>	
  <br>
   <p class="infoF">공지 사항</p>
   <br>
    <table>
        <tr class="nameForm">
            <th class="tbLine">번호</th>
            <th class="tbLine">제목</th>
            <th class="tbLine">내용</th>
            <th class="tbLine">작성자</th>
            <th class="tbLine">작성일</th>
        </tr>
        <%for(int i=0; i < v.size(); i++){ %>
        <tr>
            <td><%=v.get(i).getIdx()%></td>
            <td><a href="noticeRead.do?idx=<%=v.get(i).getIdx() %>" style="color: black"><%=v.get(i).getTitle()%></a></td>
            <td><%=v.get(i).getContents()%></td>
            <td><%=v.get(i).getId()%></td>
            <td><%=v.get(i).getDate()%></td>
        </tr>
        <%} %>
    </table>
    <br>   
    <div class="paging">
    	<%int curr = Integer.parseInt(pageidx);%>
    	<%if (curr != 1){ %>
        <a href="noticePage.do?pageidx=1"><i class="fas fa-angle-double-left"></i></a>&nbsp;&nbsp;
        <a href="noticePage.do?pageidx=<%=curr-1%>"><i class="fas fa-angle-left"></i></a>&nbsp;&nbsp;
        <%}%>
        <% for(int i=1; i<=AllPage; i++){ %>
        <a href="noticePage.do?pageidx=<%=i%>">[<%=i %>]</a>&nbsp;&nbsp;
        <%} %>
        <%if(curr != AllPage){ %>
        <a href="noticePage.do?pageidx=<%=curr+1%>"><i class="fas fa-angle-right"></i></a>&nbsp;&nbsp;
        <a href="noticePage.do?pageidx=<%=AllPage%>"><i class="fas fa-angle-double-right"></i></a> &nbsp;&nbsp;&nbsp;&nbsp;
        <%} %>
        <button class="add" onclick=""> 글작성 </button>
    </div>
    <%--
    	<% int li_primitive = (Integer)session.getAttribute("midx"); %>
       	 세션에 저장된 이름3=<%=li_primitive%>;
    --%>
    <%-- 	세션에 저장된 이름=<%=session.getAttribute("loginid")%>;
    	세션에 저장된 이름2=<%=session.getAttribute("midx")%>; --%>
    	
</section>
<footer><jsp:include page="footer.jsp"/></footer>

<script>
    $(document).ready(function() {
    	$('.add').click(function(){
    		var session = <%=session.getAttribute("loginid") == null %>;
    		
    		if(session){
    			alert("로그인 먼저 하십시오");
    		}else{
    			location.href="noticeWrite.do";
    		};
    	});
    	$(".asist").click(function(){
            $(".list").toggle(500);
      	});
    });
</script>
</body>
</html>