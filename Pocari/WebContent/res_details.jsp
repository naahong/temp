<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.Pocari.dto.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="com.Pocari.dto.FavlistAndReviewBean"%>
<%@page import="com.Pocari.dao.My_favlistDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오늘 뭐먹지? 맛집정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="headerstyle.css" />
<link rel="stylesheet" type="text/css" href="footerstyle.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 나눔고딕;
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
    .outer{
        width: 100%;
        border-collapse: collapse;
    }
    .outer tr{
        height: 45px;
        border-left: 1px solid #233d4d;
        border-right: 1px solid #233d4d;
    }
    .outer tr td{
        padding: 10px 30px;
    }
    .main_picture{
        width: 500px;
        height: 500px;
        border: 2px solid #233d4d;
        border-radius: 15px;
        margin-top: 20px;
        margin-bottom: 10px;
        margin-left: 25%;
        overflow: hidden;
    }
    .main_picture img{
        width: 100%;
    }
    .store_name{
        font-size: 35px;
        color: #233d4d;
        font-weight: bolder;
    }
    .locate{
        font-size: 20px;
        color: #233d4d;
    }
    .fa-mobile-alt{
        margin-right: 20px;
    }
    .review{
        width: 100%;
        font-size: 15px;
        border: 1px solid #fcca46;
    }
    .review tr{
        border-left: 1px solid #fcca46;
        border-right: 1px solid #fcca46;
    }
    .review tr:first-child{
        border-top: 1px solid #fcca46;
    }
    .review tr:last-child{
        border-bottom: 1px solid #fcca46;
    }
    #tagpart{
        display: flex;
        flex-flow: row wrap;
    }
    .tag{
        width: auto;
        height: 35px;
        border-radius: 20px;
        padding: 8px;
        margin: 0 10px;
        border: 1px solid #fcca46;
    }
    input[type="button"], input[type="submit"]{
        width: 100px;
        height: 40px;
        border: 2px solid #233d4d;
        background-color: #fff;
        margin: 15px;
        border-radius: 15px;
    }
    .addfav{
        width: 70px;
        margin: 5px;
    }
    input[type="text"]{
        height: 38px;
        border-radius: 5px;
        border: 1px solid #233d4d;
    }
    .c_review{
        position: fixed;
        margin: 0 auto;
        left: 0;
        right: 0;
        top: 7%;
        width: 900px;
        padding: 25px;
        background-color: white;
        border-radius: 20px;
        display: none;
        z-index: 5000;
        overflow: hidden;
        border: 0;
    }
    .writebox{
        position: fixed;
        width: 100%;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.5);
        display: none;
        z-index: 4000;
    }
    .review_pop{
        width: 100%;
        background-color: white;
        border: 0;
    }
    .review_pop tr td{
        padding: 5px 5px;
    }
    .anr input[type="button"]{
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
        margin: 5px 5px;
    }
    #filearea{
        width: 80%;
        margin: 20px;
        padding: 10px;
        border: 1px solid #233d4d;
        display: flex;
        flex-flow: row wrap;
    }
    .anr{
    	width: 100%;
    	display: flex;
    }
    span{
        color: red;
    }
    select{
        width: 70px;
        height: 25px;
        margin-left: 30px;
        margin-right: 30px;
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
        .main_picture{
            margin: 0 auto;
            width: 300px;
            height: 300px;
        }
        .main_picture img{
            width: 100%;
        }
        .review tr:nth-child(2){
            display: none;
        }
    }
</style>
</head>
<body>
<div id="wrap">
  <div class="writebox">배경</div>
  <div class="c_review">
  <%
  		int oidx = Integer.parseInt(request.getParameter("mfl_idx"));
  %>
  	  <form action="addreview.do" method="post" enctype="multipart/form-data">
      <table class="review_pop">
          <tr style="height: 80px">
              <td colspan="4" style="font-size: 17px; font-weight: bolder">리뷰쓰기 <i class="far fa-smile"></i></td>
          </tr>
          <tr>
              <td colspan="4" style="text-align: right"><p style="font-size: 13px"><span>*</span>항목은 필수입니다.</p></td>
          </tr>
          <tr>
              <td style="text-align: right"><span>*</span>리뷰</td>
              <td colspan="3"><textarea rows=10 cols=90 name="comment"></textarea></td>
          </tr>
          <tr>
              <td colspan="4" style="text-align: center">
                <div class="r_totalrating">
                  <span>*</span>전체평점<select name="total"><option value="">점수</option><option value="5">5</option>
                  <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                  <option value="1">1</option></select>
                </div> 
              </td>
          </tr>
          <tr>
              <td colspan="4" style="text-align: center">
                    분위기<select name="atmosphere"><option value="">점수</option><option value="5">5</option>
                  <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                  <option value="1">1</option></select>
                                        서비스<select name="service"><option value="">점수</option><option value="5">5</option>
                  <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                  <option value="1">1</option></select>
                                         청결도<select name="sanitary"><option value="">점수</option><option value="5">5</option>
                  <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                  <option value="1">1</option></select>
              </td>
          </tr>
          <tr>
              <td colspan="4" style="text-align: center">
                    맛<select name="flavor"><option value="">점수</option><option value="5">5</option>
                  <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                  <option value="1">1</option></select>
                                   양<select name="portions"><option value="">점수</option><option value="5">5</option>
                  <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                  <option value="1">1</option></select>
                                   가격<select name="price"><option value="">점수</option><option value="5">5</option>
                  <option value="4">4</option><option value="3">3</option><option value="2">2</option>
                  <option value="1">1</option></select>
              </td>
          </tr>
          <tr>
              <td style="text-align: right">후기 사진<br>올리기</td>
              <td colspan="3">
              	  <div id="filearea">
              	  		<input type="file" name="r_img1">
              	  </div>
              	  <div class="anr">최대 6장까지 가능합니다.<input type="button" value="+" id="add"><input type="button" value="-" id="remove"></div>
			  </td>
          </tr>
          <tr>
              <td colspan="4">태그<br><br><input type="text" name="r_tag" style="width: 95%" placeholder="예시 : 매워요, 동네맛집, 수요일 휴무 등..."></td>
          </tr>
          <tr style="border-bottom: 1px solid #233d4d">
              <td colspan="4" style="text-align: center">
              	  <input type="hidden" name="resIdx" value="<%=oidx %>">
                  <input type="submit" value="등록하기"> 
                  <input type="button" id="exit" value="취소">
              </td>
          </tr>
      </table>
      </form>
   </div>
  <header><jsp:include page="header.jsp"/></header>
   <div id="contents-wrap">
     <div class="asnse">
          <aside>
             <ul>
                <li onclick="location.href='eatout.do'">맛집 찾기</li>
                <li onclick="location.herf='recipeMain.do'">레시피 찾기</li>
             </ul>
          </aside>
          <section>
          	  <%
			
				  FavlistAndReviewBean bean = (FavlistAndReviewBean)request.getAttribute("resDetail");//한명에 대한 정보-하나의 bean으로 만들기
				
			  %>
              <div class="details">
                  <table class="outer" cellspacing="20px">
                      <tr style="height: 80px; border-top: 1px solid #233d4d; background-color: #233d4d">
                          <td colspan="4" style="font-size: 17px; font-weight: bolder; color: white">가게 정보 <i class="fas fa-utensils"></i></td>
                      </tr>
                      <tr>
                          <td colspan="4" style="text-align: right">
                          		<form action="saveStore.do" method="post">
                          			<input type="hidden" name="resIdx" value="<%=oidx %>">
                          			<input type="submit" class="addfav" value="찜'<i class="far fa-heart"></i>'">
                          		</form>
                          </td>
                      </tr>
                       <tr>
                          <td colspan="4"> 
                              <div class="main_picture"><img src="upload/<%=bean.getImgpath() %>"></div>
                          </td>
                      </tr>
                      <tr>
                          <td colspan="4" class="store_name"><%=bean.getStorename() %></td>
                      </tr>
                      <tr>
                          <td colspan="4" class="locate"><%=bean.getSido1() %> <%=bean.getGugun1() %> / <%=bean.getCategory() %></td>
                      </tr>
                      <tr>
                          <td colspan="4"><i class="fas fa-mobile-alt"></i> <%=bean.getTel() %></td>
                      </tr>

                      <tr style="height: 80px; background-color: #233d4d">
                          <td colspan="4" style="font-size: 17px; font-weight: bolder; color: white">리뷰 <i class="far fa-comments"></i></td>
                      </tr>
                      <%
                      	Vector<FavlistAndReviewBean> v  = (Vector)request.getAttribute("revList");
                      
                   	  	for(int i=0; i<v.size(); i++){
                   	  	String tags = v.get(i).getR_tag();
                   	  	
                   		String id = (String)request.getAttribute("writer");
                   	  %>
                      <tr>
                          <td colspan="4">
                              <table class="review" cellspacing="10px">
                                  <tr>
                                      <td colspan="5"><%=id %></td>
                                      <td colspan="2" style="text-align: right"><%=v.get(i).getDate() %></td>
                                  </tr>
                                  <tr>
                                      <td> 분위기 <%=v.get(i).getAtmosphere() %> </td>
                                      <td> 서비스 <%=v.get(i).getService() %> </td>
                                      <td> 맛 <%=v.get(i).getFlavor() %> </td>
                                      <td> 위생 <%=v.get(i).getSanitary() %> </td>
                                      <td>가격 <%=v.get(i).getPrice() %> </td>
                                      <td> 양 <%=v.get(i).getPortions() %> </td>
                                      <td> <i class="far fa-check-square"></i> 전체 평점 <%=v.get(i).getStar() %> </td>
                                  </tr>
                                  <tr>
                                      <td colspan="7"><%=v.get(i).getComment() %></td>
                                  </tr>
                                  <tr>
                                  
                                  </tr>
                                  <tr>
                                      <td colspan="7"><div id="tagpart"><div class="tag">#<%=v.get(i).getR_tag() %></div></div></td>
                                  </tr>
                              </table>
                          </td>
                      </tr>
                      <%} %>
                      <tr style="border-bottom: 1px solid #233d4d">
                          <td colspan="2" style="text-align: left">
                          	 <form action="removeRes.do" method="post">
                          	 	<input type="hidden" name="resIdx" value="<%=oidx %>">
                          	 	<input type="submit" class="remove" value="글 삭제">
                          	 </form>
                          </td>
                          <td colspan="2" style="text-align: right">
                             <input type="button" value="리뷰쓰기" class="write_review">
                          </td>
                      </tr>
                  </table>
              </div>
         </section>
       </div>
    </div>
   <footer><jsp:include page="footer.jsp"/></footer>
</div>

<script>

    $(document).ready(function(){
       $(".write_review").click(function(){
            $(".writebox").fadeIn(200, function(){
                $(".c_review").fadeIn(200);
            });
        }); 
         $("#exit").click(function(){
            $(".c_review").fadeOut(200, function(){
                $(".writebox").fadeOut(200);
            });
        });
    });
    
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
	
</script>
</body>
</html>