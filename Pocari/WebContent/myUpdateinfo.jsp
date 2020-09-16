<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<form action="updateMeminfo.do" name="updatemem" method="post">
<table>
    <tr>
        <td>아이디</td><td><input type="text" name="id" id="id" value="${memberinfo.id}" readonly></td>
    </tr>
    <tr>
        <td>비밀번호</td><td><input type="password" name="pw" id="pw1" value="${memberinfo.pw}" required></td>
    </tr>
    <tr>
        <td>비밀번호 확인</td>
        <td>
        	<input type="password" id="pw2" value="${memberinfo.pw}"> <i id="resPW">비밀번호가 일치하지 않습니다.</i>
        </td>
    </tr>
    <tr>
        <td>이메일</td><td><input type="email" name="email" value="${memberinfo.email}" required></td>
    </tr>
    <tr>
        <td>출생 연도</td>
        <td><input type="text" name="birth" value="${memberinfo.birth}" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required></td>
    </tr>
    <tr>
        <td>성별</td>
        <td>
        <c:choose>
        <c:when test="${memberinfo.gender eq 'female'}">
	        <input type="radio" id="male" name="gender" value="male"> <label for="male">남</label>&nbsp;&nbsp;&nbsp;&nbsp;
	        <input type="radio" id="female" name="gender" value="female" checked> <label for="female">여</label>      
        </c:when>
        <c:otherwise>
	        <input type="radio" id="male" name="gender" value="male" checked> <label for="male">남</label>&nbsp;&nbsp;&nbsp;&nbsp;
	        <input type="radio" id="female" name="gender" value="female"> <label for="female">여</label>
        </c:otherwise>
        </c:choose>
        </td>
    </tr>
    <tr>
        <td>외식 카테고리</td>
        <td>
        <c:forEach items="${foodcate}" var="fcategoryV">
        	<c:choose>
        		<c:when test="${fcategoryV.pref != null && fcategoryV.pref eq 'like'}">
        			<input type="checkbox" checked name="category" value="${fcategoryV.category}">
        		</c:when>
        		<c:otherwise><input type="checkbox" name="category" value="${fcategoryV.category}"></c:otherwise>
        	</c:choose>
        	${fcategoryV.category}&nbsp;&nbsp;
        </c:forEach>
        </td>
    </tr>
    <tr>
        <td>요리 카테고리</td>
        <td>
        <c:forEach items="${recipecate}" var="rcategoryV">
        	<c:choose>
        		<c:when test="${rcategoryV.pref != null && rcategoryV.pref eq 'like'}">
        			<input type="checkbox" checked  name="recipecate" value="${rcategoryV.category}">
        		</c:when>
        		<c:otherwise><input type="checkbox" name="recipecate" value="${rcategoryV.category}"></c:otherwise>
        	</c:choose>
        	${rcategoryV.category}&nbsp;&nbsp;
        </c:forEach>
        </td>
    </tr>
    <tr>
        <td colspan="2" id="undatebtn"><input type="submit" value="수정하기" onclick="update()"><input type="button" value="탈퇴하기" onclick="withdraw()"></td>
    </tr>
</table>
</form>