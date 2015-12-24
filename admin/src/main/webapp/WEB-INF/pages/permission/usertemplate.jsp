<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="user" varStatus="userIndex" items="${userLstTemplate}">
	<tr>
		<td class="center">
			<input type="checkbox" name="chkItem" value="${user.id}">
			<c:if test="${userIndex.index==0}"><input type="hidden" id="itemCount" value="${itemCount}"/></c:if>
		</td>
		<td>
			<a href="#">${user.id}</a>
		</td>
		<td>${user.account}</td>
		<td>${user.username}</td>
		<td>${user.mobile}</td>
		<td class="hidden-480">${user.address}</td>
		<td>${user.createTime}</td>
		<td class="hidden-480">${user.isDelete}</td>
    </tr>
</c:forEach>