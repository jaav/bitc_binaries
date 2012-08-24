<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pagesContainer">

|
<c:forEach  var="item" items="${navAlpha}" varStatus="loop">
	&nbsp;
	<wa:link URI="${URI}">
			${item}
			<wa:exceptParam name="page"/>
			<wa:param name="page" value="${loop.count}"/>
	</wa:link>
	&nbsp;|
</c:forEach>
	
</div>
