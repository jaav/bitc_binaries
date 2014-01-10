<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pagesContainer">

	<c:if test="${page>1}">
		<wa:link URI="${URI}">
			<img src="${static}/admin/images/double_arrow_prev.gif" alt="previous" width="15" height="11"/>
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="1"/>
		</wa:link>
	</c:if>
		
	<c:if test="${page>1}">
		<wa:link URI="${URI}">
			<img src="${static}/admin/images/arrow_prev.gif" alt="previous" width="10" height="11"/>
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="${page-1}"/>
		</wa:link>
	</c:if>
	
	<span class="pages">${navDisplay}</span>
	
	<c:if test="${page<lastPage}">
		<wa:link URI="${URI}">
			<img src="${static}/admin/images/arrow_next.gif" alt="next" width="10" height="11"/>
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="${page+1}"/>
		</wa:link>
	</c:if>
	
	<c:if test="${page<lastPage}">
		<wa:link URI="${URI}">
			<img src="${static}/admin/images/double_arrow_next.gif" alt="next" width="15" height="11"/>
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="${lastPage}"/>
		</wa:link>
	</c:if>
	
</div>
