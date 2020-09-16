<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc_kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘 뭐 먹지?</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" type="text/css" href="footerstyle.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <style>
        /*============기타 설정===============*/
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 나눔고딕;
        }
        a{
            text-decoration: none;
            color: white;  
        }
        /*============헤더 부분===============*/
        li{
            list-style: none;
        }
        #logo,ul,li,label,input[type=submit],button{
            cursor: pointer;
        }
        #f2 b,#f2 p{
            cursor: default;
        }
        input[type=text],input[type=email],input[type=password]{
            width: 275px; height: 30px;
        }
        input:focus{
            outline: none;
        }
        header{
            position: fixed; 
            display: flex; 
            flex-flow: row wrap; 
            justify-content: space-between; 
            width: 100%; 
            height: 100px; 
            z-index: 5;
        }
        header>ul{
            display: flex; 
            height: 35px; 
            text-align: center; 
            font-weight: 400; 
            color: white;
        }
        header>ul>a, header>ul>li{
            padding: 10px;
        }
        #help>ul{
            display: none; 
            padding-top: 5px;
        }
        #help>ul li{
            font-size: 14px; 
            line-height: 20px;
        }
        #help:hover ul{
            display: block;
        }
        #logo{
            position: absolute; 
            left: calc(50% - 272px);
        }
        #logo>a>img{
            width: 100%;
            height: 100px;
        }
        #menubar{
            display: none; 
            position: relative; 
            width: 100%; 
            height: 100px; 
            font-size: 40px; 
            color: white;
        }
        #menubar>li{
            height: 100px;
        }
        .fa-bars{
            position: absolute; 
            left: 20px;
        }
        i.fa-times{
            position: absolute; 
            left: 20px;
            display: none;
        }
        #subbar{
            position: relative; 
            top: 80px; 
            left: -300px; 
            padding-left: 30px; 
            width: 300px; 
            height: calc(100vh - 100px); 
            text-align: left; 
            font-size: 25px; 
            line-height: 70px; 
        }
        #subbar i{
            width: 45px; 
            color: #fe7f2e;
        }
        /*===================================*/
        /*============섹션 부분===============*/
        section{
            width: 100%;
            height: 800px;
        }
        section>.imgGroup>.outMeal{
            width: 50%;
            height: 800px;
            float: left;
        }
        section>.imgGroup>.recipe{
            width: 50%;
            height: 800px;
            float: right;
        }
        section>.imgGroup>.outMeal>a>img{
            width: 100%;
            height: 800px;
        }
        section>.imgGroup>.recipe>a>img{
            width: 100%;
            height: 800px;
        }
        /*============반응형 부분===============*/
        
        
        @media (max-width: 768px){  
            section{
                width: 100%;
                height: 1000px;
            }
            section>.imgGroup>.outMeal{
                width: 100%;
                height: 500px;
            }
            section>.imgGroup>.recipe{
                width: 100%;
                height: 500px;
            }
            section>.imgGroup>.outMeal>a>img{
                width: 100%;
                height: 500px;
            }
            section>.imgGroup>.recipe>a>img{
                width: 100%;
                height: 500px;;
            }
            header>ul{
                display: none; 
                padding-top: 20px;
            }
            header>ul>li{
                padding: 0;
            }
            header #menubar{
                display: block;
            }
            #logo{
            	padding-top:10px;
	            position: absolute; 
	            left: calc(50% - 140px);
        	}
        	#logo>img{
            	width: 330px; height: auto;
            }
			/*--------이까지 헤더--------------------*/
        }
        /*===================================*/
        
    </style>
</head>
<body>
<header>
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
        <%if(session.getAttribute("loginid")==null){ %>
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
                <%if(session.getAttribute("loginid")==null){ %>
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
        <div id="logo" onclick="location.href='mainPage.do'"><img src="img/logo-main.png"></div>
</header>
  <section>
     <div class="imgGroup">
        <div class="outMeal"><a href="eatout.do"><img src="img/mainPic2222222.png"></img></a></div>
        <div class="recipe"><a href="recipeMain.do"><img src="img/mainPic1111111.png"></img></a></div>  
     </div>
  </section>
  <footer><jsp:include page="footer.jsp"/></footer>
<script>
    $(".asist").click(function(){
          $(".list").toggle(500);
    });
    $(".asistSide").click(function(){
          $(".listSide").toggle(500);
    });
    $(document).ready(function(){
        $(".fa-bars").click(function(){
            $("#subbar").animate({
                left:"0px"
            },500);
            $(".fa-bars").css('display','none');
            $(".fa-times").css('display','block');
        });
        $(".fa-times").click(function(){
            $("#subbar").animate({
                left:"-300px"
            },500);
            $(".fa-bars").css('display','block');
            $(".fa-times").css('display','none');
        });
    });
</script>
</body>
</html>