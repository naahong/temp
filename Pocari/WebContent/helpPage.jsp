<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="euc_kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>���� ������? ����</title>
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
        /*===================================*/
        /*============���� �κ�===============*/
        section{
            position: relative;
            width: 1366px;
            height: 900px; 
            margin: 0 auto;
            left: 0;
            right: 0;
        }
        .sectSet{
            width: 100%;
            height: 800px;
            position: relative;
            top: 100px;
        }
        .helpBar1{
            width: 100%;
            height: 70px;
            text-align: center;
            font-size: 45px;
            border: 1px solid black;
            background-color: aquamarine;
        }
        .infoBar1, .infoBar2, .infoBar3, .infoBar4, .infoBar5, .infoBar6, .infoBar7, .infoBar8, .infoBar9{
            width: 300px;
            height: 81px;
            border: 1px solid black;
            background-color: gray;
            z-index: 1;
        }
        .infoBar1>p, .infoBar2>p, .infoBar3>p, .infoBar4>p, .infoBar5>p, .infoBar6>p, .infoBar7>p, .infoBar8>p, .infoBar9>p{
            font-size: 20px;
            text-align: center;
            font-family: 'Nanum Gothic', sans-serif;
            margin-top: 20px;
        }
        .answerBarGroup{
            position: absolute;
            width: 1065px;
            height: 730px;
            bottom: 0px;
            left: 300px;
            border: 1px solid black;
            background-color: white;
            border-bottom: 1px solid black;
            z-index: 2;
        }
        .answerBar1, .answerBar2, .answerBar3, .answerBar4, .answerBar5, .answerBar6, .answerBar7, .answerBar8, .answerBar9{
            width: 100%;
            position: relative;
            font-size: 20px;
            font-family: 'Nanum Gothic', sans-serif;
            top: 20px;
            display: none;
            text-align: center;
        }
        
        #pic1, #pic2, #pic3, #pic4, #pic5, #pic6, #pic7, #pic8, #pic9{
            width: 500px;
            height: 500px;
        } 
        /*===================================*/
        @media (max-width: 768px){  
            section{
                position: relative;
                width: 100%;
            }
            .helpBar1{
                font-size: 40px
            }
            section>.helpBarGroup{
                width: 100%;
                height: 100%;
                right: 400px;
            }
            .answerBarGroup{
                width: 100%;
                top: 70px;
                font-size: 10px;
            }

            .answerBar1, .answerBar2, .answerBar3, .answerBar4, .answerBar5, .answerBar6, .answerBar7, .answerBar8, .answerBar9{
                width: 60%;
                position: relative;
                font-size: 20px;
                font-family: 'Nanum Gothic', sans-serif;
                top: auto;
                display: none;
            }
        }
    </style>
</head>
<body>
<header><jsp:include page="header.jsp"/></header>
<section>
  <div class="sectSet">
       <div class="helpBarGroup">
            <div class="helpBar1">� ������ �ʿ��ϼ���?</div>
            <div class="infoBar1"><p>���� ���ϴ� ���ΰ���?</p></div>
            <div class="infoBar2"><p>�� �����Դϱ�.</p></div>
            <div class="infoBar3"><p>�������� �����ϱ�</p></div>
            <div class="infoBar4"><p>���ӹٴ� ���ϱ�</p></div>
            <div class="infoBar5"><p>���� �귿�� ���ϱ�</p></div>
            <div class="infoBar6"><p>�̰� ������ �� �ΰ� �����ϱ�</p></div>
            <div class="infoBar7"><p>��������������</p></div>
            <div class="infoBar8"><p>������ �������ϴ�</p></div>
            <div class="infoBar9"><p>�������ƾƾƾƾƾƾ�</p></div>
        </div>
        <div class="answerBarGroup">
           <div class="answerBar1">
               ������ ���� �޴��� ������ �� ����� �Ծ�� ���� ��εǴ� ����ڵ��� ���� ����Ʈ�Դϴ�<br>
               <img src="img/memePic1.jpg" id="pic1">
           </div>
            <div class="answerBar2">
                ���� ����Ʈ�� �����̽ʴϴ�.<br>
                <img src="img/memePic2.jpg" id="pic2">
            </div>
            <div class="answerBar3">
                �����ڵ��Դϴ�.<br>
                <img src="img/memePic3.jpg" id="pic3">
            </div>
            <div class="answerBar4">
                �ڱⰡ �����ϴ� ī�װ��� üũ���ָ� �� ī�װ��� ���õ� ���ĵ��� ��õ ���ݴϴ�.<br>
                <img src="img/memePic4.png" id="pic4">
            </div>
            <div class="answerBar5">
                ���� ������ϰ� �ǰ��� ���� �� ����ϴ� �귿�Դϴ�.<br>
                <img src="img/memePic5.jpg" id="pic5">
            </div>
            <div class="answerBar6">
                �˼��մϴ�<br>
                <img src="img/memePic6.jpg" id="pic6">
            </div>
            <div class="answerBar7">
                �ο��ƾƾƾƾƾƾ�<br>
                <img src="img/memePic7.jpg" id="pic7">
            </div>
            <div class="answerBar8">
                ���� ����ϴ�<br>
                <img src="img/memePic8.jpg" id="pic8">
            </div>
            <div class="answerBar9">
                �ָ��� �׳� �귯���ϴپƾƾƾ�<br>
                <img src="img/memePic9.jpg" id="pic9">
            </div>
        </div>
    </div>
    
</section>
<footer><jsp:include page="footer.jsp"/></footer>

<script>
    $(document).ready(function(){
    	$(".asist").click(function(){
            $(".list").toggle(500);
        });
        $(".asistSide").click(function(){
              $(".listSide").toggle(500);
        }); 
        $(".infoBar1").click(function(){
            $(".answerBarGroup>div").hide();
            $(".answerBar1").fadeIn(500); 
        });
        $(".infoBar2").click(function(){
            $(".answerBarGroup>div").hide();
            $(".answerBar2").fadeIn(500); 
        });
        $(".infoBar3").click(function(){
            $(".answerBarGroup>div").hide();
            $(".answerBar3").fadeIn(500); 
        });
        $(".infoBar4").click(function(){
            $(".answerBarGroup>div").hide();
            $(".answerBar4").fadeIn(500); 
        });
        $(".infoBar5").click(function(){
            $(".answerBarGroup>div").hide();
            $(".answerBar5").fadeIn(500); 
        });
        $(".infoBar6").click(function(){
            $(".answerBarGroup>div").hide();
            $(".answerBar6").fadeIn(500); 
        });
        $(".infoBar7").click(function(){
            $(".answerBarGroup>div").hide();
            $(".answerBar7").fadeIn(500); 
        });
        $(".infoBar8").click(function(){
            $(".answerBarGroup>div").hide();
            $(".answerBar8").fadeIn(500); 
        });
        $(".infoBar9").click(function(){
            $(".answerBarGroup>div").hide();
            $(".answerBar9").fadeIn(500); 
        });
    });
</script>
</body>
</html>