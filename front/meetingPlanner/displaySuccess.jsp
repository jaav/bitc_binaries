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
<script type="text/javascript">
//TRIP PLANNER METHOD 
//* addToTripPlanner(group, contentId) => call tripPlannerLightBox(data) => data.contentName & data.status ( return contentName & status )
function refreshMeetingPlanner(data) {
	  $.nyroModalManual({
	     minWidth:700,
	     minHeight:600,
	     forceType: 'iframe',
	     closeSelector: '.nyroModalClose', 
	     url: '${context}/front/other/displayRefreshMeetingPlanner.do?contentName='+data.contentName+'&status='+data.status+'&panelContentType='+data.contentType+'&panelGroup='+data.group+'&contentId='+data.contentId,
	     closeButton: '<a href="<wa:url URI="${site}/meetingPlanner/display"/>" target="_parent" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
	  	});
}
</script>
<div class="clear"></div>
<div id="content_main">
<wa:include URI="front/content/introForm" /> 
	<img src="${staticSite}/img/${culture.language}/title_meeting_planner.jpg" alt="meeting Planner" class="m17"/>
		<wa:include URI="front/meetingPlanner/find">
			<wa:param name="contentType" value="${panelContentType}"/>
			<wa:param name="group" value="${panelGroup}"/>
			<wa:param name="rub" value="${rub}"/>
			<wa:param name="s_ContentPropertyValue_valueId_Cuisine" value="${s_ContentPropertyValue_valueId_Cuisine}"/>
		</wa:include>
	<div class="TabbedPanelsContentGroup">
	      
	      <ul class="TabbedPanels">
	      <li class="<c:if test="${panelGroup == 'VENUE'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'VENUE'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/meetingPlanner/display"/>?panelContentType=ContentVenue&panelGroup=VENUE"><div><wa:mls>Venue</wa:mls></div></a></li>
	      <li class="<c:if test="${panelGroup eq 'HOTEL'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup ne 'HOTEL'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/meetingPlanner/display"/>?panelContentType=ContentStay&panelGroup=HOTEL"><div><wa:mls>Hotels</wa:mls></div></a></li>
          <li class="<c:if test="${panelContentType eq 'ContentEvent' and panelGroup eq 'ALL'}">TabbedPanelsTabSelected</c:if><c:if test="${(panelContentType eq 'ContentEvent' and panelGroup ne 'ALL') or panelContentType ne 'ContentEvent'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/meetingPlanner/display"/>?panelContentType=ContentEvent&panelGroup=ALL&rub=allEvent"><div><wa:mls>Events</wa:mls></div></a></li>
	      <li class="<c:if test="${panelContentType == 'ContentRestaurant'}">TabbedPanelsTabSelected</c:if><c:if test="${panelContentType != 'ContentRestaurant'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/meetingPlanner/display"/>?panelContentType=ContentRestaurant&panelGroup=ALL"><div><wa:mls>Eating</wa:mls></div></a></li>
	      <li class="<c:if test="${panelGroup == 'ATTRACTIONS'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'ATTRACTIONS'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/meetingPlanner/display"/>?panelContentType=ContentPlace&panelGroup=ATTRACTIONS"><div><wa:mls>Attractions</wa:mls></div></a></li>
	      <!-- <li class="<c:if test="${panelContentType eq 'ContentPlace' and panelGroup eq 'ALL'}">TabbedPanelsTabSelected</c:if><c:if test="${(panelContentType eq 'ContentPlace' and panelGroup ne 'ALL') or panelContentType ne 'ContentPlace'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/meetingPlanner/display"/>?panelContentType=ContentPlace&panelGroup=ALL"><div><wa:mls>Autres Lieux</wa:mls></div></a></li> -->
	      <li class="<c:if test="${panelGroup eq 'INCENTIVES'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup ne 'INCENTIVES'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${site}/meetingPlanner/display"/>?panelContentType=ContentPlace&panelGroup=INCENTIVES"><div><wa:mls>Incentives</wa:mls></div></a></li>
	      
	      </ul>
	               <div class="Tabbe_Content_Group">
	      
		  <wa:include URI="front/meetingPlanner/favorites"/>
		  <wa:include URI="front/meetingPlanner/results"/>
		  </div>
	</div>
</div>