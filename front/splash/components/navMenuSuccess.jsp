<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<ul>
	    <c:forEach items="${splash.children}" var="item" varStatus="loop">
			<li>
				<c:choose>
					<c:when test="${not empty item.userObject.url}">
						<a href="<wa:url URI="${item.userObject.url}"><wa:param name="cmid" value="${item.userObject.contentMenuId}" /><wa:param name="clt" value="BE_${lg}" /></wa:url>"
							title="${item.userObject.displayTitles[lg]}">${item.userObject.displayTitles[lg]}</a>
					</c:when>
					<c:otherwise>
			  				${item.userObject.displayTitles[lg]}
			  		</c:otherwise>
				</c:choose>
			</li>
	    </c:forEach>
</ul>
