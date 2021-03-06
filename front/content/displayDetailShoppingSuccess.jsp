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

		<!--featurepraticalinformation2:start-->
		<div id="feature_pratical_information2">
			<c:set var="varTmp" value="\""/>
			<div class="ilike_big" rel="${bean.group}|${bean.id}"></div>
			<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"
			   addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${bean.group}/id/${bean.id}"/>"
			   addthis:title="${bean.mainTitle}"
			   addthis:description="${fn:replace(wa:html2txt(bean.mainAbstract_),varTmp,'&quot;')}"><img
				src="${staticSite}/img/ml/btn_share_big.gif" id="logo_share" alt="<wa:mls>Share</wa:mls>"/></a>

			<a
				href="javascript:<c:choose><c:when test="${section eq 'meetings'  || refererMeeting eq '1'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${bean.group}','${bean.id}');"><img
				src="${staticSite}/img/ml/btn_add_big.gif" alt="<wa:mls>Add</wa:mls>" id="logo_add"/></a>

		</div>
		<!--featurepraticalinformation2:end-->
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
		<c:if test="${not empty bean.email}">
			<p><strong><wa:mls>Email :</wa:mls></strong> <br/>
				<a href="mailto:${bean.email}"><span>${bean.email}</span></a></p>
		</c:if>
		<c:if test="${not empty bean.URLWebsite}">
			<p><strong><wa:mls>Website :</wa:mls></strong> <br/>
				<a href="${bean.URLWebsite}" target="_blank"><span>${bean.URLWebsite}</span></a></p>
		</c:if>

		<c:if test="${bean.source == 'Atrium'}">
			<p>
				<wa:include URI="front/content/propertyValues">
					<wa:param name="lib" value="Type de magasin :"/>
					<wa:param name="group" value="${bean.group}"/>
					<wa:param name="id" value="${bean.id}"/>
					<wa:param name="prop" value="SHOPPING_CATEGORY"/>
				</wa:include>

			</p>
		</c:if>
		<c:if
			test="${not empty bean.latitude and bean.latitude != 0.0 and not empty bean.longitude and bean.longitude != 0.0}">
			<p><a href="javascript:callLetter('a', 'map')" class="btn_map_view"><span><wa:mls>View on the map</wa:mls></span></a>
			</p>

			<p><a href="javascript:callLetter('a', 'sv')"
			      class="btn_street_view"><span><wa:mls>Google street view</wa:mls></span></a></p>

			<div style="margin-left:15px;">
				<c:forEach var="item" items="${listPicto}" varStatus="loop">
					<a href="${item.defaultDescription}?lang=${culture.language}"> <img src="${item.logo}"
					                                                                    title="${item.mainTitle}" width="27"
					                                                                    height="27" align="left" class="m23"></a>
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
			<script type="text/javascript">
				addMarker(${bean.longitude}, ${bean.latitude}, "${bean.formatMainTitle}", "a", ${bean.svLongitude}, ${bean.svLatitude}, ${bean.svHeading}, ${bean.svPitch}, ${bean.svZoom});
			</script>
		</c:if>

		<c:if test="${bean.source == 'Atrium'}">
			<!-- <img src="${staticSite}/img/ml/btn_shopinbrussels.jpg" /> -->
			<a
				href="<c:choose><c:when test="${culture eq 'BE_en' }">http://www.shopinbrussels.be/EN</c:when><c:when test="${culture eq 'BE_fr' }">http://www.shopinbrussels.be/FR</c:when><c:when test="${culture eq 'BE_nl' }">http://www.shopinbrussels.be/NL</c:when><c:otherwise>http://www.shopinbrussels.be</c:otherwise></c:choose>"
				target="_blank"><img src="${staticSite}/img/ml/btn_shopinbrussels.jpg"/></a>
		</c:if>

	</div>


	<div class="clr"></div>


	<div id="main_information">
		${bean.mainBody}
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
	

