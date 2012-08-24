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
<script type="text/javascript">

function tripPlannerLightBox(data) {
	  $.nyroModalManual({
	     minWidth:700,
	     minHeight:400,
	     forceType: 'iframe',
	     url: '${context}/front/other/displayTripPlannerLightBox.do?contentName='+data.contentName+'&status='+data.status+'&panelContentType='+data.panelContentType+'&panelGroup='+data.panelGroup+'&panelContentId='+data.contentId,
	     });
  	
}

</script>
<!--tab:start-->
<c:set var="left" value="left"></c:set>
<c:set var="right" value="right"></c:set>
<div id="list"></div>
    <div class="TabbedPanelsContentGroup">
      <ul class="TabbedPanels">
        <li class="<c:if test="${tabbedPanelsTab eq 'Hotels'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'Hotels'}">TabbedPanelsTab</c:if>"><div><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/></wa:url>?name=${name}&panel=Hotels&page=1#list"/><wa:mls>Hotels</wa:mls></a></div></li>
        <li class="<c:if test="${tabbedPanelsTab eq 'BnB'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'BnB'}">TabbedPanelsTab</c:if>"><div><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/></wa:url>?name=${name}&panel=BnB&page=1#list"/><wa:mls>Bed &amp; <br />Breakfast</wa:mls></a></div></li>
        <li class="<c:if test="${tabbedPanelsTab eq 'Auberge'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'Auberge'}">TabbedPanelsTab</c:if>"><div><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/></wa:url>?name=${name}&panel=Auberge&page=1#list"/><wa:mls>Auberges de jeunesse</wa:mls></a></div></li>
      </ul>
 <div class="Tabbe_Content_Group">
      <div class="tab_paging">
		    <wa:include URI="${site}/content/navNumber" />
	  </div>
      <c:choose>
      	<c:when test="${fn:length(list) == 0}">
      		<p class="no_results"><wa:mls>aucun contenu trouvé</wa:mls></p>
      	</c:when>
      	 
      	  <c:otherwise>
      	<div class="second_highlight_experience_group">
      	<c:forEach var="item" items="${list}" varStatus="loop">
       
      	
      	  	 <div class="second_highlight_experience float_<c:if test="${loop.count mod 2 eq 0}">${right}</c:if><c:if test="${loop.count mod 2 > 0}">${left}</c:if> line_${item.color}">
	 <c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        		<h2>${item.mainTitle}</h2>
				        </a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		  <h2>${item.mainTitle}</h2>
		        		  </a>
          			</c:otherwise>
          </c:choose>
	      	 	 
	        	<c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
                      	<div  class="bloc_img">
					    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        		<c:choose>
          	<c:when test="${not empty item.mainSmallImage}">	
        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="288"/>
          	</c:when>
          	<c:otherwise>
        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="288"/>
          	</c:otherwise>
          </c:choose>
				        </a>
                        </div>
				    </c:when>
      			    <c:otherwise>
                      	<div class="bloc_img">
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		   <c:choose>
          	<c:when test="${not empty item.mainSmallImage}">	
        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="288"/>
          	</c:when>
          	<c:otherwise>
        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="288"/>
          	</c:otherwise>
          </c:choose>
		        	    </a></div>
      			    </c:otherwise>
      			</c:choose>
      			
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
	        <c:if test="${not empty item.URLWebsite and item.group ne 'HOTEL'}">
          		<strong><wa:mls>Website :</wa:mls>toto</strong>
          		<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
	        </c:if>
	       </p>
            	</c:when>
            	<c:otherwise><p>${item.mainAbstract_}</p></c:otherwise>
            </c:choose>
      			<div class="btn">
								<div class="more_info">
									<c:choose>
				        				<c:when test="${item.group == 'HOTEL'}">
										   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a>
									    </c:when>
		      							<c:otherwise>
			      			    			<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a>
		      			  				</c:otherwise>
		      						</c:choose>
      							</div>
      					<div class="btn_right">
								<c:choose>
										<c:when test="${contentType ne 'ContentArticle' && not empty contentType}">
											<div class="gmap">
					 							<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${staticSite}/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg" alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
												<br />
												<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')" class="sv"><span><wa:mls>Street view :</wa:mls></span><img src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
												<script type="text/javascript">
						          					addMarker(${item.longitude},${item.latitude},"${item.formatMainTitle}","${wa:numberToChar(loop.count-1)}",${item.svLongitude},${item.svLatitude},${item.svHeading},${item.svPitch},${item.svZoom});
						          				</script>
						          				<div class="ilike" rel="${item.group}|${item.id}"></div>
												<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" addthis:title="${item.formatMainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" id="logo_share" alt="<wa:mls>Share</wa:mls>"/></a>
				      							<a href="javascript:addToTripPlanner('${item.group}','${item.id}');" class="add"><img src="${staticSite}/img/ml/btn_add.gif" alt="<wa:mls>Add</wa:mls>"/></a>
											</div>
										</c:when>
										<c:otherwise> 
											<div class="ilike" rel="${item.group}|${item.id}"></div>
											<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" addthis:title="${item.formatMainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" id="logo_share" alt="<wa:mls>Share</wa:mls>"/></a>
				      						<a href="javascript:addToTripPlanner('${item.group}','${item.id}');" class="add"><img src="${staticSite}/img/ml/btn_add.gif" alt="<wa:mls>Add</wa:mls>"/></a> 
										</c:otherwise>
				      				</c:choose> 
									</div>
	          				</div>
		       				 
       			 			<div class="clr"> 
					
	          </div>
	      	 </div>
	       
      	</c:forEach>
        </div>
        
      	 
	      	 	<c:if test="${loop.count mod 2  == 0}">
	      	 			<div class="clr"></div>
	      	 		</c:if>
      				 </c:otherwise>
      </c:choose>
    </div></div>

<script language='javascript'>
function sortBy(newURI,group)
{

	var sort= $("#f_page").val();
	var orderby;
	var asc;
	if(sort == 0){
	}
	if(sort == 1){
		orderBy = "title";
		asc = "0";
	}	
	if(sort == 2){
		orderBy = "title";
		asc = "1";
	}
	if(sort == 3){
		orderBy = "id";
		asc = "1";
	}
	if(sort == 4){
		orderBy = "id";
		asc = "0";
	}
	if(sort == 5){
		orderBy = "price";
		asc = "0";
	}
	if(sort == 6){
		orderBy = "price";
		asc = "1";
	}
	if(sort == 7){
		orderBy = "ranking";
		asc = "0";
	}
	if(sort == 8){
		orderBy = "ranking";
		asc = "1";
	}
	var uri = '<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="clt"/><wa:param name="clt" value="${culture}"/><wa:exceptParam name="orderBy"/><wa:exceptParam name="asc"/><wa:exceptParam name="page"/></wa:url>';
	document.forms[0].action=uri+"&"+"orderBy="+orderBy+"&asc="+asc;
	window.location.href= document.forms[0].action;
}
</script>
