<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${listContentProperty!=null}">
	<select name="${selectNameContentProperty}">
	<option value="">...</option>
	<c:forEach var="item" items="${listContentProperty}">
				<option value="${item.propertyid}" <c:if test="${item.propertyid==defContentProperty}">selected="selected"</c:if> />
					${item.name}
				</option>
	</c:forEach>	
	</select>
</c:if>