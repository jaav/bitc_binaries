<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${userHasRight}">
	<a href="${context}/${site}/acxAdminusers/editItem/id/${lookup_user.userid}.do" title="<wa:mls>users</wa:mls>" target="admin_users">
		${lookup_user.firstname}&nbsp;${lookup_user.lastname}
	</a>
</c:if>
<c:if test="${!userHasRight}">
	${lookup_user.firstname}&nbsp;${lookup_user.lastname}
</c:if>