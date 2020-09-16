<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc_kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오늘 뭐먹지? 로그인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="headerstyle.css" />
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
        html, body {
            overflow-x: hidden;
        }
            
        /*============섹션 부분===============*/
        section{
            position: relative;
            width: 75%;
            height: 770px;
            left: 200px;
            display: flex;
            justify-content: center;
            border-left: 2px solid #a1c181;
            border-right: 2px solid #a1c181;
        }
        .tableBackground{
            position: relative;
            width: 550px;
            height: 400px;
            border-radius: 15px;
            top: 160px;
        }
        table{
            position: relative;
            width: 100%;
            background-color: white;
        }
        .loginF{
            position: relative;
            font-size: 40px;
            top: 0px;
            text-align: center;
        }
        input[type=submit], input[type=button]{
            width:100%;
            height: 60px;
            margin-top: 30px;
        }
        input[type=text], input[type=password]{
            width: 100%;
            height: 60px;
            margin-top: 30px;
            padding-left: 10px;
        }
        /*============반응형 부분===============*/
    
        @media (max-width: 768px){
            section{
                position: relative;
                width: 100%;
                height: 700px;
                background-color: white;
                right: 100px;
                border-left: 0px solid black;
                border-right: 0px solid black;
            }
            .tableBackground{
                position: relative;
                width: 500px;
                height: 500px;
                background-color: white;
                border-radius: 10px;
                top: 160px;
                right: 180px;
            }
            table{
                position: relative;
                width: 300px;
                height: 400px;
                left: 90px;
                background-color: white;
            }
            .loginF{
                position: relative;
                font-size: 50px;
            }
            input[type=submit], input[type=button]{
                width:300px;;
                height: 40px;
            }
            input[type=text], input[type=password]{
                width: 300px;
                height: 60px;
            }
		}
</style>
</head>
<body>
<header><jsp:include page="header.jsp"/></header>
    <section>
       <div class="tableBackground">
       <p class="loginF">로그인</p><br>
       <form action="loginProc.do" method="post">   
	        <table>            
	                <tr> 
	                    <td><input type="text" class="chk" name="id" id="pw1" placeholder="아이디를 입력하세요"> </td>
	                </tr>
	                <tr>
	                    <td><input type="password" class="chk" name="pw" id="pw2" placeholder="비밀번호를 입력하세요"></td>
	                </tr>
	            
	                <tr>
	                    <td colspan="2"><input type="submit" value="로그인"></td>
	                </tr>
	            
	                <tr>
	                    <td colspan="2"><input type="button" id="regist" value="회원가입"></td>
	                </tr>
	        </table>
        </form>
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
      $("#regist").click(function(){
          location.href="registerPage.do";
    	});
    });  
</script> 

</body>
</html>