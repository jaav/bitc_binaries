<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<% //NAVIGATION %>
	<c:if test="${totalPage > 1}">
		<ul id="news_nav">	
			<c:if test="${page != 1}">
				<li class="first"><a href="?page=1"><span class="arrow">&laquo;</span> <wa:mls>Première</wa:mls></a></li>		
			</c:if>
			<c:if test="${page > 1}">
				<li class="previous"><a href="?page=${page-1}"><span class="arrow">&lsaquo;</span> <wa:mls>Précédente</wa:mls></a></li>
			</c:if>	
			<li class="current">Page ${page} / ${totalPage}</li>
			<c:if test="${page < totalPage}">
				<li class="next"><a href="?page=${page+1}"><wa:mls>Suivante</wa:mls> <span class="arrow">&rsaquo;</span></a></li>		
			</c:if>
			<c:if test="${page != totalPage}">
				<li class="last"><a href="?page=${totalPage}"><wa:mls>Dernière</wa:mls> <span class="arrow">&raquo;</span></a></li>
			</c:if>
		</ul>
	</c:if>