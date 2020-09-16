<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc_kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>오늘 뭐먹지? QnA작성</title>
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
            font-family: 'Nanum Gothic', sans-serif;
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
        .pTitle, .pContent, .pIsLock{
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
        .pLocked{
        	width:100px;
        	font-size:10px;
        }
        .pic1>img{
            width: 100%;
            height: 150px;
            opacity: 0.5;
            border-bottom: 1px solid black;
        }
        /*===================================*/
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
            
    </style>
</head>
<body>
<header><jsp:include page="header.jsp"/></header>
<section>
     <div class="sectionSet">
          <div class="qaPic">
              <div class="pic1"><img src="img/qa.png"></div>
          </div>
       <form action="qnaWriteProc.do" method="post">
       <%int midxInt = (Integer)session.getAttribute("midx");%>
       <input type="hidden" value="<%=midxInt%>" name="midx">
        <table class="inputcon">
            <tr>
                <td><p class="pInfo">QnA 게시글 작성</p></td>
            </tr>
            <tr>
                <td><p class="pTitle">제목</p></td>
            </tr>
            <tr>
                <td><input type="text" name= "title" placeholder="궁금하신 내용과 관련된 제목을 입력해주세요." required></td>
            </tr>
            <tr>
                <td><p class="pContent">내용</p></td>
            </tr>
            <tr> 
                <td><textarea id="content" name= "content" placeholder="내용을 상세하게 적어주세요." required></textarea></td>
            </tr>
            <tr>
            	<td><p class="pIsLock">페이지 잠금 설정</p> <input type="checkbox" name="isLock" value="no"><p class="pLocked">잠금</p></td>
            	<td><input type="hidden" name="lockChk" value="no"></td>
            </tr>
            <tr class="buttonGroup">
                <td>
                    <button>작성하기</button>
                </td>
            </tr>
        </table>
       	</form>
    </div>
</section>
<footer><jsp:include page="footer.jsp"/></footer>

<script>
var button_joinus = document.getElementById('button');

$(document).ready(function(){
	$(".asist").click(function(){
	    $(".list").toggle(500);
		});
	$(".backToList").click(function(){
	    location.href="qnaPage.do";
	});

	$("form").submit(function(){
		if($("input:checkbox[name=isLock]").is(":checked") == true) {
			$("input:hidden[name=lockChk]").val("yes");
		}else{
			$("input:hidden[name=lockChk]").val("no");
		}
	});
});
</script>
</body>
</html>