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
<div id="rubrique">
 <a href="${context}/${site}/tripPlanner/display.do?panelContentType=ContentStay&panelGroup=HOTEL" class="blue"><wa:mls>HOTEL</wa:mls></a>
     <div class="group_item bg_dark_blue">
     <div id="HOTEL">
          <c:forEach var="item" items="${listArticleFirstHotel}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteTripPlannerFromDb('HOTEL','ContentStay','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      <div class="clr"></div>
      </div>
     <a href="${context}/${site}/tripPlanner/display.do?panelContentType=ContentStay&panelGroup=BnB" class="blue"><wa:mls>Bed &amp; Breakfast</wa:mls></a>
     <div class="group_item bg_dark_blue">
     <div id="BnB">
           <c:forEach var="item" items="${listArticleFirstBnB}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteTripPlannerFromDb('BnB','ContentStay','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
     </div>
      <div class="clr"></div>
     <a href="${context}/${site}/tripPlanner/display.do?panelContentType=ContentStay&panelGroup=ALL" class="blue"><wa:mls>Autres Logements</wa:mls></a>
     <div class="group_item bg_dark_blue">
     <div id="ContentStay">
           <c:forEach var="item" items="${listArticleFirstAllStays}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteTripPlannerFromDb('ContentStay','ContentStay','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      </div>
      <div class="clr"></div>
     <a href="${context}/${site}/tripPlanner/display.do?panelContentType=ContentEvent&panelGroup=ALL" class="dark_blue"><wa:mls>Events</wa:mls></a>
     <div class="group_item bg_darker_blue">
     <div id="ContentEvent">
           <c:forEach var="item" items="${listArticleFirstEvents}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteTripPlannerFromDb('ContentEvent','ContentEvent','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      </div>
       <div class="clr"></div>
     <a href="${context}/${site}/tripPlanner/display.do?panelContentType=ContentRestaurant&panelGroup=ALL" class="green"><wa:mls>Eating</wa:mls></a>
     <div class="group_item bg_green">
     <div id="ContentRestaurant">
           <c:forEach var="item" items="${listArticleFirstEating}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteTripPlannerFromDb('ContentRestaurant','ContentRestaurant','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      </div>
      <div class="clr"></div>
      <a href="${context}/${site}/tripPlanner/display.do?panelContentType=ContentPlace&panelGroup=MUSEUM_AND_ATTRACTIONS" class="pink"><wa:mls>Attractions ans museums</wa:mls></a>
     <div class="group_item bg_pink">
     <div id="MUSEUM">
           <c:forEach var="item" items="${listArticleFirstMuseum}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteTripPlannerFromDb('MUSEUM','ContentPlace','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      </div>
      <div class="clr"></div>
       <a href="${context}/${site}/tripPlanner/display.do?panelContentType=ContentPlace&panelGroup=ALL" class="beige"><wa:mls>Autres Lieux</wa:mls></a>
     <div class="group_item bg_beige">
     <div id="ContentPlace">
           <c:forEach var="item" items="${listArticleFirstAllPlaces}" varStatus="loop">
	       <div class="item"> <a href="javascript:deleteTripPlannerFromDb('ContentPlace','ContentPlace','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	 </div>
      </div>
      <div class="clr"></div>
    <a href="${context}/${site}/tripPlanner/display.do?panelContentType=ContentArticle&panelGroup=WALK" class="beige"><wa:mls>Walks</wa:mls></a>
     <div class="group_item bg_beige">
     <div id="WALK">
           <c:forEach var="item" items="${listArticleFirstWalk}" varStatus="loop">
	       	<div class="item"> <a href="javascript:deleteTripPlannerFromDb('WALK','ContentArticle','${item.group}','${item.id}');" class="btn_delete"></a>
            <p><strong>${item.mainTitle}</strong></p>
            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="magnifying_glass"><img src="${staticSite}/img/ml/visu_magnifying_glass.png" alt="${item.mainTitle}"/></a>
            <div class="clr"></div>
          </div>
	       </c:forEach>
	  </div>
      </div>
      <div class="clr"></div>
 
</div>