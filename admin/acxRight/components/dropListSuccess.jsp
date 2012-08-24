<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${listAcxRight!=null}">
	<select name="${selectNameAcxRight}">
	<option value="">...</option>
	<c:forEach var="item" items="${listAcxRight}">
				<option value="${item.right}" <c:if test="${item.right==defAcxRight}">selected="selected"</c:if> />${item.right}</option>
	</c:forEach>	
	</select>
</c:if>