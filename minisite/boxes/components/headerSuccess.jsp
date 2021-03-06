<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"
        isELIgnored="false"
        %>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Content-Language" content="${culture.language}"/>

    <!--<c:if test="${meta != null && meta.metaDescription ne ''}">
		<meta name="Description" content="${meta.metaDescription}" />
	</c:if>-->

    <c:choose>
        <c:when test="${meta != null && meta.metaDescription ne ''}">
            <meta name="Description" content="${meta.metaDescription}"/>
        </c:when>
        <c:otherwise>
            <meta name="Description" content="${fn:replace(wa:html2txt(og_description),varTmp,'&quot;')}"/>
        </c:otherwise>
    </c:choose>

    <c:if test="${meta != null && meta.metaKeyword ne ''}">
        <meta name="Keywords" content="${meta.metaKeyword}"/>
    </c:if>
    <c:choose>
        <c:when test="${waParam.name eq 'monument'}">
            <c:choose>
                <c:when test="${og_title != null && og_title ne ''}">
                    <title>${og_title} - <wa:mls>heritage_title</wa:mls></title>
                </c:when>
                <c:otherwise>
                    <c:if test="${meta != null && meta.metaTitle ne ''}">
                        <title>${meta.metaTitle}</title>
                    </c:if>
                    <c:if test="${meta == null || meta.metaTitle eq ''}">
                        <title><wa:mls>heritage_title</wa:mls></title>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <c:if test="${meta != null && meta.metaTitle ne ''}">
                <title>${meta.metaTitle}</title>
            </c:if>
            <c:if test="${meta == null || meta.metaTitle eq ''}">
                <title><wa:mls>BITC</wa:mls></title>
            </c:if>
        </c:otherwise>
    </c:choose>

    <% //CSS IMPORT %>
    <link rel="stylesheet" type="text/css" href="${static}/front/css/jcarousel.css" media="screen, projection"/>
    <link rel="stylesheet" type="text/css" href="${static}/front/css/screen.css" media="screen, projection"/>
    <link rel="stylesheet" type="text/css" href="${static}/front/css/newnav.css" media="screen, projection"/>
    <link rel="stylesheet" type="text/css" href="${static}/front/css/print.css" media="print"/>
    <link rel="stylesheet" type="text/css" href="${static}/front/css/scrollable.css" media="screen, projection"/>
    <link rel="stylesheet" type="text/css" href="${static}/front/css/smart_tab.css" media="screen, projection"/>
    <link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationSelect_search.css"
          media="screen, projection"/>
		<link rel="stylesheet" type="text/css" href="/bitc/static/front/css/jquery.ui.datepicker.css" media="screen, projection"/>
		<link rel="stylesheet" type="text/css" href="/bitc/static/front/css/jquery.ui.theme.css" media="screen, projection"/>


    <link rel="stylesheet" type="text/css" href="${static}/minisite/css/${waParam.name}.css"
          media="screen, projection"/>
    <% //JS IMPORT %>
    <script type="text/javascript" src="${static}/front/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery-tools.min.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery.hint.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery.smartTab.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery.carousel.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery.flash.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery-functions-v2.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery.cookies.2.2.0.min.js"></script>
    <script type="text/javascript" src="${static}/front/js/SpryValidationSelect.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery.livequery.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery.ui.core.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker.js"></script>
    <script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker-${culture.language}.js"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

    <% //OG FACEBOOK %>
    <c:if test="${not empty waParam.group && not empty waParam.id}">
        <meta property="og:title" content="${og_title}"/>
        <meta property="og:type" content="${og_type}"/>
        <meta property="og:site_name" content="${og_site_name}"/>
        <meta property="og:image" content="${og_image}"/>
        <c:set var="og_url"
               value="${config['URL']}${context}/${site}/${module}/${action}/group/${waParam.group}/id/${waParam.id}/name/${waParam.name}.do"/>
        <meta property="og:url" content="${og_url}"/>
        <meta property="fb:admins" content="${fb_admins}"/>
        <c:set var="varTmp" value="\""/>
        <meta property="og:description" content="${fn:replace(wa:html2txt(og_description),varTmp,'&quot;')}"/>
        <meta property="fb:app_id" content="135475609811744"/>
        <link rel="image_src" href="${og_image}"/>
    </c:if>


</head>
