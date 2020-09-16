<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.Pocari.dto.CategoryBean"%>
<%@page import="com.Pocari.dto.RecipeBean"%>
<%@page import="com.Pocari.dao.RecipeDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>오늘 뭐먹지? 레시피 내용</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="headerstyle.css" />
<link rel="stylesheet" type="text/css" href="footerstyle.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 나눔고딕;
}

.flex {
	display: flex;
	flex-flow: row wrap;
}

#wrap {
	position: relative;
	width: 1366px;
	margin: 0 auto;
}
#middle {
	position: relative;
	padding-top: 50px;
	padding-bottom: 30px;
	margin: 0px auto;
}

.content {
	position: relative;
	width: 100%;
	padding: 20px;
	margin: 20px;
	border: 3px solid rgb(219, 219, 219);
	border-radius: 10px;
}

.need {
	width: 45%;
	padding: 20px;
	margin: 2.5%;
	border: 3px solid rgb(183, 194, 14);
	border-radius: 10px;
}

#title {
	width: calc(92.5% - 300px);
}

.need>ul>li {
	width: 100%;
	height: 30px;
}

.imgBox {
	position: relative;
	width: 300px;
	height: 300px;
	border-radius: 30px;
	border: 1px solid black;
	float: right;
	overflow: hidden;
}

.imgBox>img {
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 2;
}

.recipeOrder {
	width: 100%;
	padding: 20px;
	margin: 20px 5%;
	border: 3px solid rgb(183, 194, 14);
	border-radius: 10px;
}

.recipeOrder>.orderText {
	width: 100%;
	height: 100%;
}

.recipeOrder>.orderText>p {
	width: 100%;
	height: 100%;
}

.recipeOrder>.replyText {
	width: 85%;
	height: 100%;
}

.recipeOrder>.replyOption {
	width: 15%;
	height: 100%;
}

.replyButton {
	width: 30%;
	height: 100%;
	border: none;
	outline: none;
}

.like {
	background-color: blue;
}

.donlike {
	background-color: gray;
}

.tlsrh {
	background-color: red;
}

#likeBox {
	
}

#likeBox input {
	width: 100px;
	height: 50px;
	margin-right: 20px;
	font-size: 24px;
}

.content>input[type=number] {
	border: none;
	background: none;
	outline: none;
}

#shortcut {
	position: fixed;
	top: calc(50% - 200px);
	right: calc(((100% - 1366px)/4) - 50px);
	width: 100px;
	height: 400px;
}

#shortcut input {
	width: 100%;
	height: 50%;
	font-size: 20px;
}

@media ( max-width :768px) {
	#wrap {
		width: 768px;
	}
}
</style>
</head>
<body>
<%
String recipe_idx = request.getParameter("recipe_idx");
RecipeDAO dao = new RecipeDAO();
RecipeBean recipeBean = dao.getRecipeBean(recipe_idx);
CategoryBean categoryBean = dao.getCategoryBean(recipe_idx);
%>
	<header><jsp:include page="header.jsp"/></header>
	<!--    -------------------------------------------------------------------------->
	<!-- <div id="shortcut">
		<input type="button" id="top" value="TOP"> <input
			type="button" id="bottom" value="BOTTOM">
	</div> -->
	<div id="wrap" class="flex">
		<div id="middle" class="flex">
			<div class="content flex">
				<div class="need" id="title">
					<ul>
						<li>
							레시피 제목&nbsp;:&nbsp;<%=recipeBean.getRecipename()%><br><br>
							난이도&nbsp;:&nbsp;<%=recipeBean.getLevel()%><br><br>
							조리 시간&nbsp;:&nbsp;<%=recipeBean.getTime()%><br><br>
							#<%=categoryBean.getCategory()%>&nbsp;
							#<%=categoryBean.getRecipecate()%>
						</li>
					</ul>
				</div>
				<div class="imgBox">
					<img id="perview" src="image/<%=recipeBean.getImgpath()%>">
				</div>
			</div>
			<div class="content flex">
				<div class="need">
					<ul>
						<li>요리 재료</li>
						<li><%=recipeBean.getIngredient()%></li>
					</ul>
				</div>
				<div class="need">
					<ul>
						<li>소스 재료</li>
						<li><%=recipeBean.getSeasoning()%></li>
					</ul>
				</div>
				<div class="need">
					<ul>
						<li>요리 도구</li>
						<li><%=recipeBean.getTools()%></li>
					</ul>
				</div>
			</div>
			<div class="content flex">
				<div class="recipeOrder flex">
					<div class="orderText">
						<p><%=recipeBean.getContents()%></p>
					</div>
				</div>
			</div>
			<%-- <div class="content flex" style="border: none;">
				<div style="width: calc(100% - 500px);"></div>
				<div id="likeBox" class="flex">
					<button id="scrap" class="like" onclick="scraptoggle($(this))">
						scrap<input type="checkbox" checked="checked">
					</button>
					<input type="number" name="scrapCount" value="<%=recipeBean.getLikecount()%>" readonly> 
					<button id="like" class="like" onclick="liketoggle($(this))">
						like<input type="checkbox" checked="checked">
					</button>
					<input type="number" name="likeCount" value="<%=recipeBean.getScrapcount()%>" readonly>
				</div>
			</div> --%>
			<!-- <div class="content flex" id="reply">
				<div class="recipeOrder flex">
					<div class="replyText">
						<p>dasdasdasdasdasd</p>
					</div>
					<div class="replyOption">
						<input type="button" class="like replyButton"> <input
							type="button" class="donlike replyButton"> <input
							type="button" class="tlsrh replyButton">
					</div>
				</div>
			</div> -->
			<div style="width: calc(100% - 220px)"></div>
			<div class="insertTd">
				<input type="button" class="insert" value="뒤로" onclick="backToThePage()">
			</div>
		</div>
	</div>
	<!--    -------------------------------------------------------------------------->
	<footer><jsp:include page="footer.jsp"/></footer>
	
	<script>
		function backToThePage(){
			window.history.back();
		}
    </script>
</body>

</html>