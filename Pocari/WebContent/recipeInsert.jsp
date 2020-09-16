<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>오늘 뭐먹지? 레시피 작성</title>
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

.insertMenu {
	width: 100%;
}

.menuTop {
	width: 100%;
	height: 50px;
	padding: 10px;
	font-size: 24px;
	background-color: green;
	color: white;
}

.menuContent {
	width: 100%;
	border: 1px solid black;
}

table {
	margin: 0 auto;
	font-size: 24px;
}

td {
	width: 100%;
	padding: 10px;
}

td>input {
	font-size: 24px;
}

.insertTd {
	text-align: right;
}

.insert {
	width: 200px;
	margin-bottom: 30px;
}

#category {
	width: 100%;
	border: 3px solid rgb(183, 194, 14);
	border-radius: 10px;
}

#category>ul {
	padding: 5px;
}

#category>ul>li {
	padding: 5px;
}

#category>ul>li>input[type=number] {
	width: 70px;
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

.recipeOrder {
	width: 100%;
	height: 400px;
	padding: 20px;
	margin-bottom: 20px;
	border: 3px solid rgb(183, 194, 14);
	border-radius: 10px;
}

.recipeOrderPlus {
	position: relative;
	width: 100%;
	height: 100px;
	padding: 20px;
	border: 3px solid rgb(183, 194, 14);
	border-radius: 10px;
}

.recipeOrder>.orderText {
	width: 100%;
	height: 100%;
}

.recipeOrder>.orderText>textarea {
	width: 100%;
	height: 100%;
	padding: 20px;
	border: 2px solid rgb(219, 219, 219);
	border-radius: 30px;
	outline: none;
	font-size: 24px;
	resize: none;
}

.recipeOrder>.orderText>.textNumber {
	width: 100%;
	height: 15%;
	padding: 0px 20px;
	margin-bottom: 10px;
	font-size: 24px;
	border: 2px solid rgb(219, 219, 219);
	border-radius: 10px;
	outline: none;
}

.recipeOrder>.replyText {
	width: 85%;
	height: 100%;
}

#recipeTitle {
	width: calc(100% - 300px);
	position: relative;
	top: 50%;
}

#recipeTitle>div {
	position: relative;
	top: calc(50% - 36px);
}

#recipeTitle>div>input {
	width: 50%;
	height: 50px;
	padding: 0px 20px;
	font-size: 24px;
	border: 2px solid rgb(219, 219, 219);
	border-radius: 10px;
	outline: none;
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

.imgBox>label>input[type=file] {
	display: none;
}

.imgBox>label {
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 3;
}

.imgBox>img {
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 2;
}

.plus {
	position: absolute;
	top: calc(50% - 50px);
	left: calc(50% - 50px);
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background-color: gray;
	z-index: 1;
}

.recipeOrderPlus>.plus {
	position: absolute;
	top: calc(50% - 25px);
	left: calc(50% - 25px);
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: gray;
	z-index: 1;
}

.needPlus>.plus {
	position: absolute;
	top: calc(50% - 25px);
	left: calc(50% - 25px);
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: gray;
	z-index: 1;
}

.recipeOrderPlus>label {
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 3;
}

.recipeOrderPlus>label>input {
	display: none;
}

.needPlus>label {
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 3;
}

.needPlus>label>input {
	display: none;
}

.content {
	position: relative;
	width: 100%;
	min-height: 300px;
	padding: 20px;
	border: 3px solid rgb(219, 219, 219);
	border-radius: 10px;
}

.need {
	width: 48%;
	min-height: 100%;
	padding: 20px;
	margin: 1%;
	border: 3px solid rgb(183, 194, 14);
	border-radius: 10px;
}

.needPlus {
	position: relative;
	width: 48%;
	padding: 20px;
	margin: 1%;
	border: 3px solid rgb(183, 194, 14);
	border-radius: 10px;
}

.need>ul>li:first-child {
	margin-bottom: 10px;
}

.need>ul>li:last-child {
	min-height: 200px;
}

.need>ul {
	height: 100%;
	;
}

.need>ul>li>textarea {
	width: 100%;
	min-height: 200px;
	padding: 20px;
	border: 2px solid rgb(219, 219, 219);
	border-radius: 30px;
	outline: none;
	font-size: 24px;
	resize: none;
}
@media ( max-width :768px) {
	#wrap {
		width: 768px;
	}
}
</style>
</head>

<body>
	<header><jsp:include page="header.jsp"/></header>
	<div style="height: 100px;"></div>
	<!--    -------------------------------------------------------------------------->
	<form action="insertRecipe.do" method="post" enctype="multipart/form-data">
		<div id="wrap" class="flex">
			<div class="insertMenu">
				<div class="menuTop">레시피 등록</div>
				<div class="menuContent">
					<table>
						<tr>
							<td class="flex">
								<div id="recipeTitle">
									<div>
										<p>레시피 제목</p>
										<input type="text" class="recipeTitle" name="recipename" required>
										<p>요리명</p>
										<input type="text" class="recipeTitle" name="foodname" required><!-- 중복체크 -->
									</div>
								</div>
								<div class="imgBox">
									<label>
										<input type="file" name="imgpath" id="fileSelect" accept=".jpg,.png" required>
									</label>
										<img id="perview">
									<div class="plus"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="category">
									<ul>
										<li>카테고리
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												한식<input type="radio" value="한식" name="category" required>
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												중식<input type="radio" value="중식" name="category">
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												일식<input type="radio" value="일식" name="category">
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												양식<input type="radio" value="양식" name="category">
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												아시아<input type="radio" value="아시아" name="category">
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												기타<input type="radio" value="기타" name="category">
											</button>
										</li>
										<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												면류<input type="radio" value="면류" name="recipecate" required>
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												밥류<input type="radio" value="밥류" name="recipecate">
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												생선<input type="radio" value="생선" name="recipecate">
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												육류<input type="radio" value="육류" name="recipecate">
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												국,찌개<input type="radio" value="국,찌개" name="recipecate">
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												기타<input type="radio" value="기타" name="recipecate">
											</button>
										</li>
										<li>조리 난이도
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												초급<input type="radio" value="초급" name="level" required>
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												중급<input type="radio" value="중급" name="level">
											</button>
											<button type="button" class="tag"
												onclick="selectRadio($(this))">
												고급<input type="radio" value="고급" name="level">
											</button>
										</li>
										<li>
											조리 시간 
											<input type="number" class="tag" name="hour" min="0" max="24" maxlength="2" oninput="numberMaxLength(this);" required>H
											<input type="number" class="tag" name="minute" min="0" max="59" maxlength="2" oninput="numberMaxLength(this);">M
										</li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<td>재료</td>
						</tr>
						<tr>
							<td>
								<div class="content flex">
									<div class="need">
										<ul>
											<li>요리 재료</li>
											<li><textarea name="ingredient" required></textarea></li>
										</ul>
									</div>
									<div class="need">
										<ul>
											<li>소스 재료</li>
											<li><textarea name="seasoning"></textarea></li>
										</ul>
									</div>
									<div class="need">
										<ul>
											<li>요리 도구</li>
											<li><textarea name="tools"></textarea></li>
										</ul>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>내용</td>
						</tr>
						<tr>
							<td>
								<div class="recipeOrder flex">
									<div class="orderText">
										<textarea name="contents" required></textarea>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="insertTd">
								<input type="submit" class="insert" value="작성">
								<input type="button" class="insert" value="취소" onclick="backToThePage()">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
	<!--    -------------------------------------------------------------------------->
	<footer><jsp:include page="footer.jsp"/></footer>
	
	<script>
	function selectRadio(e) {
        e.children(":first").prop("checked", true);
    }

    $(document).ready(function() {
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#perview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#fileSelect").change(function() {
            readURL(this);
        });
        $("button").click(function() {
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
        });
    });
    function numberMaxLength(e){
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
    }
    function backToThePage(){
		window.history.back();
	}
    </script>
</body>

</html>