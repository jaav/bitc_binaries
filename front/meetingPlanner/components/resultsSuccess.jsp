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
<c:when test="${panelGroup == 'HOTEL'}">
<wa:include URI="front/meetingPlanner/listStays" >
 	<wa:param name="group" value="${panelGroup}"/>
 </wa:include>
</c:when>
<c:when test="${panelGroup == 'BnB'}">
<c:choose>
 	<c:when test="${originTripSearch eq 'BnB'}">
 		<wa:include URI="front/meetingPlanner/listBnBSearch" >
 			<wa:param name="group" value="${panelGroup}"/>
 		</wa:include>
 	</c:when>
 	<c:otherwise>
 		<wa:include URI="front/meetingPlanner/listStays" >
 			<wa:param name="group" value="${panelGroup}"/>
 		</wa:include>
 	</c:otherwise>
 </c:choose> 
</c:when>
<c:when test="${panelContentType == 'ContentStay' and panelGroup eq 'ALL'}">
<wa:include URI="front/meetingPlanner/listStays" >
 	<wa:param name="group" value="${panelGroup}"/>
 </wa:include>
</c:when>
</c:choose>
<c:if test="${panelContentType == 'ContentRestaurant'}">
 <wa:include URI="front/meetingPlanner/listResto" >
 	<wa:param name="group" value="${panelGroup}"/>
 </wa:include>
 </c:if>
 <c:if test="${panelContentType == 'ContentEvent'}">
 <c:choose>
 	<c:when test="${originTripSearch eq 'event'}">
  	<wa:include URI="front/meetingPlanner/listAgendaSearch" >
 	<wa:param name="group" value="${panelGroup}"/>
 	<wa:param name="originTripSearch" value="${originTripSearch}"/>
 	<wa:param name="periodFromDate" value="${periodFromDate}"/>
 	<wa:param name="periodToDate" value="${periodToDate}"/>
 	</wa:include>
 </c:when>
 <c:otherwise>
	 <wa:include URI="front/meetingPlanner/listAgenda" >
	 	<wa:param name="group" value="${panelGroup}"/>
	 </wa:include>
 </c:otherwise>
 </c:choose>
 	
 </c:if>  
   <c:if test="${panelContentType == 'ContentPlace' && panelGroup ne 'MUSEUM_AND_ATTRACTIONS'}">
 <wa:include URI="front/meetingPlanner/list" >
 	<wa:param name="group" value="${panelGroup}"/>
 </wa:include>
 </c:if>  
  <c:if test="${panelGroup == 'MUSEUM_AND_ATTRACTIONS'}">
 <wa:include URI="front/meetingPlanner/list" >
 	<wa:param name="group" value="${panelGroup}"/>
 </wa:include>
 </c:if>    
<c:if test="${panelGroup == 'WALK'}">
 <wa:include URI="front/meetingPlanner/list">
 	<wa:param name="group" value="WALK"/>
 </wa:include>
</c:if>

<c:if test="${panelContentType == 'ContentVenue'}">
 <wa:include URI="front/meetingPlanner/listVenue" >
 	<wa:param name="group" value="${panelGroup}"/>
 </wa:include>
 </c:if>