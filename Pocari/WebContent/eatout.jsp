<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.Pocari.dto.CategoryBean"%>
<%@page import="com.Pocari.dao.NamebarDao"%>
<%@page import="com.Pocari.dto.FavlistAndReviewBean"%>
<%@page import="java.util.Vector"%>
<%@page import="com.Pocari.dao.My_favlistDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오늘 뭐먹지? 외식</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="headerstyle.css" />
<link rel="stylesheet" type="text/css" href="footerstyle.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&family=Roboto+Mono&display=swap" rel="stylesheet">

    <style>
     /* {"Charcoal":"233d4d","Pumpkin":"fe7f2d","Sunglow":"fcca46","Olivine":"a1c181"} */
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
	     	border-right: 2px solid #a1c181;
	     }
	     .side{
	     	width: 100%;
	     	height: 50px;
	        padding-top: 16px;
	        padding-left: 10px;
	        display: block;
	     }
	     #total:checked+label, #korean:checked+label, 
	     #western:checked+label, #chinese:checked+label, 
	     #japanese:checked+label, #cafe:checked+label, #bakerynd:checked+label,
	     #vege:checked+label, #etc:checked+label{
	     	background-color: #233d4d;
	        color: #fff;
	     }
	     aside li{
	     	 list-style:none;
	         margin: 20px;
	         border-bottom: 1.5px solid #a1c181;
	     }
	     section{
	        width: 75%;
	     }
	     .contents{
	        width: 100%;
	        padding-top: 170px;
	        padding-bottom: 50px;
	        display: flex;
	        justify-content: space-around;
	        flex-flow: row wrap; 
	     }
	     .folding{
	        width: 90%;
	        height: 50px;
	        padding-top: 16px;
	        padding-left: 20px;
	        color: white;
	        background-color: #233d4d;
	     }
	     #envelope:checked+label+div{
	        display: block;
	     }
	     .select_menu{
	         width: 90%;
	         padding: 30px;
	         border: 1px solid #233d4d;
	         display: none;
	     }
	     .sct{
	         width: 100%;
	         height: 50px;
	         padding-top: 16px;
	         padding-left: 20px;
	         background-color: #fcca46;
	         display: block;
	     }
	     .randombar, .roulette{
	         display: none;
	         padding-left: 20px;
	         height: 300px;
	         padding: 20px;
	         border: 1px solid #fcca46;
	     }
	     input{
	         display: none;
	     }
	     #randombar:checked+label+div{
	         display: block;
	     }
	     #roulette:checked+label+div{
	         display: block;
	     }
	     #screen{
	        width: 450px;
	        height: 100px;
	        border: 2px solid gray;
	        position: relative;
	        overflow: hidden;
	        margin: 0 auto;
	        left: 0;
	        right: 0;
	    }
	    .nbwrap{
	        width: 450px;
	        display: flex;
	        flex-flow: row wrap;
	        position: absolute;
	    }
	    .nblist{
	        width: 450px;
	        height: 100px;
	        margin-top: 18px; 
	        font-size: 50px;
	        font-weight: bold;
	        text-align: center;
	    }
	    #btnspart{
	    	width: 100%;	
	    	display: flex;
	    	justify-content: center;
	    	margin: 50px 0;
	    }
	    .btnP, .btnS, .favMenu{
	    	display: block;
	    	width: 20%;;
	    	height: 50px;
	    	color: #fff;
	    	font-size: 20px;
	    	border: 2px solid #233d4d;
            background-color: #233d4d;
            margin: 10px;
            border-radius: 20px;
	    }
	     #searchpart{
	         width: 100%;
	         padding: 20px;
	         display: flex;
	         justify-content: center;
	     }
	     .search{
	     	width: 70%;
	     	display: flex;
	     	flex-flow: row wrap;
	     	justify-contents:space-between;
	        height: 50px;
	        border: 2px solid #233d4d;
	        border-radius: 5px;
	     }
	     .search .schinput{
	        width: 90%;
	        height: 100%;
	        display:block;
	     }
	    .search .startS{
	    	width: 10%;
	        border: 0;
	        background: none;
	        color: #233d4d;
	        margin: 0;
	    }
	     .tags{
	         width: 90%;
	         padding: 20px 70px;
	         display: flex;
	         justify-content: space-between;
	     }
	     .tag{
	     	 width: 80px;
	         height: 30px;
	         background-color: #fff;
	         border: 1.5px solid #fe7f2d;
	         border-radius: 15px;
	         font-family: 'Roboto Mono', monospace;
	     }
	     .fav_list{
		     width: 95%;
	         padding: 25px;
		     border: 1px solid #233d4d;
	     }
        .fav_list table{
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
            border-left: 0.5px solid #fe7f2d;
            border-top: 0.5px solid #fe7f2d;
            border-right: 0.5px solid #fe7f2d;
            border-bottom: 0.5px solid #fe7f2d;
        }
        .fav_list a{
        	color: black;
        	text-decoration: none;
        }
        .review td{
            padding: 10px;
        }
        .mainpic{
            width: 100px;
            height: 100px;
        }
        .mainpic img{
            width: 100%;
            height: 100%;
        }
        .upload{
            width: 100%;
            padding: 25px;
            display: flex;
            justify-content: flex-end;
        }
        .upload button{
            width: 130px;
            height: 40px;
            border: 2px solid #233d4d;
            background-color: #fff;
            margin: 10px;
            border-radius: 15px;
        }
        
        @media (max-width: 768px) {
            aside{
                border: 0;
                width: 100%;
                padding-top: 180px;
            }
            .asnse{
                width: 100%;
                display: inline-block;
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
            .contents{
                padding-top: 80px;
            }
            .side{
                padding: 10px;
                padding-top: 15px;
                border-radius: 15px;
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
                <li><input type="radio" id="total" name="selcate" value="전체보기"><label for="total" class="side">전체보기</label></li>
                <li><input type="radio" id="korean" name="selcate" value="한식"><label for="korean" class="side">한식</label></li>
                <li><input type="radio" id="western" name="selcate" value="양식"><label for="western" class="side">양식</label></li>
                <li><input type="radio" id="chinese" name="selcate" value="중식"><label for="chinese" class="side">중식</label></li>
                <li><input type="radio" id="japanese" name="selcate" value="일식"><label for="japanese" class="side">일식</label></li>
                <li><input type="radio" id="cafe" name="selcate" value="카페"><label for="cafe" class="side">카페</label></li>
                <li><input type="radio" id="bakerynd" name="selcate" value="베이커리/디저트"><label for="bakerynd" class="side">베이커리/디저트</label></li>
                <li><input type="radio" id="vege" name="selcate" value="채식"><label for="vege" class="side">채식</label></li>
                <li><input type="radio" id="etc" name="selcate" value="기타"><label for="etc" class="side">기타</label></li>
              </ul>
             </aside>
            <section>
               <div class="contents">
                   <input type="checkbox" id="envelope" name="fold" checked="checked">
                   <label for="envelope" class="folding">펼치기</label> 
                   <div class="select_menu">
                     <input type="radio" id="randombar" name="selmenu" checked="checked">
                     <label for="randombar" class="sct">메뉴고르기</label>
                     <div class="randombar">
                     	<div id="screen">
							<div class="nbwrap">
							<%
								NamebarDao nbdao = new NamebarDao();
                    		 	if(request.getAttribute("detailedfoodL")==null){
									Vector<CategoryBean> nbv = (Vector)request.getAttribute("foodList");
									
									for(int i=0; i<nbv.size(); i++){
							%>		
									<div class="nblist"><%=nbv.get(i).getFoodname() %></div>
							<% 		
									}								
								}else{
									Vector<CategoryBean> nbv = (Vector)request.getAttribute("detailedfoodL");
									for(int i=0; i<nbv.size(); i++){
							%>
									<div class="nblist"><%=nbv.get(i).getFoodname() %></div>
							<%
									}
								}	
							%>
							</div>
						</div>
						<div id="btnspart">
							<input type="button" value="시작" class="btnS">
							<input type="button" value="멈추기" class="btnP">
						    <input type="button" value="좋아요♡" class="favMenu" >
						</div>
                     </div>
                     <input type="radio" id="roulette" name="selmenu">
                     <label for="roulette" class="sct">룰렛돌리기</label>
                     <div class="roulette">여기에 룰렛</div>
                  </div>
                  <!-- <form action="search.do" method="post" name="frm"> -->
                  <div id="searchpart">
                      <div class="search">
                          <input type="text" name="search" class="schinput"><button class="startS"><i class="fas fa-search fa-2x" onclick="search()"></i></button>
                      </div>
                  </div>
                  <!-- </form> -->
                  <div class="tags">
                      <button class="tag">#tag1</button> <button class="tag">#tag2</button>
                      <button class="tag">#tag3</button> <button class="tag">#tag4</button>
                      <button class="tag">#tag5</button> <button class="tag">#tag6</button>
                      <button class="tag">#tag7</button> <button class="tag">#tag8</button>
                  </div>
                  <div class="fav_list">
                  <%
		                String pageidx = "1";
		              	if(request.getParameter("pageidx")!=null){
		              		pageidx = request.getParameter("pageidx");
		              	}		
                  		My_favlistDao dao = new My_favlistDao();
                  		
                  		if(request.getAttribute("searchR")==null){
                  			Vector<FavlistAndReviewBean> v = (Vector)request.getAttribute("resList");
                        	int totalpage = dao.getTotalPage();
                        	
                        	for(int i=0; i<v.size(); i++){ %>
                            <table class="review" cellspacing="10px">
                                <tr>
                                    <td rowspan="2"><div class="mainpic"><img src="upload/<%=v.get(i).getImgpath() %>"></div></td>
                                    <td rowspan="2"><a href="resdetail.do?mfl_idx=<%=v.get(i).getMfl_idx() %>"><%=v.get(i).getStorename() %></a></td>
                                    <td><%=v.get(i).getSido1() %> <%=v.get(i).getGugun1() %></td>
                                    <td rowspan="2">전체평점</td>
                                </tr>
                                <tr>
                                    <td><%=v.get(i).getCategory() %></td>
                                </tr>
                            </table>
                        	<%}
                        	int curr = Integer.parseInt(pageidx);
	  						  if(curr!=1){
		  					  %>
		  						  <a href="eatout.do?pageidx=1">[처음으로] </a>
		  						  <a href="eatout.do?pageidx=<%=curr-1 %>">[이전] </a>
		  					  <%	
		  						  }
		  					  %>
		                        <%for(int i=1; i<=totalpage; i++){ %>
		  						  <a href="eatout.do?pageidx=<%=i%>">[<%=i %>] </a>
		  					  <%
		  					  	  } 
		  						  if(curr!=totalpage){
		  					  %>
		  						  <a href="eatout.do?pageidx=<%=curr+1 %>">[다음] </a>
		  						  <a href="eatout.do?pageidx=<%=totalpage %>">[마지막] </a>
		  					  <%
		  						  }
		  					 	
                  		}else{
                  			Vector<FavlistAndReviewBean> v = (Vector)request.getAttribute("searchR");
                  			int totalpage = dao.getTotalPage();
                  			
                  			for(int i=0; i<v.size(); i++){ %>
                            <table class="review" cellspacing="10px">
                                <tr>
                                    <td rowspan="2"><div class="mainpic"><img src="upload/<%=v.get(i).getImgpath() %>"></div></td>
                                    <td rowspan="2"><a href="resdetail.do?mfl_idx=<%=v.get(i).getMfl_idx() %>"><%=v.get(i).getStorename() %></a></td>
                                    <td><%=v.get(i).getSido1() %> <%=v.get(i).getGugun1() %></td>
                                    <td rowspan="2">전체평점</td>
                                </tr>
                                <tr>
                                    <td><%=v.get(i).getCategory() %></td>
                                </tr>
                            </table>
                        	<%}
                        	int curr = Integer.parseInt(pageidx);
	  						  if(curr!=1){
		  					  %>
		  						  <a href="eatout.do?pageidx=1">[처음으로] </a>
		  						  <a href="eatout.do?pageidx=<%=curr-1 %>">[이전] </a>
		  					  <%	
		  						  }
		  					  %>
		                        <%for(int i=1; i<=totalpage; i++){ %>
		  						  <a href="eatout.do?pageidx=<%=i%>">[<%=i %>] </a>
		  					  <%
		  					  	  } 
		  						  if(curr!=totalpage){
		  					  %>
		  						  <a href="eatout.do?pageidx=<%=curr+1 %>">[다음] </a>
		  						  <a href="eatout.do?pageidx=<%=totalpage %>">[마지막] </a>
		  					  <%
		  						  }
                  			
                  		}
                  		%>
                  		
                  		
                  </div>
				  <div class="upload">
                      <button onclick=location.href='myfavres.do'>내 맛집 등록하기</button>
                  </div>
               </div>               
            </section>
        </div>
   </div>
   <footer><jsp:include page="footer.jsp"/></footer>
</div>

<script type="text/javascript">
$(document).ready(function(){
    var inter = null;
    var divH = $(".nbwrap").height();
    var menu = null;
    
    function startR(){
        inter = setInterval(function(){
             $(".nbwrap").animate({top: "-50px"}, 100, function(){
                var dt = $(".nblist").eq(0).detach();
                $(".nbwrap").css("top", "0px");
                $(".nbwrap").append(dt);
                menu = $(".nblist").eq(0).html();
            });
        }, 100); 
    }
    
    $(".btnP").click(function(){
        clearInterval(inter);
    });
    
    $(".btnS").click(function(){
        startR();
    });
    
    $(".favMenu").click(function(){
        //alert(menu);
        location.href = "putfavdata.do?foodname="+menu;
    });
    
    /* ============================================================= */
    
    $('input[type=radio][name=selcate]').change(function() {
    	
    	var id = this.id;
    	var value = this.value;
    	
    	location.href="namebar.do?selcate="+id;
    	
	});
    
    /* ============================================================= */
    
    /* function search(){
		var search = $(".schinput").val();
		if(search.trim().length == 0 || search.length ==0 || search==null){
			alert("검색어를 입력하세요");
		}else{
			location.href="search.do?search="+search;
		}
	} */
    
    
});

</script>

</body>
</html>