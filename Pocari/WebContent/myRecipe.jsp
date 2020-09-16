<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<c:choose>
<c:when test="${myrecipes.size()==0}">
	<article>아직 작성한 레시피가 없습니다!</article>
</c:when>
<c:otherwise>
	<c:forEach items="${myrecipes}" var="myrecipeV">
		<c:choose>
			<c:when test="${myrecipeV.imgpath eq null}">
				<article class="myrp" style="background-image:url('img/kitchen1.jpg');">
			</c:when>
			<c:otherwise>
				<article class="myrp" style="background-image:url('image/${myrecipeV.imgpath}');">
	        </c:otherwise>
	   	</c:choose>
	        <div class="inmyrp" onclick="location.href='recipeContent.do?recipe_idx=${myrecipeV.recipe_idx}'">
	            <div>${myrecipeV.recipename}</div><div>LEVEL</div><div>${myrecipeV.level}</div>
	        </div>
	    	</article>
	</c:forEach>
	<div class="pageNum">
		<c:choose>
			<c:when test="${param.pageidx ne 1}">
				<a href="mypage.do?sectionis=recipe&pageidx=1"><button><i class="fas fa-angle-double-left"></i></button></a>
			</c:when>
			<c:when test="${param.pageidx ne 1}">
				<a href="mypage.do?sectionis=recipe&pageidx=${param.pageidx - 1}"><button><i class="fas fa-angle-left"></i></button></a>
			</c:when>
		</c:choose>
		<c:forEach var="i" begin="1" end="${re_totalpage}" step="1">
			<c:choose>
				<c:when test="${param.pageidx eq i}">
					<a href="mypage.do?sectionis=recipe&pageidx=${i}"><button class="pagenow">${i}</button></a>
				</c:when>
				<c:otherwise>
					<a href="mypagedo?sectionis=recipe&pageidx=${i}"><button>${i}</button></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${param.pageidx < re_totalpage}">
				<a href="mypage.do?sectionis=recipe&pageidx=${param.pageidx + 1}"><button><i class="fas fa-angle-right"></i></button></a>
			</c:when>
			<c:when test="${param.pageidx ne re_totalpage}">
			
				<a href="mypage.do?sectionis=recipe&pageidx=${re_totalpage}"><button><i class="fas fa-angle-double-right"></i></button></a>
			</c:when>
		</c:choose>
	</div>
</c:otherwise>
</c:choose>