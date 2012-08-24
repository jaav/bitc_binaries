<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>

<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	$(document).ready(function(){
		$(".cutEmail")	.each(function(){
									
				
				if($(this).text().length>26){
					var allEMail=$(this).text();
					var beginEmail=allEMail.substr(0,26)+"..."
					$(this).text(beginEmail);
					var newElement="<span style='position:absolute; left:10px; background-color: #fff; display:none'>"+allEMail+"</span>";
					$(this).prepend(newElement);
					
					
					$(this).mouseover(function(){
								showAllEmail($(this).children("span"));   
					})
					$(this).children("span").mouseleave(function(){
								hideAllEmail($(this));   
					})
					
				}
		})					   
	})
	function showAllEmail(element){
		element.fadeIn();		
	}
	function hideAllEmail(element){
		
		element.fadeOut();		
	}
</script>


<style type="text/css" media="screen">
@import url("${static}/front/css/nyroModal.css");
</style>
<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.1.pack.js"></script>
<script src="${static}/ajax/js/tripPlannerMethods.js" type="text/javascript"></script>
<script type="text/javascript">
//TRIP PLANNER METHOD 
//* addToTripPlanner(group, contentId) => call tripPlannerLightBox(data) => data.contentName & data.status ( return contentName & status )



function tripPlannerLightBox(data) {
	  $.nyroModalManual({
		 zIndex: 1001,					
	     minWidth:700,
	     minHeight:600,
	     forceType: 'iframe',
	     closeSelector: '.nyroModalClose', 
	     url: '${context}/front/other/displayTripPlannerLightBox.do?contentName='+data.contentName+'&status='+data.status,
	     closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.png" alt="close" /></a>'
	  	});
  	
}

function addToBasketLightBox(data) {
	  $.nyroModalManual({
		 zIndex: 1001,					
	     minWidth:690,
	     minHeight:510,
	     forceType: 'iframe',
	     closeSelector: '.nyroModalClose', 
	     url: '${context}/front/other/displayAddToBasketLightBox.do?lg=${culture.language}&productId='+data.productId+'&status='+data.status,
	     closeButton: '<a href="#" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.png" alt="close" /></a>'
	  	});
	
}
function addToBasket(catalogProductId){
	$.ajax({
		url:'/bitc/front/ajax/addToBasket.do?catalogProductId='+catalogProductId,
		type:'GET',
		dataType: "json",
		success : function(data){
			addToBasketLightBox(data)
		}
	})
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
<!--btnback:start-->
<div id="btn_back_to_result"><a href="javascript:history.back();"><wa:mls>Back to results</wa:mls></a></div>
<!--btnback:end-->
<div class="clear"></div>
<div id="content_main">
		<c:if test="${not empty adminUser}">
			 <a href="javascript:addToNltContent('${bean.group}','${bean.id}');"><wa:mls>Ajouter à la table nlt content</wa:mls></a>
			 <a href="${context}/admin/${contentTypeAdmin}/list.do?s_publishContent_id=${bean.id}&s_submit=Search" target="admin"><wa:mls>Edit</wa:mls></a>
	    </c:if>
		<h1 class="line_pink">${bean.mainTitle}</h1> <!-- ${color} -->
		<c:if test="${not empty bean.bigImage}">
			<img src="${bean.bigImage}" alt="${bean.urlLabel}" class="m22"/>
		</c:if>
		
	<div id="box_right_information">	
		<!--featurepraticalinformation:start-->
	    <div id="feature_pratical_information">
	         <div id="pratical_information">
		        <h4><wa:mls>Prix</wa:mls></h4>
		        <c:forEach var="item" items="${listPrices}" varStatus="loop">
		        <p>${item.mainTitle} <br />
	          	<strong>${item.value} &euro;</strong></p>
		        </c:forEach>
		        <hr class="dashed"/>
	        	<a href="javascript:addToBasket(${bean.id});" class="btn_add_basket"><wa:mls>Ajouter</wa:mls><br />
	        	<wa:mls>au panier</wa:mls></a>
		      </div>
	  
	 	</div>
    	<!--featurepraticalinformation:end-->
    </div>
    <div style="width: 415px;">${bean.mainBody}</div>
    <div class="clr"></div>
 
 <c:set var="fb_url" value="${config['URL']}${context}/${site}/${module}/${action}/group/${bean.group}/id/${bean.id}.do"/>   
   <iframe src="http://www.facebook.com/plugins/like.php?href=${fb_url}&amp;layout=standard&amp;show_faces=false&amp;width=450&amp;action=like&amp;font=verdana&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:35px;" allowTransparency="true" class="facebook_like"></iframe>
   <!--boxotherinformation:start-->
    <c:if test="${bean.mainInfo != null}">
	    <div id="box_other_information">
	      <h4><wa:mls>Other informations</wa:mls></h4>
	      ${bean.mainInfo}
			<c:if test="${bean.mainSalesCondition != null}">
			 <p><strong><wa:mls>Conditions de ventes :</wa:mls></strong></p>
			 ${bean.mainSalesCondition}
			</c:if>
	    </div>
	 </c:if>
	<!--boxotherinformation:end-->
	<!--tab:start-->
	
	<div id="listComment">
		<wa:include URI="${site}/content/comment" >
			<wa:param name="group" value="${bean.group}"/>
			<wa:param name="id" value="${bean.id}"/>
		</wa:include>

	</div>
	
</div>	
	

