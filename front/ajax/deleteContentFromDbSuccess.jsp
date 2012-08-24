<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:choose>
<c:when test="${ empty listArticleFirst}">
	<p><strong></strong></p>
</c:when>
<c:otherwise>
	<c:forEach var="item" items="${listArticleFirst}" varStatus="loop">
		       	<div class="item"> <a href="javascript:deleteTripPlannerFromDb('${divId}','${contentType}','${item.group}','${item.id}');" class="btn_delete"></a>
	            <p><strong>${item.mainTitle}</strong></p>
	            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
	            <div class="clr"></div>
	          </div>
	</c:forEach>
</c:otherwise>
</c:choose>
