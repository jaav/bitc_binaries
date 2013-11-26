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
<div id="footer">
  <div id="footer_content">
    <div id="logo_brussels_city"><img src="${staticSite}/img/ml/logo_brussels_city.png" alt="<wa:mls>Ville de Bruxelles</wa:mls>"/></div>
    <div id="logo_brussels_iris"><img src="${staticSite}/img/ml/logo_brussels_iris.png" alt="<wa:mls>Région Bruxelles Capitale</wa:mls>"/></div>
    <div id="logo_cocof"><img src="${staticSite}/img/ml/logo_cocof.png" alt="<wa:mls>COCOF</wa:mls>"/></div>
    <div id="logo_vlaams_community"><img src="${staticSite}/img/ml/logo_vlaams_community.png" alt="<wa:mls>Vlaams community</wa:mls>"/></div>
    <div id="logo_bitc"></div>
    <hr/>
    <!-- <div id="site_info">© ${currentYear} - VISITBRUSSELS - All rights reserved - <a href="/bitc/front/content/displayDetail/group/CONTENT/id/14372.do">Privacy Policy</a></div>
     -->
     
     <div id="site_info">© ${currentYear} - VISITBRUSSELS - All rights reserved - <a href="/bitc/front/content/displayDetail/group/CONTENT/id/22188.do">Privacy, Disclaimer & Cookie</a></div>
    <ul id="footer_nav_sub">
    	<c:forEach items="${footerNav.children}" var="item" varStatus="loop">
    	<c:if test ="${item.userObject.visible}" >
      		<li>
      		<c:choose>
			<c:when test="${not empty item.userObject.url}">
				<a href="<wa:url URI="${item.userObject.url}"/>"
					title="${item.userObject.displayTitle}">${item.userObject.displayTitle}</a>
			</c:when>
			<c:otherwise>
	  				${item.userObject.displayTitle}
	  			</c:otherwise>
			</c:choose>
			</li>
      		<c:if test="${loop.count < fn:length(footerNav.children)}">
      			<li>|</li>
      		</c:if>
      	</c:if>
      	</c:forEach>
      	<li>|</li>
      	<li><a href="<wa:url URI="front/siteMap/displaySiteMap"/>"
					title="<wa:mls>Sitemap</wa:mls>"><wa:mls>Sitemap</wa:mls></a></li>
      	
    </ul>
  </div>
</div>

