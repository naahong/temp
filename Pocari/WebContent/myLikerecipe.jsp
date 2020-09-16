<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<c:choose>
<c:when test="${likerecipe.size()==0}">
	<article>아직 좋아하는 레시피가 없습니다!</article>
</c:when>
<c:otherwise>
	<c:forEach items="${likerecipe}" var="likeRecipeV">
	<c:choose>
		<c:when test="${likeRecipeV.imgpath eq null}">
			<article class="myrp" style="background-image:url('img/cherries1.jpg');">
		</c:when>
		<c:otherwise>
			<article class="myrp" style="background-image:url('image/${likeRecipeV.imgpath}');">
        </c:otherwise>
   	</c:choose>
        <div class="inmyrp" onclick="location.href='recipeContent.do?recipe_idx=${likeRecipeV.recipe_idx}'">
            <div>${likeRecipeV.recipename}</div><div>LEVEL</div><div>${likeRecipeV.level}</div>
        </div>
    	</article>
	</c:forEach>
	<div class="pageNum">
		<c:choose>
			<c:when test="${param.pageidx ne 1}">
				<a href="mypage.do?sectionis=likerecipe&pageidx=1"><button><i class="fas fa-angle-double-left"></i></button></a>
			</c:when>
			<c:when test="${param.pageidx ne 1}">
				<a href="mypage.do?sectionis=likerecipe&pageidx=${param.pageidx - 1}"><button><i class="fas fa-angle-left"></i></button></a>
			</c:when>
		</c:choose>
		<c:forEach var="i" begin="1" end="${lire_totalpage}" step="1">
			<c:choose>
				<c:when test="${param.pageidx eq i}">
					<a href="mypage.do?sectionis=likerecipe&pageidx=${i}"><button class="pagenow">${i}</button></a>
				</c:when>
				<c:otherwise>
					<a href="mypagedo?sectionis=likerecipe&pageidx=${i}"><button>${i}</button></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${param.pageidx < lire_totalpage}">
				<a href="mypage.do?sectionis=likerecipe&pageidx=${param.pageidx + 1}"><button><i class="fas fa-angle-right"></i></button></a>
			</c:when>
			<c:when test="${param.pageidx ne lire_totalpage}">
			
				<a href="mypage.do?sectionis=likerecipe&pageidx=${lire_totalpage}"><button><i class="fas fa-angle-double-right"></i></button></a>
			</c:when>
		</c:choose>
	</div>
</c:otherwise>
</c:choose>