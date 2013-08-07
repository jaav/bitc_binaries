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
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta http-equiv="Content-Language" content="${culture.language}" />
	
	<c:choose>
		<c:when test="${meta != null && meta.metaDescription ne ''}">
			<meta name="Description" content="${meta.metaDescription}" />
		</c:when>
		<c:otherwise>
			<meta name="Description" content="${fn:replace(wa:html2txt(og_description),varTmp,'&quot;')}"/>
		</c:otherwise>
	</c:choose>
	
	<c:if test="${meta != null && meta.metaKeyword ne ''}">
		<meta name="Keywords" content="${meta.metaKeyword}" /> 
	</c:if>
	<c:if test="${meta != null && meta.metaTitle ne ''}">
		<title>${meta.metaTitle}</title>
	</c:if> 
	 <c:if test="${meta == null || meta.metaTitle eq ''}"> 
		<title><wa:mls>BITC</wa:mls></title>
	 </c:if>
	
	<% //CSS IMPORT %>
	<link rel="stylesheet" type="text/css" href="${staticSite}/css/jcarousel.css" media="screen, projection"/>
	<link rel="stylesheet" type="text/css" href="${staticSite}/css/screen.css" media="screen, projection"/>
	<link rel="stylesheet" type="text/css" href="${staticSite}/css/newnav.css" media="screen, projection"/>
	<link rel="stylesheet" type="text/css" href="${staticSite}/css/print.css" media="print"/>
	<link rel="stylesheet" type="text/css" href="${staticSite}/css/scrollable.css" media="screen, projection"/>
	<link rel="stylesheet" type="text/css" href="${staticSite}/css/smart_tab.css" media="screen, projection"/>
	<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationSelect_search.css" media="screen, projection"/>
	<link rel="stylesheet" type="text/css" href="${staticSite}/css/video-js.css" media="screen, projection"/>
	<% //JS IMPORT %>
	<script type="text/javascript" src="${staticSite}/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="${staticSite}/js/jquery-tools.min.js"></script>
	<script type="text/javascript" src="${staticSite}/js/jquery.hint.js"></script>
	<script type="text/javascript" src="${staticSite}/js/jquery.smartTab.js"></script>
	<script type="text/javascript" src="${staticSite}/js/jquery.carousel.js"></script>
    <script type="text/javascript" src="${staticSite}/js/jquery.flash.js"></script>
    <script type="text/javascript" src="${staticSite}/js/jquery-functions-v2.js"></script>
    <script type="text/javascript" src="${staticSite}/js/jquery.cookies.2.2.0.min.js"></script>
    <script type="text/javascript" src="${staticSite}/js/SpryValidationSelect.js"></script>
    <script type="text/javascript" src="${staticSite}/js/jquery.livequery.js"></script>
	<script type="text/javascript" src="${staticSite}/js/jquery.ui.core.js"></script>
	<script type="text/javascript" src="${staticSite}/js/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="${staticSite}/js/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="${staticSite}/js/jquery.ui.datepicker-${culture.language}.js"></script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="${staticSite}/js/video.js"></script>
	<script type="text/javascript" src="${staticSite}/js/eshortcut.js"></script>
    <% //OG FACEBOOK %>
    <c:if test="${not empty waParam.group && not empty waParam.id}">
		<meta property="og:title" content="${og_title}"/>
		<meta property="og:type" content="${og_type}"/>
		<meta property="og:site_name" content="${og_site_name}"/>
		<meta property="og:image" content="${config['URL']}${og_image}"/>
		<c:set var="og_url" value="${config['URL']}${context}/${site}/${module}/${action}/group/${waParam.group}/id/${waParam.id}.do"/>  
		<meta property="og:url" content="${og_url}"/>
		<meta property="fb:admins" content="${fb_admins}"/>
		<c:set var="varTmp" value="\"" />
		<meta property="og:description" content="${fn:replace(wa:html2txt(og_description),varTmp,'&quot;')}"/>
		<meta property="fb:app_id" content="135475609811744" />
		
		<link rel="image_src" href="${og_image}" />
	</c:if>


</head>
