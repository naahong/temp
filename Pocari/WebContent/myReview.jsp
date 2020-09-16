<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<c:choose>
<c:when test="${myreviews.size()==0}">
	<article>아직 등록한 리뷰가 없습니다!</article>
</c:when>
<c:otherwise>
<article>
<c:forEach items="${myreviews}" var="myreviewsV">
	<table class="retable">
        <thead>
        <tr>
            <td colspan="4" onclick="location.href='resdetail.do?mfl_idx=${myreviewsV.mfl_idx}'">${myreviewsV.storename}</td>
            <td colspan="3">${myreviewsV.date}</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>분위기&nbsp;&nbsp; ${myreviewsV.atmosphere}</td>
            <td>서비스&nbsp;&nbsp; ${myreviewsV.service}</td>
            <td>위생&nbsp;&nbsp; ${myreviewsV.sanitary}</td>
            <td>맛&nbsp;&nbsp; ${myreviewsV.flavor}</td>
            <td>양&nbsp;&nbsp; ${myreviewsV.portions}</td>
            <td>가격&nbsp;&nbsp; ${myreviewsV.price}</td>
            <td>전체평점&nbsp;&nbsp; ${myreviewsV.star}</td>
        </tr>
        <tr><td colspan="7">${myreviewsV.comment}</td></tr>
        </tbody>
        <tfoot>
        <tr>
        	<td colspan="7">
        	<c:forTokens items="${myreviewsV.r_tag}" delims="," var="tags">
        		<span class="tag">#${tags}</span></c:forTokens>
        	</td>
        </tr>
        </tfoot>
    </table>
</c:forEach>
<div class="pageNum">
	<c:choose>
		<c:when test="${param.pageidx ne 1}">
			<a href="mypage.do?sectionis=review&pageidx=1"><button><i class="fas fa-angle-double-left"></i></button></a>
		</c:when>
		<c:when test="${param.pageidx ne 1}">
			<a href="mypage.do?sectionis=review&pageidx=${param.pageidx - 1}"><button><i class="fas fa-angle-left"></i></button></a>
		</c:when>
	</c:choose>
	<c:forEach var="i" begin="1" end="${rv_totalpage}" step="1">
		<c:choose>
			<c:when test="${param.pageidx eq i}">
				<a href="mypage.do?sectionis=review&pageidx=${i}"><button class="pagenow">${i}</button></a>
			</c:when>
			<c:otherwise>
				<a href="mypagedo?sectionis=review&pageidx=${i}"><button>${i}</button></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${param.pageidx < rv_totalpage}">
			<a href="mypage.do?sectionis=review&pageidx=${param.pageidx + 1}"><button><i class="fas fa-angle-right"></i></button></a>
		</c:when>
		<c:when test="${param.pageidx ne rv_totalpage}">
		
			<a href="mypage.do?sectionis=review&pageidx=${rv_totalpage}"><button><i class="fas fa-angle-double-right"></i></button></a>
		</c:when>
	</c:choose>
</div>
</article>
</c:otherwise>
</c:choose>