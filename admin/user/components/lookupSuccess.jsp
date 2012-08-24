<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${lookup_user != null}">
	<a href="<wa:url URI="${site}/user/editItem/id/${lookup_user.userId}"></wa:url>" target="lookup">${lookup_user.firstname}&nbsp;${lookup_user.lastname}</a>
</c:when>
<c:otherwise>
	${waCompParam.id}
</c:otherwise>
</c:choose>
