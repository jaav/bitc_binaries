<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${listAcxRessource!=null}">
	<select name="${selectNameAcxRessource}">
	<option value="">...</option>
	<c:forEach var="item" items="${listAcxRessource}">
				<option value="${item.ressource}" <c:if test="${item.ressource==defAcxRessource}">selected="selected"</c:if> />${item.ressource}</option>
	</c:forEach>	
	</select>
</c:if>