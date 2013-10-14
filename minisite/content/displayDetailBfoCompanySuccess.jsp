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

<style type="text/css" media="screen">
    @import url("${static}/front/css/nyroModal.css");
    #pratical_information{
        float: left;
        border: none;
        width: 400px;
    }
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>
<script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>


<c:if test="${adminUser != null}">
    <script type="text/javascript">
        function addToNltContent(group, contentId) {
        $.ajax({
        url: '/bitc/admin/ajax/addToNltContent.do?contentId=' + contentId + '&group=' + group,
        type: 'GET',
        dataType: "json",
        success: function (data) {
        alert(data.result);
        }
        })
        }
    </script>
</c:if>
<!-- !!!! Don't put elements here. Content MUST be in content_main div below !!! -->

<div id="content_main" class="bfo_company">
<div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>

<h1 class="no_margin summary">${bean.mainTitle}
</h1>

<c:if test="${not empty bean.mainBigImage}">
    <img src="${bean.mainBigImage}" alt="${bean.mainTitle}" height="200" align="left" class="m22" class="photo">
</c:if>



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
                <span class="locality"> ${bean.city} </span>
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
        <p><strong><wa:mls>Email :</wa:mls></strong>
            <a href="mailto:${bean.email}"><span class="cutEmail">${bean.email}</span></a></p>
    </c:if>
    <c:if test="${not empty bean.URLWebsite && fn:length(bean.URLWebsite)>8}">
        <p><strong><wa:mls>Website :</wa:mls></strong>
            <a href="${bean.URLWebsite}" target="_blank"><span>${bean.URLWebsite}</span></a></p>
    </c:if>
    <c:if test="${not empty bean.latitude and bean.latitude != 0.0 and not empty bean.longitude and bean.longitude != 0.0}">
        <p><a href="javascript:callLetter('a', 'map')"
              class="btn_map_view"><span><wa:mls>View on the map</wa:mls></span></a></p>

        <p><a href="javascript:callLetter('a', 'sv')"
              class="btn_street_view"><span><wa:mls>Google street view</wa:mls></span></a></p>
    </c:if>

    <c:if test="${not empty bean.contentPersons}">
        <p><strong><wa:mls>Persons:</wa:mls></strong>
        <ul id="pesonTable">
            <c:forEach var="person" items="${bean.contentPersons}">
                <c:if test="${person != null}">
                    <li> ${person.name}  ${person.serviceStr} / ${person.email} / ${person.mobile}</li>
                </c:if>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${not empty bean.servicePropertyValues}">
        <p><strong><wa:mls>Services:</wa:mls></strong>
        <ul id="pesonTable">
            <c:forEach var="service" items="${bean.servicePropertyValues}">
                <c:if test="${service != null}">
                    <li> ${service.contentPropertyValue.mainTitleWithDirectParent}</li>
                </c:if>
            </c:forEach>
        </ul>
    </c:if>




</div>
<div id="box_right_information">
    <!--featurepraticalinformation:start-->
    <div id="feature_pratical_information">
        <c:set var="varTmp" value="\""/>
        <div class="ilike_big" rel="${bean.group}|${bean.id}"></div>
        <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"
           addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${bean.group}/id/${bean.id}/name/${waParam.name}"/>"
           addthis:title="${bean.mainTitle}"
           addthis:description="${fn:replace(wa:html2txt(bean.mainAbstract_),varTmp,'&quot;')}"><img
                src="${static}/front/img/ml/btn_share_big.gif" id="logo_share"
                alt="<wa:mls>Share</wa:mls>"/></a>
    </div>
    <!--featurepraticalinformation:end-->

</div>

<div class="clr"></div>

<div id="main_information">

    <div class="description">
        ${bean.mainBody}
        ${bean.memo}
    </div>
</div>

<c:set var="fb_url"
       value="${config['URL']}${context}/${site}/${module}/${action}/group/${bean.group}/id/${bean.id}/name/${waParam.name}.do"/>
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
</div>

<script>
    $(function() {
    // initialize scrollable
    $(".scrollable").scrollable();
    });
</script>

<script type="text/javascript">
    $(function() {
    $('a.spotImage').lightBox({
    fixedNavigation:true,
    'imageBtnClose': "/bitc/static/front/img/lightbox-btn-close.gif",
    'imageLoading': "/bitc/static/front/img/lightbox-ico-loading.gif",
    'imageBtnNext': "/bitc/static/front/img/lightbox-btn-next.gif",
    'imageBtnPrev': "/bitc/static/front/img/lightbox-btn-prev.gif"
    });
    });

</script>