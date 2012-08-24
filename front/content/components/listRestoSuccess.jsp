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

function tripPlannerLightBox(data) {
	  $.nyroModalManual({
	     minWidth:700,
	     minHeight:400,
	     forceType: 'iframe',
	     closeSelector: '.nyroModalClose', 
	     url: '${context}/front/other/displayTripPlannerLightBox.do?contentName='+data.contentName+'&status='+data.status+'&panelContentType='+data.panelContentType+'&panelGroup='+data.panelGroup+'&panelContentId='+data.contentId,
	     closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
	  	});
}
function meetingPlannerLightBox(data) {
	  $.nyroModalManual({
	     minWidth:700,
	     minHeight:400,
	     forceType: 'iframe',
	     closeSelector: '.nyroModalClose', 
	     url: '${context}/front/other/displayMeetingPlannerLightBox.do?contentName='+data.contentName+'&status='+data.status+'&panelContentType='+data.panelContentType+'&panelGroup='+data.panelGroup+'&panelContentId='+data.contentId,
	     closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
	  	});
	
}

</script>
<!--tab:start-->

   <div class="TabbedPanelsContentGroup">
   
    <ul class="TabbedPanels">
        <li class="<c:if test="${panelGroup == 'RESTO'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'RESTO'}">TabbedPanelsTab</c:if>"><div><a href="<wa:url URI="${site}/content/displayResto/group/RESTO"/>"><wa:mls>Resto</wa:mls></a></div></li>
        <li class="<c:if test="${panelGroup == 'BREAKFAST'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'BREAKFAST'}">TabbedPanelsTab</c:if>"><div><a href="<wa:url URI="${site}/content/displayResto/group/BREAKFAST"/>"><wa:mls>Breakfast</wa:mls></a></div></li>
        <li class="<c:if test="${panelGroup == 'RESTO_NIGHT'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'RESTO_NIGHT'}">TabbedPanelsTab</c:if>"><div><a href="<wa:url URI="${site}/content/displayResto/group/RESTO_NIGHT"/>"><wa:mls>RESTO_NIGHT</wa:mls></a></div></li>
      </ul>
            <div class="Tabbe_Content_Group">
      
       <div class="tab_paging">
            <wa:include URI="${site}/content/navNumber" />
       <div class="select">
          <form>
            <fieldset>
              <label for="f_page"><wa:mls>Sort by :</wa:mls></label>
              <select name="f_page" id="f_page" onchange=sortBy("${URI}/","${group}")>
                <option value="0"><wa:mls>Choix</wa:mls></option>
                <option value="1" <c:if test="${ orderBy == 'ranking' and  asc == 'true'}"> SELECTED</c:if>><wa:mls>Nombre d'iris (asc)</wa:mls></option>
                <option value="2" <c:if test="${ orderBy == 'ranking' and  asc == 'false'}"> SELECTED</c:if>><wa:mls>Nombre d'iris (desc)</wa:mls></option>
              </select>
            </fieldset>
          </form>
        </div>
      </div>
      <ul class="tab_list_complete">
      <c:if test="${listNull == '1'}"><wa:mls>Liste vide</wa:mls></c:if>
<c:set var="indexLetter" value="0" />
      	<c:forEach var="item" items="${list}" varStatus="loop">
          <li> 
           <c:choose>
          	<c:when test="${not empty item.mainSmallImage}">	
        	<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="165"/>
        	</a>
          	</c:when>
          	<c:otherwise>
          	<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="165"/>
        	</a>
          	</c:otherwise>
          </c:choose>
	          <div class="txt">
	            <h3 class="no_margin">
	            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" >${item.mainTitle}</a></h3>
	            <c:choose>
            	<c:when test="${contentType ne 'ContentArticle' && empty item.mainAbstract_}">
            		<c:if test="${not empty item.address}">
	        			<p> ${item.address} </p>
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
	       
	        <c:if test="${not empty item.URLWebsite}">
          		<strong><wa:mls>Website :</wa:mls></strong>
          		<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span> <br />
	        </c:if>
	        </p>
	         <c:if test="${not empty item.ranking and item.ranking > 0}">
	            <div class="float_left"><strong><wa:mls>Category :</wa:mls></strong></div>
		            <c:forEach var="rankingLoopCount" begin="1" end="${item.ranking}">
						<img src="${staticSite}/img/ml/visu_iris.jpg" alt="" class="float_left"/> 
					</c:forEach>
					<br />
				</c:if>
				<div class="clr"></div>
			
			<c:if test="${not empty item.listCuisine}">
				<strong><wa:mls>List Cuisines :</wa:mls></strong>
          		<span >${item.listCuisine}</span> <br />
          	</c:if>
          	<c:if test="${not empty item.price}">
       			<strong><wa:mls>Price :</wa:mls></strong> ${item.price}<br />
       		</c:if>
	      
            	</c:when>
            	<c:otherwise>${item.mainAbstract_}</c:otherwise>
            </c:choose>
	           
				
					
		        <div class="clr"></div>
	           </div>
	          <div class="btn">
					<div class="more_info"><a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a></div>
						<c:if test="${contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
				 <a href="javascript:callLetter('${wa:numberToChar(indexLetter)}', 'map')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${staticSite}/img/ml/btn_map_${wa:numberToChar(indexLetter)}.jpg" alt="Map ${wa:numberToChar(indexLetter)}"/></a>
				<br />
				<a href="javascript:callLetter('${wa:numberToChar(indexLetter)}', 'sv')" class="sv"><span><wa:mls>Street view :</wa:mls></span><img src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
				<script type="text/javascript">
          			addMarker(${item.longitude},${item.latitude},"${item.formatMainTitle}","${wa:numberToChar(indexLetter)}",${item.svLongitude},${item.svLatitude},${item.svHeading},${item.svPitch},${item.svZoom});
          		</script>
          		<c:set var="indexLetter" value="${indexLetter+1}" />
				</c:if>
				<c:set var="varTmp" value="\"" />
					<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" addthis:title="${item.mainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>			      	<div class="ilike" rel="${item.group}|${item.id}"></div>
			      	<a href="javascript:<c:choose><c:when test="${section eq 'meetings' or section eq 'trade'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${item.group}','${item.id}');" class="add"><img src="${staticSite}/img/ml/btn_add.gif" alt="<wa:mls>Add</wa:mls>"/></a>
			      	
	          </div>
	          <div class="clr"></div>
	        </li>
	        <c:if test="${loop.count eq 1}">
	        	<c:set var="group" value="${item.group}"></c:set>
	        </c:if>
        </c:forEach>
 
      </ul>
      <div class="tab_paging">
      
        <wa:include URI="${site}/content/navNumber" />
      
      </div>
    </div></div>
    <!--tab:end-->

<script language='javascript'>
function sortBy(uri,group)
{

	var sort= $("#f_page").val();
	var orderby;
	var asc;
	if(sort == 0){
	}
	if(sort == 1){
		orderBy = "ranking";
		asc = "0";
	}	
	if(sort == 2){
		orderBy = "ranking";
		asc = "1";
	}
	var uri = '<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="clt"/><wa:param name="clt" value="${culture}"/><wa:exceptParam name="orderBy"/><wa:exceptParam name="asc"/><wa:exceptParam name="page"/></wa:url>';
	if(uri.indexOf('?') >= 0)
		document.forms[0].action=uri+"&"+"orderBy="+orderBy+"&asc="+asc;
	else 
		document.forms[0].action=uri+"?"+"orderBy="+orderBy+"&asc="+asc;
	window.location.href= document.forms[0].action;
}
</script>
