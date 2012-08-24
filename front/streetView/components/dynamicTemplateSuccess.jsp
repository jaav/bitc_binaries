<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="st" uri="StringToolsTags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="wast" uri="StringToolsTags" %>



<div class="clear"></div>

<div id="content_main">
	<h1 class="no_margin line_grey">${intro.mainTitle}</h1>
	<p>${intro.mainBody}</p>
	<div id="pano" style="width: 620px; height: 620px;"></div>
</div>

<div id="content_sub"> 
	<div id="right_content">
      <ul class="tab_list_complete_sv">
      	<h2 class="no_margin line_grey"><wa:mls>Top 7 des lieux à Bruxelles</wa:mls></h2>
	      <c:forEach var="item" items="${list}" varStatus="loop">
	        <li id="sv_${loop.count}">
		        <a href="javascript:sv_display(${loop.count},${item.svLatitude},${item.svLongitude},${item.svHeading},${item.svPitch},${item.svZoom})" class="street_view_hl"> 
		          <c:choose>
		          	<c:when test="${not empty item.mainSmallImage}">	
		        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="96"/>
		          	</c:when>
		          	<c:otherwise>
		        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="96"/>
		          	</c:otherwise>
		          </c:choose>
		      	</a>
	            <div class="txt" id="txt_${item.id}">
		            <h3 class="no_margin"><a href="javascript:sv_display(${loop.count},${item.svLatitude},${item.svLongitude},${item.svHeading},${item.svPitch},${item.svZoom})" title="${item.mainTitle}" class="street_view_hl">${item.mainTitle}</a></h3>
		            <p>${item.mainAbstract_}</p>
		        </div>
	          <div class="clr"></div>
	        </li>
	  	</c:forEach>
		</ul>
	</div>
</div>

<script type="text/javascript">
function sv_display(i,lat,lng,heading,pitch,zoom) {
	 var place = new google.maps.LatLng(lat,lng);
	 var panoramaOptions = {
		      position: place,
		      pov: {
		        heading: heading,
		        pitch: pitch,
		        zoom: zoom
		      },
		      visible: true
		    };
	var panorama = new google.maps.StreetViewPanorama(document.getElementById("pano"), panoramaOptions);
	$(".tab_list_complete_sv").children("li").removeClass()
   	$("#sv_"+i).addClass("active")
}
window.onload = function()
{
	sv_display(1,${list[0].svLatitude},${list[0].svLongitude},${list[0].svHeading},${list[0].svPitch}, ${list[0].svZoom});
} 
</script>