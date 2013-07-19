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
	     minHeight:600,
	     forceType: 'iframe',
	     closeSelector: '.nyroModalClose', 
	     url: '${context}/front/other/displayTripPlannerLightBox.do?contentName='+data.contentName+'&status='+data.status+'&panelContentType='+data.panelContentType+'&panelGroup='+data.panelGroup+'&panelContentId='+data.contentId,
	     closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
	  	});
  	
}
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

<c:choose>
	<c:when test="${culture.language eq 'en'}">
	<fmt:setLocale value="en_US" />	
	</c:when>
	<c:otherwise>
	<fmt:setLocale value="${culture.language}" />
	</c:otherwise>
</c:choose>



<div id="content_main">
	<div class="first_highlight_home">
	
		<div class="scrollable" id="chained">
		 	<div class="items">
		 		<!-- Affichage Des Slides  first_highlight_home-->
		 		<c:set var="indexLetter" value="0" />
		 		<c:forEach var="item" items="${mainList}" varStatus="loop">
				 	<div>
				 		<c:choose>
				 			<c:when test="${item.homeDisplay eq 'free'}">
				 				<div class="first_highlight_home_slide line_grey">
				 					${item.mainBody}
				 				</div>
				 			</c:when>
				 			<c:otherwise>
				 			
				 			
				      	<div class="first_highlight_home_slide line_${item.color}">
				             <h2>
				             	<c:choose>
		        					<c:when test="${item.group == 'HOTEL'}">
					   					<a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" title="${item.formatMainTitle}" ><span class="cutH2Title">${item.mainTitle}</span></a>
				    				</c:when>
      			    				<c:otherwise>
	      			    				<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.formatMainTitle}" ><span class="cutH2Title">${item.mainTitle}</span></a>
      			    				</c:otherwise>
      							</c:choose>
      						</h2>
      						<h3>
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
      						</h3>
				           	<c:choose>
          						<c:when test="${not empty item.mainSmallImage}">
	        						<c:choose>
		        						<c:when test="${item.group == 'HOTEL'}">
					    					<a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        						<img src="${item.mainSmallImage}" alt="${item.formatMainTitle}" width="410"/>
				        					</a>
				    					</c:when>
      			    					<c:otherwise>
	      			    					<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		    					<img src="${item.mainSmallImage}" alt="${item.formatMainTitle}" width="410"/>
		        	    					</a>
      			    					</c:otherwise>
      								</c:choose>
      							</c:when>
          						<c:otherwise>
          							<c:choose>
		        						<c:when test="${item.group == 'HOTEL'}">
					    					<a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        						<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.formatMainTitle}" width="410"/>
				        					</a>
				    					</c:when>
      			    					<c:otherwise>
	      			    					<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		    					<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.formatMainTitle}" width="410"/>
		        	    					</a>
      			    					</c:otherwise>
      								</c:choose>
          						</c:otherwise>
          					</c:choose> 
				            <c:choose>
            					<c:when test="${item.contentType ne 'ContentArticle' && empty item.mainAbstract_}">
            						<c:if test="${not empty item.address}">
	        							<p>${item.address} </p>
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
	        							<c:if test="${not empty item.URLWebsite && item.group != 'HOTEL'}">
          									<strong><wa:mls>Website :</wa:mls></strong>
          									<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
	        							</c:if>
	       							</p> 
            					</c:when>
            					<c:when test="${fn:startsWith(item.mainAbstract_, '<div')}">
            						${item.mainAbstract_}
            					</c:when>
            					<c:otherwise><p class="cutHomeMainAbstract">${item.mainAbstract_}</p></c:otherwise>
           					</c:choose>
				            <div class="btn">
								<div class="more_info">
									<c:choose>
				        				<c:when test="${item.group == 'HOTEL'}">
							   				<a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a>
						    			</c:when>
		      			    			<c:otherwise>
			      			    			<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a>
		      			    			</c:otherwise>
		      						</c:choose>
      							</div>
								<c:if test="${item.contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
				 					<a href="javascript:callLetter('${wa:numberToChar(indexLetter)}', 'map')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${staticSite}/img/ml/btn_map_${wa:numberToChar(indexLetter)}.jpg" alt="Map ${wa:numberToChar(indexLetter)}"/></a>
				<br />
				<a href="javascript:callLetter('${wa:numberToChar(indexLetter)}', 'sv')" class="sv"><span><wa:mls>Street view :</wa:mls></span><img src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
				<script type="text/javascript">
          			addMarker(${item.longitude},${item.latitude},"${item.formatMainTitle}","${wa:numberToChar(indexLetter)}",${item.svLongitude},${item.svLatitude},${item.svHeading},${item.svPitch},${item.svZoom});
          		</script>
          		
          		<c:set var="indexLetter" value="${indexLetter+1}" />
								</c:if> 
				           </div>
			            </div>
			            </c:otherwise>
				 		</c:choose>
					</div>
		 		</c:forEach>
		 	</div>
		</div>
		<div class="navi">
			<c:forEach var="item" items="${mainList}"  varStatus="loopCount">
				<a href="">${ loopCount.count }</a>
			</c:forEach>
		</div>

	</div>
	<c:if test="${fn:length(tickerList) > 0}">
	<div id="ticker">
      <div> <a class="prev_1 browse left"><strong>&lt;</strong></a>
        <div class="scrollable" id="chained2" >
          <div class="items">
          
            <c:forEach items="${tickerList}" var="item" varStatus="loop">
	           <div>
	                <div class="ticker"><img src="${context}/static/${site}/img/ml/picto_news.jpg" alt="ticker"/>
			            <p>
			            	<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>">${item.truncMainTitle}</a> 
			            	<strong><fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodFromDate}"/> - <fmt:formatDate pattern="dd/MM/yyyy" value="${item.periodToDate}"/></strong>
			            </p> 
		            	<div class="clr"></div>
		            </div>
	           </div>
            </c:forEach>
          </div>
        </div>
        <a class="next_1 browse right"><strong>&gt;</strong></a> </div>
    </div>
    <!--ticker:end-->
    </c:if>
	<!-- second_highlight_home -->
	<c:set var="mainSize" value="${fn:length(mainList)}"/>
	
	<c:forEach var="item" items="${centerList}"  varStatus="loop">
		<c:if test="${(loop.count mod 2) ne 0}">
				<c:choose>
				 			<c:when test="${item.homeDisplay eq 'free'}">
				 				<div class="clr second_highlight_home float_left line_grey">
				 					${item.mainBody}
				 				</div>
				 			</c:when>
				 			<c:otherwise>
				 			
			<div class="clr second_highlight_home float_left line_${item.color}">
		      <h3><c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" ><span class="cutH2SmallTitle">${item.mainTitle}</span></a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" ><span class="cutH2SmallTitle">${item.mainTitle}</span></a>
      			    </c:otherwise>
      			</c:choose>
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
      			</h3>
		      
		      <c:choose>
          	<c:when  test="${not empty item.mainSmallImage}">
	        	<c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        		<img src="${item.mainSmallImage}" alt="${item.formatMainTitle}" width="300"/>
				        </a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		    <img src="${item.mainSmallImage}" alt="${item.formatMainTitle}" width="300"/>
		        	    </a>
      			    </c:otherwise>
      			</c:choose>
      				</c:when>
          	<c:otherwise>
          <c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.formatMainTitle}" width="300"/>
				        </a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		    <img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.formatMainTitle}" width="300"/>
		        	    </a>
      			    </c:otherwise>
      			</c:choose>
          	</c:otherwise>
          </c:choose> 
		  
		      
		     <c:choose>
            	<c:when test="${item.contentType ne 'ContentArticle' && empty item.mainAbstract_}">
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
          		<span><a href="mailto:${item.email}">${item.email}</a></span> <br />
	        </c:if>
	        <c:if test="${not empty item.URLWebsite && item.group != 'HOTEL'}">
          		<strong><wa:mls>Website :</wa:mls></strong>
          		<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
	        </c:if>
	       </p>
            	</c:when>
            	<c:otherwise><span class="cutMainAbstract">${item.mainAbstract_}</span></c:otherwise>
            </c:choose>
		      <div class="btn"> 
		      		<div class="more_info">
						<c:choose>
				        	<c:when test="${item.group == 'HOTEL'}">
							   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a>
						    </c:when>
		      			    <c:otherwise>
			      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a>
		      			    </c:otherwise>
		      			</c:choose>
      				</div>
						<c:if test="${item.contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
				<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${staticSite}/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg" alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
				<br />
				<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')" class="sv"><span><wa:mls>Street view :</wa:mls></span><img src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
				<script type="text/javascript">
          			addMarker(${item.longitude},${item.latitude},"${item.formatMainTitle}","${wa:numberToChar(loop.count-1)}",${item.svLongitude},${item.svLatitude},${item.svHeading},${item.svPitch},${item.svZoom});
          		</script>
				</c:if>  
				<c:set var="varTmp" value="\"" />
		      		<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}${context}/front/content/detail/group/${item.group}/id/${item.id}.do" addthis:title="${item.mainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
		      		<div class="ilike" rel="${item.group}|${item.id}"></div>
		      		<a href="javascript:<c:choose><c:when test="${section eq 'meetings'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${item.group}','${item.id}');" class="add"><img src="${staticSite}/img/ml/btn_add.gif" alt="<wa:mls>Add</wa:mls>"/></a> 
		      </div>
		    </div>
		    </c:otherwise>
		    </c:choose>
		</c:if>
		<c:if test="${(loop.count mod 2) eq 0}">
		<c:choose>
				 			<c:when test="${item.homeDisplay eq 'free'}">
				 				<div class="second_highlight_home float_right line_grey">
				 					${item.mainBody}
				 				</div>
				 			</c:when>
				 			<c:otherwise>
			<div class="second_highlight_home float_right line_${item.color}">
		      <h3><c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" ><span class="cutH2SmallTitle">${item.mainTitle}</span></a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" ><span class="cutH2SmallTitle">${item.mainTitle}</span></a>
      			    </c:otherwise>
      			</c:choose></h3>
		      
		      <c:choose>
          	<c:when  test="${not empty item.mainSmallImage}">
	        	<c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        	<img src="${item.mainSmallImage}" alt="${item.formatMainTitle}" width="300"/>
				        </a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		    <img src="${item.mainSmallImage}" alt="${item.formatMainTitle}" width="300"/>
		        	    </a>
      			    </c:otherwise>
      			</c:choose>
      		</c:when>
          	<c:otherwise>
          <c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        	<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.formatMainTitle}" width="300"/>
				        </a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		    <img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.formatMainTitle}" width="300"/>
		        	    </a>
      			    </c:otherwise>
      			</c:choose>
          	</c:otherwise>
          </c:choose> 
		      
		   <c:choose>
            	<c:when test="${item.contentType ne 'ContentArticle' && empty item.mainAbstract_}">
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
          		<span><a href="mailto:${item.email}">${item.email}</a></span><br />
	        </c:if>
	        <c:if test="${not empty item.URLWebsite && item.group != 'HOTEL'}">
          		<strong><wa:mls>Website :</wa:mls></strong>
          		<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
	        </c:if>
	       </p>
            	</c:when>
            	<c:otherwise><span class="cutMainAbstract">${item.mainAbstract_}</span></c:otherwise>
            </c:choose>
		      <div class="btn"> 
		      		<div class="more_info">
						<c:choose>
				        	<c:when test="${item.group == 'HOTEL'}">
							   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a>
						    </c:when>
		      			    <c:otherwise>
			      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a>
		      			    </c:otherwise>
		      			</c:choose>
      				</div>
						<c:if test="${item.contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
				 <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${staticSite}/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg" alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
				<br />
				<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')" class="sv"><span><wa:mls>Street view :</wa:mls></span><img src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
				<script type="text/javascript">
          			addMarker(${item.longitude},${item.latitude},"${item.formatMainTitle}","${wa:numberToChar(loop.count-1)}",${item.svLongitude},${item.svLatitude},${item.svHeading},${item.svPitch},${item.svZoom});
          		</script>
				</c:if> <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}${context}/front/content/detail/group/${item.group}/id/${item.id}.do" addthis:title="${item.mainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
		      		<div class="ilike" rel="${item.group}|${item.id}"></div>
		      		<a href="javascript:<c:choose><c:when test="${section eq 'meetings'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${item.group}','${item.id}');" class="add"><img src="${staticSite}/img/ml/btn_add.gif" alt="<wa:mls>Add</wa:mls>"/></a> 
		      </div>
		    </div>
		    </c:otherwise>
		    </c:choose>
		</c:if>
    </c:forEach>
   
   <div class="clr"></div>
    <!--third_highlight_home  -->
    <c:if test="${fn:length(bottomList) > 0}">
    <ul class="third_highlight_home">
  
<c:forEach var="item" items="${bottomList}" varStatus="loop">    
    <li> 

    <c:choose>
				 			<c:when test="${item.homeDisplay eq 'free'}">
				 				
				 					${item.mainBody}
				 				
				 			</c:when>
				 			<c:otherwise>
    <c:choose>
          	<c:when  test="${not empty item.mainSmallImage}">
	        	<c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="96"/>
				        </a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		    <img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="96"/>
		        	    </a>
      			    </c:otherwise>
      			</c:choose>
      				</c:when>
          	<c:otherwise>
          <c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
				        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="96"/>
				        </a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
		        		    <img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="96"/>
		        	    </a>
      			    </c:otherwise>
      			</c:choose>
          	</c:otherwise>
          </c:choose> 
   
        <div class="txt">
          <h5><c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" >${item.mainTitle}</a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" >${item.mainTitle}</a>
      			    </c:otherwise>
      			</c:choose></h5>
         <c:choose>
            	<c:when test="${item.contentType ne 'ContentArticle' && empty item.mainAbstract_}">
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
          		<span><a href="mailto:${item.email}">${item.email}</a></span> <br />
	        </c:if>
	        <c:if test="${not empty item.URLWebsite && item.group != 'HOTEL'}">
          		<strong><wa:mls>Website :</wa:mls></strong>
          		<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
	        </c:if>
	       </p>
            	</c:when>
            	<c:otherwise><span class="cutMainAbstract">${item.mainAbstract_}</span></c:otherwise>
            </c:choose>
        </div>
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
        <div class="clr"></div>
        </c:otherwise>
        </c:choose>
      </li>
      </c:forEach>
    
    </ul>
    </c:if>
</div>