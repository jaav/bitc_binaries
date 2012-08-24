<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="wast" uri="StringToolsTags" %>


<ul id="breadcrump">
	<c:choose>
		<c:when test="${module eq 'minisite' || (module eq 'home' and empty waParam.section) || (waParam.group eq 'CONTENT' && empty waParam.cmid)}">
		</c:when>
		<c:when test="${module eq 'search'}">
			<li>
				<a href="<wa:url URI="front/home/display/section/${section}"/>" title="<wa:mls>${section}</wa:mls>">
					<wa:mls>${section}</wa:mls>
				</a>
			</li> 
			- <li><wa:mls>Recherche</wa:mls></li>
		</c:when>
		<c:when test="${not empty breadcrumb}">
			<c:forEach items="${breadcrumb}" var="item" varStatus="loop">
				<c:if test="${not empty item.displayTitle && item.displayTitle ne ' '}">
				<li>
					<c:choose>
						<c:when test="${not empty item.url}">
							<a href="<wa:url URI="${item.url}"><wa:param name="cmid" value="${item.contentMenuId}" /></wa:url>" title="${item.displayTitle}">${item.displayTitle}</a>
						</c:when>
						<c:otherwise>
							${item.displayTitle}
						</c:otherwise>
					</c:choose>
				</li>
				<c:if test="${fn:length(breadcrumb) ne loop.count}">
					<li>-</li>
				</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${not empty breadcrumb[0].author && breadcrumb[0].tree.contentMenuId eq 929}">
			<script type="text/javascript">
				jQuery(document).ready(function($){
					$("h1").removeClass("line_grey");
					$("h1").addClass("line_${breadcrumb[0].author}");
				});
			</script>	
			</c:if>
		</c:when>
		
		<c:when test="${module eq 'tripPlanner'}">
			<li>
				<a href="<wa:url URI="front/tripPlanner/display"/>" title="<wa:mls>Trip Planner</wa:mls>">
					<wa:mls>Trip Planner</wa:mls>
				</a>
			</li> 
			<c:if test="${not empty waParam.panelContentType && not empty waParam.panelGroup}">
			- <li><wa:mls>${waParam.panelContentType} ${waParam.panelGroup}</wa:mls></li>
			</c:if>
		</c:when>
		<c:when test="${module eq 'meetingPlanner'}">
			<li>
				<a href="<wa:url URI="front/meetingPlanner/display"/>" title="<wa:mls>Meeting Planner</wa:mls>">
					<wa:mls>Meeting Planner</wa:mls>
				</a>
			</li>
			<c:if test="${not empty waParam.panelContentType && not empty waParam.panelGroup}">
			 -	<li><wa:mls>${waParam.panelContentType} ${waParam.panelGroup}</wa:mls></li>
			 </c:if>
		</c:when>
		<c:when test="${module eq 'propertyValue' && not empty waParam.name}">
			<li>
				<a href="<wa:url URI="front/propertyValue/display/name/${waParam.name}"/>" title="${waParam.name}">
					<wa:mls>${wast:upFirstChar(waParam.name)}</wa:mls>
				</a>
			</li> 
			<c:if test="${not empty waParam.panel}">-	<li><wa:mls>${waParam.panel}</wa:mls></li></c:if>
		</c:when>
		<c:when test="${module eq 'content' and action eq 'displayAgenda'}">
			<li>
				<a href="<wa:url URI="front/home/display/section/${section}"/>" title="<wa:mls>${section}</wa:mls>">
					<wa:mls>${section}</wa:mls>
				</a>
			</li>
			- <li><wa:mls>Agenda</wa:mls></li> 
			<c:if test="${not empty waParam.group}">-	<li><wa:mls>${waParam.group}</wa:mls></li></c:if>
		</c:when>
		<c:when test="${module eq 'user'}">
			<li>
				<a href="<wa:url URI="front/home/display/section/${section}"/>" title="<wa:mls>${section}</wa:mls>">
					<wa:mls>${section}</wa:mls>
				</a>
			</li> 
			- <li><wa:mls>Gestion de profil</wa:mls></li>
		</c:when>
		<c:when test="${module eq 'eshop'}">
			<li>
				<a href="<wa:url URI="front/home/display/section/${section}"/>" title="<wa:mls>${section}</wa:mls>">
					<wa:mls>${section}</wa:mls>
				</a>
			</li> 
			- <wa:mls>E-Shop</wa:mls>
			- <li><a href="<wa:url URI="front/eshop/displayEsCategory"/>" title="<wa:mls>Catalogue</wa:mls>">
					<wa:mls>Catalogue</wa:mls>
				</a></li>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	
 </ul>


