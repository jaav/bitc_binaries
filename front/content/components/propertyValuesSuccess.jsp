<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="sep" value=""></c:set>
<c:if test="${not empty listPropertyValues}">
	<div class="float_left"><strong><wa:mls>${lib } </wa:mls></strong>&nbsp;</div>
	<c:forEach var="item" items="${listPropertyValues}" varStatus="loop">${sep}${item.valueName}<c:set var="sep" value=", "></c:set></c:forEach>
</c:if>


