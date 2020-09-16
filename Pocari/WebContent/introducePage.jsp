<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc_kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>���� ������? Ȩ������ �Ұ�</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" type="text/css" href="headerstyle.css" />
    <link rel="stylesheet" type="text/css" href="footerstyle.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <style>
        /*============��Ÿ ����===============*/
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: �������;
        }
        /*============���� �κ�===============*/
        section{
            width: 100%;
            height: auto;
            border: 1px solid black;
        }
        #intorPic1{
            width: 100%;
            margin-top: 100px;
            height: 800px;
        }
        
        /*============������ �κ�===============*/
        @media (max-width: 768px){  
            section{
                width: 100%;
                height: 900px;
                border: 1px solid black;
            }
            #intorPic1{
                min-width: 768px;
                height: 800px;
                margin-top: 100px;
            }
        }
        /*===================================*/
    </style>
</head>
<body>
<header><jsp:include page="header.jsp"/></header>
<section>
    <img src="img/introPic1.png" id="intorPic1">
</section>
<footer><jsp:include page="footer.jsp"/></footer>
<script>
    $(document).ready(function(){
        $(".asist").click(function(){
            $(".list").toggle(500);
      	});
    }); 
</script>
</body>
</html>