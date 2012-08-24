<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="wast" uri="StringToolsTags" %>
<%@ taglib prefix="wabd" uri="BigDecimalUtilsTags" %>
<%@ taglib prefix="wadt" uri="DateToolsTags" %>
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
	     closeButton: '<a href="javascript:location.reload(true)" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a>'
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
        <li class="<c:if test="${panelGroup == 'HOTEL'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'HOTEL'}">TabbedPanelsTab</c:if>"><div><a href="<wa:url URI="${site}/content/displayStays/group/HOTEL"/>"><wa:mls>Hotels</wa:mls></a></div></li> 
        <li class="<c:if test="${panelGroup == 'BnB'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'BnB'}">TabbedPanelsTab</c:if>"><div><a href="<wa:url URI="${site}/content/displayStays/group/BnB"/>"><wa:mls>Bed &amp; Breakfast</wa:mls></a></div></li>
        <li class="<c:if test="${panelGroup == 'AUBERGE'}">TabbedPanelsTabSelected</c:if><c:if test="${panelGroup != 'AUBERGE'}">TabbedPanelsTab</c:if>"><div><a href="<wa:url URI="${site}/content/displayStays/group/AUBERGE"/>"><wa:mls>Auberges de jeunesse</wa:mls></a></div></li>
      </ul>
            <div class="Tabbe_Content_Group">
      
      <c:choose>
      	<c:when test="${iFrameBooking eq 'iFrameBooking'}">
      		<iframe src ="http://www.booking.com/searchresults.${culture.language}.html?ssai=1;aid=325807;order=class;ssre=1;do_availability_check=on;si=ai,co,ci,re;checkin_monthday=${wadt:formatDateByPattern(s_periodFromDate,'dd')};checkin_year_month=${wadt:formatDateByPattern(s_periodFromDate,'yyyy-MM')};checkout_monthday=${wadt:formatDateByPattern(s_periodToDate,'dd')};checkout_year_month=${wadt:formatDateByPattern(s_periodToDate,'yyyy-MM')};class_interval=1;offset=0;score_min=0;si=ai,co,ci,re,di;ss=hotel_id:${hotelIds};city=-1955538;origin=disamb;srhash=1777195148;srpos=1" width="620" height="2450" >
			</iframe> 
      	</c:when>
      	<c:otherwise>
      	<div class="tab_paging">
            <wa:include URI="${site}/content/navNumber" />
        <div class="select">
          <form>
            <fieldset>
              <label for="f_page"><wa:mls>Sort by :</wa:mls></label>
              <select name="f_page" id="f_page" onchange=sortBy("${URI}/","${group}")>
                <option value="0" <c:if test="${empty waParam.orderBy}">SELECTED</c:if>><wa:mls>Choix</wa:mls></option>
                <option value="3" <c:if test="${waParam.orderBy == 'id' && waParam.asc == '1'}">SELECTED</c:if> ><wa:mls>Article (le plus récent)</wa:mls></option>
                <option value="4" <c:if test="${waParam.orderBy == 'id' && waParam.asc == '0'}">SELECTED</c:if>><wa:mls>Article (le moins récent)</wa:mls></option>
                <c:if test="${panelGroup eq 'BnB' or panelGroup == 'HOTEL' or panelGroup == 'BDLF'}">
	                <option value="5" <c:if test="${waParam.orderBy == 'price' && waParam.asc == '0'}">SELECTED</c:if>><wa:mls>Prix (asc)</wa:mls></option>
	                <option value="6" <c:if test="${waParam.orderBy == 'price' && waParam.asc == '1'}">SELECTED</c:if>><wa:mls>Prix (desc)</wa:mls></option>
                </c:if>
                <option value="7" <c:if test="${waParam.orderBy == 'ranking' && waParam.asc == '0'}">SELECTED</c:if>><wa:mls>Nombre d'étoiles (asc)</wa:mls></option>
                <option value="8" <c:if test="${waParam.orderBy == 'ranking' && waParam.asc == '1'}">SELECTED</c:if>><wa:mls>Nombre d'étoiles (desc)</wa:mls></option>
              </select>
            </fieldset>
          </form>
        </div>
      </div>
      <ul class="tab_list_complete">
      <c:choose>
      <c:when test="${MSG_NOT_RES_BNB == '1'}"><wa:mls>Aucune chambre libre </wa:mls>
      </c:when>
      <c:otherwise>
      <c:if test="${listNull == '1'}"><wa:mls>Liste vide</wa:mls></c:if>
           	<c:set var="indexLetter" value="0" />
      <c:forEach var="item" items="${list}" varStatus="loop">
             <li> 
	           <c:choose>
	          		<c:when  test="${not empty item.mainSmallImage}">
		        		<c:choose>
			        		<c:when test="${item.group == 'HOTEL'}">
							    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
						        		<img src="${item.mainSmallImage}"  alt="${item.mainTitle}" width="165"/>
						        </a>
					   		</c:when>
		      			    <c:when test="${item.group != 'HOTEL'}">
			      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
				        		    <img src="${item.mainSmallImage}"  alt="${item.mainTitle}" width="165"/>
				        	    </a>
		      			    </c:when>
	      				</c:choose>
	      			</c:when>
		          	<c:otherwise>
		          		<c:choose>
				        	<c:when test="${item.group == 'HOTEL'}">
							    <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" >
						        		<img src="${context}/static/${site}/img/ml/default_content.jpg"  alt="${item.mainTitle}" width="165"/>
						        </a>
						    </c:when>
		      			    <c:otherwise>
			      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
				        		    <img src="${context}/static/${site}/img/ml/default_content.jpg"  alt="${item.mainTitle}" width="165"/>
				        	    </a>
		      			    </c:otherwise>
		      			</c:choose>
		          	</c:otherwise>
          	</c:choose> 

	          <div class="txt">
	            <h3 class="no_margin">
	            <c:choose>
		        	<c:when test="${item.group == 'HOTEL'}">
					   <a href="<wa:url URI="${site}/content/displayDetailBooking/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" >${item.mainTitle}</a>
				    </c:when>
      			    <c:otherwise>
	      			    <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}" >${item.mainTitle}</a>
      			    </c:otherwise>
      			</c:choose>
	            </h3>
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
	        <c:if test="${not empty item.URLWebsite && item.group != 'HOTEL'}">
          		<strong><wa:mls>Website :</wa:mls></strong>
          		<span><a href="${item.URLWebsite}" target="_blank">${item.URLWebsite}</a></span>
	        </c:if>
	       </p>
            	</c:when>
            	<c:otherwise>${item.mainAbstract_}</c:otherwise>
            </c:choose>
            	<c:if test="${not empty item.ranking && item.ranking > 0}">
	            <div class="float_left"><strong>Category</strong></div>
		            <c:forEach var="rankingLoopCount" begin="1" end="${item.ranking}">
						<img src="${staticSite}/img/ml/visu_stars.jpg" alt="" class="float_left"/> 
					</c:forEach>
		         </c:if>  
		        <div class="clr"></div>
		         <c:if test="${(item.group == 'BnB'|| item.group =='HOTEL') && not empty item.price}">
	            <p><strong><wa:mls>Starting at</wa:mls></strong> : <span class="txt_orange">${wabd:format(wast:toDouble2(item.price,0.0),0)} &euro;<wa:mls>/night</wa:mls></span> <br />
	              </p>
	             </c:if>
	          </div>
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
					<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" addthis:title="${item.mainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
			      	<div class="ilike" rel="${item.group}|${item.id}"></div>
			      	<a href="javascript:<c:choose><c:when test="${section eq 'meetings' or section eq 'trade'}">addToMeetingPlanner</c:when><c:otherwise>addToTripPlanner</c:otherwise></c:choose>('${item.group}','${item.id}');" class="add"><img src="${staticSite}/img/ml/btn_add.gif" alt="<wa:mls>Add</wa:mls>"/></a>
	          </div>
	          <div class="clr"></div>
	        </li>
	        <c:if test="${loop.count eq 1}">
	        	<c:set var="group" value="${item.group}"></c:set>
	        </c:if>
        </c:forEach>
      </c:otherwise>
      </c:choose>
      </ul>
      <div class="tab_paging">
      
        <wa:include URI="${site}/content/navNumber" />
      
      </div>
      </c:otherwise>
      </c:choose>
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
	if(uri.indexOf('?') >= 0)
		document.forms[0].action=uri+"&"+"orderBy="+orderBy+"&asc="+asc;
	else 
		document.forms[0].action=uri+"?"+"orderBy="+orderBy+"&asc="+asc;
	
	window.location.href= document.forms[0].action;
}
</script>
