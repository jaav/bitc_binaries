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
            <wa:include URI="${site}/meetingPlanner/navNumber" />
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
			       	<c:if test="${not empty item.email}">
		          		<strong><wa:mls>Email :</wa:mls></strong>
		          		<span ><a href="mailto:${item.email}">${item.email}</a></span> <br />
			        </c:if>
			        <c:if test="${not empty item.URLWebsite}">
		          		<strong><wa:mls>Website :</wa:mls></strong>
		          		<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
			        </c:if>
			       </p>
	            	</c:when>
	            	<c:otherwise>${item.mainAbstract_}</c:otherwise>
	            </c:choose>
	            <c:if test="${not empty item.capacity and item.capacity > 0 }">
		        	 <p>	<strong><wa:mls>Nombre de couverts :</wa:mls></strong>
		        	 	<span>${item.capacity}</span></p>
		        	 </c:if>
	            <%--c:if test="${not empty item.ranking and item.ranking > 0}">
	              <div class="float_left"><strong><wa:mls>Category :</wa:mls></strong></div>
		            <c:forEach var="rankingLoopCount" begin="1" end="${item.ranking}">
									<img src="${staticSite}/img/ml/visu_iris.jpg" alt="" class="float_left"/>
								</c:forEach>
							</c:if--%>
					<div class="clr"></div>
					
				
					<wa:include URI="front/content/propertyValues" >
						<wa:param name="lib" value="Type de cuisine :"/>
						<wa:param name="group" value="${item.group}"/>
						<wa:param name="id" value="${item.id}"/>
					</wa:include>
		        <div class="clr"></div>
	           </div>
	          <div class="btn">
					<div class="more_info"><a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a></div>
					<c:if test="${contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
					 <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${staticSite}/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg" alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
				<br />
				<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')" class="sv"><span><wa:mls>Street view :</wa:mls></span><img src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
				<script type="text/javascript">
          			addMarker(${item.longitude},${item.latitude},"${item.formatMainTitle}","${wa:numberToChar(loop.count-1)}",${item.svLongitude},${item.svLatitude},${item.svHeading},${item.svPitch},${item.svZoom});
          		</script>
					</c:if> 
					<c:set var="varTmp" value="\"" />
					<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" addthis:title="${item.mainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
			      	<div class="ilike" rel="${item.group}|${item.id}"></div>
			      	<a href="javascript:saveMeetingPlannerToDb('${divId}','${contentType}','${item.group}','${item.id}','liste');" class="add"><img src="${staticSite}/img/ml/btn_add.gif" alt="<wa:mls>Add</wa:mls>"/></a>
			      	
	          </div>
	          <div class="clr"></div>
	        </li>
	        <c:if test="${loop.count eq 1}">
	        	<c:set var="group" value="${item.group}"></c:set>
	        </c:if>
        </c:forEach>
      </ul>
      <div class="tab_paging">
      
        <wa:include URI="${site}/meetingPlanner/navNumber" />
      
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
	if(sort == 1){
		orderBy = "ranking";
		asc = "0";
	}	
	if(sort == 2){
		orderBy = "ranking";
		asc = "1";
	}
	var uri = '<wa:url URI="${URI}"><wa:param name="clt" value="${culture}"/><wa:param name="group" value="${waParam.group}"/></wa:url>?page=${waParam.page}<c:if test="${not empty waParam.orderBy}">&orderBy=${waParam.orderBy}&asc=${waParam.asc}</c:if><c:if test="${not empty waParam.s_periodFromDate}">&s_periodFromDate=${s_periodFromDate }</c:if><c:if test="${not empty waParam.s_periodToDate}">&s_periodToDate=${s_periodToDate}</c:if><c:if test="${not empty waParam.title}">&title=${waParam.title}</c:if><c:if test="${not empty waParam.room}">&room=${waParam.room}</c:if><c:if test="${not empty waParam.ranking}">&ranking=${waParam.ranking}</c:if><c:if test="${not empty waParam.f_config}">&f_config=${waParam.f_config}</c:if><c:if test="${not empty waParam.f_persons}">&f_persons=${waParam.f_persons}</c:if><c:if test="${not empty waParam.s_ContentPropertyValue_valueId_Cuisine}">&s_ContentPropertyValue_valueId_Cuisine=${waParam.s_ContentPropertyValue_valueId_Cuisine}</c:if><c:if test="${not empty waParam.panel}">&panel=${waParam.panel}</c:if>';
	if(uri.indexOf('?') >= 0)
		uri=uri+"&"+"orderBy="+orderBy+"&asc="+asc;
	else 
		uri=uri+"?"+"orderBy="+orderBy+"&asc="+asc;
	document.forms[0].action=uri+"&panelContentType=${waParam.panelContentType}&panelGroup=${waParam.panelGroup}&rub=${waParam.rub}";
	window.location.href= document.forms[0].action;
}
</script>
