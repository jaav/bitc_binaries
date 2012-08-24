<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${listAcxProfile!=null}">
	<select name="${selectNameAcxProfile}">
	<option value="">...</option>
	<c:forEach var="item" items="${listAcxProfile}">
				<option value="${item.profile}" <c:if test="${item.profile==defAcxProfile}">selected="selected"</c:if> />${item.profile}</option>
	</c:forEach>	
	</select>
</c:if>