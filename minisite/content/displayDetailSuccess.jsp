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
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>


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

<div id="content_main" class="vevent">
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
			<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"
			   addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${bean.group}/id/${bean.id}/name/${waParam.name}"/>"
			   addthis:title="${bean.mainTitle}"
			   addthis:description="${fn:replace(wa:html2txt(bean.mainAbstract_),varTmp,'&quot;')}"><img
				src="${static}/front/img/ml/btn_share_big.gif" id="logo_share"
				alt="<wa:mls>Share</wa:mls>"/></a>
		</div>
		<!--featurepraticalinformation:end-->
		<c:if test="${contentGroupType ne 'ContentArticle' && contentGroupType ne 'ContentProduct'}">
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
					<p><strong><wa:mls>Email :</wa:mls></strong> <br/>
						<a href="mailto:${bean.email}"><span class="cutEmail">${bean.email}</span></a></p>
				</c:if>
				<c:if test="${not empty bean.URLWebsite && fn:length(bean.URLWebsite)>8}">
					<p><strong><wa:mls>Website :</wa:mls></strong> <br/>
						<a href="${bean.URLWebsite}" target="_blank"><span
							class="cutEmail">${bean.URLWebsite}</span></a></p>
				</c:if>
				<c:if test="${bean.group eq 'MICE'}">
					<c:choose>
						<c:when test="${bean.attachedContentVenue != null}">
							<p><strong><wa:mls>Venue :</wa:mls></strong>
								<a
									href="<wa:url URI="${site}/content/displayDetailVenue/group/${bean.attachedContentVenue.group}/id/${bean.attachedContentVenue.id}"/>"><span>${bean.attachedContentVenue.mainTitle}</span></a>
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
				<c:choose>
					<c:when test="${bean.group == 'HERITAGE_PLACE' || bean.group == 'HERITAGE_EVENT'}">
						<p>
							<a
								href="javascript:showModelPanel('/bitc/map/map.jsp?lat=${bean.latitude}&lng=${bean.longitude}&locale=${culture.language}')"
								class="btn_map_view"><span><wa:mls>View on the map</wa:mls></span></a></p>
					</c:when>
					<c:otherwise>
						<c:if
							test="${contentType ne 'ContentArticle'  && contentGroupType ne 'ContentProduct' and not empty bean.latitude and bean.latitude != 0.0 and not empty bean.longitude and bean.longitude != 0.0}">
							<p><a href="javascript:callLetter('a', 'map')"
							      class="btn_map_view"><span><wa:mls>View on the map</wa:mls></span></a></p>

							<p><a href="javascript:callLetter('a', 'sv')"
							      class="btn_street_view"><span><wa:mls>Google street view</wa:mls></span></a></p>
						</c:if>
					</c:otherwise>
				</c:choose>
				<c:if test="${bean.group == 'GUIDED_TOUR' && bean.source == 'VoirEtDire'}">
					<strong><wa:mls>Réserver:</wa:mls></strong><br/><br/>
					<a href="/bitc/front/tracking/link/desc/voiretdirebruxelles/cid/F0FDB0F455B48382.do"
					   target="_blank"><img src="${static}/front/img/ml/btn_voiretdire.jpg"
					                        alt="voir et dire bruxelles"/></a>
				</c:if>
				<c:if test="${not empty propTalk}">
					<a href="${propTalk}" target="_blank"><img class="btn_museumtalks"
					                                           src="${static}/front/img/ml/btn_museumtalks.jpg"
					                                           alt="museum talks"/></a>
				</c:if>

				<c:if test="${bean.group == 'BnB' && bean.source == 'BednBrussels'}">
					<wa:mls>Pour réservation, cliquez ici</wa:mls><br/><br/>
					<a href="${bean.mainUrl}" target="_blank"><img src="${static}/front/img/ml/btn_bednbrussels.jpg"
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

<c:if test="${bean.group eq 'BFOSPOT'}">
	<div style="margin:0 auto; width: 634px; height:120px;">
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
	<br/>

	<div class="clr"></div>
	<legend style="font-weight: bold"><wa:mls>Spot Profiles</wa:mls></legend>
	<br/>

	<div class="clr"></div>
	<c:forEach var="profile" items="${bean.profilePropertyValues}">
		${profile.contentPropertyValue.mainTitleWithDirectParent}<br/>
	</c:forEach>
</c:if>

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

<div id="listComment">
	<wa:include URI="${site}/content/comment">
		<wa:param name="group" value="${bean.group}"/>
		<wa:param name="id" value="${bean.id}"/>
	</wa:include>

</div>
</div>
<style type="text/css">
	#pesonTable tr.td {
		border: 1px solid black;
	}
</style>