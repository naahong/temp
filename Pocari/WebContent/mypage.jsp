<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>오늘 뭐먹지? 마이페이지</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" type="text/css" href="headerstyle.css" />
    <link rel="stylesheet" type="text/css" href="footerstyle.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <style>
        *{margin: 0; padding: 0; box-sizing: border-box; font-family: 나눔고딕;}
        
        .middle{position: relative; top: 100px; margin: 0 auto; display: flex; flex-flow: row wrap; width: 1366px;}
        nav{width: 100%; height: 200px; background-image: url(img/restaurant.png); background-size: cover; background-position: center;}
        nav>div{padding-top: 90px; padding-left: 50px; color: white; font-size: 70px; text-shadow: 0px 0px 1px black;}
        nav>div>b{padding-left: 20px;}
        
        aside{padding-top: 40px; padding-left: 60px; width: 25%; height: auto;}
        aside>ul{width: 70%; color: #233d4d;}
        aside>ul>li{margin-bottom: 10px; width: 100%; line-height: 40px; font-size: 20px; text-align: left; border-bottom: 2px solid #a1c181;}
        aside .pa{padding-left: 0; font-size: 20px; background-color: white;}
        aside>ul>li>ul{display: none; background-color: white;}
        
        #menu1, #menu2, #menu3, #menu4, #menu5{display: none;}
        #menu1:checked ~ul,#menu2:checked ~ul,#menu3:checked ~ul{display: block;}
        .submenu{padding-left: 10px; font-size: 18px; background-color: white;}
        
        section{display: flex; flex-flow: row wrap; width: 75%; min-height: 500px;}
        #recipe,#likerecipe,#scraprecipe{padding-top: 30px;}
        .myrp{margin: 10px; overflow: hidden; width: 235px; height: 350px; background-size: cover; background-position: center;}
        .myrp:hover .inmyrp{left: 0; opacity: 1;}
        .inmyrp{position: relative; left: -235px; padding-top: 30%; width: 100%; height: 100%; text-align: center; background-color:rgba(255,255,255,0.8); opacity: 0; color: #233d4d; transition: all .7s;}
        .inmyrp>div:first-child{font-size: 30px;  font-weight: bold; }
        .inmyrp>div:nth-child(2){padding-top: 15px; font-size: 20px;}
        .inmyrp>div:nth-child(3){padding-top: 15px; font-size: 30px;}
        .tagsearch{padding-top: 10px; padding-left: 60%; width: 100%; height: 50px;}
        .search{padding-left: 20px; width: 330px; height: 30px; background-color: white; border-radius: 25px; border: 1px solid black; overflow: hidden;}
        .search input[type=text]{border: 0;}
        .search button{width: 30px; height: 30px; border: 0; background-color: transparent;}
        .rst,.sstore{padding: 30px 50px 30px 10px; width: 100%;}
        .rst>table,.sstore>table{padding-left:20px; width: 100%; border: 1px solid #fe7f2d;}
        .rst>table tr,.sstore>table tr{height: 60px;}
        .storename{font-weight: bold;}
        .sstore{height: 120px;}
        
        #review>article{padding: 50px 50px 50px 10px; width: 100%;}
        .retable{margin-bottom: 10px; width: 100%; border: 1px solid #fe7f2d; border-collapse: collapse; text-align: left;}
        .retable td{padding: 15px 10px 10px 20px;}
        .retable>thead td:first-child{font-size: 20px; font-weight: bold;}
        .retable>thead td:nth-child(2){padding-right: 20px; color: dimgray; text-align: end;}
        .retable>tbody tr:first-child td{width: 14%;}
        .retable>tfoot .tag{padding: 5px 10px; font-size:14px; color: #fe7f2d; border:1px solid #fe7f2d; border-radius: 20px;}
        
        #updateinfo{padding: 50px 50px 50px 10px;}
        #updateinfo table{padding: 20px 20px 0 20px; width: 100%; border: 1px solid black; table-layout: fixed;}
        #updateinfo table td{height: 40px;}
        #updateinfo table td:first-child{width: 130px;}
        #updateinfo #id{border:0;}
        #updateinfo #resPW{font-size:0; color: red;}
        #undatebtn{text-align: center;}
        #undatebtn input{margin-right: 10px; width: 100px; height: 30px; background-color: #fe7f2d; border: 0; border-radius: 5px; color: white; font-size: 16px;}
        
	    .pageNum{padding-top:10px; width:100%; text-align: center;}
	    .pageNum button{width: 25px; height: 25px; color: black; font-size: 17px; background-color: transparent; border:0;}
	    .pageNum .pagenow{color: white; background-color: black;}
        
        @media(max-width:768px){
            nav>div{padding-left: 30px; font-size: 50px;}
            .middle{width: 100%;}
            aside{padding: 0; width: 100%; z-index: 3; border-top: 1px solid #fe7f2d; border-bottom: 1px solid #fe7f2d;}
            aside>ul{display: flex; justify-content: space-around; width: 100%; height: 60px;}
            aside>ul li, aside .pa{width: 140px; font-size: 15px; text-align: center; line-height: 60px; border-bottom: 0;}
            aside>ul>li>ul{border: 1px solid #fe7f2d; flex-flow:row wrap;}
            .submenu{padding: 0; width: 130px; font-size: 15px; line-height: 40px;}
            section{width: 100%; margin: 0 auto; z-index: 2;}
            .tagsearch{padding: 0px;}
            .rst,.sstore,#review>article{padding: 30px;}
            .retable>tbody td:nth-child(2n){width: 50px;}
            .myrp{width: 50%; margin: 0 0 10px 0;}
            .inmyrp{left: 0; background-color: rgba(255,255,255,0.5); opacity: 1;}
            .retable>tbody tr:first-child td{width: auto; font-size: 13px;}
            #updateinfo{padding: 20px;}
            #updateinfo table td{height: 45px;}
            #updateinfo input[type=text],#updateinfo input[type=email],#updateinfo input[type=password],
            #updateinfo input[type=tel]{width:auto; font-weight: bold;}
        }
        @media(max-width:640px){
            aside>ul{height: 50px;}
            aside>ul li, aside .pa{width: 95px; font-size: 13px; line-height: 50px;}
            .submenu{width: 93px; font-size: 12px; line-height: 35px;}
        }
    </style>
</head>
<body>
<%
String loginid = (String)session.getAttribute("loginid");
if(loginid==null || loginid.equals("null")){%>
	<script>
		alert("로그인 하세요!");
		location.href="mainPage.do";
	</script>
<%}%>
<div class="wrap">
    <header><jsp:include page="header.jsp"/></header>
    <div class="middle">
    <nav>
        <div><i class="fas fa-user-circle"></i><b>${memberinfo.id}</b></div>
    </nav>
    <aside>
        <ul>
            <li><input type="radio" id="menu1" name="menu"><label for="menu1">글 쓰 기</label>
                <ul>
                    <li class="submenu" onclick="location.href='myfavres.do'">맛집 등록</li>
                    <li class="submenu" onclick="location.href='recipeInsert.do'">레시피 작성</li>
                </ul>
            </li>
            <li><input type="radio" id="menu2" name="menu"><label for="menu2">내가 쓴 글 관리</label>
                <ul>
                    <li class="submenu" id="sub_restaurant" onclick="location.href='mypage.do?sectionis=restaurant&pageidx=1'">맛집 리스트</li>
                    <li class="submenu" id="sub_recipe" onclick="location.href='mypage.do?sectionis=recipe&pageidx=1'"> 레시피</li>
                    <li class="submenu" id="sub_review" onclick="location.href='mypage.do?sectionis=review&pageidx=1'">나의 리뷰들</li>
                </ul>
            </li>
            <li><input type="radio" id="menu3" name="menu"><label for="menu3">레시피 관리</label>
                <ul>
                    <li class="submenu" id="sub_likerecipe" onclick="location.href='mypage.do?sectionis=likerecipe&pageidx=1'">좋아요 레시피</li>
                    <li class="submenu" id="sub_scraprecipe" onclick="location.href='mypage.do?sectionis=scraprecipe&pageidx=1'">스크랩한 레시피</li>
                </ul>
            </li>
            <li class="submenu pa" id="sub_savestore" onclick="location.href='mypage.do?sectionis=savestore&pageidx=1'">
            	<input type="radio" id="menu4" name="menu"><label for="menu4">찜한 맛집</label>
            </li>
            <li class="submenu pa" id="sub_updateinfo" onclick="location.href='mypage.do?sectionis=updateinfo'">
            	<input type="radio" id="menu5" name="menu"><label for="menu5">내 정보 수정</label>
            </li>
        </ul>
    </aside>
    <c:choose>
    	<c:when test="${param.sectionis eq 'restaurant'}">
    		<section id="restaurant"><%@include file="myRestaurant.jsp"%></section>
    	</c:when>
    	<c:when test="${param.sectionis eq 'recipe'}">
    		<section id="recipe"><%@include file="myRecipe.jsp"%></section>
    	</c:when>
    	<c:when test="${param.sectionis eq 'review'}">
    		<section id="review"><%@include file="myReview.jsp"%></section>
    	</c:when>
    	<c:when test="${param.sectionis eq 'likerecipe'}">
    		<section id="likerecipe"><%@include file="myLikerecipe.jsp"%></section>
    	</c:when>
    	<c:when test="${param.sectionis eq 'scraprecipe'}">
    		<section id="scraprecipe"><%@include file="myScraprecipe.jsp"%></section>
    	</c:when>
    	<c:when test="${param.sectionis eq 'savestore'}">
    		<section id="savestore"><%@include file="mySavestore.jsp"%></section>
    	</c:when>
    	<c:when test="${param.sectionis eq 'updateinfo'}">
    		<section id="updateinfo"><%@include file="myUpdateinfo.jsp"%></section>
    	</c:when>
    </c:choose>
    </div>
    <footer><jsp:include page="footer.jsp"/></footer>
</div>
<script>
    function withdraw(){
    	var withdraw = confirm("정말 탈퇴하시겠습니까?");
    	if(withdraw){location.href = "withdraw.do";}
    }
    function update(){
    	var pw1 = $("#pw1").val();
        var pw2 = $("#pw2").val();
    	if(pw1 != pw2){
    		alert("비밀번호를 확인해주세요.")
    	}else{
    		updatemem.submit();
    	}
    }
    function search(tablename){
    	var keyword = document.getElementById("search_"+tablename).value;
    	if(tablename=="my_favlist"){
    		location.href = "mypage.do?sectionis=restaurant&pageidx=1&where="+tablename+"&keyword="+keyword;
    	}else if(tablename=="save_store"){
    		location.href = "mypage.do?sectionis=savestore&pageidx=1&where="+tablename+"&keyword="+keyword;
    	}
    }
    function movepageinx(tablename,pageidx){
    	var keyword1 = document.getElementById("search_"+tablename).value;
    	if(tablename=="my_favlist"){
    		sectionname = "restaurant";
    	}else if(tablename=="save_store"){
    		sectionname = "savestore";
    	}
    	location.href="mypage.do?sectionis="+sectionname+"&pageidx="+pageidx+"&where="+tablename+"&keyword="+keyword1;
    }
    
    $(document).ready(function(){
    	var params = location.search.substring(1).split("&");
    	var sectionid;
    	for(var i=0; i<params.length; i++){
    		var param = params[i].split("=");
    		if(param[0]=="sectionis"){
    			sectionid = param[1];
    		}
    	};
    	var li = '#sub_'+sectionid;
    	$(li).css('color','#a1c181');
    	if(window.outerWidth<768){
    		$('[name="menu"]').prop("checked",false);
    	}else{
    		$(li).parent().css("display","block");
    	}
        
        $("#pw2").keyup(function(){
            var pw2 = $("#pw2").val();
            var pw1 = $("#pw1").val();
            if(pw1!=pw2){
                $("#resPW").css("fontSize","13px");
            }else{
            	$("#resPW").css("fontSize","0px");
            }
        });
    });
</script>
</body>
</html>