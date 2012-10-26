<%@ page
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${staticSite}/js/SpryValidationTextField.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationRadio.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationPassword.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationConfirm.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationTextarea.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationSelect.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationCheckbox.js"></script>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationRadio.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationPassword.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationConfirm.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextarea.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationSelect.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationCheckbox.css" media="screen, projection"/>
<link href="${static}/${site}/css/datepicker.css" rel="stylesheet" type="text/css" media="screen" />
<!-- javascripts -->
<script type="text/javascript" src="${staticSite}/js/datepicker.js"></script>

<div class="form_search">
      <div>
        <h3 class="no_margin"><wa:mls>Recherchez</wa:mls></h3>
        <div class="arrow"></div>
        <form action="<wa:url URI="${site}/${module}/display"/>" method="get" class="search">
    
          	<input type="hidden" name="group" value="${waParam.group}" />
          	<input type="hidden" name="contentType" value="${contentType}" />
          	
	        <input type="text" name="f_search_query" value="${waParam.f_search_query}"/>
            <input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form"/> 
            
            <div class="arrow"></div>
<<<<<<< HEAD
            <c:if test="${group ne 'LATEST_NEWS' && group ne 'TESTIMONIAL' && group ne 'DEALS'}">	
=======
            <c:if test="${group ne 'LATEST_NEWS' && group ne 'TESTIMONIAL' && group ne 'DEALS' && group ne 'PRESS_RELEASE'}">
>>>>>>> b598cef06297b4ca87b088885cb31b2742248ffd
            <a onClick="changeDisplay()" class="<c:if test="${ind == '0'}">advanced_search </c:if> <c:if test="${ind == '1'}">advanced_search_active </c:if>" id="advanced_search_id"><wa:mls>Advanced search</wa:mls></a>
            
           <div class="clr"></div>
           <c:if test="${not empty criteriaDate}">
	           <label for="f_page"><wa:mls>Du: </wa:mls></label>
	           <script>
	           	$(function() {
						  		$("#s_periodFromDate").datepicker({
								showOn: 'button',
								buttonImage: '${static}/front/img/ml/calendar.gif',
								buttonImageOnly: true,		
								minDate: '+0D', 
								maxDate: '+2Y',
								onSelect: function(dateText, inst) { 			 	
									var day=dateText.substr(0,2);
									var month=dateText.substr(3,2);
									var year=dateText.substr(6,4);
									var monthYear=year+"-"+month;
								}
								})
						  	  });
				</script>

	           	<input name="s_periodFromDate" type="text" id="s_periodFromDate" class="datepicker" value="${ s_periodFromDate}" />
	           	<div class="clr"></div>
	             <label for="f_page"><wa:mls>Au: </wa:mls></label>
	           <script>
	           	$(function() {
						  		$("#s_periodToDate").datepicker({
								showOn: 'button',
								buttonImage: '${static}/front/img/ml/calendar.gif',
								buttonImageOnly: true,		
								minDate: '+0D', 
								maxDate: '+2Y',
								onSelect: function(dateText, inst) { 			 	
									var day=dateText.substr(0,2);
									var month=dateText.substr(3,2);
									var year=dateText.substr(6,4);
									var monthYear=year+"-"+month;
								}
								})
						  	  });
				</script>
	           	<input name="s_periodToDate" type="text" id="s_periodToDate" class="datepicker" value="${s_periodToDate}" />
           	</c:if>
          
           	<div class="clr"></div>
           	
           	<div style="<c:if test="${ind == '0'}">display:none</c:if> <c:if test="${ind == '1'}">display:block</c:if>" id="advanced_search">
           	<c:if test="${group ne 'PRESS_RELEASE'}">
	            <div id="ListExperience" class="align_left">
					<label for="s_ContentPropertyValueManager_valueId_Experience"><wa:mls>Experience</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
						<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
						<wa:param name="method" value="listExperience" />
						<wa:param name="identity" value="valueId" />
						<wa:param name="display" value="mainTitle" />
						<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Experience" />
						<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_Experience}" />
					</wa:include>
				</div>
	
				<div id="ListProfiles" class="align_right">
					<label for="s_ContentPropertyValueManager_valueId_Profil"><wa:mls>Profiles</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
						<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
						<wa:param name="method" value="listProfiles" />
						<wa:param name="identity" value="valueId" />
						<wa:param name="display" value="mainTitle" />
						<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Profil" />
						<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_Profil}" />
					</wa:include>
				</div>
				<div class="clr"></div>
			</c:if>
			<c:if test="${group eq 'PRESS_RELEASE'}">
				<div id="ListThemes" class="align_left">
					<label for="s_ContentPropertyValueManager_valueId_Theme"><wa:mls>Choose your theme</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
						<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
						<wa:param name="method" value="listThemes" />
						<wa:param name="identity" value="valueId" />
						<wa:param name="display" value="mainTitle" />
						<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Theme" />
						<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_Theme}" />
					</wa:include>
				</div>
			</c:if>
			<div id="ListQuartiers" >
				<label for="s_ContentPropertyValueManager_valueId_Quartier"><wa:mls>Quartiers</wa:mls></label>
				<wa:include URI="${site}/dropdown/dropList">
					<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
					<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
					<wa:param name="method" value="listQuartiers" />
					<wa:param name="identity" value="valueId" />
					<wa:param name="display" value="mainTitle" />
					<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Quartier" />
					<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_Quartier}" />
				</wa:include>
			</div>

			<c:if test="${group eq 'RESTO_1' or group eq 'RESTO_NIGHT' or group eq 'BREAKFAST'}">
			<div class="clr"></div>
			<div id="ListTypeCuisine">
				<label for="s_ContentPropertyValue_valueId_Cuisine"><wa:mls>Type de cuisine</wa:mls></label>
				<wa:include URI="${site}/dropdown/dropList">
					<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
					<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
					<wa:param name="method" value="listCuisinesTypes" />
					<wa:param name="identity" value="valueId" />
					<wa:param name="display" value="mainTitle" />
					<wa:param name="name" value="s_ContentPropertyValue_valueId_Cuisine" />
					<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValue_valueId_Cuisine}" />
				</wa:include>
			</div>
			</c:if>

			<c:if test="${group eq 'SHOPPING'}">
			<div class="clr"></div>
			<div id="ListShoppingCategory" >
				<label for="s_ContentPropertyValueManager_valueId_ShoppingCategory"><wa:mls>Shopping Category</wa:mls></label>
				<wa:include URI="${site}/dropdown/dropList">
					<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
					<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
					<wa:param name="method" value="listShoppingCategory" />
					<wa:param name="identity" value="valueId" />
					<wa:param name="display" value="mainTitle" />
					<wa:param name="name" value="s_ContentPropertyValueManager_valueId_ShoppingCategory" />
					<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_ShoppingCategory}" />
				</wa:include>
			</div>
			</c:if>
			</div>
			<div class="clr"></div>
			</c:if>
			 <input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form2" />
            <div class="clr"></div>

        </form>
      </div>
    </div>
<script language='javascript'>
function changeDisplay(){
	if($("#advanced_search").css('display')=="block"){
		$("#advanced_search").slideUp(200);
		$(".btn_form2").hide(200, function(){$(".btn_form").show(200)})
		$("a#advanced_search_id").addClass("advanced_search");
    }else{
		$("#advanced_search").slideDown(200)
		$(".btn_form").hide(200, function(){$(".btn_form2").show(200)})
		$("a#advanced_search_id").addClass("advanced_search_active");
    }

}
$(document).ready(function() {
	  //changeDisplay();
	  //alert($("#advanced_search").css('display'));
	  if($("#advanced_search").css('display')=="block"){
		  $(".btn_form").hide(200, function(){$(".btn_form2").show(200)})
			$("a#advanced_search_id").addClass("advanced_search_active");
		}  
	 });

</script> 
<script language='javascript'>
var spryLastname = new Spry.Widget.ValidationTextField("tfv_debut", "none", {validateOn:["blur"]});
var spryFirstname = new Spry.Widget.ValidationTextField("tfv_fin", "none", {validateOn:["blur"]});
</script>