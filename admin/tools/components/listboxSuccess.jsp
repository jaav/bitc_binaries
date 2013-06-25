<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<select name="${name}" size="${size}">
<c:forEach items="${items}" var="item">
	<option value="${item.id}">${item.value}</option>
</c:forEach>
</select>