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

<style type="text/css" media="screen">
@import url("${static}/front/css/nyroModal.css");
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.datepicker.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.theme.css" media="screen, projection"/>

<script type="text/javascript" src="${static}/front/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker-${culture.language}.js"></script> 

<div class="clear"></div>
<div id="content_main">
	<wa:include URI="${site}/search/find" >
		<wa:param name="group" value="${group}"/>
		<wa:param name="contentType" value="${contentType}"/>
		<wa:param name="criteriaDate" value="${criteriaDate}"/>
		<wa:param name="s_periodFromDate" value="${s_periodFromDate}"/>
		<wa:param name="s_periodToDate" value="${s_periodToDate}"/>
	</wa:include>
	<div class="TabbedPanelsContentGroup">
	<ul class="TabbedPanels">
	</ul>
	<c:if test="${result != null}">
	<div class="tab_paging">
	    <wa:include URI="${site}/search/pageNav" />
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
					<c:forEach items="${result}" var="item" varStatus="loop">
					<li>
					<c:choose>
					
          	<c:when test="${not empty item.imageUrl}">	
        	<a href="<wa:url URI='${item.encodedUrl}'/>" >
        		<img src="${item.imageUrl}" alt="${item.title}" width="165"/>
        	</a>
          	</c:when>
          	<c:otherwise>
          	<a href="<wa:url URI='${item.encodedUrl}'/>" >
        		<img src="${context}/static/front/img/ml/default_content.jpg" alt="${item.title}" width="165"/>
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
					<div class="btn">
						<div class="more_info">
						 <a href="<wa:url URI='${item.encodedUrl}'/>" class="btn_more_info" title="${item.title}"><wa:mls>More info</wa:mls></a>
						 </div>
			<c:if test="${contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
					 <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${static}/front/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg" alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
				<br />
				<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')" class="sv"><span><wa:mls>Street view :</wa:mls></span><img src="${static}/front/img/ml/btn_streetview.jpg" alt="Street view"/></a>
				<script type="text/javascript">
          			addMarker(${item.longitude},${item.latitude},"${item.formatMainTitle}","${wa:numberToChar(loop.count-1)}",${item.svLongitude},${item.svLatitude},${item.svHeading},${item.svPitch},${item.svZoom});
          		</script>
			</c:if> 
					<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}/${site}/content/displayDetail/group/${item.group}/id/${item.id}.do" addthis:title="${item.title}" addthis:description="${wa:html2txt(item.title)}"><img src="${static}/front/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
			      	<div class="ilike" rel="${item.group}|${item.id}"></div>
			      	
						</div>
						 <div class="clr"></div>
						 
					</li>
			</c:forEach>
				<!-- SEARCH RESULTS LIST : end -->
		      </c:if>
	</c:if>
	</ul>
	<c:if test="${result != null}">
	<div class="tab_paging">
      
        <wa:include URI="${site}/search/pageNav" />
      
      </div>
     </c:if>
	</div>
</div>

