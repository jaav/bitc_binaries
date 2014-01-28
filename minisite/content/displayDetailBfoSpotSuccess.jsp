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

<style type="text/css" media="screen">
	@import url("${static}/front/css/nyroModal.css");
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>
<script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
<link rel="stylesheet" type="text/css" href="${static}/front/css/scrollable-buttons.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/lightbox.css" media="screen"/>
<script type="text/javascript" src="${static}/front/js/lightbox.js"></script>


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

<div id="content_main" class="bfo_spot">
<div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>

<h1 class="no_margin summary">${bean.mainTitle}
	<c:if test="${contentGroupType eq 'ContentRestaurant' &&  not empty bean.ranking}">
	      	<span> <c:forEach var="rankingLoopCount" begin="1" end="${bean.ranking}">
			      <img src="${static}/front/img/ml/visu_iris.jpg" alt="" class="float_right"/>
		      </c:forEach>
			</span>
	</c:if>
</h1> <!-- ${color} -->

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
	<c:when test="${not empty bean.mainBigImage}">
		<img src="${bean.mainBigImage}" alt="${bean.mainTitle}" height="200" align="left" class="m22" class="photo">
	</c:when>
	<c:otherwise>
		<img src="${context}/static/minisite/img/bfo/default_image.jpg" alt="${bean.mainTitle}" align="left" class="m22"
		     class="photo"/>
	</c:otherwise>
</c:choose>


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
	<div id="pratical_information" class="location vcard">
		<h4><wa:mls>Practical informations</wa:mls></h4>
		<c:if test="${contentGroupType eq 'ContentEvent'}">
			<c:if test="${not empty bean.placeName}">
				<p class="fn org">${bean.placeName}</p>
			</c:if>
		</c:if>

		<c:set var="isHouse" value="false"/>
		<c:forEach var="profile" items="${bean.profilePropertyValues}">
			<c:if test="${profile != null && profile.contentPropertyValue.name eq 'Maisons'}">
				<c:set var="isHouse" value="true"/>
			</c:if>
		</c:forEach>
		<c:if test="${not empty bean.address && not isHouse}">

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
			<p><strong><wa:mls>Email :</wa:mls></strong> <br/>
				<a href="mailto:${bean.email}"><span class="cutEmail">${bean.email}</span></a></p>
		</c:if>
		<c:if test="${not empty bean.URLWebsite && fn:length(bean.URLWebsite)>8}">
			<p><strong><wa:mls>Website :</wa:mls></strong> <br/>
				<a href="${bean.URLWebsite}" target="_blank"><span
					class="cutEmail">${bean.URLWebsite}</span></a></p>
		</c:if>
		<c:if
			test="${not empty bean.latitude and bean.latitude != 0.0 and not empty bean.longitude and bean.longitude != 0.0}">
			<p><a href="javascript:callLetter('a', 'map')"
			      class="btn_map_view"><span><wa:mls>View on the map</wa:mls></span></a></p>

			<p><a href="javascript:callLetter('a', 'sv')"
			      class="btn_street_view"><span><wa:mls>Google street view</wa:mls></span></a></p>
		</c:if>


		<c:if test="${not empty bean.architect}">
			<p><strong><wa:mls>Architect :</wa:mls></strong> ${bean.architect}</p>
		</c:if>
		<c:if test="${not empty bean.epoche}">
			<p><strong><wa:mls>Epoche :</wa:mls></strong> ${bean.epoche}</p>
		</c:if>
		<c:if test="${not empty bean.placeConditions}">
			<p><strong><wa:mls>Place conditions :</wa:mls></strong> >${bean.placeConditions}</p>
		</c:if>
		<c:if test="${not empty bean.parking}">
			<p><strong><wa:mls>Parking :</wa:mls></strong> ${bean.parking}</p>
		</c:if>
		<c:if test="${not empty bean.cost}">
			<p><strong><wa:mls>Cost :</wa:mls></strong> ${bean.cost}</p>
		</c:if>
		<c:if test="${bean.surface gt 0}">
			<p><strong><wa:mls>Surface :</wa:mls></strong> ${bean.surface}</p>
		</c:if>
		<c:if test="${not empty bean.archStyle}">
			<p><strong><wa:mls>Architectural style :</wa:mls></strong> ${bean.archStyle}</p>
		</c:if>


		<c:if test="${not empty bean.profilePropertyValues}">
			<p><strong><wa:mls>Spot Profiles:</wa:mls></strong>
			<ul id="pesonTable">
				<c:forEach var="profile" items="${bean.profilePropertyValues}">
					<c:if test="${profile != null}">
						<li> ${profile.contentPropertyValue.mainTitleWithDirectParent}</li>
					</c:if>
				</c:forEach>
			</ul>
		</c:if>

	</div>

</div>

<div class="clr"></div>

<div id="main_information">

	<div class="description">
		${bean.mainBody}
		${bean.memo}
	</div>
</div>

<div class="clr"></div>

<div style="margin:20px auto; width: 634px; height:120px;">
	<!-- "previous page" action -->
	<a class="prev browse left"></a>

	<!-- root element for scrollable -->
	<div class="scrollable" id="scrollable">

		<!-- root element for the items -->
		<div class="items">
			<c:forEach items="${bean.validContentSpotImages}" var="spotImage" varStatus="status">
				<c:if test="${status.index % 5 == 0}">
					<div>
				</c:if>
				<a class="spotImage" href="${fn:replace(spotImage.imageURL,'S.', 'L.')}">
					<img src="${spotImage.imageURL}"/>
				</a>
				<c:if test="${(status.index % 5 eq 4) or (status.last)}">
					</div>
				</c:if>
			</c:forEach>
		</div>

	</div>

	<!-- "next page" action -->
	<a class="next browse right"></a>
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


<c:set var="fb_url"
       value="${config['URL']}${context}/${site}/${module}/${action}/group/${bean.group}/id/${bean.id}/name/${waParam.name}.do"/>
<iframe
	src="http://www.facebook.com/plugins/like.php?href=${fb_url}&amp;layout=standard&amp;show_faces=false&amp;width=450&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=35"
	scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:35px;"
	allowTransparency="true" class="facebook_like"></iframe>
<!--tab:start-->
</div>

<script>
	$(function () {
		var source = $('div.items div').not('.cloned').children('a');
		source.lightBox({
			fixedNavigation: true,
			'imageBtnClose': "/bitc/static/front/img/lightbox-btn-close.gif",
			'imageLoading': "/bitc/static/front/img/lightbox-ico-loading.gif",
			'imageBtnNext': "/bitc/static/front/img/lightbox-btn-next.gif",
			'imageBtnPrev': "/bitc/static/front/img/lightbox-btn-prev.gif"
		});
	});

	$(function () {
		// initialize scrollable
		$(".scrollable").scrollable();
	});
</script>