<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<form action="updateMeminfo.do" name="updatemem" method="post">
<table>
    <tr>
        <td>���̵�</td><td><input type="text" name="id" id="id" value="${memberinfo.id}" readonly></td>
    </tr>
    <tr>
        <td>��й�ȣ</td><td><input type="password" name="pw" id="pw1" value="${memberinfo.pw}" required></td>
    </tr>
    <tr>
        <td>��й�ȣ Ȯ��</td>
        <td>
        	<input type="password" id="pw2" value="${memberinfo.pw}"> <i id="resPW">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</i>
        </td>
    </tr>
    <tr>
        <td>�̸���</td><td><input type="email" name="email" value="${memberinfo.email}" required></td>
    </tr>
    <tr>
        <td>��� ����</td>
        <td><input type="text" name="birth" value="${memberinfo.birth}" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required></td>
    </tr>
    <tr>
        <td>����</td>
        <td>
        <c:choose>
        <c:when test="${memberinfo.gender eq 'female'}">
	        <input type="radio" id="male" name="gender" value="male"> <label for="male">��</label>&nbsp;&nbsp;&nbsp;&nbsp;
	        <input type="radio" id="female" name="gender" value="female" checked> <label for="female">��</label>      
        </c:when>
        <c:otherwise>
	        <input type="radio" id="male" name="gender" value="male" checked> <label for="male">��</label>&nbsp;&nbsp;&nbsp;&nbsp;
	        <input type="radio" id="female" name="gender" value="female"> <label for="female">��</label>
        </c:otherwise>
        </c:choose>
        </td>
    </tr>
    <tr>
        <td>�ܽ� ī�װ�</td>
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
        <td>�丮 ī�װ�</td>
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
        <td colspan="2" id="undatebtn"><input type="submit" value="�����ϱ�" onclick="update()"><input type="button" value="Ż���ϱ�" onclick="withdraw()"></td>
    </tr>
</table>
</form>