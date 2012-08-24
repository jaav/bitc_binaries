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
 

 
<!--tab:start-->

   <div class="TabbedPanelsContentGroup">
   
    
            <div class="Tabbe_Content_Group">
      
       <div class="tab_paging">
            <wa:include URI="${site}/content/navNumber" />
        
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
	             
	       			  <p>
	       			   	<c:if test="${not empty item.mainAbstract_}">
	       		<strong> </strong> ${item.mainAbstract_}<br />
	            	</c:if>  
	       	   </p>
	   
	        
	       	 
	       	<div class="clr"></div>
       			<c:if test="${not empty item.price}">
       			<strong><wa:mls>Price :</wa:mls></strong> <span class="txt_orange"> ${item.price}&euro;</span> <br/>
       		</c:if>
	         
	     
	          
				<div class="clr"></div>
			
			 
      
       		    				
		   
	           </div>
	          <div class="btn">
					<div class="more_info"><a href="<wa:url URI="front/content/displayDetail/group/${item.group}/id/${item.id}"/>" class="btn_more_info" title="${item.mainTitle}"><wa:mls>More info</wa:mls></a></div>
				<c:set var="varTmp" value="\"" />
					<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetailDeals/group/${item.group}/id/${item.id}"/>" addthis:title="${item.mainTitle}" addthis:description="${fn:replace(wa:html2txt(item.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share.gif" alt="<wa:mls>Share</wa:mls>"/></a>
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

 

