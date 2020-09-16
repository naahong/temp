<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc_kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>���� ������? ȸ������</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="headerstyle.css" />
<link rel="stylesheet" type="text/css" href="footerstyle.css" />
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
       <br><p class="Pname">ȸ������ ����</p><br>
       <form action="registerProc.do" name="regist" method="post">   
        <table border="0">
                <tr>
                    <td><p class="idP"><i class="star">*</i> ���̵�</p></td>    
                </tr>
                <tr> 
                    <td><input type="text" id="userID" name="userID" placeholder="���̵� �Է��ϼ���" required> </td>
                </tr>
                <tr>
                    <td><p class="pwP"><i class="star">*</i> ��й�ȣ</p></td>    
                </tr>
                <tr>
                    <td><input type="password" class="pp" id="userPw" name="userPw" placeholder="��й�ȣ�� �Է��ϼ���" required></td>
                </tr>
                <tr>
                    <td><p class="pwP"><i class="star">*</i> ��й�ȣ Ȯ��</p></td>    
                </tr>
                <tr>
                    <td><input type="password" class="pp" id="userPwChk" name="userPwChk" placeholder="��й�ȣ�� �ٽ� �Է��ϼ���" required></td>
                </tr>
                <tr>
                    <td><font id="chkNotice" size="2"></font></td>
                </tr>
                <tr>
                    <td><p class="emP"><i class="star">*</i> �̸���</p></td>    
                </tr>
                <tr>
                    <td><input type="email" id="userEmail" name="userEmail" placeholder="�̸����� �Է��ϼ���" required></td>
                </tr>
                <tr>
                    <td><p class="btP"><i class="star">*</i> ��� ����</p></td>    
                </tr>
                <tr>
                    <td><input type="tel" id="userBirth" name="userBirth" placeholder="����⵵�� �Է��ϼ���" maxlength="4" oninput="numberMaxLength(this)" required></td>
                </tr>
                <tr>
                   <td>
                    <div class="Pgender"><i class="star">*</i> �ڽ��� ������ Ŭ���ϼ���.</div><br>
                    <input type=radio name="gender" value="male" checked required>�� &nbsp;&nbsp;&nbsp;
                    <input type=radio name="gender" value="female">��
                   </td>
                </tr>
                <tr>
                   <td><div class="PoutMeal">��ȣ�ϴ� �ܽ� ī�װ�</div></td>
                </tr>
                <tr>
                   <td class="outMealCh">
                        <input type=checkbox name="outEatChk" value="�ѽ�">�ѽ�&nbsp;&nbsp; 
                        <input type=checkbox name="outEatChk" value="���">��� &nbsp;&nbsp;
                        <input type=checkbox name="outEatChk" value="�߽�">�߽�&nbsp;&nbsp; 
                        <input type=checkbox name="outEatChk" value="�Ͻ�">�Ͻ�&nbsp;&nbsp; 
                        <input type=checkbox name="outEatChk" value="ä��">ä��<br>
                        <input type=checkbox name="outEatChk" value="����Ŀ��/����Ʈ">����Ŀ��������Ʈ&nbsp;&nbsp;
                        <input type=checkbox name="outEatChk" value="ī��">ī��&nbsp;&nbsp; 
                        <input type=checkbox name="outEatChk" value="��Ÿ">��Ÿ
                        <input type="hidden" name="eatChkAccept" value="0"> 
                    </td>
                </tr>
                <tr>
                   <td>
                    <div class="Precipe">��ȣ�ϴ� ������ ī�װ�</div>       
                   </td>
                </tr>
                <tr>
                    <td class="recipeCh">
                        <input type=checkbox name="recipeChk" value="�ѽ�">�ѽ� &nbsp;
                        <input type=checkbox name="recipeChk" value="�߽�">�߽� &nbsp;
                        <input type=checkbox name="recipeChk" value="�Ͻ�">�Ͻ� &nbsp;
                        <input type=checkbox name="recipeChk" value="���">��� &nbsp;
                        <input type=checkbox name="recipeChk" value="�ƽþ�">�ƽþ� &nbsp;<br>
                        <input type=checkbox name="recipeChk" value="��Ÿ">��Ÿ &nbsp;
                        <input type="hidden" name="recipeChkAccept" value="0"> 
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type=submit value="ȸ������"></td>
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
                $('#chkNotice').html('��й�ȣ ��ġ���� ����<br><br>');
                $('#chkNotice').attr('color', '#f82a2aa3');
            } else{
                $('#chkNotice').html('��й�ȣ ��ġ��<br><br>');
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
        		alert("��й�ȣ�� �ٸ��ϴ�.");
        		return false; 
        	}else if($("#userID").val() == "admin"){
        		alert("���� �Ұ����� ���̵��Դϴ�");
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