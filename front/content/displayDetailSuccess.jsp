<%@ page
        language="java"
        contentType="text/html; charset=utf-8"
        pageEncoding="utf-8"
        isELIgnored="false"
        %>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="wabd" uri="BigDecimalUtilsTags" %>
<%@ taglib prefix="wast" uri="StringToolsTags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:choose>
<c:when test="${group eq 'Conditions_Ventes'}">
    <div class="clear"></div>
    <div id="content_main">
        <h1 class="line_grey">${bean.mainTitle}</h1>

        <p>${bean.mainBody}</p>

        <div class="clr"></div>
    </div>
</c:when>

<c:when test="${group ne 'Conditions_Ventes'}">
<div id="btn_back" style="margin-bottom: 15px;"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>

<style type="text/css" media="screen">
    @import url("${static}/front/css/nyroModal.css");
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>
<script src="${static}/ajax/js/tripPlannerMethods.js" type="text/javascript"></script>
<script src="${static}/ajax/js/meetingPlannerMethods.js" type="text/javascript"></script>
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
            closeButton:'<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
        });

    }

    function meetingPlannerLightBox(data) {
        $.nyroModalManual({
            minWidth:700,
            minHeight:600,
            forceType:'iframe',
            closeSelector:'.nyroModalClose',
            url:'${context}/front/other/displayMeetingPlannerLightBox.do?contentName=' + data.contentName + '&status=' + data.status + '&panelContentType=' + data.panelContentType + '&panelGroup=' + data.panelGroup + '&panelContentId=' + data.contentId,
            closeButton:'<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
        });

    }

</script>

<c:if test="${adminUser != null}">
    <script type="text/javascript">
        function addToNltContent(group, contentId) {
            $.ajax({
                url:'/bitc/admin/ajax/addToNltContent.do?contentId=' + contentId + '&group=' + group,
                type:'GET',
                dataType:"json",
                success:function (data) {
                    alert(data.result);
                }
            })
        }
    </script>
</c:if>

<div class="clear"></div>

<div id="content_main" class="vevent">
<c:if test="${not empty adminUser}">
    <a href="javascript:addToNltContent('${bean.group}','${bean.id}');"><wa:mls>Ajouter à la table nlt content</wa:mls></a>
    <a href="${context}/admin/${contentTypeAdmin}/list.do?s_publishContent_id=${bean.id}&s_submit=Search"
       target="admin"><wa:mls>Edit</wa:mls></a>
</c:if>
<c:choose>
    <c:when test="${bean.group=='FOODY'}">
        <h1 class="no_margin line_grey">${bean.index}
        </h1> <!-- ${color} -->
    </c:when>
    <c:otherwise>
        <h1 class="no_margin line_grey">${bean.mainTitle}
        </h1> <!-- ${color} -->
    </c:otherwise>
</c:choose>

<c:if test="${not empty bean.periodFromDate}">
    <h3>
        <c:choose>
            <c:when test="${bean.periodFromHour eq '00'}">
					<span class="dtstart value-title"
                          title="<fmt:formatDate pattern="yyyy-MM-dd" value="${bean.periodFromDate}"/>">
						<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.periodFromDate}"/>
				    </span>
            </c:when>
            <c:otherwise>
					<span class="dtstart value-title"
                          title="<fmt:formatDate pattern="yyyy-MM-dd" value="${bean.periodFromDate}"/>">
						<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bean.periodFromDate}"/>
				    </span>

            </c:otherwise>
        </c:choose>
        -
        <c:choose>
            <c:when test="${bean.periodToHour eq '00'}">
						<span class="dtend value-title"
                              title="<fmt:formatDate pattern="yyyy-MM-dd" value="${bean.periodToDate}"/>">
						<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.periodToDate}"/>
				       </span>
            </c:when>
            <c:otherwise>
					<span class="dtend value-title"
                          title="<fmt:formatDate pattern="yyyy-MM-dd" value="${bean.periodToDate}"/>">
						<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bean.periodToDate}"/>
				   </span>

            </c:otherwise>
        </c:choose>
    </h3>
</c:if>

<c:choose>
<c:when test="${bean.group == 'FOODY'}">
    <div class="float_left mtop10">

        <c:if test="${not empty bean.mainBigImage}">
            <img src="${bean.mainBigImage}" alt="${bean.mainTitle}" height="200" align="left" class="m22" class="photo">
        </c:if>

        <div id="feature_pratical_information2">
            <c:set var="varTmp" value="\""/>
            <div class="ilike_big" rel="${bean.group}|${bean.id}"></div>
            <c:if test="${bean.group ne 'CONTENT' and bean.group ne 'PRESS_REPORT'  and bean.group ne 'OG_TOUR' and bean.group ne 'LATEST_NEWS' and bean.group ne 'PRESTATAIRE'}">
                <a href="javascript:<c:choose><c:when test="${section eq 'meetings' || refererMeeting eq '1'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${bean.group}','${bean.id}');"><img
                        src="${staticSite}/img/ml/btn_add_big.gif" alt="<wa:mls>Add</wa:mls>" id="logo_add"/></a>
            </c:if>
            <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"
               addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${bean.group}/id/${bean.id}"/>"
               addthis:title="${bean.mainTitle}"
               addthis:description="${fn:replace(wa:html2txt(bean.mainAbstract_),varTmp,'&quot;')}"><img
                    src="${staticSite}/img/ml/btn_share_big.gif" id="logo_share" alt="<wa:mls>Share</wa:mls>"/></a>
        </div>

    </div>

    <div id="pratical_information_large">
        <h4><wa:mls>Practical informations</wa:mls></h4>
        <c:if test="${not empty bean.address}">

            <p class="adr">

                <span class="street-address"> ${bean.address}</span> <br/>

                <c:if test="${not empty bean.zipcode && bean.zipcode > 0}">
                    <span class="postal-code"> ${bean.zipcode}</span>
                </c:if>
                <c:if test="${not empty bean.city}">
                    <span class="locality"> - ${bean.city} </span>
                </c:if>
            </p>
        </c:if>
        <c:if test="${not empty bean.closing}">
            <p><span class="tel"> ${bean.closing}</span></p>
        </c:if>
        <c:if test="${not empty bean.phone}">
            <p><strong><wa:mls>Tel :</wa:mls></strong><span class="tel"> ${bean.phone}</span></p>
        </c:if>
        <c:if test="${not empty bean.mobile}">
            <p><strong><wa:mls>Mobile :</wa:mls></strong> ${bean.mobile}</p>
        </c:if>
        <c:if test="${not empty bean.fax}">
            <p><strong><wa:mls>Fax :</wa:mls></strong> ${bean.fax}</p>
        </c:if>
        <c:if test="${not empty bean.email}">
            <p><strong><wa:mls>Email :</wa:mls></strong> <br/>
                <a href="mailto:${bean.email}"><span class="cutEmail">${bean.email}</span></a></p>
        </c:if>
        <c:if test="${not empty bean.URLWebsite}">
            <p><strong><wa:mls>Website :</wa:mls></strong> <br/>
                <a href="${bean.URLWebsite}" target="_blank"><span class="cutEmail">${bean.URLWebsite}</span></a></p>
        </c:if>

        <c:if test="${contentType ne 'ContentArticle'  && contentGroupType ne 'ContentProduct' and not empty bean.latitude and bean.latitude != 0.0 and not empty bean.longitude and bean.longitude != 0.0}">
            <p><a href="javascript:callLetter('a', 'map')"
                  class="btn_map_view"><span><wa:mls>View on the map</wa:mls></span></a></p>

            <p><a href="javascript:callLetter('a', 'sv')"
                  class="btn_street_view"><span><wa:mls>Google street view</wa:mls></span></a></p>

            <script type="text/javascript">
                addMarker(${bean.longitude}, ${bean.latitude}, "${bean.formatMainTitle}", "a", ${bean.svLongitude}, ${bean.svLatitude}, ${bean.svHeading}, ${bean.svPitch}, ${bean.svZoom});
            </script>
        </c:if>
        <div style="margin-left:15px;">
            <c:forEach var="item" items="${listPicto}" varStatus="loop">
                <a href="${item.defaultDescription}?lang=${culture.language}" target="_blank"> <img src="${item.logo}"
                                                                                                    title="${item.mainTitle}"
                                                                                                    width="27"
                                                                                                    height="27"
                                                                                                    class="m23"></a>


                <c:if test="${loop.count  mod 4 ==0}">
                    <div class="clr"></div>
                </c:if>

            </c:forEach>
        </div>

        <c:if test="${not empty propTalk}">
            <a href="${propTalk}" target="_blank"><img class="btn_museumtalks"
                                                       src="${staticSite}/img/ml/btn_museumtalks.jpg"
                                                       alt="museum talks"/></a>
        </c:if>

    </div>

    <div class="clr"></div>

    <div id="main_information">
        <div class="description">
            <div style="margin:20px 0 20px 0;">${bean.mainBody}</div>
            <c:set var="gastrobean" value="0" scope="page"/>
            <c:set var="othersbean" value="0" scope="page"/>
            <c:set var="infobean" value="0" scope="page"/>
            <table width="400px" cellspacing="20px" style="margin-bottom:20px">
                <tr>
                    <td>
                        <div id="infoBlock" style="display:none;">
                            <strong><wa:mls>Infos</wa:mls></strong><br/><br/>
                            <c:if test="${not empty bean.price_menu}">
                                <c:set var="infobean" value="${infobean + 1}" scope="page"/>
                                <strong><wa:mls>Price Menu :</wa:mls></strong><span
                                    class="tel"> ${bean.price_menu}</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.price_card}">
                                <c:set var="infobean" value="${infobean + 1}" scope="page"/>
                                <strong><wa:mls>Price Card :</wa:mls></strong><span
                                    class="tel"> ${bean.price_card}</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.price_single_room}">
                                <c:set var="infobean" value="${infobean + 1}" scope="page"/>
                                <strong><wa:mls>Price Single Room :</wa:mls></strong><span
                                    class="tel"> ${bean.price_single_room}</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.price_double_room}">
                                <c:set var="infobean" value="${infobean + 1}" scope="page"/>
                                <strong><wa:mls>Price Double Room :</wa:mls></strong><span
                                    class="tel"> ${bean.price_double_room}</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.nbrSuites}">
                                <c:set var="infobean" value="${infobean + 1}" scope="page"/>
                                <strong><wa:mls>NBR Suites :</wa:mls></strong><span
                                    class="tel"> ${bean.nbrSuites}</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.nbrChambres}">
                                <c:set var="infobean" value="${infobean + 1}" scope="page"/>
                                <strong><wa:mls>NBR Chambres :</wa:mls></strong><span
                                    class="tel"> ${bean.nbrChambres}</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.nbrChambres}">
                                <c:set var="infobean" value="${infobean + 1}" scope="page"/>
                                <strong><wa:mls>NBR Chambres :</wa:mls></strong><span
                                    class="tel"> ${bean.nbrChambres}</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.closingHotel}">
                                <c:set var="infobean" value="${infobean + 1}" scope="page"/>
                                <strong><wa:mls>Closing Hotel :</wa:mls></strong><span
                                    class="tel"> ${bean.closingHotel}</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.cook}">
                                <c:set var="infobean" value="${infobean + 1}" scope="page"/>
                                <strong><wa:mls>Cook :</wa:mls></strong><span class="tel"> ${bean.cook}</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.exploitant}">
                                <c:set var="infobean" value="${infobean + 1}" scope="page"/>
                                <strong><wa:mls>Exploitant :</wa:mls></strong><span
                                    class="tel"> ${bean.exploitant}</span><br/>
                            </c:if>
                            <c:if test="${infobean > 0}">
                                <script>
                                    $('#infoBlock').show();
                                </script>
                            </c:if>
                        </div>
                    </td>
                    <td width="10px">&nbsp;</td>
                    <td>
                        <div id="gastroBlock" style="display: none;">
                            <strong><wa:mls>Scores Gastromania</wa:mls></strong><br/><br/>
                            <c:if test="${not empty bean.gastro && bean.gastro>0}">
                                <c:set var="gastrobean" value="${gastrobean + 1}" scope="page"/>
                                <strong><wa:mls>Cuisine :</wa:mls></strong><span class="tel"> ${bean.gastro} / 20</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.welcome && bean.welcome>0}">
                                <c:set var="gastrobean" value="${gastrobean + 1}" scope="page"/>
                                <strong><wa:mls>Acceuil :</wa:mls></strong><span
                                    class="tel"> ${bean.welcome} / 20</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.decor && bean.decor>0}">
                                <c:set var="gastrobean" value="${gastrobean + 1}" scope="page"/>
                                <strong><wa:mls>Décor :</wa:mls></strong><span
                                    class="tel"> ${bean.decor} / 20</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.money && bean.money>0}">
                                <c:set var="gastrobean" value="${gastrobean + 1}" scope="page"/>
                                <strong><wa:mls>Qualité-prix :</wa:mls></strong><span
                                    class="tel"> ${bean.money} / 20</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.pleasure && bean.pleasure>0}">
                                <c:set var="gastrobean" value="${gastrobean + 1}" scope="page"/>
                                <strong><wa:mls>Ensemble :</wa:mls></strong><span
                                    class="tel"> ${bean.pleasure} / 20</span><br/>
                            </c:if>
                            <c:if test="${gastrobean > 0}">
                                <script>
                                    $('#gastroBlock').show();
                                </script>
                            </c:if>
                        </div>
                        <div id="othersBlock" style="display: none;margin-top:20px;">
                            <strong><wa:mls>Scores from resto guides</wa:mls></strong><br/><br/>
                            <c:if test="${not empty bean.gault && bean.gault>0}">
                                <c:set var="othersbean" value="${othersbean + 1}" scope="page"/>
                                <strong><wa:mls>GaultMillau :</wa:mls></strong><span
                                    class="tel"> ${bean.gault} / 20</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.mich && bean.mich>0}">
                                <c:set var="othersbean" value="${othersbean + 1}" scope="page"/>
                                <strong><wa:mls>Michelin :</wa:mls></strong><span
                                    class="tel"> ${bean.mich} / 20</span><br/>
                            </c:if>
                            <c:if test="${not empty bean.delta && bean.delta>0}">
                                <c:set var="othersbean" value="${othersbean + 1}" scope="page"/>
                                <strong><wa:mls>Delta :</wa:mls></strong><span
                                    class="tel"> ${bean.delta} / 20</span><br/>
                            </c:if>
                            <c:if test="${othersbean > 0}">
                                <script>
                                    $('#othersBlock').show();
                                </script>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</c:when>

<c:otherwise>

<c:if test="${not empty bean.mainBigImage}">
    <img src="${bean.mainBigImage}" alt="${bean.mainTitle}" height="200" align="left" class="m22" class="photo">
</c:if>


<div class="clr"></div>

<div id="main_information">

<div id="box_right_information">
    <!--featurepraticalinformation:start-->
    <div id="feature_pratical_information">
        <c:set var="varTmp" value="\""/>
        <div class="ilike_big" rel="${bean.group}|${bean.id}"></div>
        <c:if test="${bean.group ne 'CONTENT' and bean.group ne 'PRESS_REPORT'  and bean.group ne 'OG_TOUR' and bean.group ne 'LATEST_NEWS' and bean.group ne 'PRESTATAIRE'}">
            <a href="javascript:<c:choose><c:when test="${section eq 'meetings' || refererMeeting eq '1'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${bean.group}','${bean.id}');"><img
                    src="${staticSite}/img/ml/btn_add_big.gif" alt="<wa:mls>Add</wa:mls>" id="logo_add"/></a>
        </c:if>
        <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"
           addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${bean.group}/id/${bean.id}"/>"
           addthis:title="${bean.mainTitle}"
           addthis:description="${fn:replace(wa:html2txt(bean.mainAbstract_),varTmp,'&quot;')}"><img
                src="${staticSite}/img/ml/btn_share_big.gif" id="logo_share" alt="<wa:mls>Share</wa:mls>"/></a>
    </div>
    <!--featurepraticalinformation:end-->
    <c:if test="${contentGroupType ne 'ContentArticle' && contentGroupType ne 'ContentProduct' && contentGroupType ne 'ContentPress'}">
        <div id="pratical_information" class="location vcard">
            <h4><wa:mls>Practical informations</wa:mls></h4>
            <c:if test="${contentGroupType eq 'ContentEvent'}">
                <c:if test="${not empty bean.placeName}">
                    <p class="fn org">${bean.placeName}</p>
                </c:if>
            </c:if>
            <c:if test="${not empty bean.address}">

                <p class="adr">

                    <span class="street-address"> ${bean.address}</span> <br/>

                    <c:if test="${not empty bean.zipcode && bean.zipcode > 0}">
                        <span class="postal-code"> ${bean.zipcode}</span>
                    </c:if>
                    <c:if test="${not empty bean.city}">
                        <span class="locality"> - ${bean.city} </span>
                    </c:if>
                </p>
            </c:if>
            <c:if test="${not empty bean.phone}">
                <p><strong><wa:mls>Tel :</wa:mls></strong><span class="tel"> ${bean.phone}</span></p>
            </c:if>
            <c:if test="${not empty bean.mobile}">
                <p><strong><wa:mls>Mobile :</wa:mls></strong> ${bean.mobile}</p>
            </c:if>
            <c:if test="${not empty bean.fax}">
                <p><strong><wa:mls>Fax :</wa:mls></strong> ${bean.fax}</p>
            </c:if>
            <c:if test="${not empty bean.email}">
                <p><strong><wa:mls>Email :</wa:mls></strong> <br/>
                    <a href="mailto:${bean.email}"><span class="cutEmail">${bean.email}</span></a></p>
            </c:if>
            <c:if test="${not empty bean.URLWebsite}">
                <p><strong><wa:mls>Website :</wa:mls></strong> <br/>
                    <a href="${bean.URLWebsite}" target="_blank"><span class="cutEmail">${bean.URLWebsite}</span></a>
                </p>
            </c:if>
            <c:if test="${bean.group eq 'MICE'}">
                <c:choose>
                    <c:when test="${bean.attachedContentVenue != null}">
                        <p><strong><wa:mls>Venue :</wa:mls></strong>
                            <a href="<wa:url URI="${site}/content/displayDetailVenue/group/${bean.attachedContentVenue.group}/id/${bean.attachedContentVenue.id}"/>"><span>${bean.attachedContentVenue.mainTitle}</span></a>
                        </p>
                    </c:when>
                    <c:when test="${bean.attachedContentVenue == null and !empty bean.attachedVenue}">
                        <p><strong><wa:mls>Venue :</wa:mls></strong> ${bean.attachedVenue}</p>
                    </c:when>
                </c:choose>
            </c:if>
            <c:if test="${bean.group == 'BnB' && not empty bean.price}">
                <p><strong><wa:mls>Starting at</wa:mls></strong>
                    : ${wabd:format(wast:toDouble2(bean.price,0.0),0)} &euro;<wa:mls>/night</wa:mls> <br/></p>
            </c:if>
            <c:if test="${contentGroupType eq 'ContentEvent'}">
                <p>
                    <c:if test="${not empty bean.price}">
                        <strong><wa:mls>Price :</wa:mls></strong> ${bean.price}<br/>
                    </c:if>
                    <c:if test="${not empty bean.numParticipation && bean.numParticipation > 0}">
                        <strong><wa:mls>Number of Participation :</wa:mls></strong> ${bean.numParticipation}<br/>
                    </c:if>
                </p>
            </c:if>
            <c:if test="${contentGroupType eq 'ContentRestaurant'}">
                <p>
                    <c:if test="${not empty bean.listCuisine}">
                        <strong><wa:mls>List Cuisines :</wa:mls></strong>
                        <span>${bean.listCuisine}</span> <br/>
                    </c:if>
                </p>

                <p>
                    <c:if test="${not empty bean.price}">
                        <strong><wa:mls>Price :</wa:mls></strong> ${bean.price}<br/>
                    </c:if>
                </p>

                <p>
                    <wa:include URI="front/content/propertyValues">
                        <wa:param name="lib" value="Type de cuisine :"/>
                        <wa:param name="group" value="${bean.group}"/>
                        <wa:param name="id" value="${bean.id}"/>
                        <wa:param name="prop" value="CUISINES_TYPES"/>
                    </wa:include>
                </p>
            </c:if>

            <c:if test="${contentType ne 'ContentArticle'  && contentGroupType ne 'ContentProduct' and not empty bean.latitude and bean.latitude != 0.0 and not empty bean.longitude and bean.longitude != 0.0}">
                <p><a href="javascript:callLetter('a', 'map')"
                      class="btn_map_view"><span><wa:mls>View on the map</wa:mls></span></a></p>

                <p><a href="javascript:callLetter('a', 'sv')"
                      class="btn_street_view"><span><wa:mls>Google street view</wa:mls></span></a></p>

                <script type="text/javascript">
                    addMarker(${bean.longitude}, ${bean.latitude}, "${bean.formatMainTitle}", "a", ${bean.svLongitude}, ${bean.svLatitude}, ${bean.svHeading}, ${bean.svPitch}, ${bean.svZoom});
                </script>
            </c:if>
            <div style="margin-left:15px;">
                <c:forEach var="item" items="${listPicto}" varStatus="loop">
                    <a href="${item.defaultDescription}?lang=${culture.language}" target="_blank"> <img
                            src="${item.logo}" title="${item.mainTitle}" width="27" height="27" class="m23"></a>


                    <c:if test="${loop.count  mod 4 ==0}">
                        <div class="clr"></div>
                    </c:if>

                </c:forEach>
            </div>


            <c:if test="${bean.group == 'GUIDED_TOUR' && bean.source == 'VoirEtDire'}">
                <strong><wa:mls>Réserver:</wa:mls></strong><br/><br/>
                <a href="/bitc/front/tracking/link/desc/voiretdirebruxelles/cid/F0FDB0F455B48382.do"
                   target="_blank"><img src="${staticSite}/img/ml/btn_voiretdire.jpg" alt="voir et dire bruxelles"/></a>
            </c:if>
            <c:if test="${not empty propTalk}">
                <a href="${propTalk}" target="_blank"><img class="btn_museumtalks"
                                                           src="${staticSite}/img/ml/btn_museumtalks.jpg"
                                                           alt="museum talks"/></a>
            </c:if>

            <c:if test="${bean.group == 'BnB' && bean.source == 'BednBrussels'}">
                <wa:mls>Pour réservation, cliquez ici</wa:mls><br/><br/>
                <a href="${bean.mainUrl}" target="_blank"><img src="${staticSite}/img/ml/btn_bednbrussels.jpg"
                                                               alt="bed and brussels"/></a>
            </c:if>

        </div>
    </c:if>

</div>


<div class="description">
        ${bean.mainBody}
</div>
</div>
<div class="clr"></div>


</c:otherwise>

</c:choose>


<c:set var="fb_url"
       value="${config['URL']}${context}/${site}/${module}/${action}/group/${bean.group}/id/${bean.id}.do"/>
<iframe src="http://www.facebook.com/plugins/like.php?href=${fb_url}&amp;layout=standard&amp;show_faces=false&amp;width=450&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=35"
        scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:35px;"
        allowTransparency="true" class="facebook_like"></iframe>

<!--boxotherinformation:start-->
<c:if test="${not empty bean.mainInfo}">
    <div id="box_other_information">
        <h4><wa:mls>Other informations</wa:mls></h4>
            ${bean.mainInfo}
    </div>
</c:if>
<c:if test="${images ne null && fn:length(images) > 0}">
    <c:forEach items="${images}" var="image">
        <img src="${image.sourceUrl}" alt="${wa:nullFree2(image.sourceDescription,bean.mainTitle)}"/>
    </c:forEach>
</c:if>
<!--boxotherinformation:end-->
<!--tab:start-->
<c:choose>

    <c:when test="${bean.group eq 'CONTENT' || bean.group  eq 'PRESTATAIRE'}">
        <div class="TabbedPanelsContentGroup "></div>
    </c:when>
    <c:otherwise>
        <div class="clr"></div>
        <div id="associatedContent"></div>
        <div class="TabbedPanelsContentGroup">
            <wa:include URI="${site}/content/associatedContentFirst">
                <wa:param name="contentType" value="${contentGroupType}"/>
                <wa:param name="group" value="${bean.group}"/>
                <wa:param name="contentId" value="${bean.id}"/>
                <wa:param name="userId" value="${userId}"/>
                <wa:param name="tabbedPanelsTab" value="${tabbedPanelsTab}"/>
            </wa:include>
        </div>
    </c:otherwise>

</c:choose>
<div id="listComment">
    <wa:include URI="${site}/content/comment">
        <wa:param name="group" value="${bean.group}"/>
        <wa:param name="id" value="${bean.id}"/>
    </wa:include>

</div>
</div>
</c:when>
</c:choose>