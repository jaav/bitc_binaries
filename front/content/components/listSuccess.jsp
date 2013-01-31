<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css" media="screen">
@import url("${static}/front/css/nyroModal.css");
</style>
<script type="text/javascript"
	src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>
<script src="${static}/ajax/js/tripPlannerMethods.js"
	type="text/javascript"></script>
<script src="${static}/ajax/js/meetingPlannerMethods.js"
	type="text/javascript"></script>
<script type="text/javascript">
    //TRIP PLANNER METHOD
    //* addToTripPlanner(group, contentId) => call tripPlannerLightBox(data) => data.contentName & data.status ( return contentName & status )
    function tripPlannerLightBox(data) {
        $.nyroModalManual({
            minWidth:700,
            minHeight:400,
            forceType:'iframe',
            closeSelector:'.nyroModalClose',
            url:'${context}/front/other/displayTripPlannerLightBox.do?contentName=' + data.contentName + '&status=' + data.status + '&panelContentType=' + data.panelContentType + '&panelGroup=' + data.panelGroup + '&panelContentId=' + data.contentId,
            closeButton:'<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
        });

    }
    function meetingPlannerLightBox(data) {
        $.nyroModalManual({
            minWidth:700,
            minHeight:400,
            forceType:'iframe',
            closeSelector:'.nyroModalClose',
            url:'${context}/front/other/displayMeetingPlannerLightBox.do?contentName=' + data.contentName + '&status=' + data.status + '&panelContentType=' + data.panelContentType + '&panelGroup=' + data.panelGroup + '&panelContentId=' + data.contentId,
            closeButton:'<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
        });

    }
</script>
<!--tab:start-->

<c:if test="${contentType ne 'ContentGuidedTour'}">
	<div class="TabbedPanelsContentGroup">
		<div class="Tabbe_Content_Group">

			<div class="tab_paging">
				<wa:include URI="${site}/content/navNumber">
					<wa:param name="navId" value="1" />
				</wa:include>

			</div>
			<ul class="tab_list_complete">
				<c:set var="indexLetter" value="0" />
				<c:forEach var="item" items="${list}" varStatus="loop">
					<li><c:if test="${contentType ne 'ContentPress'}">
							<a
								href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>">
								<c:choose>
									<c:when test="${not empty item.mainSmallImage}">
										<img src="${item.mainSmallImage}"
											alt="${item.formatMainTitle}" width="165" />
									</c:when>
									<c:otherwise>
										<img
											src="${context}/static/${site}/img/ml/default_content.jpg"
											alt="${item.formatMainTitle}" width="165" />
									</c:otherwise>
								</c:choose>
							</a>
						</c:if> <c:if test="${contentType eq 'ContentPress'}">
							<c:choose>
								<c:when test="${not empty item.mainSmallImage}">
									<img src="${item.mainSmallImage}" alt="${item.formatMainTitle}"
										width="165" />
								</c:when>
								<c:otherwise>
									<img src="${context}/static/${site}/img/ml/press_small.jpeg"
										alt="${item.formatMainTitle}" width="165" />
								</c:otherwise>
							</c:choose>
						</c:if>
						<div class="txt" id="txt_${item.id}">
							<h3 class="no_margin">
								<c:choose>
									<c:when
										test="${contentType eq 'ContentPress' and empty item.body}">
                                    ${item.mainTitle}
                                </c:when>
									<c:otherwise>
										<a
											href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>"
											title="${item.formatMainTitle}">${item.mainTitle}</a>
									</c:otherwise>
								</c:choose>

							</h3>
							<c:choose>
								<c:when
									test="${contentType ne 'ContentArticle' && contentType ne 'ContentPress' && empty item.mainAbstract_}">
									<c:if test="${not empty item.address}">
										<p>${item.address}</p>

										<p>
											<c:if test="${not empty item.zipcode && item.zipcode > 0}">
                                            ${item.zipcode}
                                        </c:if>
											<c:if test="${not empty item.city}">
                                            ${item.city}
                                        </c:if>
										</p>
									</c:if>
									<p>
										<c:if test="${not empty item.phone}">
											<strong><wa:mls>Tel :</wa:mls></strong> ${item.phone}<br />
										</c:if>
										<c:if test="${not empty item.mobile}">
											<strong><wa:mls>Mobile :</wa:mls></strong> ${item.mobile}<br />
										</c:if>
										<c:if test="${not empty item.fax}">
											<strong><wa:mls>Fax :</wa:mls></strong> ${item.fax}<br />
										</c:if>
										<c:if test="${not empty item.email}">
											<strong><wa:mls>Email :</wa:mls></strong>
											<span><a href="mailto:${item.email}">${item.email}</a></span>
											<br />
										</c:if>
										<c:if test="${not empty item.URLWebsite}">
											<strong><wa:mls>Website :</wa:mls></strong>
											<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
										</c:if>
									</p>
								</c:when>
								<c:otherwise>

									<div class="cutMainAbstract">${item.mainAbstract_}</div>
								</c:otherwise>
							</c:choose>
							<c:if test="${item.group eq 'PRESS_RELEASE'}">
								<c:if test="${not empty item.pressDocDate}">
									<strong><wa:mls>Press Date :</wa:mls></strong>
									<fmt:formatDate value="${item.pressDocDate}"
										pattern="dd MMM yyyy" />
									<br />
								</c:if>
								<c:if test="${not empty item.pressDoc}">
									<strong><wa:mls>Press Release :</wa:mls></strong>
									<a href="${item.pressDoc}" target="_blank"> <wa:mls>click here to download</wa:mls>
									</a>
									<br />
								</c:if>
							</c:if>

						</div>
						<div class="btn">
							<c:if
								test="${contentType ne 'ContentPress' or not empty item.body}">
								<div class="more_info">
									<a
										href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>"
										class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a>
								</div>
							</c:if>
							<c:if
								test="${contentType ne 'ContentArticle' and contentType ne 'ContentPress' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
								<a
									href="javascript:callLetter('${wa:numberToChar(indexLetter)}', 'map')"
									class="map"><span><wa:mls>Map :</wa:mls></span><img
									src="${staticSite}/img/ml/btn_map_${wa:numberToChar(indexLetter)}.jpg"
									alt="Map ${wa:numberToChar(indexLetter)}" /></a>
								<br />
								<a
									href="javascript:callLetter('${wa:numberToChar(indexLetter)}', 'sv')"
									class="sv"><span><wa:mls>Street view :</wa:mls></span><img
									src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view" /></a>
								<script type="text/javascript">
                                addMarker(${item.longitude}, ${item.latitude}, "${item.formatMainTitle}", "${wa:numberToChar(indexLetter)}", ${item.svLongitude}, ${item.svLatitude}, ${item.svHeading}, ${item.svPitch}, ${item.svZoom});
                            </script>
								<c:set var="indexLetter" value="${indexLetter+1}" />
							</c:if>
							<c:set var="varTmp" value="\"" />
							<!-- <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}${context}/front/content/detail/group/${item.group}/id/${item.id}.do" addthis:title="${item.formatMainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a> -->
							<a
								href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe"
								class="addthis_button share"
								addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>"
								addthis:title="${item.formatMainTitle}"
								addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img
								src="${staticSite}/img/ml/btn_share.gif"
								alt="<wa:mls>Share</wa:mls>" /></a>

							<div class="ilike" rel="${item.group}|${item.id}"></div>
							<c:if
								test="${group ne 'PRESS_REPORT'  and group ne 'OG_TOUR' && group ne 'LATEST_NEWS' && group ne 'TESTIMONIAL' }">
								<a
									href="javascript:<c:choose><c:when test="${section eq 'meetings' or section eq 'trade'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${item.group}','${item.id}');"
									class="add"><img src="${staticSite}/img/ml/btn_add.gif"
									alt="<wa:mls>Add</wa:mls>" /></a>
							</c:if>
						</div>

						<div class="clr"></div></li>
					<c:if test="${loop.count eq 1}">
						<c:set var="group" value="${item.group}"></c:set>
					</c:if>
				</c:forEach>

			</ul>
			<div class="tab_paging">

				<wa:include URI="${site}/content/navNumber">
					<wa:param name="navId" value="2" />
				</wa:include>

			</div>
		</div>
	</div>
</c:if>
<c:if test="${contentType eq 'ContentGuidedTour'}">
	<c:if test="${empty showAllOnRequestGuide or showAllOnRequestGuide == false}">
	<div class="TabbedPanelsContentGroup">
		<h2><wa:mls>Visits on fixed schedules</wa:mls></h2>
		<div class="Tabbe_Content_Group">
			<c:if test="${showAllFixDateGuide}">
			<div class="tab_paging">
				<wa:include URI="${site}/content/navNumber">
					<wa:param name="navId" value="1" />
				</wa:include>
			</div>
			</c:if>
			<ul class="tab_list_complete">
				<c:set var="indexLetter" value="0" />
				<c:if test="${empty fixedScheduleGuidedTours}">
						<h3>
							<wa:mls>No record found</wa:mls>
						</h3>
				</c:if>
				<c:forEach var="item" items="${fixedScheduleGuidedTours}"
					varStatus="loop">
					<li><c:if test="${contentType ne 'ContentPress'}">
							<a
								href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>">
								<c:choose>
									<c:when test="${not empty item.mainSmallImage}">
										<img src="${item.mainSmallImage}"
											alt="${item.formatMainTitle}" width="165" />
									</c:when>
									<c:otherwise>
										<img
											src="${context}/static/${site}/img/ml/default_content.jpg"
											alt="${item.formatMainTitle}" width="165" />
									</c:otherwise>
								</c:choose>
							</a>
						</c:if> <c:if test="${contentType eq 'ContentPress'}">
							<c:choose>
								<c:when test="${not empty item.mainSmallImage}">
									<img src="${item.mainSmallImage}" alt="${item.formatMainTitle}"
										width="165" />
								</c:when>
								<c:otherwise>
									<img src="${context}/static/${site}/img/ml/press_small.jpeg"
										alt="${item.formatMainTitle}" width="165" />
								</c:otherwise>
							</c:choose>
						</c:if>
						<div class="txt" id="txt_${item.id}">
							<h3 class="no_margin">
								<c:choose>
									<c:when
										test="${contentType eq 'ContentPress' and empty item.body}">
                                    ${item.mainTitle}
                                </c:when>
									<c:otherwise>
										<a
											href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>"
											title="${item.formatMainTitle}">${item.mainTitle}</a>
									</c:otherwise>
								</c:choose>

							</h3>
							<c:choose>
								<c:when
									test="${contentType ne 'ContentArticle' && contentType ne 'ContentPress' && empty item.mainAbstract_}">
									<c:if test="${not empty item.address}">
										<p>${item.address}</p>

										<p>
											<c:if test="${not empty item.zipcode && item.zipcode > 0}">
                                            ${item.zipcode}
                                        </c:if>
											<c:if test="${not empty item.city}">
                                            ${item.city}
                                        </c:if>
										</p>
									</c:if>
									<p>
										<c:if test="${not empty item.phone}">
											<strong><wa:mls>Tel :</wa:mls></strong> ${item.phone}<br />
										</c:if>
										<c:if test="${not empty item.mobile}">
											<strong><wa:mls>Mobile :</wa:mls></strong> ${item.mobile}<br />
										</c:if>
										<c:if test="${not empty item.fax}">
											<strong><wa:mls>Fax :</wa:mls></strong> ${item.fax}<br />
										</c:if>
										<c:if test="${not empty item.email}">
											<strong><wa:mls>Email :</wa:mls></strong>
											<span><a href="mailto:${item.email}">${item.email}</a></span>
											<br />
										</c:if>
										<c:if test="${not empty item.URLWebsite}">
											<strong><wa:mls>Website :</wa:mls></strong>
											<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
										</c:if>
									</p>
								</c:when>
								<c:otherwise>

									<div class="cutMainAbstract">${item.mainAbstract_}</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="btn">
							<c:if
								test="${contentType ne 'ContentPress' or not empty item.body}">
								<div class="more_info">
									<a
										href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>"
										class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a>
								</div>
							</c:if>
							<c:if
								test="${contentType ne 'ContentArticle' and contentType ne 'ContentPress' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
								<a
									href="javascript:callLetter('${wa:numberToChar(indexLetter)}', 'map')"
									class="map"><span><wa:mls>Map :</wa:mls></span><img
									src="${staticSite}/img/ml/btn_map_${wa:numberToChar(indexLetter)}.jpg"
									alt="Map ${wa:numberToChar(indexLetter)}" /></a>
								<br />
								<a
									href="javascript:callLetter('${wa:numberToChar(indexLetter)}', 'sv')"
									class="sv"><span><wa:mls>Street view :</wa:mls></span><img
									src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view" /></a>
								<script type="text/javascript">
                                addMarker(${item.longitude}, ${item.latitude}, "${item.formatMainTitle}", "${wa:numberToChar(indexLetter)}", ${item.svLongitude}, ${item.svLatitude}, ${item.svHeading}, ${item.svPitch}, ${item.svZoom});
                            </script>
								<c:set var="indexLetter" value="${indexLetter+1}" />
							</c:if>
							<c:set var="varTmp" value="\"" />
							<!-- <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}${context}/front/content/detail/group/${item.group}/id/${item.id}.do" addthis:title="${item.formatMainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a> -->
							<a
								href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe"
								class="addthis_button share"
								addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>"
								addthis:title="${item.formatMainTitle}"
								addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img
								src="${staticSite}/img/ml/btn_share.gif"
								alt="<wa:mls>Share</wa:mls>" /></a>

							<div class="ilike" rel="${item.group}|${item.id}"></div>
							<c:if
								test="${group ne 'PRESS_REPORT'  and group ne 'OG_TOUR' && group ne 'LATEST_NEWS' && group ne 'TESTIMONIAL' }">
								<a
									href="javascript:<c:choose><c:when test="${section eq 'meetings' or section eq 'trade'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${item.group}','${item.id}');"
									class="add"><img src="${staticSite}/img/ml/btn_add.gif"
									alt="<wa:mls>Add</wa:mls>" /></a>
							</c:if>
						</div>

						<div class="clr"></div></li>
					<c:if test="${loop.count eq 1}">
						<c:set var="group" value="${item.group}"></c:set>
					</c:if>
				</c:forEach>
			</ul>
			<div>
				<c:if test="${showAllFixDateGuide eq false}">
					<input type="button" value="Show All" onclick="showAllFixedDate()" />
				</c:if>
				<c:if test="${showAllFixDateGuide}">
					<input type="button" value="Back" onclick="hideAllFixedDate()" />
				</c:if>
			</div>
		</div>

	</div>
	</c:if>
	<c:if test="${empty showAllFixDateGuide or showAllFixDateGuide == false}">
		<div class="TabbedPanelsContentGroup">
			<h2><wa:mls>Visits on request</wa:mls></h2>
			<div class="Tabbe_Content_Group">
				<c:if test="${showAllOnRequestGuide}">
				<div class="tab_paging">
					<wa:include URI="${site}/content/navNumber">
						<wa:param name="navId" value="1" />
					</wa:include>
				</div>
				</c:if>
				<ul class="tab_list_complete">
					<c:set var="indexLetter" value="0" />
					<c:if test="${empty onRequestGuidedTours}">
						<h3>
							<wa:mls>No record founds</wa:mls>
						</h3>
					</c:if>
					<c:forEach var="item" items="${onRequestGuidedTours}"
						varStatus="loop">
						<li><c:if test="${contentType ne 'ContentPress'}">
								<a
									href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>">
									<c:choose>
										<c:when test="${not empty item.mainSmallImage}">
											<img src="${item.mainSmallImage}"
												alt="${item.formatMainTitle}" width="165" />
										</c:when>
										<c:otherwise>
											<img
												src="${context}/static/${site}/img/ml/default_content.jpg"
												alt="${item.formatMainTitle}" width="165" />
										</c:otherwise>
									</c:choose>
								</a>
							</c:if> <c:if test="${contentType eq 'ContentPress'}">
								<c:choose>
									<c:when test="${not empty item.mainSmallImage}">
										<img src="${item.mainSmallImage}"
											alt="${item.formatMainTitle}" width="165" />
									</c:when>
									<c:otherwise>
										<img src="${context}/static/${site}/img/ml/press_small.jpeg"
											alt="${item.formatMainTitle}" width="165" />
									</c:otherwise>
								</c:choose>
							</c:if>
							<div class="txt" id="txt_${item.id}">
								<h3 class="no_margin">
									<c:choose>
										<c:when
											test="${contentType eq 'ContentPress' and empty item.body}">
                                    ${item.mainTitle}
                                </c:when>
										<c:otherwise>
											<a
												href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>"
												title="${item.formatMainTitle}">${item.mainTitle}</a>
										</c:otherwise>
									</c:choose>

								</h3>
								<c:choose>
									<c:when
										test="${contentType ne 'ContentArticle' && contentType ne 'ContentPress' && empty item.mainAbstract_}">
										<c:if test="${not empty item.address}">
											<p>${item.address}</p>

											<p>
												<c:if test="${not empty item.zipcode && item.zipcode > 0}">
                                            ${item.zipcode}
                                        </c:if>
												<c:if test="${not empty item.city}">
                                            ${item.city}
                                        </c:if>
											</p>
										</c:if>
										<p>
											<c:if test="${not empty item.phone}">
												<strong><wa:mls>Tel :</wa:mls></strong> ${item.phone}<br />
											</c:if>
											<c:if test="${not empty item.mobile}">
												<strong><wa:mls>Mobile :</wa:mls></strong> ${item.mobile}<br />
											</c:if>
											<c:if test="${not empty item.fax}">
												<strong><wa:mls>Fax :</wa:mls></strong> ${item.fax}<br />
											</c:if>
											<c:if test="${not empty item.email}">
												<strong><wa:mls>Email :</wa:mls></strong>
												<span><a href="mailto:${item.email}">${item.email}</a></span>
												<br />
											</c:if>
											<c:if test="${not empty item.URLWebsite}">
												<strong><wa:mls>Website :</wa:mls></strong>
												<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
											</c:if>
										</p>
									</c:when>
									<c:otherwise>

										<div class="cutMainAbstract">${item.mainAbstract_}</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="btn">
								<c:if
									test="${contentType ne 'ContentPress' or not empty item.body}">
									<div class="more_info">
										<a
											href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>"
											class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a>
									</div>
								</c:if>
								<c:if
									test="${contentType ne 'ContentArticle' and contentType ne 'ContentPress' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
									<a
										href="javascript:callLetter('${wa:numberToChar(indexLetter)}', 'map')"
										class="map"><span><wa:mls>Map :</wa:mls></span><img
										src="${staticSite}/img/ml/btn_map_${wa:numberToChar(indexLetter)}.jpg"
										alt="Map ${wa:numberToChar(indexLetter)}" /></a>
									<br />
									<a
										href="javascript:callLetter('${wa:numberToChar(indexLetter)}', 'sv')"
										class="sv"><span><wa:mls>Street view :</wa:mls></span><img
										src="${staticSite}/img/ml/btn_streetview.jpg"
										alt="Street view" /></a>
									<script type="text/javascript">
                                addMarker(${item.longitude}, ${item.latitude}, "${item.formatMainTitle}", "${wa:numberToChar(indexLetter)}", ${item.svLongitude}, ${item.svLatitude}, ${item.svHeading}, ${item.svPitch}, ${item.svZoom});
                            </script>
									<c:set var="indexLetter" value="${indexLetter+1}" />
								</c:if>
								<c:set var="varTmp" value="\"" />
								<!-- <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}${context}/front/content/detail/group/${item.group}/id/${item.id}.do" addthis:title="${item.formatMainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a> -->
								<a
									href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe"
									class="addthis_button share"
									addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>"
									addthis:title="${item.formatMainTitle}"
									addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img
									src="${staticSite}/img/ml/btn_share.gif"
									alt="<wa:mls>Share</wa:mls>" /></a>

								<div class="ilike" rel="${item.group}|${item.id}"></div>
								<c:if
									test="${group ne 'PRESS_REPORT'  and group ne 'OG_TOUR' && group ne 'LATEST_NEWS' && group ne 'TESTIMONIAL' }">
									<a
										href="javascript:<c:choose><c:when test="${section eq 'meetings' or section eq 'trade'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${item.group}','${item.id}');"
										class="add"><img src="${staticSite}/img/ml/btn_add.gif"
										alt="<wa:mls>Add</wa:mls>" /></a>
								</c:if>
							</div>

							<div class="clr"></div></li>
						<c:if test="${loop.count eq 1}">
							<c:set var="group" value="${item.group}"></c:set>
						</c:if>
					</c:forEach>

				</ul>
				<div>
					<c:if test="${showAllOnRequestGuide eq false}">
						<input type="button" value="Show All"
							onclick="showAllOnRequestGuide()" />
					</c:if>
					<c:if test="${showAllOnRequestGuide}">
						<input type="button" value="Back"
							onclick="hideAllOnRequestGuide()" />
					</c:if>
				</div>
			</div>
		</div>
	</c:if>
</c:if>
<!--tab:end-->

<script type="text/javascript">
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
        //
    ${URI}
        var uri = '<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="clt"/><wa:param name="clt" value="${culture}"/><wa:exceptParam name="orderBy"/><wa:exceptParam name="asc"/><wa:exceptParam name="page"/></wa:url>';
        if (uri.indexOf('?') >= 0)
            document.forms[0].action = uri + "&" + "orderBy=" + orderBy + "&asc=" + asc;
        else
            document.forms[0].action = uri + "?" + "orderBy=" + orderBy + "&asc=" + asc;
        window.location.href = document.forms[0].action;
    }
    
   
</script>
<script language='javascript'>
function showAllFixedDate() {
	var uri = '<wa:url URI="${URI}" allParams="true"></wa:url>' + '?' + 'showAllFixDateGuide=true';
	window.location.href = uri;
}

function hideAllFixedDate() {
	var uri = '<wa:url URI="${URI}" allParams="true"></wa:url>';
	window.location.href = uri;	
}

function showAllOnRequestGuide() {
	var uri = '<wa:url URI="${URI}" allParams="true"></wa:url>' + '?' + 'showAllOnRequestGuide=true';
	window.location.href = uri;
}	

function hideAllOnRequestGuide() {
	var uri = '<wa:url URI="${URI}" allParams="true"></wa:url>';
	window.location.href = uri;
}	
</script>

