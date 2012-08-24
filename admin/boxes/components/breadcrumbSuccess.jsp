<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<div id="breadCrumb">
	<h1><wa:mls>vous êtes ici:</wa:mls></h1>
	<div class="content">
		<c:if test="${breadcrumbList != null}">
			<c:forEach var="item" items="${breadcrumbList}" varStatus="loop">
				<c:if test="${loop.count > 1}"> - </c:if>
				<c:if test="${!loop.last}"><a href="${item.url}">${item.title}</a></c:if>
				<c:if test="${loop.last}">${item.title}</c:if>	
			</c:forEach> 
		</c:if>
	</div>
</div>
