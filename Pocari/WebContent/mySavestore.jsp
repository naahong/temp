<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<c:choose>
<c:when test="${save_store.size()==0}">
	<article>아직 찜한 맛집이 없습니다!</article>
</c:when>
<c:otherwise>
<article class="sstore">
    <div class="tagsearch">
        <div class="search"><input type="text" id="search_save_store" placeholder="tag로 검색해보세요" value="${param.keyword}"><button onclick="search('save_store')"><i class="fas fa-search fa-lg"></i></button></div>
    </div>
    <table>
       <colgroup>
           <col width="45%"/><col width="30%"/><col width="15%"/><col width="10%"/>
       </colgroup>
       <c:forEach items="${save_store}" var="savestoreV">
       <tr>
            <td class="storename" onclick="location.href='resdetail.do?mfl_idx=${savestoreV.mfl_idx}'">${savestoreV.storename}</td>
            <td>${savestoreV.sido1} ${savestoreV.gugun1}</td>
            <td>${savestoreV.category}</td>
            <td>${savestoreV.avgstar}</td>
        </tr>
       </c:forEach>
    </table>
    <div class="pageNum">
		<c:choose>
			<c:when test="${param.pageidx ne 1}">
				<button onclick="movepageinx('save_store','1')"><i class="fas fa-angle-double-left"></i></button>
			</c:when>
			<c:when test="${param.pageidx ne 1}">
				<button onclick="movepageinx('save_store','${param.pageidx - 1}')"><i class="fas fa-angle-left"></i></button>
			</c:when>
		</c:choose>
		<c:forEach var="i" begin="1" end="${ss_totalpage}" step="1">
			<c:choose>
				<c:when test="${param.pageidx eq i}">
					<button class="pagenow" onclick="movepageinx('save_store','${i}')">${i}</button>
				</c:when>
				<c:otherwise>
					<button onclick="movepageinx('save_store','${i}')">${i}</button>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${param.pageidx < ss_totalpage}">
				<button onclick="movepageinx('save_store','${param.pageidx + 1}')"><i class="fas fa-angle-right"></i></button>
			</c:when>
			<c:when test="${param.pageidx ne ss_totalpage}">
				<button onclick="movepageinx('save_store','${ss_totalpage}')"><i class="fas fa-angle-double-right"></i></button>
			</c:when>
		</c:choose>
	</div>
</article>
</c:otherwise>
</c:choose>