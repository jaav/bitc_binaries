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
<c:when test="${article != null}">
	<div class="item"> <a href="javascript:deleteTripPlannerFromDb('${divId}','${contentType}','${article.group}','${article.id}');" class="btn_delete"></a>
	            <p><strong>${article.mainTitle}</strong></p>
	            <a href="<wa:url URI="${site}/content/displayDetail/group/${article.group}/id/${article.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${article.mainTitle}"/></a>
	            <div class="clr"></div>
	</div>
</c:when>
<c:otherwise>
	<p></p>
</c:otherwise>
</c:choose>

	     