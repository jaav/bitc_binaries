<%@ page 
language="java"
contentType="text/html; charset=utf-8"
pageEncoding="utf-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--tab:start-->

   <div class="TabbedPanelsContentGroup">
         <div class="Tabbe_Content_Group">
   
       <div class="tab_paging">
            <wa:include URI="${site}/content/navNumber" />
 
      </div>
      <ul class="tab_list_complete">
      <c:if test="${empty list}"><wa:mls>Liste vide</wa:mls></c:if>
      <c:forEach var="item" items="${list}" varStatus="loop">
             <li> 
             <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" > 
	          <c:choose>
	          	<c:when test="${not empty item.mainSmallImage}">	
	        		<img src="${item.mainSmallImage}" alt="${item.formatMainTitle}" width="165"/>
	          	</c:when>
	          	<c:otherwise>
	        		<img src="${context}/static/${site}/img/ml/default_content.jpg" alt="${item.formatMainTitle}" width="165"/>
	          	</c:otherwise>
	          </c:choose>
	          </a>
              <div class="txt">
	            <h3 class="no_margin">
		            <a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}"/>"  title="${item.formatMainTitle}">${item.mainTitle}</a></h3>
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
	          		<div class="more_info"><a href="<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}/lg/${culture.language}"/>" class="btn_more_info" title="${item.formatMainTitle}"><wa:mls>More info</wa:mls></a></div>
	          		<c:if test="${contentType ne 'ContentArticle' and not empty item.latitude and item.latitude != 0.0 and not empty item.longitude and item.longitude != 0.0}">
				<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'map')" class="map"><span><wa:mls>Map :</wa:mls></span><img src="${staticSite}/img/ml/btn_map_${wa:numberToChar(loop.count-1)}.jpg" alt="Map ${wa:numberToChar(loop.count-1)}"/></a>
				<br />
				<a href="javascript:callLetter('${wa:numberToChar(loop.count-1)}', 'sv')" class="sv"><span><wa:mls>Street view :</wa:mls></span><img src="${staticSite}/img/ml/btn_streetview.jpg" alt="Street view"/></a>
				<script type="text/javascript">
          			addMarker(${item.longitude},${item.latitude},"${item.formatMainTitle}","${wa:numberToChar(loop.count-1)}",${item.svLongitude},${item.svLatitude},${item.svHeading},${item.svPitch},${item.svZoom});
          		</script>
				</c:if> 
	          		<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetail/group/${item.group}/id/${item.id}"/>" addthis:title="${item.formatMainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
		      		<div class="ilike" rel="${item.group}|${item.id}"></div>
	          </div>
	          <div class="clr"></div>
	        </li>
	       
        </c:forEach>
      </ul>
      <div class="tab_paging">
      
        <wa:include URI="${site}/content/navNumber" />
      
      </div>
    </div></div>
    <!--tab:end-->


