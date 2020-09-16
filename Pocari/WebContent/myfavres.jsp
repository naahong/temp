<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������? �������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="headerstyle.css" />
<link rel="stylesheet" type="text/css" href="footerstyle.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: �������;
     }
     #wrap{
        width: 100%;
     }
     #contents-wrap{
        width: 100%;
        display: flex;
        justify-content: space-around;
     }
     .asnse{
        width: 1366px;
        display: flex;
        justify-content: space-around;
     }
     aside{
        width: 25%;
        padding-top: 230px;
        border-left: 1px solid #a1c181;
     }
     aside li{
         list-style:none;
         margin: 20px;
         padding: 10px;
         font-size: 16px;
         font-weight: bolder;
     }
     aside li:hover{
        background-color: #a1c181;
    }
    section{
        width: 75%;
    }
    .details{
        width: 100%;
        padding-top: 170px;
        padding-bottom: 50px;
    }
    .details table{
        width: 100%;
        border-collapse: collapse;
    }
    .details table tr{
        height: 45px;
        border-left: 1px solid #233d4d;
        border-right: 1px solid #233d4d;
    }
    .details table tr td{
        padding: 10px 20px;
    }
    span{
        color: red;
    }
    #sido1, #gugun1{
        margin-left: 20px;
        margin-right: 20px;
    }
    input[type="text"]{
        height: 38px;
        border-radius: 5px;
        border: 1px solid #233d4d;
    }
    textarea{
        border: 1px dotted #233d4d;
    }
    .totalrating{
        padding: 20px;
        margin: 20px;
        border-bottom: 1px solid #fe7f2d;
    }
    select{
        width: 100px;
        height: 30px;
        margin-left: 50px;
        margin-right: 50px;
    }
    input[type="button"]{
        width: 50px;
        height: 25px;
        margin: 15px 20px;
        border: 2px solid #233d4d;
        background-color: #233d4d;
        color: white;
        font-size: 15px;
        font-weight: bold;
    }
    input[type="file"]{
        margin: 10px 5px;
    }
    #filearea{
        width: 80%;
        margin: 20px;
        padding: 20px;
        border: 1px solid #233d4d;
        display: flex;
        flex-flow: row wrap;
    }
    .anr{
    	width: 100%;
    	display: flex;
    }
    button, input[type="submit"]{
        width: 100px;
        height: 40px;
        border: 2px solid #233d4d;
        background-color: #fff;
        margin: 15px;
        border-radius: 15px;
    }
    
    @media (max-width: 768px) {
        .asnse{
            width: 100%;
            display: inline-block;
        }
        aside{
            border: 0;
            width: 100%;
            padding-top: 150px;
        }
        aside ul{
            display: flex;
        }
        aside li{
            margin: 10px;
            border: 0;
            font-size: 13px;
        }
        section{
            width: 100%;
        }
        table{
            font-size: 14px;
        }
        .details{
            padding-top: 80px;
        }
    }
    
</style>
</head>
<body>
<div id="wrap">
   <header><jsp:include page="header.jsp"/></header>
   <div id="contents-wrap">
      <div class="asnse">
          <aside>
             <ul>
                <li onclick="location.href='eatout.do'">���� ã��</li>
                <li onclick="location.herf='recipeMain.do'">������ ã��</li>
             </ul>
          </aside>
          <section>
          <div class="details">
          	  <form action="inputres.do" method="post" enctype = "multipart/form-data">
              <table cellspacing="10px">
                 <colgroup>
                     <col width="30%"><col width="20%"><col width="25%"><col width="25%">
                 </colgroup>
                  <tr style="height: 80px; border-top: 1px solid #233d4d; background-color: #233d4d">
                      <td colspan="4" style="font-size: 17px; font-weight: bolder; color: white">�� ���� ����ϱ� <i class="far fa-smile"></i></td>
                  </tr>
                  <tr>
                      <td colspan="4" style="text-align: right"><p style="font-size: 13px"><span>*</span>�׸��� �ʼ��Դϴ�.</p></td>
                  </tr>
                  <tr>
                      <td><span>*</span>��ȣ��</td>
                      <td colspan="3"><input type="text" name="storename" style="width: 70%"></td>
                  </tr>
                  <tr>
                      <td><span>*</span>����</td>
                      <td><select name="sido1" id="sido1"></select><select name="gugun2" id="gugun1"></select></td>
                      <td colspan="2"><span>*</span>ī�װ�<select name="category" style="width: 150px"><option value="">ī�װ�����</option><option value="�ѽ�">�ѽ�</option>
                      <option value="���">���</option><option value="�߽�">�߽�</option><option value="�Ͻ�">�Ͻ�</option>
                      <option value="ī��">ī��</option><option value="����Ŀ��/����Ʈ">����Ŀ��/����Ʈ</option>
                      <option value="ä��">ä��</option><option value="��Ÿ">��Ÿ</option></select></td>
                  </tr>
                  <tr>
                      <td>����ó ����</td>
                      <td colspan="3"><input type="text" name="tel" style="width:400px" placeholder="xxx-xxxx-xxxx �������� �Է����ּ���"></td>
                  </tr>
                  <tr>
                      <td style="text-align: right">��ǥ ����<br>�ø���</td>
                      <td colspan="3"><input type="file" name="m_imgpath"></td>
                  </tr>
                  <tr>
                      <td colspan="4">�±�<br><br><input type="text" name="s_tag" style="width: 90%" placeholder="���� : �������, ���������, ������ �޹� ��..."><br><br></td>
                  </tr>
                  <tr style="height: 80px; background-color: #233d4d">
                      <td colspan="4" style="font-size: 17px; font-weight: bolder; color: white">���侲�� <i class="far fa-smile"></i></td>
                  </tr>
                  <tr>
                      <td colspan="4" style="text-align: right"><p style="font-size: 13px"><span>*</span>�׸��� �ʼ��Դϴ�.</p></td>
                  </tr>
                  <tr>
                      <td style="text-align: right"><span>*</span>����</td>
                      <td colspan="3"><textarea rows=10 cols=120 name="comment"></textarea></td>
                  </tr>
                  <tr>
                      <td colspan="4" style="text-align: center">
                        <div class="totalrating">
                          <span>*</span>��ü����<select name="total"><option value="">����</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                        </div> 
                      </td>
                  </tr>
                  <tr>
                      <td colspan="4" style="text-align: center">
                          ������<select name="atmosphere"><option value="">����</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                          ����<select name="service"><option value="">����</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                          û�ᵵ<select name="sanitary"><option value="">����</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="4" style="text-align: center">
                          ��<select name="flavor"><option value="">����</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                          ��<select name="portions"><option value="">����</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                          ����<select name="price"><option value="">����</option><option value="5">5</option>
                          <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                          <option value="1">1</option></select>
                      </td>
                  </tr>
                  <tr>
                      <td style="text-align: right">�ı� ����<br>�ø���</td>
                      <td colspan="3">
                          <div id="filearea">
                              <input type="file" name="r_img1">
                          </div>
                          <div class="anr">�ִ� 6����� �����մϴ�.<input type="button" value="+" id="add"><input type="button" value="-" id="remove"></div>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="4">�±�<br><br><input type="text" name="r_tag" style="width: 90%"  placeholder="���� : �ſ���, ���׸���, ������ �޹� ��..."></td>
                  </tr>
                   <tr style="border-bottom: 1px solid #233d4d">
                      <td colspan="4" style="text-align: center">
                          <button onclick=location.href="eatout.do">���</button>
                          <input type="submit" value="����ϱ�" onclick="sign()"> 
                      </td>
                  </tr>
              </table>
              </form>
          </div>
          </section>
       </div>
   </div>
   <footer><jsp:include page="footer.jsp"/></footer>
</div>      


<script>
    $(document).ready(function(){
        
          var area0 = ["��/�� ����","����Ư����","��õ������","����������","���ֱ�����","�뱸������","��걤����","�λ걤����","��⵵","������","��û�ϵ�","��û����","����ϵ�","���󳲵�","���ϵ�","��󳲵�","���ֵ�"];
          var area1 = ["������","������","���ϱ�","������","���Ǳ�","������","���α�","��õ��","�����","������","���빮��","���۱�","������","���빮��","���ʱ�","������","���ϱ�","���ı�","��õ��","��������","��걸","����","���α�","�߱�","�߶���"];
           var area2 = ["��籸","����","������","����","����","����","������","�߱�","��ȭ��","������"];
           var area3 = ["�����","����","����","������","�߱�"];
           var area4 = ["���걸","����","����","�ϱ�","����"];
           var area5 = ["����","�޼���","����","�ϱ�","����","������","�߱�","�޼���"];
           var area6 = ["����","����","�ϱ�","�߱�","���ֱ�"];
           var area7 = ["������","������","����","����","������","�λ�����","�ϱ�","���","���ϱ�","����","������","������","������","�߱�","�ؿ�뱸","���屺"];
           var area8 = ["����","��õ��","�����","���ֽ�","������","������","������","�����ֽ�","����õ��","��õ��","������","������","�����","�Ȼ��","�ȼ���","�Ⱦ��","���ֽ�","�����","���ν�","�ǿս�","�����ν�","��õ��","���ֽ�","���ý�","��õ��","�ϳ���","ȭ����","����","����","���ֱ�","��õ��"];
           var area9 = ["������","���ؽ�","��ô��","���ʽ�","���ֽ�","��õ��","�¹��","����","�籸��","��籺","������","������","������","ö����","��â��","ȫõ��","ȭõ��","Ⱦ����"];
           var area10 = ["��õ��","û�ֽ�","���ֽ�","���걺","�ܾ籺","������","������","��õ��","������","����","��õ��","û����"];
           var area11 = ["����","���ֽ�","����","���ɽ�","�����","�ƻ��","õ�Ƚ�","�ݻ걺","������","�ο���","��õ��","���ⱺ","���걺","û�籺","�¾ȱ�","ȫ����"];
           var area12 = ["�����","������","������","�ͻ��","���ֽ�","������","��â��","���ֱ�","�ξȱ�","��â��","���ֱ�","�ӽǱ�","�����","���ȱ�"];
           var area13 = ["�����","���ֽ�","������","��õ��","������","������","���ﱺ","���","���ʱ�","��籺","���ȱ�","������","�žȱ�","������","���ϱ�","�ϵ���","�强��","���ﱺ","������","����","�س���","ȭ����"];
           var area14 = ["����","���ֽ�","���̽�","��õ��","�����","���ֽ�","�ȵ���","���ֽ�","��õ��","���׽�","��ɱ�","������","��ȭ��","���ֱ�","������","���籺","��õ��","�︪��","������","�Ǽ���","û����","û�۱�","ĥ�"];
           var area15 = ["������","���ؽ�","�����","�о��","��õ��","����","���ֽ�","���ؽ�","â����","�뿵��","��â��","����","���ر�","��û��","�Ƿɱ�","â�籺","�ϵ���","�Ծȱ�","�Ծ籺","��õ��"];
           var area16 = ["��������","���ֽ�","�����ֱ�","�����ֱ�"];



         // ��/�� ���� �ڽ� �ʱ�ȭ

         $("select[name^=sido]").each(function() {
          $selsido = $(this);
          $.each(eval(area0), function() {
           $selsido.append("<option value='"+this+"'>"+this+"</option>");
          });
          $selsido.next().append("<option value=''>��/�� ����</option>");
         });



         // ��/�� ���ý� ��/�� ����

         $("select[name^=sido]").change(function() {
          var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // ���������� ���� Array
          var $gugun = $(this).next(); // ���ÿ��� ���� ��ü
          $("option",$gugun).remove(); // ���� �ʱ�ȭ

          if(area == "area0")
           $gugun.append("<option value=''>��/�� ����</option>");
          else {
           $.each(eval(area), function() {
            $gugun.append("<option value='"+this+"'>"+this+"</option>");
           });
          }
         });
        
        
    });
    
/* ================================================================= */    
    
    //var form = document.forms[0];
	var add = document.getElementById("add");
	var remove = document.getElementById("remove");
	var filearea = document.getElementById("filearea");
	var cnt = 1;
		
	add.onclick = function(){
		if(cnt<6){
			cnt++;
			var elm = document.createElement("input");
			elm.type = "file";
			elm.name = "r_img"+cnt;
			
			filearea.appendChild(elm);
		}
	};
	
	remove.onclick = function(){
		if(cnt>1){
			cnt--;
			var inputs = filearea.getElementsByTagName("input");
			filearea.removeChild(inputs[cnt]);
		}
	};
	
	function sign(){
		
	}
    
</script>

</body>
</html>