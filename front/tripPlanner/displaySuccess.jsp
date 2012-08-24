<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css" media="screen">
@import url("${static}/front/css/nyroModal.css");
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>
<script src="${static}/ajax/js/tripPlannerMethods.js" type="text/javascript"></script> 
<script type="text/javascript">
//TRIP PLANNER METHOD 
//* addToTripPlanner(group, contentId) => call tripPlannerLightBox(data) => data.contentName & data.status ( return contentName & status )
function refreshTripPlanner(data) {
	  $.nyroModalManual({
	     minWidth:700,
	     minHeight:600,
	     forceType: 'iframe',
	     closeSelector: '.nyroModalClose', 
	     url: '${context}/front/other/displayRefreshTripPlanner.do?contentName='+data.contentName+'&status='+data.status+'&panelContentType='+data.contentType+'&panelGroup='+data.group+'&contentId='+data.contentId,
	     closeButton: '<a href="<wa:url URI="${site}/tripPlanner/display"/>" target="_parent" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
	  	});
}
</script>
<div class="clear"></div>
<div id="content_main"> 
<wa:include URI="front/content/introForm" />
	<img src="${staticSite}/img/${culture.language}/title_trip_planner.jpg" alt="Trip Planner" class="m17"/>
	<c:if test="${panelGroup eq 'HOTEL' or panelGroup eq 'BnB' or panelContentType eq 'ContentEvent'}">
		<wa:include URI="front/tripPlanner/find">
			<wa:param name="contentType" value="${panelContentType}"/>
			<wa:param name="group" value="${panelGroup}"/>
		</wa:include>
	</c:if>
	<div class="TabbedPanelsContentGroup">
	      
	      <ul class="TabbedPanels">

	      <li class="<c:if test="${panelGroup == 'HOTEL'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'HOTEL'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/tripPlanner/searchTrip"/>?panelContentType=ContentStay&panelGroup=HOTEL<c:if test="${not empty day_begin}">&f_day_begin=${day_begin}</c:if><c:if test="${not empty month_begin}">&f_month_begin=${month_begin}</c:if><c:if test="${not empty day_end}">&f_day_end=${day_end}</c:if><c:if test="${not empty month_end}">&f_month_end=${month_end}</c:if>"><div><wa:mls>H�tels</wa:mls></div></a></li>
          <li class="<c:if test="${panelGroup == 'BnB'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'BnB'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/tripPlanner/searchTrip"/>?panelContentType=ContentStay&panelGroup=BnB&rub=allBnB<c:if test="${not empty day_begin}">&f_day_begin=${day_begin}</c:if><c:if test="${not empty month_begin}">&f_month_begin=${month_begin}</c:if><c:if test="${not empty day_end}">&f_day_end=${day_end}</c:if><c:if test="${not empty month_end}">&f_month_end=${month_end}</c:if>"><div><wa:mls>Bed &amp; <br />Breakfast</wa:mls></div></a></li>
          <li class="<c:if test="${panelContentType eq 'ContentStay'  and panelGroup eq 'ALL'}">TabbedPanelsTabSelected</c:if><c:if test="${(panelContentType eq 'ContentStay'  and panelGroup ne 'ALL') or panelContentType ne 'ContentStay'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/tripPlanner/searchTrip"/>?panelContentType=ContentStay&panelGroup=ALL<c:if test="${not empty day_begin}">&f_day_begin=${day_begin}</c:if><c:if test="${not empty month_begin}">&f_month_begin=${month_begin}</c:if><c:if test="${not empty day_end}">&f_day_end=${day_end}</c:if><c:if test="${not empty month_end}">&f_month_end=${month_end}</c:if>"><div><wa:mls>Autres <br />Logements</wa:mls></div></a></li>
          <li class="<c:if test="${panelContentType == 'ContentEvent'}">TabbedPanelsTabSelected</c:if><c:if test="${panelContentType != 'ContentEvent'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/tripPlanner/searchTrip"/>?panelContentType=ContentEvent&panelGroup=ALL&rub=allEvent<c:if test="${not empty day_begin}">&f_day_begin=${day_begin}</c:if><c:if test="${not empty month_begin}">&f_month_begin=${month_begin}</c:if><c:if test="${not empty day_end}">&f_day_end=${day_end}</c:if><c:if test="${not empty month_end}">&f_month_end=${month_end}</c:if>"><div><wa:mls>Events</wa:mls></div></a></li>
	      <li class="<c:if test="${panelContentType == 'ContentRestaurant'}">TabbedPanelsTabSelected</c:if><c:if test="${panelContentType != 'ContentRestaurant'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/tripPlanner/searchTrip"/>?panelContentType=ContentRestaurant&panelGroup=ALL<c:if test="${not empty day_begin}">&f_day_begin=${day_begin}</c:if><c:if test="${not empty month_begin}">&f_month_begin=${month_begin}</c:if><c:if test="${not empty day_end}">&f_day_end=${day_end}</c:if><c:if test="${not empty month_end}">&f_month_end=${month_end}</c:if>"><div><wa:mls>Eating</wa:mls></div></a></li>
	      <li class="<c:if test="${panelGroup == 'MUSEUM_AND_ATTRACTIONS'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'MUSEUM_AND_ATTRACTIONS'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/tripPlanner/searchTrip"/>?panelContentType=ContentPlace&panelGroup=MUSEUM_AND_ATTRACTIONS<c:if test="${not empty day_begin}">&f_day_begin=${day_begin}</c:if><c:if test="${not empty month_begin}">&f_month_begin=${month_begin}</c:if><c:if test="${not empty day_end}">&f_day_end=${day_end}</c:if><c:if test="${not empty month_end}">&f_month_end=${month_end}</c:if>"><div><wa:mls>Attractions <br />ans museums</wa:mls></div></a></li>
	      <li class="<c:if test="${panelContentType eq 'ContentPlace' and panelGroup eq 'ALL'}">TabbedPanelsTabSelected</c:if><c:if test="${(panelContentType eq 'ContentPlace' and panelGroup ne 'ALL') or panelContentType ne 'ContentPlace'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/tripPlanner/searchTrip"/>?panelContentType=ContentPlace&panelGroup=ALL<c:if test="${not empty day_begin}">&f_day_begin=${day_begin}</c:if><c:if test="${not empty month_begin}">&f_month_begin=${month_begin}</c:if><c:if test="${not empty day_end}">&f_day_end=${day_end}</c:if><c:if test="${not empty month_end}">&f_month_end=${month_end}</c:if>""><div><wa:mls>Autres<br />Lieux</wa:mls></div></a></li>
	      <li class="<c:if test="${panelGroup == 'WALK'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'WALK'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/tripPlanner/searchTrip"/>?panelContentType=ContentArticle&panelGroup=WALK<c:if test="${not empty day_begin}">&f_day_begin=${day_begin}</c:if><c:if test="${not empty month_begin}">&f_month_begin=${month_begin}</c:if><c:if test="${not empty day_end}">&f_day_end=${day_end}</c:if><c:if test="${not empty month_end}">&f_month_end=${month_end}</c:if>"><div><wa:mls>Walks</wa:mls></div></a></li>

	      </ul>
	                  <div class="Tabbe_Content_Group">
	      
		  <wa:include URI="front/tripPlanner/favorites"/>
		  <wa:include URI="front/tripPlanner/results"/>
		  </div>
	</div>
</div>