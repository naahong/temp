<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc_kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>���� ������? �������� �ۼ�</title>
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
        
        /*============���� �κ�===============*/
        section{
            position: relative;
            width: 1366px;
            padding-top: 50px;
            padding-bottom: 200px;
            margin: 0 auto;
            left: 0;
            right: 0;
            border-left: 1px solid black;
            border-right: 1px solid black;
        }

        .inputcon{
            position: relative;
            height: 100px;
            font-size: 30px;
            top: 160px;
            margin: 0 auto;
            left: 0;
            right: 0;
        }
        .inputcon td{
            padding: 20px;
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
        button, input[type=submit]{
            position: relative;
            width: 100px;
            height: 50px;
            margin: 0px 50px;
            border: 2px solid #233d4d;
            border-radius: 15px;
            background-color: white;
            left: 140px;
        }
        /*===================================*/
        
        @media (max-width: 768px){  
            .pInfo{
                position: relative;
                bottom: 30px;
            }
            table{
                position: relative;
                width: 100%;
                height: 100px;
                font-size: 30px;
                top: 140px;
                left: 01
            }
            input[type=text]{
                width: 60%;
                height: 50px;
                text-indent: 20px;
            }
            textarea{
                width: 60%;
                height: 200px;
                text-indent: 20px;
                line-height: 50px;
            }
            .btnGroup{
                position: relative;
                width: 100%;
                height: 100px;
                top: 200px;
            }
        }
        
        /*===================================*/
    </style>
</head>
<body>
	<%if(session.getAttribute("loginid") ==null){ %>
		<script>
			alert("�̿��ϱ� ���ؼ� �α����� �ʿ��մϴ�.");
			location.href="mainPage.do";
		</script>
	<%} %>
<header><jsp:include page="header.jsp"/></header>
<section>
	<form action="noticeWriteProc.do" method="post">
     <div class="sectionSet">
        <table class="inputcon">
        	<input type="hidden" value="<%=session.getAttribute("loginid") %>" name="id">
            <tr>
                <td><p class="pInfo">�������� �Խñ� �ۼ�</p></td>
            </tr>
            <tr>
                <td><p class="pTitle">����</p></td>
            </tr>
            <tr>
                <td><input type="text" name="title" placeholder="���� �� �Խù��� ������ �Է� �Ͻʽÿ�." maxlength="20" required></td>
            </tr>
            <tr>
                <td><p class="pContent">����</p></td>
            </tr>
            <tr> 
                <td><textarea id="content" name="content" placeholder="������ ���ϰ� �����ּ���." required></textarea></td>
            </tr>
            <tr>
                <td class="buttonGroup">
                    <input type="submit" value="�ۼ�">
                    <button class="backToList">���</button>
                </td>
            </tr>
        </table>
        </form>
    </div>
</section>
<footer><jsp:include page="footer.jsp"/></footer>
<script>
    
    function numberMaxLength(e){
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
    }
    $(document).ready(function(){
   		$(".asist").click(function(){
        	$(".list").toggle(500);
	    });
	    $(".backToList").click(function(){
	      	location.replace=("noticePage.do");
	    });
    });
</script>
</body>
</html>