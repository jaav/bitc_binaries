<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="wadt" uri="DateToolsTags" %>
 <%@ taglib prefix="wast" uri="StringToolsTags" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style type="text/css" media="screen">
@import url("${static}/front/css/nyroModal.css");
</style>

<%-- Short term fix for displaying external (Cubilis) hotels page. Thank you Tho ;-) --%>
<script type="text/javascript">
    window.location="${bean.hotelDetailPage}";
</script>

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
	     url: '${context}/front/other/displayTripPlannerLightBox.do?contentName='+data.contentName+'&status='+data.status+'&panelContentType='+data.panelContentType+'&panelGroup='+data.panelGroup,
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
 <c:set var="fb_url" value="${config['URL']}${context}/${site}/${module}/${action}/group/${bean.group}/id/${bean.id}.do"/>   
   <iframe src="http://www.facebook.com/plugins/like.php?href=${fb_url}&amp;layout=standard&amp;show_faces=false&amp;width=450&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:35px;" allowTransparency="true" class="facebook_like"></iframe>
	
		<c:if test="${not empty adminUser}">
			 <a href="javascript:addToNltContent('${bean.group}','${bean.id}');"><wa:mls>Ajouter à la table nlt content</wa:mls></a>
			 <a href="${context}/admin/${contentTypeAdmin}/list.do?s_publishContent_id=${bean.id}&s_submit=Search" target="admin"><wa:mls>Edit</wa:mls></a>
	    </c:if>
	    <div id="main_information">
		 <div style="margin-top:20px;">
				 <c:forEach var="item" items="${listPicto}" varStatus="loop">
				<a href="${item.defaultDescription}?lang=${culture.language}">  <img src="${item.logo}" title="${item.mainTitle}" width="27"  height="27"  align="left" class="m23"></a>
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
			 
				 
				
				</div></div> 
    <iframe
      
     src ="http://www.motel-one.com/en/" width="620" height="2750">
    </iframe>
	  
	  
    <div class="clr"></div>
  
	<!--tab:start-->
	<c:choose>
		
	<c:when test="${bean.group eq 'CONTENT' }">
	 <div class="TabbedPanelsContentGroup "></div>
	</c:when>
	<c:otherwise>
	<div class="clr"></div>
	 <div id="associatedContent"></div> 
    <div class="TabbedPanelsContentGroup">
		<wa:include URI="${site}/content/associatedContentFirst">
				<wa:param name="contentType" value="${contentGroupType}"/>
				<wa:param name="group" value="${bean.group}"/>
				<wa:param name="contentId" value="${bean.id}"/>
				<wa:param name="userId" value="${userId}"/>
				<wa:param name="tabbedPanelsTab" value="${tabbedPanelsTab}"/>
		</wa:include>
	</div>
	</c:otherwise>
			
	</c:choose>
	
	<!-- Khoa add start-->
	<div class="fb-comments" data-href="${fb_url}" data-num-posts="5" data-width="auto">
	</div>
	<!-- Khoa add end -->
	
	<div id="listComment">
		<wa:include URI="${site}/content/comment" >
			<wa:param name="group" value="${bean.group}"/>
			<wa:param name="id" value="${bean.id}"/>
		</wa:include>

	</div>
	
</div>	
	
 
