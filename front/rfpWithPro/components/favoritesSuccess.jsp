<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${static}/ajax/js/meetingPlannerMethods.js" type="text/javascript"></script>
<div id="favorite">
<div class="box_my_favorite">

        <h2><wa:mls>My favorites</wa:mls></h2>
        <c:choose>
        	<c:when test="${ empty MeetingPlannerFavoriates}">
        		<wa:mls>Aucun favori sélectionné</wa:mls>
        	</c:when>
        	<c:otherwise>
        		<c:forEach var="item" items="${MeetingPlannerFavoriates}" varStatus="loop">
					<div class="favorite_item"> 
						<a href="javascript:deleteMeetingPlannerFromSession('${divId}','${contentType}','${item.group}','${item.id}');" class="btn_delete"></a>
						<p><strong>${item.mainTitle}</strong><strong> ${item.mainAbstract_}</strong> </p>
						<a href="javascript:saveMeetingPlannerToDb('${divId}','${contentType}','${item.group}','${item.id}','');" class="btn_add_to_my_trip"><img src="${staticSite}/img/${culture.language}/btn_add_my_trip.jpg" alt="Add my meeting" /></a>
						<div class="clr"></div>
			        </div>
		       </c:forEach>
        	</c:otherwise>
        </c:choose>
        
</div>       
</div>

