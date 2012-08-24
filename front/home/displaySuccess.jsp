<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<!--<wa:mls>Test</wa:mls>-->
	<!-- Set lg  with default lg of the browser if the first access to the site START -->
<script type="text/javascript">

	var cookie_navigator_clt = $.cookies.get('navigator_clt', {path : '/'});
	var lg = '${culture.language}';
	var lgRedirect = (lg == 'en'); 
	if(lgRedirect && (cookie_navigator_clt == null || cookie_navigator_clt != "0")){
			//first access to the site
			if (navigator.browserLanguage)
				 language = navigator.browserLanguage;
			else
				 language = navigator.language;
			if (language.indexOf('fr') > -1) {
				uri = '<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="lg"/><wa:exceptParam name="clt"/><wa:param name="lg" value="fr"/></wa:url>';
				$.cookies.set('navigator_clt', '0', {path : '/', hoursToLive: 24})
				document.location.href =uri;
			} else if (language.indexOf('nl') > -1){ 
				uri = '<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="lg" value="nl"/></wa:url>';
				$.cookies.set('navigator_clt', '0', {path : '/', hoursToLive: 24})
				document.location.href =uri;
			}
			
	}
	
</script>
	
	<c:choose>
		<c:when test="${empty waParam.section}">
			<wa:include URI="front/home/dynamicTemplate" >
				<wa:param name="section" value="visiteur" />
			</wa:include>
		</c:when>
		<c:otherwise>
			<wa:include URI="front/home/dynamicTemplate" >
				<wa:param name="section" value="${waParam.section}" />
			</wa:include>
		</c:otherwise>
	</c:choose>
	
	

