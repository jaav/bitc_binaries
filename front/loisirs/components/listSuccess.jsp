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
//TRIP PLANNER METHOD 
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

   <div class="TabbedPanelsContentGroup">
         <div class="Tabbe_Content_Group">
   
       <div class="tab_paging">
            <wa:include URI="${site}/content/navNumber"><wa:param name="navId" value="1"/></wa:include>
        <div class="select">
          <form>
            <fieldset>
              <label for="f_page"><wa:mls>Sort by :</wa:mls></label>
              <select name="f_page" id="f_page" onchange=sortBy("${URI}/","${group}")>
                <option value="0"><wa:mls>Choix</wa:mls></option>
                <c:if test="${contentType eq 'ContentPlace' }">
                	<option value="1"><wa:mls>Title asc</wa:mls></option>
                	<option value="2" ><wa:mls>Title desc</wa:mls></option>
                </c:if>
                <option value="3" ><wa:mls>Article (le plus récent)</wa:mls></option>
                <option value="4" ><wa:mls>Article (le moins récent)</wa:mls></option>
              </select>
            </fieldset>
          </form>
        </div>
      </div>
      <ul class="tab_list_complete">
      <c:forEach var="item" items="${list}" varStatus="loop">
        <li> 
        	<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" >
        		<c:choose>
		          	<c:when test="${not empty item.mainSmallImage}">	
		        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="165"/>
		          	</c:when>
		          	<c:otherwise>
		        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.mainTitle}" width="165"/>
		          	</c:otherwise>
		          </c:choose>
        	</a>
          <div class="txt">
            <h3 class="no_margin"><a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" title="${item.mainTitle}">${item.mainTitle}</a></h3>
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
		      	<a href="javascript:saveTripPlannerToDb('${divId}','${contentType}','${item.group}','${item.id}','liste');" class="add"><img src="${staticSite}/img/ml/btn_add.gif" alt="<wa:mls>Add</wa:mls>"/></a>
          </div>
          <div class="clr"></div>
        </li>
        <c:if test="${loop.count eq 1}">
        	<c:set var="group" value="${item.group}"></c:set>
        </c:if>
        </c:forEach>
      </ul>
      <div class="tab_paging">
      
        <wa:include URI="${site}/content/navNumber" ><wa:param name="navId" value="2"/></wa:include>
      
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
	var uri = '<wa:url URI="${URI}" allParams="true"><wa:exceptParam name="clt"/><wa:param name="clt" value="${culture}"/><wa:exceptParam name="orderBy"/><wa:exceptParam name="asc"/><wa:exceptParam name="page"/></wa:url>';
	document.forms[0].action=uri+"&"+"orderBy="+orderBy+"&asc="+asc;
	window.location.href= document.forms[0].action;
}
</script>