<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!-- FACEBOOK -->
<div id="fb-root"></div>
<c:choose>
	<c:when test="${culture.language eq 'fr'}">
		<script src="http://connect.facebook.net/fr_FR/all.js"></script>
	</c:when>
	<c:when test="${culture.language eq 'nl'}">
		<script src="http://connect.facebook.net/nl_BE/all.js"></script>
	</c:when>
	<c:otherwise>
		<script src="http://connect.facebook.net/en_US/all.js"></script>
	</c:otherwise>
</c:choose>
<script type="text/javascript"> 
         FB.init({ 
            appId:'${facebook_key}', cookie:true, 
            status:true, xfbml:true,oauth : false 
         });		
</script>	