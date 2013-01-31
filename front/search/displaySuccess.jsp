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

<style type="text/css" media="screen">
    @import url("${static}/front/css/nyroModal.css");
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>
<script src="${static}/ajax/js/tripPlannerMethods.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.datepicker.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.theme.css" media="screen, projection"/>

<script type="text/javascript" src="${static}/front/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker-${culture.language}.js"></script>
<script type="text/javascript">
    //TRIP PLANNER METHOD
    //* addToTripPlanner(group, contentId) => call tripPlannerLightBox(data) => data.contentName & data.status ( return contentName & status )

    function tripPlannerLightBox(data) {

        $.nyroModalManual({
            minWidth:700,
            minHeight:600,
            forceType:'iframe',
            closeSelector:'.nyroModalClose',
            url:'${context}/front/other/displayTripPlannerLightBox.do?contentName=' + data.contentName + '&status=' + data.status + '&panelContentType=' + data.panelContentType + '&panelGroup=' + data.panelGroup + '&panelContentId=' + data.contentId,
            closeButton:'<a href="javascript:location.reload(true)" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
        });

    }

</script>
<div class="clear"></div>
<div id="content_main">

    <wa:include URI="front/search/find">
        <wa:param name="group" value="${group}"/>
        <wa:param name="contentType" value="${contentType}"/>
        <wa:param name="criteriaDate" value="${criteriaDate}"/>
        <wa:param name="s_periodFromDate" value="${s_periodFromDate}"/>
        <wa:param name="s_periodToDate" value="${s_periodToDate}"/>
        <wa:param name="boxOfficeEvent" value="${boxOfficeEvent}"/>
    </wa:include>
    <div class="TabbedPanelsContentGroup">
        <ul class="TabbedPanels">
        </ul>
        <c:if test="${result != null}">
            <div class="tab_paging">
                <wa:include URI="${site}/search/pageNav"/>
            </div>
        </c:if>
        <ul class="tab_list_complete">
            <c:if test="${result == null}">
                <h1><wa:mls>Aucun résultat</wa:mls></h1>
            </c:if>
            <c:if test="${result != null}">
                <c:if test="${fn:length(searchRes) == 0}">
                    <h1><wa:mls>Aucun résultat</wa:mls></h1>
                </c:if>
                <c:if test="${fn:length(result) > 0}">
                    <h1>${resultsSize} <wa:mls>r&eacute;sultats de recherche</wa:mls></h1>
                    <!-- SEARCH RESULTS LIST : start -->
                    <c:if test="${group ne 'GUIDED_TOUR'}">
                    	
                    <c:forEach items="${result}" var="item" varStatus="loop">
                        <li>
                            <c:if test="${item.contentType ne 'ContentPress'}">
                                <c:choose>
                                    <c:when test="${not empty item.imageUrl}">
                                        <a href="<wa:url URI='${item.encodedUrl}'/>">
                                            <img src="${item.imageUrl}" alt="${item.title}" width="165"/>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<wa:url URI='${item.encodedUrl}'/>">
                                            <img src="${context}/static/${site}/img/ml/default_content.jpg"
                                                 alt="${item.title}" width="165"/>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                <div class="txt">
                                    <h3 class="no_margin">
                                        <a href="<wa:url URI='${item.encodedUrl}'/>">${item.title}</a>
                                    </h3>

                                    <p>
                                            ${item.description}
                                    </p>
                                    <c:if test="${item.contentType eq 'ContentEvent'}">
                                        <c:if test="${not empty item.periodFromDate}">
                                            <div class="clr"></div>
                                            <div class="float_left"><strong><wa:mls>Date de début :</wa:mls></strong>
                                    <span>
                                            ${item.periodFromDate}
                                    </span>
                                            </div>
                                        </c:if>
                                        <div class="clr"></div>
                                        <c:if test="${not empty item.periodToDate}">
                                            <div class="float_left"><strong><wa:mls>Date de fin :</wa:mls></strong>
                                    <span>
                                            ${item.periodToDate}
                                    </span>
                                            </div>
                                        </c:if>
                                    </c:if>
                                </div>
                            </c:if>
                            <c:if test="${item.contentType eq 'ContentPress'}">

                                <c:choose>
                                    <c:when test="${not empty item.smallImage}">
                                        <img src="${item.smallImage}" alt="${item.pressTitle}" width="165"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${context}/static/${site}/img/ml/press_small.jpeg"
                                             alt="${item.pressTitle}" width="165"/>
                                    </c:otherwise>
                                </c:choose>
                                <%--a href="${item.pressDoc}">
                                      <img src="${context}/static/${site}/img/ml/press_default_image.jpg" width="50" height="47"/>
                                  </a--%>
                                <div class="txt" id="txt_${item.id}">
                                    <h3 class="no_margin">
                                        ${item.title}
                                    </h3>
                                    <c:if test="${not empty item.pressDate}">
                                        <strong><wa:mls>Press Date :</wa:mls></strong><fmt:formatDate
                                            value="${item.pressDate}" pattern="dd MMM yyyy"/> <br/>
                                    </c:if>
                                    <c:if test="${not empty item.pressDoc}">
                                        <strong><wa:mls>Press Release :</wa:mls></strong>
                                        <a href="${item.pressDoc}" target="_blank">
                                            <wa:mls>click here to download</wa:mls>
                                        </a> <br/>
                                    </c:if>

                                </div>
                            </c:if>
                            <div class="btn">
                                <c:if test="${item.contentType ne 'ContentPress' or not empty item.body}">
                                    <div class="more_info">
                                        <a href="<wa:url URI="${item.encodedUrl}"/>"
                                           class="btn_more_info" title="${item.title}"><wa:mls>More info</wa:mls></a>
                                    </div>
                                </c:if>
                                <%--div class="more_info">
                                    <a href="<wa:url URI='${item.encodedUrl}'/>" class="btn_more_info"
                                       title="${item.title}"><wa:mls>More info</wa:mls></a>
                                </div--%>
                                <c:if test="${contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
                                    <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')"
                                       class="map"><span><wa:mls>Map :</wa:mls></span><img
                                            src="${staticSite}/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg"
                                            alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
                                    <br/>
                                    <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')"
                                       class="sv"><span><wa:mls>Street view :</wa:mls></span><img
                                            src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
                                    <script type="text/javascript">
                                        addMarker(${item.longitude}, ${item.latitude}, "${item.title}", "${wa:numberToChar(loop.count-1)}", ${item.svLongitude}, ${item.svLatitude}, ${item.svHeading}, ${item.svPitch}, ${item.svZoom});
                                    </script>
                                </c:if>
                                <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe"
                                   class="addthis_button share"
                                   addthis:url="${config['URL']}/${site}/content/displayDetail/group/${item.group}/id/${item.id}.do"
                                   addthis:title="${item.title}" addthis:description="${wa:html2txt(item.title)}"><img
                                        src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>

                                <div class="ilike" rel="${item.group}|${item.id}"></div>
                                <c:if test="${group ne 'DEALS'}">
                                    <a href="javascript:addToTripPlanner('${item.group}','${item.id}');"
                                       class="add"><img src="${staticSite}/img/ml/btn_add.gif"
                                                        alt="<wa:mls>Add</wa:mls>"/></a>
                                </c:if>
                            </div>

                            <div class="clr"></div>

                        </li>
                    </c:forEach>
                    </c:if>
                    <!-- SEARCH RESULTS LIST : end -->
                    <c:if test="${group eq 'GUIDED_TOUR'}">
                    	<c:if test="${not empty fixedDateTours}">
                    	<h2><wa:mls>Visits on fixed schedules</wa:mls></h2>
                    	<c:forEach items="${fixedDateTours}" var="item" varStatus="loop">
                        <li>
                            <c:if test="${item.contentType ne 'ContentPress'}">
                                <c:choose>
                                    <c:when test="${not empty item.imageUrl}">
                                        <a href="<wa:url URI='${item.encodedUrl}'/>">
                                            <img src="${item.imageUrl}" alt="${item.title}" width="165"/>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<wa:url URI='${item.encodedUrl}'/>">
                                            <img src="${context}/static/${site}/img/ml/default_content.jpg"
                                                 alt="${item.title}" width="165"/>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                <div class="txt">
                                    <h3 class="no_margin">
                                        <a href="<wa:url URI='${item.encodedUrl}'/>">${item.title}</a>
                                    </h3>

                                    <p>
                                            ${item.description}
                                    </p>
                                    <c:if test="${item.contentType eq 'ContentEvent'}">
                                        <c:if test="${not empty item.periodFromDate}">
                                            <div class="clr"></div>
                                            <div class="float_left"><strong><wa:mls>Date de début :</wa:mls></strong>
                                    <span>
                                            ${item.periodFromDate}
                                    </span>
                                            </div>
                                        </c:if>
                                        <div class="clr"></div>
                                        <c:if test="${not empty item.periodToDate}">
                                            <div class="float_left"><strong><wa:mls>Date de fin :</wa:mls></strong>
                                    <span>
                                            ${item.periodToDate}
                                    </span>
                                            </div>
                                        </c:if>
                                    </c:if>
                                </div>
                            </c:if>
                            <c:if test="${item.contentType eq 'ContentPress'}">

                                <c:choose>
                                    <c:when test="${not empty item.smallImage}">
                                        <img src="${item.smallImage}" alt="${item.pressTitle}" width="165"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${context}/static/${site}/img/ml/press_small.jpeg"
                                             alt="${item.pressTitle}" width="165"/>
                                    </c:otherwise>
                                </c:choose>
                                <%--a href="${item.pressDoc}">
                                      <img src="${context}/static/${site}/img/ml/press_default_image.jpg" width="50" height="47"/>
                                  </a--%>
                                <div class="txt" id="txt_${item.id}">
                                    <h3 class="no_margin">
                                        ${item.title}
                                    </h3>
                                    <c:if test="${not empty item.pressDate}">
                                        <strong><wa:mls>Press Date :</wa:mls></strong><fmt:formatDate
                                            value="${item.pressDate}" pattern="dd MMM yyyy"/> <br/>
                                    </c:if>
                                    <c:if test="${not empty item.pressDoc}">
                                        <strong><wa:mls>Press Release :</wa:mls></strong>
                                        <a href="${item.pressDoc}" target="_blank">
                                            <wa:mls>click here to download</wa:mls>
                                        </a> <br/>
                                    </c:if>

                                </div>
                            </c:if>
                            <div class="btn">
                                <c:if test="${item.contentType ne 'ContentPress' or not empty item.body}">
                                    <div class="more_info">
                                        <a href="<wa:url URI="${item.encodedUrl}"/>"
                                           class="btn_more_info" title="${item.title}"><wa:mls>More info</wa:mls></a>
                                    </div>
                                </c:if>
                                <%--div class="more_info">
                                    <a href="<wa:url URI='${item.encodedUrl}'/>" class="btn_more_info"
                                       title="${item.title}"><wa:mls>More info</wa:mls></a>
                                </div--%>
                                <c:if test="${contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
                                    <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')"
                                       class="map"><span><wa:mls>Map :</wa:mls></span><img
                                            src="${staticSite}/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg"
                                            alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
                                    <br/>
                                    <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')"
                                       class="sv"><span><wa:mls>Street view :</wa:mls></span><img
                                            src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
                                    <script type="text/javascript">
                                        addMarker(${item.longitude}, ${item.latitude}, "${item.title}", "${wa:numberToChar(loop.count-1)}", ${item.svLongitude}, ${item.svLatitude}, ${item.svHeading}, ${item.svPitch}, ${item.svZoom});
                                    </script>
                                </c:if>
                                <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe"
                                   class="addthis_button share"
                                   addthis:url="${config['URL']}/${site}/content/displayDetail/group/${item.group}/id/${item.id}.do"
                                   addthis:title="${item.title}" addthis:description="${wa:html2txt(item.title)}"><img
                                        src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>

                                <div class="ilike" rel="${item.group}|${item.id}"></div>
                                <c:if test="${group ne 'DEALS'}">
                                    <a href="javascript:addToTripPlanner('${item.group}','${item.id}');"
                                       class="add"><img src="${staticSite}/img/ml/btn_add.gif"
                                                        alt="<wa:mls>Add</wa:mls>"/></a>
                                </c:if>
                            </div>

                            <div class="clr"></div>

                        </li>
                    </c:forEach>
                    </c:if>
                    	<c:if test="${not empty onrequestTours}">
                    	<h2><wa:mls>Visits on request</wa:mls></h2>
                    	<c:forEach items="${onrequestTours}" var="item" varStatus="loop">
                        <li>
                            <c:if test="${item.contentType ne 'ContentPress'}">
                                <c:choose>
                                    <c:when test="${not empty item.imageUrl}">
                                        <a href="<wa:url URI='${item.encodedUrl}'/>">
                                            <img src="${item.imageUrl}" alt="${item.title}" width="165"/>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<wa:url URI='${item.encodedUrl}'/>">
                                            <img src="${context}/static/${site}/img/ml/default_content.jpg"
                                                 alt="${item.title}" width="165"/>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                <div class="txt">
                                    <h3 class="no_margin">
                                        <a href="<wa:url URI='${item.encodedUrl}'/>">${item.title}</a>
                                    </h3>

                                    <p>
                                            ${item.description}
                                    </p>
                                    <c:if test="${item.contentType eq 'ContentEvent'}">
                                        <c:if test="${not empty item.periodFromDate}">
                                            <div class="clr"></div>
                                            <div class="float_left"><strong><wa:mls>Date de début :</wa:mls></strong>
                                    <span>
                                            ${item.periodFromDate}
                                    </span>
                                            </div>
                                        </c:if>
                                        <div class="clr"></div>
                                        <c:if test="${not empty item.periodToDate}">
                                            <div class="float_left"><strong><wa:mls>Date de fin :</wa:mls></strong>
                                    <span>
                                            ${item.periodToDate}
                                    </span>
                                            </div>
                                        </c:if>
                                    </c:if>
                                </div>
                            </c:if>
                            <c:if test="${item.contentType eq 'ContentPress'}">

                                <c:choose>
                                    <c:when test="${not empty item.smallImage}">
                                        <img src="${item.smallImage}" alt="${item.pressTitle}" width="165"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${context}/static/${site}/img/ml/press_small.jpeg"
                                             alt="${item.pressTitle}" width="165"/>
                                    </c:otherwise>
                                </c:choose>
                                <%--a href="${item.pressDoc}">
                                      <img src="${context}/static/${site}/img/ml/press_default_image.jpg" width="50" height="47"/>
                                  </a--%>
                                <div class="txt" id="txt_${item.id}">
                                    <h3 class="no_margin">
                                        ${item.title}
                                    </h3>
                                    <c:if test="${not empty item.pressDate}">
                                        <strong><wa:mls>Press Date :</wa:mls></strong><fmt:formatDate
                                            value="${item.pressDate}" pattern="dd MMM yyyy"/> <br/>
                                    </c:if>
                                    <c:if test="${not empty item.pressDoc}">
                                        <strong><wa:mls>Press Release :</wa:mls></strong>
                                        <a href="${item.pressDoc}" target="_blank">
                                            <wa:mls>click here to download</wa:mls>
                                        </a> <br/>
                                    </c:if>

                                </div>
                            </c:if>
                            <div class="btn">
                                <c:if test="${item.contentType ne 'ContentPress' or not empty item.body}">
                                    <div class="more_info">
                                        <a href="<wa:url URI="${item.encodedUrl}"/>"
                                           class="btn_more_info" title="${item.title}"><wa:mls>More info</wa:mls></a>
                                    </div>
                                </c:if>
                                <%--div class="more_info">
                                    <a href="<wa:url URI='${item.encodedUrl}'/>" class="btn_more_info"
                                       title="${item.title}"><wa:mls>More info</wa:mls></a>
                                </div--%>
                                <c:if test="${contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
                                    <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')"
                                       class="map"><span><wa:mls>Map :</wa:mls></span><img
                                            src="${staticSite}/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg"
                                            alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
                                    <br/>
                                    <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')"
                                       class="sv"><span><wa:mls>Street view :</wa:mls></span><img
                                            src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
                                    <script type="text/javascript">
                                        addMarker(${item.longitude}, ${item.latitude}, "${item.title}", "${wa:numberToChar(loop.count-1)}", ${item.svLongitude}, ${item.svLatitude}, ${item.svHeading}, ${item.svPitch}, ${item.svZoom});
                                    </script>
                                </c:if>
                                <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe"
                                   class="addthis_button share"
                                   addthis:url="${config['URL']}/${site}/content/displayDetail/group/${item.group}/id/${item.id}.do"
                                   addthis:title="${item.title}" addthis:description="${wa:html2txt(item.title)}"><img
                                        src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>

                                <div class="ilike" rel="${item.group}|${item.id}"></div>
                                <c:if test="${group ne 'DEALS'}">
                                    <a href="javascript:addToTripPlanner('${item.group}','${item.id}');"
                                       class="add"><img src="${staticSite}/img/ml/btn_add.gif"
                                                        alt="<wa:mls>Add</wa:mls>"/></a>
                                </c:if>
                            </div>

                            <div class="clr"></div>

                        </li>
                    </c:forEach>
                    </c:if>
                    </c:if>
                </c:if>
            </c:if>
        </ul>
        <c:if test="${result != null}">
            <div class="tab_paging">

                <wa:include URI="${site}/search/pageNav"/>

            </div>
        </c:if>
    </div>
</div>
<script language='javascript'>
    function sortBy(newURI, group) {

        var sort = $("#f_page").val();
        var orderby;
        var asc;
        if (sort == 0) {
        }
        if (sort == 1) {
            orderBy = "title";
            asc = "0";
        }
        if (sort == 2) {
            orderBy = "title";
            asc = "1";
        }
        if (sort == 3) {
            orderBy = "id";
            asc = "1";
        }
        if (sort == 4) {
            orderBy = "id";
            asc = "0";
        }
        if (sort == 5) {
            orderBy = "price";
            asc = "0";
        }
        if (sort == 6) {
            orderBy = "price";
            asc = "1";
        }
        if (sort == 7) {
            orderBy = "ranking";
            asc = "0";
        }
        if (sort == 8) {
            orderBy = "ranking";
            asc = "1";
        }
        var uri = '<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="orderBy"/><wa:exceptParam name="asc"/><wa:exceptParam name="page"/></wa:url>';
        document.forms[0].action = uri + "&" + "orderBy=" + orderBy + "&asc=" + asc;
        window.location.href = document.forms[0].action;
    }
</script>
