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
<c:when test="${ empty list}">
	<p><strong></strong></p>
</c:when>
<c:otherwise>
	<c:forEach var="item" items="${list}" varStatus="loop">
         <div class="item"> <a href="javascript:deleteRfpProfessionalFromDb('pro','${item.id});" class="btn_delete"></a>
	            <p><strong>${item.firstname}</strong><strong>${item.lastname}</strong></p>
	            <div class="clr"></div>
	     </div>
	</c:forEach>
</c:otherwise>
</c:choose>
