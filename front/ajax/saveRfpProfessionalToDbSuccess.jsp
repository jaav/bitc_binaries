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
<c:when test="${proUser != null}">
	<div class="item">
	 <a href="javascript:deleteRfpProfessionalFromDb('pro','${proUser.userid}');" class="btn_delete"></a>
        <p><strong>${proUser.firstname}</strong> <strong>${proUser.lastname}</strong></p>
         <div class="clr"></div>
	</div>
</c:when>
<c:otherwise>
	<p></p>
</c:otherwise>
</c:choose>

	     