<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc_kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오늘 뭐먹지? 회원가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="headerstyle.css" />
<link rel="stylesheet" type="text/css" href="footerstyle.css" />
<style>
        /*============기타 설정===============*/    
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 나눔고딕;
        }
        /*============섹션 부분===============*/
        section{
            width: 100%;
            height: 1100px;
            display: flex;
            justify-content: center;
             
        }
        .tableBackground{
            width: 550px;
            height: 950px;
            background-color: white;
            margin-top: 110px;
            border-radius: 5px;
            border: 1px solid black;
        }
        .Pname{
            font-size: 40px;
            font-weight: bold;
            text-align: center;
        }
        .Pgender, .PoutMeal, .Precipe{
            font-size: 20px;
            font-weight: bold;
        }

        .idP, .pwP, .emP, .btP{
            font-size: 20px;
            font-weight: bold;
        }
        table{
            width: 500px;
            height: 840px;
            background-color: white;
            margin-left: 20px;
        }
        button{
            width:100%;
            height: 50px;
        }
        input[type=text], input[type=email], input[type=tel], input[type=password]{
            width: 500px;
            height: 50px;
            text-indent: 15px;
            border-radius: 10px;
        }
        .star{
            color: red;
        }
        /*===================================*/
    
        @media (max-width: 768px){  
            section{
                width: 100%;
                height: 975px;
                background-color: gray;
                display: flex;
                justify-content: center;
                margin-top: 
            }
            .tableBackground{
                position: relative;
                width: 600px;
                height: 875px;
                background-color: white;
                border: 1px solid black;
                bottom: 10;
            }
            table{
                width: 500px;
                height: 740px;
                background-color: white;
                margin-left: 20px;
            }
            button{
                width:450px;
                height: 50px;
            }
            input[type=text], input[type=email], input[type=tel], input[type=password]{
                width: 300px;
                height: 50px;
                text-indent: 15px;
                border-radius: 10px;
            }
        }
</style>
</head>
<body>
<header><jsp:include page="header.jsp"/></header>
    <section>
       <div class="tableBackground">
       <br><p class="Pname">회원가입 정보</p><br>
       <form action="registerProc.do" name="regist" method="post">   
        <table border="0">
                <tr>
                    <td><p class="idP"><i class="star">*</i> 아이디</p></td>    
                </tr>
                <tr> 
                    <td><input type="text" id="userID" name="userID" placeholder="아이디를 입력하세요" required> </td>
                </tr>
                <tr>
                    <td><p class="pwP"><i class="star">*</i> 비밀번호</p></td>    
                </tr>
                <tr>
                    <td><input type="password" class="pp" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요" required></td>
                </tr>
                <tr>
                    <td><p class="pwP"><i class="star">*</i> 비밀번호 확인</p></td>    
                </tr>
                <tr>
                    <td><input type="password" class="pp" id="userPwChk" name="userPwChk" placeholder="비밀번호를 다시 입력하세요" required></td>
                </tr>
                <tr>
                    <td><font id="chkNotice" size="2"></font></td>
                </tr>
                <tr>
                    <td><p class="emP"><i class="star">*</i> 이메일</p></td>    
                </tr>
                <tr>
                    <td><input type="email" id="userEmail" name="userEmail" placeholder="이메일을 입력하세요" required></td>
                </tr>
                <tr>
                    <td><p class="btP"><i class="star">*</i> 출생 연도</p></td>    
                </tr>
                <tr>
                    <td><input type="tel" id="userBirth" name="userBirth" placeholder="출생년도를 입력하세요" maxlength="4" oninput="numberMaxLength(this)" required></td>
                </tr>
                <tr>
                   <td>
                    <div class="Pgender"><i class="star">*</i> 자신의 성별을 클릭하세요.</div><br>
                    <input type=radio name="gender" value="male" checked required>남 &nbsp;&nbsp;&nbsp;
                    <input type=radio name="gender" value="female">여
                   </td>
                </tr>
                <tr>
                   <td><div class="PoutMeal">선호하는 외식 카테고리</div></td>
                </tr>
                <tr>
                   <td class="outMealCh">
                        <input type=checkbox name="outEatChk" value="한식">한식&nbsp;&nbsp; 
                        <input type=checkbox name="outEatChk" value="양식">양식 &nbsp;&nbsp;
                        <input type=checkbox name="outEatChk" value="중식">중식&nbsp;&nbsp; 
                        <input type=checkbox name="outEatChk" value="일식">일식&nbsp;&nbsp; 
                        <input type=checkbox name="outEatChk" value="채식">채식<br>
                        <input type=checkbox name="outEatChk" value="베이커리/디저트">베이커리º디저트&nbsp;&nbsp;
                        <input type=checkbox name="outEatChk" value="카페">카페&nbsp;&nbsp; 
                        <input type=checkbox name="outEatChk" value="기타">기타
                        <input type="hidden" name="eatChkAccept" value="0"> 
                    </td>
                </tr>
                <tr>
                   <td>
                    <div class="Precipe">선호하는 레시피 카테고리</div>       
                   </td>
                </tr>
                <tr>
                    <td class="recipeCh">
                        <input type=checkbox name="recipeChk" value="한식">한식 &nbsp;
                        <input type=checkbox name="recipeChk" value="중식">중식 &nbsp;
                        <input type=checkbox name="recipeChk" value="일식">일식 &nbsp;
                        <input type=checkbox name="recipeChk" value="양식">양식 &nbsp;
                        <input type=checkbox name="recipeChk" value="아시아">아시아 &nbsp;<br>
                        <input type=checkbox name="recipeChk" value="기타">기타 &nbsp;
                        <input type="hidden" name="recipeChkAccept" value="0"> 
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type=submit value="회원가입"></td>
                </tr>
        </table>
        </form>
        </div>
    </section>
<footer><jsp:include page="footer.jsp"/></footer>
	
<script>
	var pwd1 = $("#userPw").val();
	var pwd2 = $("#userPwChk").val();
     
    function numberMaxLength(e){
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
    }
    
    $(document).ready(function(){
    	$('#userPw').keyup(function(){
            $('#chkNotice').html('');
        });
        $('#userPwChk').keyup(function(){
            if($('#userPw').val() != $('#userPwChk').val()){
                $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
                $('#chkNotice').attr('color', '#f82a2aa3');
            } else{
                $('#chkNotice').html('비밀번호 일치함<br><br>');
                $('#chkNotice').attr('color', '#199894b3');
            }
        });
    	$(".asist").click(function(){
            $(".list").toggle(500);
	    });
	    $(".asistSide").click(function(){
	          $(".listSide").toggle(500);
	    });
    	$("form").submit(function() { 
        	if ($("#userPw").val() != $("#userPwChk").val()) { 
        		alert("비밀번호가 다릅니다.");
        		return false; 
        	}else if($("#userID").val() == "admin"){
        		alert("생성 불가능한 아이디입니다");
        		return false;
        	}
        	if($("input:checkbox[name=outEatChk]").is(":checked") == true) {
        		$("input:hidden[name=eatChkAccept]").val("like");
        	}
        	if($("input:checkbox[name=recipeChk]").is(":checked") == true) {
        		$("input:hidden[name=recipeChkAccept]").val("like");
        	}
        	return true;
        });
    });
    
    
</script> 
</body>
</html>