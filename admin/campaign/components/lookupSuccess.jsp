<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${userHasRight}">
	<a href="${context}/${site}/campaign/editItem/id/${lookup_campaign.campaignId}.do" title="<wa:mls>Campaign</wa:mls>" target="admin_users">
		${lookup_campaign.name}
	</a>
</c:if>
<c:if test="${!userHasRight}">
	${lookup_campaign.name}
</c:if>