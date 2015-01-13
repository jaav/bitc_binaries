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
.blocImageCss{
	width: 142px;height: 142px;overflow: hidden;display: inline-block;background-size: auto 142px;background-position-x: center;
}
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
	     url: '${context}/front/other/displayTripPlannerLightBox.do?contentName='+data.contentName+'&status='+data.status+'&panelContentType='+data.panelContentType+'&panelGroup='+data.panelGroup+'&panelContentId='+data.contentId,
	     });
  	
}

</script>
<c:choose>
	<c:when test="${culture.language eq 'en'}">
	<fmt:setLocale value="en_US" />	
	</c:when>
	<c:otherwise>
	<fmt:setLocale value="${culture.language}" />
	</c:otherwise>
</c:choose>
<!--tab:start-->
<c:set var="left" value="left"></c:set>
<c:set var="right" value="right"></c:set>
<div id="list"></div>
	
    <div class="TabbedPanelsContentGroup">
      <ul class="TabbedPanels">
       	<c:if test="${module ne 'displayByMap' and module ne 'listByMap' and  empty origin_map}">
       		<li class="<c:if test="${tabbedPanelsTab eq 'HOME'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'HOME'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?panel=HOME&page=1#list"/><div><wa:mls>HOME</wa:mls></div></a></li>
       	</c:if>

        <c:if test="${hotelFound eq true}">  <li class="<c:if test="${tabbedPanelsTab eq 'Hotels'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'Hotels'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentStay&panel=Hotels&page=1#list"/><div><wa:mls>Hotels</wa:mls></div></a></li></c:if>
        <c:if test="${BnBFound eq true}"><li class="<c:if test="${tabbedPanelsTab eq 'BnB'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'BnB'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentStay&panel=BnB&page=1#list"/><div><wa:mls>Bed &amp; <br />Breakfast</wa:mls></div></a></li></c:if>
        <c:if test="${eventsFound eq true}"><li class="<c:if test="${tabbedPanelsTab eq 'events'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'events'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentEvent&panel=events&page=1#list"/><div><wa:mls>Events</wa:mls></div></a></li></c:if>
        <c:if test="${nightLifeFound eq true}"><li class="<c:if test="${tabbedPanelsTab eq 'nightLife'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'nightLife'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentPlace&panel=nightLife&page=1#list"/><div><wa:mls>Night Life</wa:mls></div></a></li></c:if>
        <c:if test="${attractionmuseumFound eq true}"><li class="<c:if test="${tabbedPanelsTab eq 'attractionmuseum'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'attractionmuseum'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentPlace&panel=attractionmuseum&page=1#list"/><div><wa:mls>Attractions <br />and museums</wa:mls></div></a></li></c:if>
        <c:if test="${contemparchFound eq true}"><li class="<c:if test="${tabbedPanelsTab eq 'contemparch'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'contemparch'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentPlace&panel=contemparch&page=1#list"/><div><wa:mls>Monuments</wa:mls></div></a></li></c:if>
        <c:if test="${contentPropertyValue.name != 'gastronomy'}">
        	<c:if test="${eatingFound eq true}"><li class="<c:if test="${tabbedPanelsTab eq 'eating'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'eating'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentRestaurant&panel=eating&page=1#list"/><div><wa:mls>Eating</wa:mls></div></a></li></c:if>
        </c:if>
        <c:if test="${contentPropertyValue.name == 'gastronomy'}">
        	<c:if test="${eatingFound eq true}"><li class="<c:if test="${tabbedPanelsTab eq 'eating'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'eating'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentRestaurant&panel=eating&page=1#list"/><div>
        		<c:if test="${culture == 'BE_en'}">
	        		<wa:mls>Best kitchens</wa:mls>
	        	</c:if>
	        	<c:if test="${culture == 'BE_fr'}">
	        		<wa:mls>Meilleures tables</wa:mls>
	        	</c:if>
	        	<c:if test="${culture == 'BE_nl'}">
	        		<wa:mls>Heerlijk tafelen</wa:mls>
	        	</c:if>
        	</div></a></li></c:if>
        </c:if>
        <c:if test="${walkFound eq true}"><li class="<c:if test="${tabbedPanelsTab eq 'walk'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'walk'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentArticle&panel=walk&page=1#list"/><div><wa:mls>Walks</wa:mls></div></a></li></c:if>
        <c:if test="${shoppingFound eq true}"><li class="<c:if test="${tabbedPanelsTab eq 'shopping'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'shopping'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentPlace&panel=shopping&page=1#list"/><div><wa:mls>Shopping</wa:mls></div></a></li></c:if>
        <c:if test="${packageFound eq true}">  <li class="<c:if test="${tabbedPanelsTab eq 'Package'}">TabbedPanelsTabSelected</c:if><c:if test="${tabbedPanelsTab ne 'Package'}">TabbedPanelsTab</c:if>"><a href="<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="page"/><wa:exceptParam name="clt"/><wa:exceptParam name="lg"/><wa:param name="clt" value="${culture}"/><wa:param name="idCongressiste" value="${idCongressiste}"/></wa:url>?contentType=ContentPlace&panel=Package&page=1#list"/><div><wa:mls>Package</wa:mls></div></a></li></c:if>
     </ul>
     <div class="Tabbe_Content_Group">
        
      <div class="tab_paging">
		    <wa:include URI="${site}/propertyValue/navNumber" />
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
				 			<c:when test="${item.homeDisplay eq 'free'}">
				 				 
				 					${item.mainBody}
				 			 
				 			</c:when>
				 			<c:otherwise>
	      	 				<h2>
	      	 				<c:choose>
		        				<c:when test="${item.group == 'HOTEL'}">
					    			<a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        				<span class="cutH2SmallTitle">${item.mainTitle}</span> 
				        			</a>
				    			</c:when>
                               <c:when test="${item.group == 'FOODY'}">
                                    <a href="/bitc/front/content/displayDetail/group/${item.group}/id/${item.id}.do" >
                                        <span class="cutH2SmallTitle">${item.index}</span>
                                    </a>
                                </c:when>
      			    			<c:otherwise>
	      			    			<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		  				<span class="cutH2SmallTitle">${item.mainTitle}</span>
		        		  			</a>
          						</c:otherwise>
          					</c:choose>
          					</h2>
          					<h3>
          					<c:if test="${contentType eq 'ContentEvent'}">
          						<c:if test="${not empty item.periodFromDate}">
	          						<c:choose>
										<c:when test="${item.periodFromHour eq '00'}">
											<fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodFromDate}"/>
										</c:when>
										<c:otherwise>
											<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.periodFromDate}"/>
										</c:otherwise>
									</c:choose>-<c:choose>
										<c:when test="${item.periodToHour eq '00'}">
											<fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodToDate}"/>
										</c:when>
										<c:otherwise>
											<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${item.periodToDate}"/>
										</c:otherwise>
									</c:choose>
	          					</c:if>
          					</c:if>
          					</h3>
	      	 					<c:choose>
	      	 						<c:when test="${item.group == 'RESTO' || item.group == 'BREAKFAST' || item.group == 'RESTO_NIGHT'}">
				        				<div class="bloc_img">
		                                     <c:choose>
												<c:when test="${not empty item.mainSmallImage}">
													<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="blocImageCss" style="background-image: url('${item.mainSmallImage}')" name="${item.formatMainTitle}" title="${item.formatMainTitle}"></a>
												</c:when>
												<c:otherwise>
													<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="blocImageCss" style="background-image: url('${context}/static/${site}/img/ml/default_content.jpg')" name="${item.formatMainTitle}" title="${item.formatMainTitle}"></a>
												 </c:otherwise>
										     </c:choose>
				        	    		</div>
	      	 						</c:when>
	      	 						<c:otherwise>
	      	 							<c:choose>
				        					<c:when test="${item.group == 'HOTEL'}">
		                                      	<div class="bloc_img">
		                                      		<a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
								        				<c:choose>
				          									<c:when test="${not empty item.mainSmallImage}">	
				        										<img src="${item.mainSmallImage}" alt="${item.mainTitle}" height="142" width="288"/>
				          									</c:when>
				          									<c:otherwise>
				        										<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" height="142" width="288"/>
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
				        										<img src="${item.mainSmallImage}" alt="${item.mainTitle}" height="142" width="288"/>
				          									</c:when>
				          									<c:otherwise>
				        										<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.formatMainTitle}" height="142" width="288"/>
				          									</c:otherwise>
				          								</c:choose>
							        				</a>
												
				        	    				</div>
		      			    				</c:otherwise>
		      							</c:choose>
	      	 						</c:otherwise>
	      	 					</c:choose>
	        					
      					
      						<!-- <p>${item.mainAbstract_}</p>-->
      						 <c:choose>
				            	<c:when test="${contentType ne 'ContentArticle' && not empty contentType && empty item.mainAbstract_}">
				            		<c:if test="${not empty item.address}">
					        			<p style="text-align: left;"> ${item.address} <br />
					      				<c:if test="${not empty item.zipcode && item.zipcode > 0}">
					      					${item.zipcode}
					      				</c:if>
					      			 	<c:if test="${not empty item.city}">
						      			 	${item.city}
						      			 </c:if>
					    		  		</p>
					       			</c:if>
					       			  <p style="text-align: left;">
							       	<c:if test="${not empty item.phone}">
							       		<strong><wa:mls>Tel :</wa:mls></strong> ${item.phone}<br />
							       	</c:if>
							       	<c:if test="${empty item.phone && not empty item.mobile}">
							       		<strong><wa:mls>Mobile :</wa:mls></strong> ${item.mobile}<br />
							       	</c:if>
							       	<c:if test="${not empty item.email &&  item.group ne 'RESTO'}">
						          		<strong><wa:mls>Email :</wa:mls></strong>
						          		<span><a href="mailto:${item.email}">${item.email}</a></span> <br />
							        </c:if>
							        <c:if test="${empty item.email && not empty item.URLWebsite &&  item.group ne 'HOTEL'}">
						          		<strong><wa:mls>Website :</wa:mls></strong>
						          		<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span> <br />
							        </c:if>
                                     <c:if test="${item.group == 'FOODY' && item.gastro>0}">
                                         <strong><wa:mls>Score :</wa:mls></strong> ${item.gastro} / 20<br />
                                     </c:if>
							       </p>
						            	</c:when>
						            	<c:otherwise><span class="cutMainAbstract">${item.mainAbstract_}</span></c:otherwise>
				            </c:choose>
      						<div class="btn">
								<div class="more_info"><a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a></div> 
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
	          				</c:otherwise></c:choose>
	      	 			</div>
	      	 		<c:if test="${loop.count mod 2  == 0}">
	      	 			<div class="clr"></div>
	      	 		</c:if>
        			</c:forEach>
        		</div>
      		</c:otherwise>
      </c:choose>
      <div class="clr"></div>
    </div>
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
