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
	<img src="${staticSite}/img/${culture.language}/title_trip_planner.jpg" alt="meeting Planner" class="m17"/>
		<wa:include URI="front/rfpWithPro/find">
		</wa:include>
	<div class="TabbedPanelsContentGroup">
		  <wa:include URI="front/rfpWithPro/results"/>
	</div>
</div>