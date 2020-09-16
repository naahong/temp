<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<c:choose>
<c:when test="${scraprecipe.size()==0}">
	<article>아직 스크랩한 레시피가 없습니다!</article>
</c:when>
<c:otherwise>
	<c:forEach items="${scraprecipe}" var="scrapRecipeV">
	<c:choose>
		<c:when test="${scrapRecipeV.imgpath eq null}">
			<article class="myrp" style="background-image:url('img/lemons.jpg');">
		</c:when>
		<c:otherwise>
			<article class="myrp" style="background-image:url('image/${scrapRecipeV.imgpath})';">
        </c:otherwise>
   	</c:choose>
        <div class="inmyrp" onclick="location.href='recipeContent.do?recipe_idx=${scrapRecipeV.recipe_idx}'">
            <div>${scrapRecipeV.recipename}</div><div>LEVEL</div><div>${scrapRecipeV.level}</div>
        </div>
    	</article>
	</c:forEach>
	<div class="pageNum">
		<c:choose>
			<c:when test="${param.pageidx ne 1}">
				<a href="mypage.do?sectionis=scraprecipe&pageidx=1"><button><i class="fas fa-angle-double-left"></i></button></a>
			</c:when>
			<c:when test="${param.pageidx ne 1}">
				<a href="mypage.do?sectionis=scraprecipe&pageidx=${param.pageidx - 1}"><button><i class="fas fa-angle-left"></i></button></a>
			</c:when>
		</c:choose>
		<c:forEach var="i" begin="1" end="${scre_totalpage}" step="1">
			<c:choose>
				<c:when test="${param.pageidx eq i}">
					<a href="mypage.do?sectionis=scraprecipe&pageidx=${i}"><button class="pagenow">${i}</button></a>
				</c:when>
				<c:otherwise>
					<a href="mypagedo?sectionis=scraprecipe&pageidx=${i}"><button>${i}</button></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${param.pageidx < scre_totalpage}">
				<a href="mypage.do?sectionis=scraprecipe&pageidx=${param.pageidx + 1}"><button><i class="fas fa-angle-right"></i></button></a>
			</c:when>
			<c:when test="${param.pageidx ne scre_totalpage}">
			
				<a href="mypage.do?sectionis=scraprecipe&pageidx=${scre_totalpage}"><button><i class="fas fa-angle-double-right"></i></button></a>
			</c:when>
		</c:choose>
	</div>
</c:otherwise>
</c:choose>