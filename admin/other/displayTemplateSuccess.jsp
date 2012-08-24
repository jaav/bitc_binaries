<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach var="clt" items="${culture.allCultures}" varStatus="loop">
CULTURE : ${clt}<br />
	<c:forEach var="nltContent" items="${mapNltContent[clt]}">
	
		titre : ${nltContent.title} <br />
		
		<c:if test="${type eq 'html'}">
			<c:if test="${nltContent.smallVersion==true}">
			listHtml : ${nltContent.listHtml} <br />
			</c:if>
			<c:if test="${nltContent.smallVersion==false}">
			detailHtml : ${nltContent.detailHtml} <br />
			</c:if>
		</c:if>
		
		<c:if test="${type eq 'text'}">
			<c:if test="${nltContent.smallVersion==true}">
			listText: ${nltContent.listText} <br />
			</c:if>
			<c:if test="${nltContent.smallVersion==false}">
			DetailText : ${nltContent.detailText} <br />
			</c:if>	
		</c:if>
		
		image : ${nltContent.image} <br />
		url : ${nltContent.url} <br />
		<hr />
	</c:forEach>
</c:forEach>