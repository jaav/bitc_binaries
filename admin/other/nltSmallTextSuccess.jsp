<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="be_FR" scope="request" />
BRUSSELS 
OFFICIAL WEBSITE FOR TOURISME & CONGRESS
--------------------------------------------------------------------------------

<wa:mls>Bonjour</wa:mls> &FIRSTNAME;,

<wa:mls>Intro lorem ipsum</wa:mls>

<c:forEach var="item" items="${list}" varStatus="loop">
	--------------------------------------------------------------------------------
	${item.mainContentArticleCltFirst.title}
	--------------------------------------------------------------------------------
	
	<%-- ${item.listText} --%>
	
	<c:if test="${not empty item.mainContentArticleCltFirst.url}">
	<wa:mls>More info</wa:mls> >
	***********
	${item.mainContentArticleCltFirst.url}
	</c:if>

</c:forEach>


<wa:mls>Cordialement,</wa:mls>
<wa:mls>L'équipe de Visitbrussels</wa:mls>
--------------------------------------------------------------------------------
