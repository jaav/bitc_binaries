<%@ page 
language="java"
contentType="text/html; charset=utf-8"
pageEncoding="utf-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="wabd" uri="BigDecimalUtilsTags" %>
<%@ taglib prefix="wast" uri="StringToolsTags" %>


<div>
	<ul>
		<c:forEach items="${values}" var="item">
			<li>${item.mainTitle} - ${item.valueId}</li>
		</c:forEach>
	</ul>
</div>


<div>
	<ul>
		<c:forEach items="${mapArticles}" var="entry">
			<c:forEach items="${entry.value}" var="article">
				<li class="${entry.key}">${article.mainTitle} - ${article.id} - ${article.latitude} - - ${article.longitude}</li>
			</c:forEach>
		</c:forEach>
	</ul>
</div>