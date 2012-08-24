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
<script src="${static}/ajax/js/tripPlannerMethods.js" type="text/javascript"></script> 
<script src="${static}/ajax/js/meetingPlannerMethods.js" type="text/javascript"></script> 
<script type="text/javascript">
//TRIP PLANNER METHOD 
//* addToTripPlanner(group, contentId) => call tripPlannerLightBox(data) => data.contentName & data.status ( return contentName & status )

function meetingPlannerLightBox(data) {
	  $.nyroModalManual({
	     minWidth:700,
	     minHeight:600,
	     forceType: 'iframe',
	     closeSelector: '.nyroModalClose', 
	     url: '${context}/front/other/displayMeetingPlannerLightBox.do?contentName='+data.contentName+'&status='+data.status+'&panelContentType='+data.panelContentType+'&panelGroup='+data.panelGroup+'&panelContentId='+data.contentId,
	     closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
	  	});
  	
}
</script>
<!--tab:start-->

   <div class="TabbedPanelsContentGroup">
         <div class="Tabbe_Content_Group">
   
       <div class="tab_paging">
            <wa:include URI="${site}/meeting/navNumber" />
      </div>
      <div class="clr"></div>
     <ul class="tab_list_complete venue">
      <c:if test="${listNull == '1'}"><wa:mls>Liste vide</wa:mls></c:if>
      <c:forEach var="item" items="${list}" varStatus="loop">
             <li> 
             	<h3 class="no_margin title_venue"><span>${loop.count }.</span> 
             	<a href="<wa:url URI="${site}/content/displayDetailVenue/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" >${item.mainTitle} <c:if test="${item.nbrDeals >0 }"><span class="txt_orange"> « <wa:mls> promo </wa:mls>»</span></c:if></a>
             	</h3>
	        	<a href="<wa:url URI="${site}/content/displayDetailVenue/group/${item.group}/id/${item.id}"/>" > 
		          <c:choose>
		          	<c:when test="${not empty item.mainSmallImage}">	
		        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="84"/>
		          	</c:when>
		          	<c:otherwise>
		        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="84"/>
		          	</c:otherwise>
		          </c:choose>
		          </a>
	        	<div class="box_txt_left">
          			${item.mainAbstract_}
          		</div>
          		<!--  -->
          		<div class="box_txt_right">
					<span class="label_venue"><wa:mls> Venue Type</wa:mls> </span> <span class="venue_detail"><wa:mls> <c:choose><c:when test="${not empty item.type}">${item.type}</c:when><c:otherwise>Venue</c:otherwise></c:choose></wa:mls></span>
					<c:if test="${not empty item.listCategories}"><span class="venue_detail2">${item.listCategories}</span><br /></c:if>
					<c:if test="${infosVenue[item.id][0] != 0}"><span class="label_venue"><wa:mls> Nombre de personnes</wa:mls></span>  <span class="venue_detail">${infosVenue[item.id][0]}</span><br /></c:if>
					<c:if test="${fn:length(item.contentRooms) != 0}"><span class="label_venue"> <wa:mls> Meeting Rooms </wa:mls></span> <span class="venue_detail">${fn:length(item.contentRooms)}</span><br /></c:if>
					<c:if test="${infosVenue[item.id][1] != 0}"><span class="label_venue"> <wa:mls>Largest Mtg Rm </wa:mls></span> <span class="venue_detail">${infosVenue[item.id][1]} <wa:mls>m&sup2;</wa:mls></span><br /></c:if>
					<c:if test="${infosVenue[item.id][2] != 0}"><span class="label_venue"> <wa:mls> Meeting Space</wa:mls></span>  <span class="venue_detail">${infosVenue[item.id][2]} <wa:mls>m&sup2;</wa:mls></span><br /></c:if>
					<c:if test="${item.type eq 'VENUE'}"><a href="<wa:url URI="${site}/content/displayDetailVenue/group/${item.group}/id/${item.id}"/>?tabbedPanelsTab=Hotels&property=ALL#associatedContent"><span class="label_venue"><wa:mls>Hotel nearby</wa:mls></span></a></c:if>
		       </div>
		       <div class="btn_venue">
            	<div class="more_info"><a href="<wa:url URI="${site}/content/displayDetailVenue/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a></div>
	            <c:if test="${not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
					<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${staticSite}/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg" alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
				<br />
				<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')" class="sv"><span><wa:mls>Street view :</wa:mls></span><img src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
				<script type="text/javascript">
          			addMarker(${item.longitude},${item.latitude},"${item.formatMainTitle}","${wa:numberToChar(loop.count-1)}",${item.svLongitude},${item.svLatitude},${item.svHeading},${item.svPitch},${item.svZoom});
          		</script>
					</c:if> 
	            <c:set var="varTmp" value="\"" />
					<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share_venue" addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" addthis:title="${item.mainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
			      	<div class="ilike_venue" rel="${item.group}|${item.id}"></div>
			      	<a href="javascript:addToMeetingPlanner('${item.group}','${item.id}');" class="add_venue"><img src="${staticSite}/img/ml/btn_add.gif" alt="<wa:mls>Add</wa:mls>"/></a>
               </div>
	         <div class="clr"></div>
	        </li>
	        
	        <c:if test="${loop.count eq 1}">
	        	<c:set var="group" value="${item.group}"></c:set>
	        </c:if>
        </c:forEach>
      </ul>
      <div class="tab_paging">
      
        <wa:include URI="${site}/meeting/navNumber" />
      
      </div>
    </div></div>
    <!--tab:end-->
<script language='javascript'>
function sortBy(newURI,group)
{

	var sort= $("#f_page").val();
	var orderby;
	var asc;
	if(sort == 0){
	}
	
	if(sort == 3){
		orderBy = "id";
		asc = "1";
	}
	if(sort == 4){
		orderBy = "id";
		asc = "0";
	}

	if(sort == 7){
		orderBy = "ranking";
		asc = "0";
	}
	if(sort == 8){
		orderBy = "ranking";
		asc = "1";
	}
	var uri = '<wa:url URI="${URI}"><wa:param name="clt" value="${culture}"/><wa:param name="group" value="${waParam.group}"/></wa:url>?page=${waParam.page}<c:if test="${not empty waParam.orderBy}">&orderBy=${waParam.orderBy}&asc=${waParam.asc}</c:if><c:if test="${not empty waParam.s_periodFromDate}">&s_periodFromDate=${s_periodFromDate }</c:if><c:if test="${not empty waParam.s_periodToDate}">&s_periodToDate=${s_periodToDate}</c:if><c:if test="${not empty waParam.title}">&title=${waParam.title}</c:if><c:if test="${not empty waParam.room}">&room=${waParam.room}</c:if><c:if test="${not empty waParam.ranking}">&ranking=${waParam.ranking}</c:if><c:if test="${not empty waParam.f_config}">&f_config=${waParam.f_config}</c:if><c:if test="${not empty waParam.f_persons}">&f_persons=${waParam.f_persons}</c:if><c:if test="${not empty waParam.s_ContentPropertyValue_valueId_Cuisine}">&s_ContentPropertyValue_valueId_Cuisine=${waParam.s_ContentPropertyValue_valueId_Cuisine}</c:if><c:if test="${not empty waParam.panel}">&panel=${waParam.panel}</c:if>';
	if(uri.indexOf('?') >= 0)
		document.forms[0].action=uri+"&"+"orderBy="+orderBy+"&asc="+asc;
	else 
		document.forms[0].action=uri+"?"+"orderBy="+orderBy+"&asc="+asc;
	window.location.href= document.forms[0].action;
}
</script>
