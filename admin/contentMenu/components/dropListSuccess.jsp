<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${listContentMenu!=null}">
	<select name="${selectNameContentMenu}">
	<option value="">...</option>
	<c:forEach var="item" items="${listContentMenu}">
				<option value="${item.contentMenuId}" <c:if test="${item.contentMenuId==defContentMenu}">selected="selected"</c:if> />
					${item.titleWithDepth}
				</option>
	</c:forEach>	
	</select>
</c:if>