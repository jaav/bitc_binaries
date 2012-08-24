<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <table class="meeting">
    <tr class="top"><td class="id">Id</td><td class="type">Type</td><td class="name">Name</td><td class="tel">Tel</td><td class="email">Email</td></tr>
<c:forEach var="item" items="${meetingPlanner}" varStatus="loop">
   	<c:choose>
	<c:when test="${loop.count mod 2 ne 0}"> 
     <tr>
      </c:when>
        <c:otherwise>
     <tr class="seconde">
       </c:otherwise>
        </c:choose>
     <td>${item.tripId}&nbsp;</td>
   <td> ${item.contentType}</td>
	<wa:include URI="${site}/reqforproposal/lookup">
			<wa:param name="contentId" value="${item.contentId}"/>
			<wa:param name="contentType" value="${item.contentType}"/>
		</wa:include></tr>
</c:forEach>
</table>