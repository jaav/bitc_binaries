<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${lookup_calendarPartner != null}">
	<a href="<wa:url URI="${site}/calendarPartner/editItem/id/${lookup_calendarPartner.partnerId}"></wa:url>" target="lookup">${lookup_calendarPartner.name}</a>
</c:when>
<c:otherwise>
	${waCompParam.id}
</c:otherwise>
</c:choose>
