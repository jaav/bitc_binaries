<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<span class="label">${waCompParam.displayName}</span>
<c:forEach items="${items}" var="item" varStatus="var">
<div id="d_${waCompParam.name}">
<input name="f_${waCompParam.name}" id="f_${waCompParam.name}_${var.count-1}" type="checkbox" ${item.selected} value="${item.id}" style="width:15;"/>
<label for="f_${waCompParam.name}_${var.count-1}">${item.value}</label><br>
</div>
</c:forEach>