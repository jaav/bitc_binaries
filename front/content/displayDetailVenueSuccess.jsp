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
<c:if test="${adminUser != null}">
<script>
function addToNltContent(group,contentId){
	$.ajax({
		url:'/bitc/admin/ajax/addToNltContent.do?contentId='+contentId+'&group='+group,
		type:'GET',
		dataType: "json",
		success : function(data){
			alert(data.result);
		}
	})
}
</script>
</c:if>
<div id="btn_back"><a href="javascript:history.back();"><wa:mls>Back</wa:mls></a></div>
<div class="clear"></div>
<div id="content_main">
		<c:if test="${not empty adminUser}">
			 <a href="javascript:addToNltContent('VENUE','${bean.id}');"><wa:mls>Ajouter à la table nlt content</wa:mls></a>
			 <a href="${context}/admin/contentVenue/list.do?s_publishContent_id=${bean.id}&s_submit=Search" target="admin"><wa:mls>Edit</wa:mls></a>
	    </c:if>
		<h1 class="no_margin line_grey">${bean.mainTitle}</h1> <!-- ${color} -->
		
		<c:if test="${not empty bean.mainBigImage}">	
        	<img src="${bean.mainBigImage}" alt="${bean.mainTitle}" height="200" align="left"  class="m22">
        </c:if>
        <div class="clr"></div>
    	<div id="main_information">
		<!--featurepraticalinformation:start-->
			<div id="box_right_information">
    <div id="feature_pratical_information"> 
    <c:set var="varTmp" value="\"" />
       <div class="ilike_big" rel="${bean.group}|${bean.id}"></div> 
       <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=wanabe" class="addthis_button share"  addthis:url="${config['URL']}<wa:url URI="${site}/content/displayDetailVenue/id/${bean.id}"/>" addthis:title="${bean.mainTitle}" addthis:description="${fn:replace(wa:html2txt(bean.mainAbstract_),varTmp,'&quot;')}"><img src="${staticSite}/img/ml/btn_share_big.gif" id="logo_share" alt="<wa:mls>Share</wa:mls>"/></a>
       <a href="javascript:addToMeetingPlanner('VENUE','${bean.id}');"><img src="${staticSite}/img/ml/btn_add_big.gif" alt="<wa:mls>Add</wa:mls>" id="logo_add"/></a>

    </div>
   		
         <div id="pratical_information">
	        <h4><wa:mls>Practical informations</wa:mls></h4>
	        <c:if test="${not empty bean.address}">
	        	<p> ${bean.address} </p>
	      		<p>
	      			<c:if test="${not empty bean.zipcode && bean.zipcode > 0}">
	      				${bean.zipcode}
	      			</c:if>
	      			 <c:if test="${not empty bean.city}">
	      			 	${bean.city}
	      			 </c:if>
	      		</p>
	        </c:if>
	      
	       	<c:if test="${not empty bean.phone}">
	       		 <p><strong><wa:mls>Tel :</wa:mls></strong> ${bean.phone}</p>
	       	</c:if>
	       	<c:if test="${not empty bean.mobile}">
	       		 <p><strong><wa:mls>Mobile :</wa:mls></strong> ${bean.mobile}</p>
	       	</c:if>
	       	<c:if test="${not empty bean.fax}">
	       		 <p><strong><wa:mls>Fax :</wa:mls></strong> ${bean.fax}</p>
	       	</c:if>
	       	<c:if test="${not empty bean.email}">
          		 <p><strong><wa:mls>Email :</wa:mls></strong> <br />
          		<span class="cutEmail"><a href="mailto:${bean.email}">${bean.email}</a></span></p>
	        </c:if>
	        <c:if test="${not empty bean.URLWebsite}">
          		 <p><strong><wa:mls>Website :</wa:mls></strong> <br />
          		<span class="cutEmail"><a href="${bean.URLWebsite}" target="_blank">${bean.URLWebsite}</a></span></p>
	        </c:if>
	       	        
	        <c:if test="${contentType ne 'ContentArticle' and not empty bean.latitude and bean.latitude != 0.0 and not empty bean.longitude and bean.longitude != 0.0}">
				<p><a href="javascript:callLetter('a', 'map')" class="btn_map_view"><span><wa:mls>View on the map</wa:mls></span></a></p>
				<p><a href="javascript:callLetter('a', 'sv')" class="btn_street_view"><span><wa:mls>Google street view</wa:mls></span></a></p>
			 <div style="margin-left:15px;">
				 <c:forEach var="item" items="${listPicto}" varStatus="loop">
			    <a href="${item.defaultDescription}?lang=${culture.language}" target="_blank">  <img src="${item.logo}" title="${item.mainTitle}" width="27"  height="27"    class="m23"   ></a> 
				<c:choose>
					 <c:when test="${fn:length(listPicto) >8}">
						<c:if test="${loop.count  == 5}">
	      	 			  <div class="clr"></div>
	      	 			</c:if>
	      	 		  </c:when>
	      	 		  <c:otherwise> 	
	      	 		    <c:if test="${loop.count  == 4}">
	      	 			  <div class="clr"></div>
	      	 			 </c:if> 
	      	 		  </c:otherwise>
				   </c:choose>
				</c:forEach>
			 
				 
				
				</div>
				<script type="text/javascript">
				addMarker(${bean.longitude},${bean.latitude},"${bean.formatMainTitle}","a",${bean.svLongitude},${bean.svLatitude},${bean.svHeading},${bean.svPitch},${bean.svZoom});
          		</script>
			</c:if>
			 
	      </div>
  
      
 
    </div>
    
    ${bean.mainBody}
    
    </div>
    <!--featurepraticalinformation:end-->
    		    <div class="clr"></div>
 <c:set var="fb_url" value="${config['URL']}${context}/${site}/${module}/${action}/group/${bean.group}/id/${bean.id}.do"/>   
   <iframe src="http://www.facebook.com/plugins/like.php?href=${fb_url}&amp;layout=standard&amp;show_faces=false&amp;width=450&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:35px;" allowTransparency="true" class="facebook_like"></iframe>

    <!--boxotherinformation:start-->
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="venues_table">
  <tr class="top">
    <td class="first_row"><wa:mls>Room</wa:mls></td>
    <td><wa:mls>Surface</wa:mls></td>
    <td><wa:mls>Height</wa:mls></td>
    <td><wa:mls>Theater</wa:mls></td>
    <td><wa:mls>School</wa:mls></td>
    <td><wa:mls>Cocktail</wa:mls></td>
    <td><wa:mls>Banquet</wa:mls></td>
    <td><wa:mls>Auditorium</wa:mls></td>
    <td><wa:mls>Interpr. cabins</wa:mls></td>
  </tr>
  <c:forEach items="${bean.contentRooms}" var="item" varStatus="loop">
  	<tr class="row${loop.count mod 2}">
    	<td class="room">${item.name}</td>
    	<td><c:choose><c:when test="${item.surface > 0}"><fmt:formatNumber value="${item.surface}" pattern="#######"/> <wa:mls>m&sup2;</wa:mls></c:when><c:otherwise>-</c:otherwise></c:choose></td>
    	<td><c:choose><c:when test="${item.height > 0}"><fmt:formatNumber value="${item.height}" pattern="#####.##"/></c:when><c:otherwise>-</c:otherwise></c:choose></td>
    	<td><c:choose><c:when test="${item.theater > 0}"><fmt:formatNumber value="${item.theater}" pattern="#######"/></c:when><c:otherwise>-</c:otherwise></c:choose></td>
    	<td><c:choose><c:when test="${item.school > 0}"><fmt:formatNumber value="${item.school}" pattern="#######"/></c:when><c:otherwise>-</c:otherwise></c:choose></td>
    	<td><c:choose><c:when test="${item.cocktail > 0}"><fmt:formatNumber value="${item.cocktail}" pattern="#######"/></c:when><c:otherwise>-</c:otherwise></c:choose></td>
    	<td><c:choose><c:when test="${item.banque > 0}"><fmt:formatNumber value="${item.banque}" pattern="#######"/></c:when><c:otherwise>-</c:otherwise></c:choose></td>
    	<td><c:choose><c:when test="${item.auditorium > 0}"><fmt:formatNumber value="${item.auditorium}" pattern="#######"/></c:when><c:otherwise>-</c:otherwise></c:choose></td>
    	<td><c:choose><c:when test="${item.interprateCabines == 0}"><wa:mls>On demand</wa:mls></c:when><c:when test="${item.interprateCabines == -1}"><wa:mls>No</wa:mls></c:when><c:otherwise><wa:mls>yes</wa:mls></c:otherwise></c:choose></td>
  </tr>
  </c:forEach>
</table>
    <c:if test="${not empty bean.mainInfo}">
	<div id="box_other_information">
	<h4><wa:mls>Other informations</wa:mls></h4>
	    	<p>${bean.mainInfo}</p>
	    
	</div>
	</c:if>
	 
	<!--boxotherinformation:end-->
	<!--tab:start-->
	
	 <div class="clear"></div> 
	 <a name="associatedContent" ></a>
	  <div class="clear"></div> 
	<wa:include URI="${site}/content/associatedContentFirst">
			<wa:param name="contentType" value="${contentGroupType}"/>
			<wa:param name="group" value="${bean.group}"/>
			<wa:param name="contentId" value="${bean.id}"/>
			<wa:param name="userId" value="${userId}"/>
			<wa:param name="tabbedPanelsTab" value="${tabbedPanelsTab}"/>
	</wa:include>

	<div id="listComment">
		<wa:include URI="${site}/content/comment" >
			<wa:param name="group" value="VENUE"/>
			<wa:param name="id" value="${bean.id}"/>
		</wa:include>

	</div>
	
</div>	
	

