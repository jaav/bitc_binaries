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
<%@ taglib prefix="wabd" uri="BigDecimalUtilsTags" %>
<%@ taglib prefix="wast" uri="StringToolsTags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
			minWidth: 700,
			minHeight: 600,
			forceType: 'iframe',
			closeSelector: '.nyroModalClose',
			url: '${context}/front/other/displayTripPlannerLightBox.do?contentName=' + data.contentName + '&status=' + data.status + '&panelContentType=' + data.panelContentType + '&panelGroup=' + data.panelGroup + '&panelContentId=' + data.contentId,
			closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
		});

	}

	function meetingPlannerLightBox(data) {
		$.nyroModalManual({
			minWidth: 700,
			minHeight: 600,
			forceType: 'iframe',
			closeSelector: '.nyroModalClose',
			url: '${context}/front/other/displayMeetingPlannerLightBox.do?contentName=' + data.contentName + '&status=' + data.status + '&panelContentType=' + data.panelContentType + '&panelGroup=' + data.panelGroup + '&panelContentId=' + data.contentId,
			closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
		});

	}

</script>

<c:if test="${adminUser != null}">
	<script>
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
<div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>
<div class="clear"></div>
<div id="content_main" class="${group}">
<c:if test="${not empty adminUser}">
	<a
		href="javascript:addToNltContent('${bean.group}','${bean.id}');"><wa:mls>Ajouter à la table nlt content</wa:mls></a>
	<a href="${context}/admin/${contentTypeAdmin}/list.do?s_publishContent_id=${bean.id}&s_submit=Search"
	   target="admin"><wa:mls>Edit</wa:mls></a>
</c:if>
<h1 class="no_margin line_grey">${bean.mainTitle}
</h1> <!-- ${color} -->


<c:choose>
<c:when test="${not empty bean.mainBigImage}">
<div class="float_left mtop10" style="background-image: url('${bean.mainBigImage}')">
</c:when>
<c:otherwise>
<div class="float_left mtop10" style="background-image: url('${context}/static/${site}/img/ml/default_content.jpg')">
</c:otherwise>
</c:choose>

	<!--featurepraticalinformation:start-->
	<div id="feature_pratical_information2">
		<c:set var="varTmp" value="\""/>
		<div class="ilike_big" rel="${bean.group}|${bean.id}"></div>
		<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"
		   addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${bean.group}/id/${bean.id}"/>"
		   addthis:title="${bean.mainTitle}"
		   addthis:description="${fn:replace(wa:html2txt(bean.mainAbstract_),varTmp,'&quot;')}"><img
			src="${staticSite}/img/ml/btn_share_big.gif" id="logo_share" alt="<wa:mls>Share</wa:mls>"/></a>

		<a
			href="javascript:<c:choose><c:when test="${refererMeeting eq '1'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${bean.group}','${bean.id}');"><img
			src="${staticSite}/img/ml/btn_add_big.gif" alt="<wa:mls>Add</wa:mls>" id="logo_add"/></a>

	</div>
	<!--featurepraticalinformation:end-->
</div>

<div id="pratical_information_large">
	<h4><wa:mls>Practical informations</wa:mls></h4>
	<c:if test="${not empty bean.address}">
		<p> ${bean.address} </p>

		<p>
			<c:if test="${not empty bean.zipcode && bean.zipcode > 0}">
				${bean.zipcode}
			</c:if>
			<c:if test="${not empty bean.city}">
				${bean.city}
			</c:if>
		</p>
	</c:if>
	<c:if test="${not empty bean.phone}">
		<p><strong><wa:mls>Tel :</wa:mls></strong> ${bean.phone}</p>
	</c:if>
	<c:if test="${not empty bean.mobile}">
		<p><strong><wa:mls>Mobile :</wa:mls></strong> ${bean.mobile}</p>
	</c:if>
	<c:if test="${not empty bean.fax}">
		<p><strong><wa:mls>Fax :</wa:mls></strong> ${bean.fax}</p>
	</c:if>

	<c:if test="${not empty bean.URLWebsite}">
	<p><strong><a href="${bean.URLWebsite}" target="_blank"><wa:mls>Website</wa:mls></a></strong> <br/>
		</c:if>


	<p>
		<c:if test="${not empty bean.listCuisine}">
			<strong><wa:mls>List Cuisines :</wa:mls></strong>
			<span>${bean.listCuisine}</span> <br/>
		</c:if>
	</p>

	<p>
		<c:if test="${not empty bean.listAccomodation}">
			<strong><wa:mls>List Accomodation :</wa:mls></strong>
			<span>${bean.listAccomodation}</span> <br/>
		</c:if>
	</p>

	<p>
		<c:if test="${not empty bean.listPaiementType}">
			<strong><wa:mls>List Paiement Type :</wa:mls></strong>
			<span>${bean.listPaiementType}</span> <br/>
		</c:if>
	</p>

	<p>
		<c:if test="${not empty bean.price}">
			<strong><wa:mls>Price :</wa:mls></strong> ${bean.price}<br/>
		</c:if>
	</p>

	<p>
		<c:if test="${not empty bean.capacity}">
			<strong><wa:mls>Capacity :</wa:mls></strong> ${bean.capacity}<br/>
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

	<div itemprop="rating" itemscope itemtype="http://data-vocabulary.org/Rating" style="display: none;">
		Hidden Rating: <span itemprop="value">${bean.rating}</span>
		<meta itemprop="best" content="10"/>
	</div>
	<c:if test="${not empty bean.ratingIcon}">
		<p><strong style="float:left;"><wa:mls>Rating resto.be:</wa:mls> </strong><span
			style="background:url('${staticSite}/img/ml/rating_${bean.ratingIcon}.jpg') no-repeat 0px 0px; width:80px;display: inline-block;height: 16px;margin-left: 6px;"></span>
		</p>
	</c:if>
	<c:if test="${not empty bean.michelin}">
		<p><strong style="float:left;"><wa:mls>Rating Michelin:</wa:mls> </strong><span
			style="background: url('${staticSite}/img/ml/michelin_${fn:substring(bean.michelin, 0,1)}.jpg') no-repeat 0px 0px; width:80px;display: inline-block;height: 16px;margin-left: 6px;"></span>
		</p>
	</c:if>
	<c:if test="${not empty bean.gault}">
		<p><strong style="float:left;"><wa:mls>Rating GaultMillau:</wa:mls> </strong><span
			style="width:80px;display: inline-block;height: 16px;margin-left: 6px;">${bean.gault}</span></p>
	</c:if>

	<c:if
		test="${not empty bean.latitude and bean.latitude != 0.0 and not empty bean.longitude and bean.longitude != 0.0}">
		<p><a href="javascript:callLetter('a', 'map')"
		      class="btn_map_view"><span><wa:mls>View on the map</wa:mls></span></a>
		</p>

		<p><a href="javascript:callLetter('a', 'sv')"
		      class="btn_street_view"><span><wa:mls>Google street view</wa:mls></span></a></p>
		<script type="text/javascript">
			addMarker(${bean.longitude}, ${bean.latitude}, "${bean.formatMainTitle}", "a", ${bean.svLongitude}, ${bean.svLatitude}, ${bean.svHeading}, ${bean.svPitch}, ${bean.svZoom});
		</script>

		<c:if test="${bean.fromResto and bean.bookingAvailable}">
			<p>
				<a href="javascript:openIFrame('${bean.restoBookingURL}')" class="btn_resto_booking">
					<wa:mls>book now</wa:mls>
				</a>
			</p>
		</c:if>
	</c:if>
	<div>
		<c:forEach var="item" items="${listPicto}" varStatus="loop">
			<a href="${item.defaultDescription}?lang=${culture.language}" target="_blank"> <img src="${item.logo}"
			                                                                                    title="${item.mainTitle} "
			                                                                                    width="27" height="27"
			                                                                                    class="m23"></a>
			<c:choose>
				<c:when test="${fn:length(listPicto) >8}">
					<c:if test="${loop.count  == 5}">
						<div class="clr"></div>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${loop.count  == 4}">
						<div class="clr"></div>
					</c:if>
				</c:otherwise>
			</c:choose>
		</c:forEach>


	</div>

</div>


<div class="clr"></div>

<div id="main_information">


	<c:choose>
		<c:when test="${ not empty bean.ranking}">
			<div id="box_other_information_restaurant">${bean.mainBody}</div>
			<div class="clr"></div>
		</c:when>
		<c:otherwise>
			${bean.mainBody}
		</c:otherwise>
	</c:choose>


</div>
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


<div class="clr"></div>
<c:set var="fb_url"
       value="${config['URL']}${context}/${site}/${module}/${action}/group/${bean.group}/id/${bean.id}.do"/>
<iframe
	src="http://www.facebook.com/plugins/like.php?href=${fb_url}&amp;layout=standard&amp;show_faces=false&amp;width=450&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=35"
	scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:35px;"
	allowTransparency="true" class="facebook_like"></iframe>
<!-- Khoa add start-->
<div class="fb-comments" data-href="${fb_url}" data-num-posts="5" data-width="auto">
</div>
<!-- Khoa add end -->
<!--tab:start-->

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

<div id="listComment">
	<wa:include URI="${site}/content/comment">
		<wa:param name="group" value="${bean.group}"/>
		<wa:param name="id" value="${bean.id}"/>
	</wa:include>

</div>

</div>


<script language='javascript'>
	function openIFrame(contentURL) {
		$.nyroModalManual({
			zIndex: 1001,
			minWidth: 690,
			minHeight: 560,
			forceType: 'iframe',
			closeSelector: '.nyroModalClose',
			url: contentURL,
			closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.png" alt="close" /></a>'
		});
	}
</script>
