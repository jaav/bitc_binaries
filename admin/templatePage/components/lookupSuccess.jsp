<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${lookup_templatePage != null}">
	<a href="<wa:url URI="${site}/templatePage/editItem/id/${lookup_templatePage.templatePageId}"></wa:url>" target="lookup">${lookup_templatePage.templatePageId}-${lookup_templatePage.template}&nbsp;[${lookup_templatePage.paramValues}]</a>
</c:when>
<c:otherwise>
	${waCompParam.templatePageId}
</c:otherwise>
</c:choose>
