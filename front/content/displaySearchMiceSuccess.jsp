<%@ page 
language="java"
contentType="text/html; charset=utf-8"
pageEncoding="utf-8"
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
<script type="text/javascript">
//TRIP PLANNER METHOD 
//* addToTripPlanner(group, contentId) => call tripPlannerLightBox(data) => data.contentName & data.status ( return contentName & status )

function tripPlannerLightBox(data) {
	  $.nyroModalManual({
	     minWidth:700,
	     minHeight:600,
	     forceType: 'iframe',
	     closeSelector: '.nyroModalClose', 
	     url: '${context}/front/other/displayTripPlannerLightBox.do?contentName='+data.contentName+'&status='+data.status+'&panelContentType='+data.panelContentType+'&panelGroup='+data.panelGroup+'&panelContentId='+data.contentId,
	     closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
	  	});
  	
}

</script>
<!--tab:start-->
<div id="content_main">
			<wa:include URI="front/content/findEventMice" />

   <div class="TabbedPanelsContentGroup">
       <div class="tab_paging">
            <wa:include URI="${site}/content/navNumber" />
      </div>
      <div class="clr"></div>
      <ul class="tab_list_complete">
      <c:if test="${ list  eq null or fn:length(list) <= 0}"><wa:mls>Liste vide</wa:mls></c:if>
      <c:forEach var="item" items="${list}" varStatus="loop">
             <li>
            
             <!-- begin image -->
             
	       <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>">
          <c:choose>
          	<c:when test="${not empty item.mainSmallImage}">	
        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="165"/>
          	</c:when>
          	<c:otherwise>
        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="165"/>
          	</c:otherwise>
          </c:choose>
          </a>
          <!-- end image -->
          
          <div class="txt" id="txt_${item.id}">
            <h3 class="no_margin"><a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}">${item.mainTitle}</a></h3>
            
            <!-- begin date -->
            <div class="date">
	             <c:if test="${not empty item.periodFromDate}">
	             		<strong><wa:mls>Date :</wa:mls></strong>
		            	<span><c:choose>
						<c:when test="${item.periodFromHour eq '00'}">
							<fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodFromDate}"/>
						</c:when>
						<c:otherwise>
							<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.periodFromDate}"/>
						</c:otherwise>
					</c:choose></span>
		            	<span><c:choose>
						<c:when test="${item.periodToHour eq '00'}">
							- <fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodToDate}"/>
						</c:when>
						<c:otherwise>
							- <fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.periodToDate}"/>
						</c:otherwise>
					</c:choose></span>
		        </c:if>
	        </div>
	        <div class="clr"></div>
            <!-- end date -->
            
            <c:choose>
            	<c:when test="${contentType ne 'ContentArticle' && empty item.mainAbstract_}">
            		<%-- 
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
			       
			       </p>
			       --%>
			       <c:if test="${item.numParticipation >0}">
			            <div class="float_left"><strong><wa:mls>Number participation :</wa:mls></strong> ${item.numParticipation}
						</div>
					   </c:if>
					    <div class="clr"></div>
			       <c:choose>
						    <c:when test="${item.attachedContentVenue != null}">
						    	<div class="float_left"><strong><wa:mls>Venue :</wa:mls></strong> <a href="<wa:url URI="${site}/content/displayDetailVenue/group/${item.attachedContentVenue.group}/id/${item.attachedContentVenue.id}"/>" ><span >${item.attachedContentVenue.mainTitle}</span></a>
					            </div>
							    <div class="clr"></div>
						    </c:when>
						    <c:when test="${item.attachedContentVenue == null and !empty item.attachedVenue}">
							    <div class="float_left"><strong><wa:mls>Venue :</wa:mls></strong> ${item.attachedVenue}
					            </div>
							    <div class="clr"></div>
						    </c:when>
					</c:choose>
            	</c:when>
            	<c:otherwise>${item.mainAbstract_}</c:otherwise>
            </c:choose>
			    <div class="clr"></div>
			  
			    
			     <c:if test="${not empty item.URLWebsite}">
          		<p><strong><wa:mls>Website :</wa:mls></strong>
          		<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span></p>
	        </c:if>
			    
			    <c:if test="${item.group == 'GUIDED_TOUR' && item.source == 'VoirEtDire'}">
			    	<a href="/bitc/front/tracking/link/desc/voiretdirebruxelles/cid/F0FDB0F455B48382.do" target="_blank"><wa:mls>Réserver &gt;</wa:mls></a>
			    </c:if>
			    <div class="clr"></div>
	           </div>
	          <div class="btn">
	          <c:set var="varTmp" value="\"" />
					<div class="more_info"><a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a></div> 
					<c:if test="${contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
				 <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${staticSite}/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg" alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
				  <script language='javascript'>
          			addMarker(${item.longitude},${item.latitude},"${item.mainTitle}","${wa:numberToChar(loop.count-1)}");
          		</script>
				</c:if> 
					<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}/${site}/content/displayDetail/group/${item.group}/id/${item.id}.do" addthis:title="${item.mainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
			      	<div class="ilike" rel="${item.group}|${item.id}"></div>
			      	<a href="javascript:addToTripPlanner('${item.group}','${item.id}');" class="add"><img src="${staticSite}/img/ml/btn_add.gif" alt="<wa:mls>Add</wa:mls>"/></a>
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
    </div>
    <!--tab:end-->
</div>
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
	var uri = '<wa:url URI="${URI}"allParams="true"><wa:exceptParam name="orderBy"/><wa:exceptParam name="asc"/><wa:exceptParam name="page"/></wa:url>';
	document.forms[0].action=uri+"&"+"orderBy="+orderBy+"&asc="+asc;
	window.location.href= document.forms[0].action;
}
</script>
