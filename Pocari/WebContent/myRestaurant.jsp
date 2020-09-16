<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<c:choose>
<c:when test="${myfavlist.size()==0}">
	<article>아직 등록한 맛집이 없습니다!</article>
</c:when>
<c:otherwise>
<article class="rst">
    <div class="tagsearch">
        <div class="search"><input type="text" id="search_my_favlist" placeholder="tag로 검색해보세요" value="${param.keyword}"><button onclick="search('my_favlist')"><i class="fas fa-search fa-lg"></i></button></div>
    </div>
    <table>
       <colgroup>
           <col width="45%"/><col width="30%"/><col width="15%"/><col width="10%"/>
       </colgroup>
       <c:forEach items="${myfavlist}" var="favlistV">
       <tr>
        <td class="storename" onclick="location.href='resdetail.do?mfl_idx=${favlistV.mfl_idx}'">${favlistV.storename}</td>
        <td>${favlistV.sido1} ${favlistV.gugun1}</td>
        <td>${favlistV.category}</td>
        <td>${favlistV.avgstar}</td>
       </tr>
       </c:forEach>
    </table>
    <div class="pageNum">
		<c:choose>
			<c:when test="${param.pageidx ne 1}">
				<button onclick="movepageinx('my_favlist','1')"><i class="fas fa-angle-double-left"></i></button>
			</c:when>
			<c:when test="${param.pageidx ne 1}">
				<button onclick="movepageinx('my_favlist','${param.pageidx - 1}')"><i class="fas fa-angle-left"></i></button>
			</c:when>
		</c:choose>
		<c:forEach var="i" begin="1" end="${mfl_totalpage}" step="1">
			<c:choose>
				<c:when test="${param.pageidx eq i}">
					<button class="pagenow" onclick="movepageinx('my_favlist','${i}')">${i}</button>
				</c:when>
				<c:otherwise>
					<button onclick="movepageinx('my_favlist','${i}')">${i}</button>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${param.pageidx < mfl_totalpage}">
				<button onclick="movepageinx('my_favlist','${param.pageidx + 1}')"><i class="fas fa-angle-right"></i></button>
			</c:when>
			<c:when test="${param.pageidx ne mfl_totalpage}">
				<button onclick="movepageinx('my_favlist','${mfl_totalpage}')"><i class="fas fa-angle-double-right"></i></button>
			</c:when>
		</c:choose>
	</div>
</article>
</c:otherwise>
</c:choose>