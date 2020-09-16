<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.Pocari.dao.qnaRpyDao"%>
<%@page import="com.Pocari.dto.Re_Bean"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc_kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>오늘 뭐먹지? QnA</title>
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
        
        /*============섹션 부분===============*/
        section{
            position: relative;
            width: 1366px;
            margin: 0 auto;
            left: 0;
            right: 0;
            padding-top: 50px;
            padding-bottom: 180px;
            border-left: 1px solid black;
            border-right: 1px solid black;
        }
        .sectionSet{
            width: 1366px;
            height: 100%;
            left: 280px;
        }
        
        .qaPic{
            position: relative;
            font-size: 60px;
            text-align: center;
            top: 50px;
        }
        .inputcon{
            position: relative;
            height: 100px;
            font-size: 30px;
            top: 100px;
            margin: 0 auto;
            left: 0;
            right: 0;
        }
        .inputcon td{
            padding: 20px;
        }
        .pInfo{
            font-size: 40px;
        }
        .pTitle, .pContent{
            font-size: 20px;
        }
        input[type=text]{
            width: 700px;
            height: 50px;
            text-indent: 20px;
            border: 1px solid #233d4d;
            border-radius: 5px;
        }
        textarea{
            width: 700px;
            height: 200px;
            text-indent: 20px;
            line-height: 50px;
            border: 1px solid #233d4d;
            border-radius: 5px;
        }
        button{
            position: relative;
            width: 100px;
            height: 50px;
            margin: 0px 50px;
            border: 2px solid #233d4d;
            border-radius: 15px;
            background-color: white;
            left: 140px;
        }
        .pageRpy{
        	position: relative;
        	width:700px;
        	height:300px;
        	top:100px;
        	left:300px;
        	border:1px solid black;
        }
        .pic1>img{
            width: 100%;
            height: 150px;
            opacity: 0.5;
            border-bottom: 1px solid black;
        }
        /*============반응형 부분===============*/
        
        @media (max-width: 768px){  
            .qaPic{
                position: relative;
                width: 100%;
                font-size: 60px;
                text-align: center;
            }
            .inputcon{
                width: 100%;
            }
            .pInfo{
                font-size: 40px;
                text-align: none;
            }
            input[type=text]{
                width: 50%;
                height: 50px;
                text-indent: 20px;
            }
            textarea{
                width: 50%;
                height: 200px;
                text-indent: 20px;
                line-height: 50px;
            }
            .pic1{
                width: 70%;
            }
            .pic1>img{
                width: 100%;
                height: 150px;
                opacity: 0.5;
                border-bottom: 1px solid black;
            }
            
        }
        /*===================================*/
    </style>
</head>
<body>

<%
	String chkLock = (String)session.getAttribute("chkLock");
	String idChk = (String)session.getAttribute("loginid");
	String qidxChk = (String)session.getAttribute("qidx");
	
	
	if(idChk.equals("admin")){
		System.out.println("관리자 입장");
	}else if(chkLock.equals("yes")){
%>
	<script>
	var view=prompt("관리자 비밀번호를 입력하세요");
		switch(view){
			case "12358":
			text="확인 되었습니다.";
			break;
			
			default:
			text=".....?";
			location.href="qnaPage.do";
			break;
		}
	</script>
	<%}else{%>
	
<%} %>
<header><jsp:include page="header.jsp"/></header>
<section>
     <div class="sectionSet">
          <div class="qaPic">
              <div class="pic1"><img src="img/qa.png"></div>
          </div>
        <table class="inputcon">
            <tr>
                <td><p class="pInfo">QnA 게시글</p></td>
            </tr>
            <tr>
                <td><p class="pTitle">제목</p></td>
            </tr>
            <tr>
                <td><input type="text" value="${sessionScope.readTitle}" disabled></td>
            </tr>
            <tr>
                <td><p class="pContent">내용</p></td>
            </tr>
            <tr> 
                <td><textarea id="content" disabled> ${sessionScope.readContents} </textarea></td>
            </tr>
            <tr class="buttonGroup">
                <td>
                    <button class="backToList">목록으로</button>
                </td>
            </tr>
        </table>
    </div>
    답글<br>
	<%
		qnaRpyDao dao = new qnaRpyDao();
		Vector<Re_Bean> v=dao.selectReData(qidxChk);
		for(int i=0; i<v.size(); i++){
	%>
		<%= v.get(i).getContents()%>
		<br>
		===================================<br>
	<%} %>
    <div class="pageRpy">
    	<form action="qnaReadRe.do" method="post">
	    	<input type="text" name="read_id" value="<%=idChk%>">
			<textarea name="content"></textarea>
			<input type="hidden" name="read_qidx" value="<%=qidxChk%>">
			<input type="submit" value="입력">
		</form>
    </div>
</section>
<footer><jsp:include page="footer.jsp"/></footer>

<script>
    
    $(document).ready(function(){
    	$(".asist").click(function(){
            $(".list").toggle(500);
      });
      $(".backToList").click(function(){
          location.href="qnaPage.do";
      });
    });

</script>
</body>
</html>