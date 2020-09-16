<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.Pocari.dto.CategoryBean"%>
<%@page import="com.Pocari.dao.RecipeDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.Pocari.dto.RecipeBean"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>오늘 뭐먹지? 레시피 검색</title>
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

#searchBox {
	position: relative;
	width: 600px;
	margin: 0 auto;
	padding-bottom: 20px;
}

#search {
	width: 500px;
	height: 80px;
	padding: 10px;
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
	font-size: 30px;
}

#searchButton {
	width: 98px;
	height: 80px;
	border-top-right-radius: 30px;
	border-bottom-right-radius: 30px;
	font-size: 24px;
}

#sideBar {
	position: relative;
	width: 20%;
	padding: 20px;
	background-color: rgb(252, 202, 70);
	z-index: 3;
}

#sideBarImage {
	width: 100%;
	padding-bottom: 20px;
}

#sideBar>ul>li input[type=radio] {
	display: none;
}

#sideBar>ul>li {
	width: 100%;
	height: 80px;
	padding-bottom: 10px;
	border-top: 2px solid blue;
}

#sideBar>ul>li:last-child {
	border-bottom: 2px solid blue;
}

#sideBar>ul>li label {
	position: relative;
	top: calc(50% - 12px);
	left: 10px;
	font-size: 24px;
}

#sideBar>ul>li label:hover {
	color: white;
}

#category {
	width: 900px;
	border: 2px solid black;
	border-radius: 10px;
}

#category>ul {
	padding: 5px;
}

#category>ul>li {
	padding: 5px;
}

.tag {
	min-width: 70px;
	height: 30px;
	padding: 0px 10px;
	margin: 0px 5px;
	border-radius: 15px;
	font-size: 14px;
	background-color: gray;
	color: white;
	outline: none;
}

.tag>input[type=radio] {
	display: none;
}

#category>ul>li>input[type=number] {
	width: 70px;
}

#middle {
	position: relative;
	width: 80%;
	padding: 20px;
}

#middleTopBox {
	margin: 0 auto;
}

.result {
	width: 100%;
	height: 300px;
	padding: 20px;
}

.result img {
	width: 30%;
	height: 100%;
	border-left: 3px solid rgb(219, 219, 219);
	border-top: 3px solid rgb(219, 219, 219);
	border-bottom: 3px solid rgb(219, 219, 219);
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
}

.resultcontent {
	width: 70%;
	height: 100%;
	padding: 20px;
	border: 3px solid rgb(219, 219, 219);
	border-top-right-radius: 30px;
	border-bottom-right-radius: 30px;
}

.recipeTag {
	width: 70px;
	height: 30px;
	outline: none;
	border-radius: 10px;
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
RecipeBean recipeBean = new RecipeBean();
recipeBean.setLevel(request.getParameter("level"));
recipeBean.setTime(request.getParameter("hour")+"H"+request.getParameter("minute")+"M");

CategoryBean categoryBean = new CategoryBean();
categoryBean.setCategory(request.getParameter("category"));
categoryBean.setRecipecate(request.getParameter("recipecate"));

RecipeDAO dao = new RecipeDAO();
String[] imgpath = dao.imgpath(request.getParameter("search"), recipeBean, categoryBean);
String[] recipe_idx = dao.recipe_idx(request.getParameter("search"), recipeBean, categoryBean);
%>
	<header><jsp:include page="header.jsp"/></header>
	<!--    -------------------------------------------------------------------------->
	<div id="wrap" class="flex">
		<div id="sideBar">
			<img src="image/logo.png" alt="" id="sideBarImage">
			<ul>
				<li>
					<label><input type="button" onclick="location.href='recipeMain.do'">홈</label>
				</li>
				<li>
					<label><input type="button" onclick="location.href='recipeInsert.do'">레시피 쓰기</label>
				</li>
			</ul>
		</div>
		<div id="middle" class="flex">
			<div id="middleTopBox">
				<form action="recipeSearch.jsp">
					<div id="searchBox" class="flex">
						<input type="text" id="search" name="search" value="<%=request.getParameter("search")%>"> <input
							type="submit" id="searchButton" value="검색">
					</div>
					<div id="category">
						<ul>
							<li>카테고리
								<button type="button" class="tag" onclick="selectRadio($(this))">
									한식<input type="radio" value="한식" name="category">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									중식<input type="radio" value="중식" name="category">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									일식<input type="radio" value="일식" name="category">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									양식<input type="radio" value="양식" name="category">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									아시아<input type="radio" value="아시아" name="category">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									기타<input type="radio" value="기타" name="category">
								</button>
							</li>
							<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="tag" onclick="selectRadio($(this))">
									면류<input type="radio" value="면류" name="recipecate">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									밥류<input type="radio" value="밥류" name="recipecate">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									생선<input type="radio" value="생선" name="recipecate">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									육류<input type="radio" value="육류" name="recipecate">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									국,찌개<input type="radio" value="국,찌개" name="recipecate">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									기타<input type="radio" value="기타" name="recipecate">
								</button>
							</li>
							<li>조리 난이도
								<button type="button" class="tag" onclick="selectRadio($(this))">
									초급<input type="radio" value="초급" name="level">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									중급<input type="radio" value="중급" name="level">
								</button>
								<button type="button" class="tag" onclick="selectRadio($(this))">
									고급<input type="radio" value="고급" name="level">
								</button>
							</li>
							<li>
								조리 시간 
								<input type="number" class="tag" name="hour" min="0" max="24" maxlength="2" value="<%=request.getParameter("hour")%>" oninput="numberMaxLength(this);">H
								<input type="number" class="tag" name="minute" min="0" max="59" maxlength="2" value="<%=request.getParameter("minute")%>" oninput="numberMaxLength(this);">M
							</li>
						</ul>
					</div>
				</form>
			</div>
			<%
        	for(int i = 0;i < imgpath.length ;i++){
        		RecipeBean bean = dao.getRecipeBean(recipe_idx[i]);
        		CategoryBean bean1 = dao.getCategoryBean(recipe_idx[i]);
        		String path = "image/"+imgpath[i];
        	%>
        	<label onclick="location.href='recipeContent.do?recipe_idx=<%=recipe_idx[i]%>'">
	        	<div class="result flex">
					<img src="<%=path%>" class="recipeImg">
					<div class="resultcontent">
						<table>
							<tr>
								<td>레시피 제목 : &nbsp;&nbsp;</td>
								<td><%=bean.getRecipename()%></td>
							</tr>
							<tr>
								<td>카테고리 : </td>
								<td><input type="text" class="recipeTag" value="<%=bean1.getCategory()%>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" class="recipeTag" value="<%=bean1.getRecipecate()%>"></td>
							</tr>
							<tr>
								<td>난이도 : </td>
								<td><input type="text" class="recipeTag" value="<%=bean.getLevel()%>"></td>
							</tr>
							<tr>
								<td>조리 시간 : </td>
								<td><input type="text" class="recipeTag" value="<%=bean.getTime()%>"></td>
							</tr>
						</table>
					</div>
				</div>
			</label>
			<%
        	}
			%>
		</div>
	</div>
	<!--    -------------------------------------------------------------------------->
	<footer><jsp:include page="footer.jsp"/></footer>
	
	<script>
		function selectRadio(e) {
	        e.children(":first").prop("checked", true);
	        viewSelect();
	    }
	    $(window).load(function(){
	    	getCategory();
	    	viewSelect();
	    });
	    function viewSelect(){
			var button = $("button[class=tag]");
			for (var i = 0; i < button.length; i++) {
			    if ($(button[i]).children(":first").is(":checked") == true) {
			        $(button[i]).css("background-color", "white");
			        $(button[i]).css("color", "black");
			    } else {
			        $(button[i]).css("background-color", "gray");
			        $(button[i]).css("color", "white");
			    }
			}
	    }
	    function numberMaxLength(e){
	        if(e.value.length > e.maxLength){
	            e.value = e.value.slice(0, e.maxLength);
	        }
	    }
	    function getCategory() {
	    	var radio1 = $("button[class=tag]>input[name=category]");
	    	var radio2 = $("button[class=tag]>input[name=recipecate]");
	    	var radio3 = $("button[class=tag]>input[name=level]");
	    	var category = "<%=request.getParameter("category")%>";
	    	var recipecate = "<%=request.getParameter("recipecate")%>";
	    	var level = "<%=request.getParameter("level")%>";
			for (var i = 0; i < radio1.length; i++) {
			    if ($(radio1[i]).val() == category) {
			        $(radio1[i]).prop("checked", true);
			    }
			}
			for (var i = 0; i < radio2.length; i++) {
			    if ($(radio2[i]).val() == recipecate) {
			        $(radio2[i]).prop("checked", true);
			    }
			}
			for (var i = 0; i < radio3.length; i++) {
			    if ($(radio3[i]).val() == level) {
			        $(radio3[i]).prop("checked", true);
			    }
			}
		}
    </script>
</body>

</html>