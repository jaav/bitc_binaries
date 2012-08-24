<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
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
		&nbsp;
	</c:if>
		
	<c:if test="${page>1}">
		<wa:link URI="${URI}">
			<img src="${static}/admin/images/arrow_prev.gif" alt="previous" width="10" height="11"/>
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="${page-1}"/>
		</wa:link>
		&nbsp;
	</c:if>
	
	<c:forEach  var="item" items="${linksTail}" varStatus="loop">
		&nbsp;

		<c:choose>
			<c:when test="${page>1}">
				<wa:link URI="${URI}">
						${item}
						<wa:exceptParam name="page"/>
						<wa:param name="page" value="${item}"/>
				</wa:link>
			</c:when>
			<c:otherwise>
				<wa:link URI="${URI}">
						${item}
				</wa:link>
			</c:otherwise>
		</c:choose>		
		&nbsp;
	</c:forEach>
	
	&nbsp;
	<wa:link URI="${URI}">
			[${page}]
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="${page}"/>
	</wa:link>
	&nbsp;
	
	<c:forEach  var="item" items="${linksHead}" varStatus="loop">
		&nbsp;
		<wa:link URI="${URI}">
				${item}
				<wa:exceptParam name="page"/>
				<wa:param name="page" value="${item}"/>
		</wa:link>
		&nbsp;
	</c:forEach>
	
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
