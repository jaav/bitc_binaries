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
		<a href="<wa:url URI="minisite/home/display/name/${waParam.name}"/>" >${minisiteClt.title}</a>
		<c:if test="${not empty breadcrumb}">
			-
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
		</c:if>
		
		
	
 </ul>


