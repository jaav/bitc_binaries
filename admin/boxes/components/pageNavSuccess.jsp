<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${page>1}">
		<wa:link URI="${URI}" allParams="true">
			<img src="${static}/${site}/img/ico_doublearrow_left.png" alt="first" />
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="1"/>
			<wa:exceptParam name="orderBy"/>
			<wa:param name="orderBy" value="${waCompParam.orderBy}"/>
			<wa:exceptParam name="orderDir"/>
			<wa:param name="orderDir" value="${waCompParam.orderDir}"/>
		</wa:link>
	</c:if>
		
	<c:if test="${page>1}">
		<wa:link URI="${URI}" allParams="true">
			<img src="${static}/${site}/img/ico_arrow_left.png" alt="previous"/>
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="${page-1}"/>
			<wa:exceptParam name="orderBy"/>
			<wa:param name="orderBy" value="${waCompParam.orderBy}"/>
			<wa:exceptParam name="orderDir"/>
			<wa:param name="orderDir" value="${waCompParam.orderDir}"/>
		</wa:link>
	</c:if>
	
	<span class="pages">
		<c:if test="${listSize > 0}">
			${navDisplay}
		</c:if>
	</span>
	
	<c:if test="${page<lastPage}" >
		<wa:link URI="${URI}" allParams="true">
			<img src="${static}/${site}/img/ico_arrow_right.png" alt="next"/>
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="${page+1}"/>
			<wa:exceptParam name="orderBy"/>
			<wa:param name="orderBy" value="${waCompParam.orderBy}"/>
			<wa:exceptParam name="orderDir"/>
			<wa:param name="orderDir" value="${waCompParam.orderDir}"/>
		</wa:link>
	</c:if>
	
	<c:if test="${page<lastPage}">
		<wa:link URI="${URI}"  allParams="true">
			<img src="${static}/${site}/img/ico_doublearrow_right.png" alt="last"/>
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="${lastPage}"/>
			<wa:exceptParam name="orderBy"/>
			<wa:param name="orderBy" value="${waCompParam.orderBy}"/>
			<wa:exceptParam name="orderDir"/>
			<wa:param name="orderDir" value="${waCompParam.orderDir}"/>
		</wa:link>
	</c:if>
	

