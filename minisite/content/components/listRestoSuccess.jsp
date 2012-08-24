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

<!--tab:start-->

   <div class="TabbedPanelsContentGroup">
   
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

      	<c:forEach var="item" items="${list}" varStatus="loop">
          <li> 
           <c:choose>
          	<c:when test="${not empty item.mainSmallImage}">	
        	<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}/name/${waParam.name}"/>" >
        		<img src="${item.mainSmallImage}" alt="${item.mainTitle}" width="165"/>
        	</a>
          	</c:when>
          	<c:otherwise>
          	<a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}/name/${waParam.name}"/>" >
        		<img src="${context}/static/front/img/ml/default_content.jpg" alt="${item.mainTitle}" width="165"/>
        	</a>
          	</c:otherwise>
          </c:choose>
	          <div class="txt">
	            <h3 class="no_margin">
	            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}/name/${waParam.name}"/>" title="${item.mainTitle}" >${item.mainTitle}</a></h3>
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
						<img src="${static}/front/img/ml/visu_iris.jpg" alt="" class="float_left"/> 
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
					<div class="more_info"><a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}/name/${waParam.name}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a></div>
					<c:if test="${contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
				 <a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${static}/front/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg" alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
				<br />
				<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')" class="sv"><span><wa:mls>Street view :</wa:mls></span><img src="${static}/front/img/ml/btn_streetview.jpg" alt="Street view"/></a>
				<script type="text/javascript">
          			addMarker(${item.longitude},${item.latitude},"${item.formatMainTitle}","${wa:numberToChar(loop.count-1)}",${item.svLongitude},${item.svLatitude},${item.svHeading},${item.svPitch},${item.svZoom});
          		</script>
				</c:if> 
				<c:set var="varTmp" value="\"" />
					<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}/name/${waParam.name}"/>" addthis:title="${item.mainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${static}/front/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>			      	
					<div class="ilike" rel="${item.group}|${item.id}"></div>
			      	
			      	
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
