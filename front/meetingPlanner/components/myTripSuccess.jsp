<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="clear"></div>
<script src="${static}/ajax/js/meetingPlannerMethods.js" type="text/javascript"></script>
<div id="rubrique">
 <a href="${context}/${site}/meetingPlanner/display.do?panelContentType=ContentVenue&panelGroup=VENUE" class="beige"><wa:mls>Venue</wa:mls></a>
     <div class="group_item bg_beige">
     <div id="ContentVenue">
           <c:forEach var="item" items="${listArticleFirstVenue}" varStatus="loop">
	       <div class="item"> <a href="javascript:deleteMeetingPlannerFromDb('ContentVenue','ContentVenue','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	 </div>
      </div>
      
      <div class="clr"></div>
  <a href="${context}/${site}/meetingPlanner/display.do?panelContentType=ContentStay&panelGroup=HOTEL" class="blue"><wa:mls>HOTEL</wa:mls></a> 
     <div class="group_item bg_dark_blue">
     <div id="HOTEL">
          <c:forEach var="item" items="${listArticleFirstHotel}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteMeetingPlannerFromDb('HOTEL','ContentStay','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      <div class="clr"></div>
      </div>
    <div class="clr"></div>
     <a href="${context}/${site}/meetingPlanner/display.do?panelContentType=ContentEvent&panelGroup=ALL&rub=allEvent" class="dark_blue"><wa:mls>Events</wa:mls></a>
     <div class="group_item bg_darker_blue">
     <div id="ContentEvent">
           <c:forEach var="item" items="${listArticleFirstEvents}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteMeetingPlannerFromDb('ContentEvent','ContentEvent','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      </div>
     
       <div class="clr"></div>
     <a href="${context}/${site}/meetingPlanner/display.do?panelContentType=ContentRestaurant&panelGroup=ALL" class="green"><wa:mls>Eating</wa:mls></a>
     <div class="group_item bg_green">
     <div id="ContentRestaurant">
           <c:forEach var="item" items="${listArticleFirstEating}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteMeetingPlannerFromDb('ContentRestaurant','ContentRestaurant','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      </div>
      <div class="clr"></div>
      <a href="${context}/${site}/meetingPlanner/display.do?panelContentType=ContentPlace&panelGroup=ATTRACTIONS" class="pink"><wa:mls>Attractions</wa:mls></a>
     <div class="group_item bg_pink">
     <div id="ATTRACTIONS">
           <c:forEach var="item" items="${listArticleFirstAttractions}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteMeetingPlannerFromDb('ATTRACTIONS','ContentPlace','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      </div>
      <div class="clr"></div>

    <a href="${context}/${site}/meetingPlanner/display.do?panelContentType=ContentPlace&panelGroup=INCENTIVES" class="beige"><wa:mls>INCENTIVES</wa:mls></a>
     <div class="group_item bg_beige">
     <div id="INCENTIVES">
           <c:forEach var="item" items="${listArticleFirstIncentives}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteMeetingPlannerFromDb('INCENTIVES','ContentPlace','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      </div>
      <div class="clr"></div>
      
 
</div>