<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="property" items="${listProperties}">
	<div>
		<wa:include URI="admin/dropdown/dropListProperty">
			<wa:param name="propertyName" value="${property.name}" />
			<wa:param name="contentType" value="${waParam.type}"/>
			<wa:param name="contentId" value="0" />
		</wa:include>
	</div>
</c:forEach>