<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- MINI SITE NAVIGATION : start--> 
	<c:if test="${not empty minisiteNav}">
		<ul id="mini_site_nav_ul">
			<c:forEach items="${minisiteNav.children}" var="item" varStatus="loop">
				<c:if test ="${item.userObject.visible}" >
		    		<li >
		    			<c:choose>
							<c:when test="${not empty item.userObject.url && item.userObject.isExtenal}">
								<a href="${item.userObject.url} " title="${minisiteClt.title} - ${item.userObject.displayTitle}" target="_blank">${item.userObject.displayTitle}</a>
							</c:when>
							<c:when test="${not empty item.userObject.url && not item.userObject.isExtenal}">
								<a href="<wa:url URI="${item.userObject.url}"><wa:param name="cmid" value="${item.userObject.contentMenuId}" /></wa:url>" title="${minisiteClt.title} - ${item.userObject.displayTitle}">${item.userObject.displayTitle}</a>
							</c:when>
						</c:choose>
		    		</li>
		    	</c:if>
		    </c:forEach>
		</ul>
	</c:if>	
<!-- MINI SITE NAVIGATION: end--> 

<script>
function showModelPanel(url) {
	  $.nyroModalManual({
		 zIndex: 1001,					
	     minWidth:1050,
	     height:580,
	     forceType: 'iframe',
	     closeSelector: '.nyroModalClose', 
	     url: '/bitc/map.jsp',
	     closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.png" alt="close" /></a>'
	  	});

}
</script>
<c:forEach items="${rightColumnList}" var="item">
	<wa:include URI="${site}/boxes/${item.algorithm}">
		<wa:param name="algo_params" value="${item.paramValues}"/>
		
	</wa:include>
</c:forEach>



	
