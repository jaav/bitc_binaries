<%@ page
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="form_search">
      <div>
        <h3 class="no_margin"><wa:mls>Recherchez</wa:mls></h3>
        <div class="arrow"></div>
        <form action="<wa:url URI="${site}/search/display"/>" method="get" class="search">

		        <input class="first_input" type="text" name="f_search_query" value=""/>
		        <input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form"/>
		        <div class="arrow"></div>
		        
		    <input type ="hidden" name ="group" value="${group}">
		    <input type="hidden" name="contentType" value="${contentType}" />
		    
            <c:if test="${group ne 'LATEST_NEWS' && group ne 'TESTIMONIAL' && group ne 'DEALS' && group ne 'PRESS_RELEASE'}">
            <a onClick="changeDisplay()" class="advanced_search"><wa:mls>Advanced search</wa:mls></a>
            
           	<div class="clr"></div>
           	<c:if test="${fn:toLowerCase(group) eq 'guided_tour'}">
	           <label for="f_page"><wa:mls>Period From Date: </wa:mls></label>
	           <script>
	           	$(function() {
						  		$("#s_periodFromDate").datepicker({
								showOn: 'button',
								buttonImage: '${static}/front/img/ml/calendar.gif',
								buttonImageOnly: true,		
								maxDate: '+2Y',
								visible: false,
								onSelect: function(dateText, inst) { 			 	
									var day=dateText.substr(0,2);
									var month=dateText.substr(3,2);
									var year=dateText.substr(6,4);
									var monthYear=year+"-"+month;
									allowSearchEitherDateOrLanguage();
								}
								})
						  	  });
				</script>

	           	<input name="s_periodFromDate" type="text" id="s_periodFromDate" class="datepicker" value="${ s_periodFromDate}" onkeyup="allowSearchEitherDateOrLanguage()"/>
	           	<div class="clr"></div>
	             <label for="f_page"><wa:mls>Period To Date: </wa:mls></label>
	           <script>
	           	$(function() {
						  		$("#s_periodToDate").datepicker({
								showOn: 'button',
								buttonImage: '${static}/front/img/ml/calendar.gif',
								buttonImageOnly: true,		
								maxDate: '+2Y',
								visible: true,
								onSelect: function(dateText, inst) { 			 	
									var day=dateText.substr(0,2);
									var month=dateText.substr(3,2);
									var year=dateText.substr(6,4);
									var monthYear=year+"-"+month;
									allowSearchEitherDateOrLanguage();
								}
								})
						  	  });
				</script>
	           	<input name="s_periodToDate" type="text" id="s_periodToDate" class="datepicker" value="${s_periodToDate}" onkeyup="allowSearchEitherDateOrLanguage()"/>
           	</c:if>
           	
           	<div style="display:none" id="advanced_search">
           	<c:if test="${group ne 'PRESS_RELEASE'}">	
           		<c:if test="${fn:toLowerCase(group) ne 'guided_tour'}">
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
				</c:if>
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
			<div id="ListQuartiers" class="align_left">
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
			<c:if test="${fn:toLowerCase(group) eq 'guided_tour'}">
				<div id="ListCategory" class="align_right">
					<label for="s_ContentPropertyValueManager_valueId_Category"><wa:mls>Category</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
						<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
						<wa:param name="method" value="listCategory" />
						<wa:param name="identity" value="valueId" />
						<wa:param name="display" value="mainTitle" />
						<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Category" />
						<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_Category}" />
					</wa:include>
				</div>
				<div class="clr"></div>
				<div id="ListLanguage" class="align_left">
					<label for="s_ContentPropertyValueManager_valueId_Language"><wa:mls>Language</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.bitc.utils.ISOLanguageDropdownBean" />
						<wa:param name="manager" value="com.bitc.utils.Utils" />
						<wa:param name="method" value="getISOLanguages" />
						<wa:param name="identity" value="id" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="s_guided_tour_valueId_language" />
						<wa:param name="onChangeEvent" value="allowSearchEitherDateOrLanguage()" />
						<wa:param name="selectedValues" value="${waParam.s_guided_tour_valueId_language}" />
					</wa:include>
				</div>
			</c:if>
			
			
			<c:if test="${group eq 'SHOPPING'}">
			<div class="clr"></div>
			<div id="ListQuartiers">
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
			</c:if>
			<div class="clr"></div>
			<input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form2" />
			<div class="clr"></div>
			 
        </form>
         </div>
         </div>
         
        <!--  <div id="mapFlash">
	       "${staticSite}/swf/nom.swf"
	      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="map_flash" width="620" height="460" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab">
	       		<param name="movie" value="/bitc/static/front/swf/map_search.swf" />
	       		<param name="quality" value="high" />
	       		<param name="wmode" value="transparent" />
	       		<param name="allowScriptAccess" value="sameDomain" />
	       		<param name="flashvars" value="xmlURL=/bitc/static/front/xml/carte.xml" />
	       		<embed src="/bitc/static/front/swf/map_search.swf" quality="high" bgcolor="#000000"
		           width="620" height="460" name="map_flash" align="left"
		           play="true" loop="false" wmode="transparent" quality="high" allowScriptAccess="sameDomain"
		           type="application/x-shockwave-flash"
		           flashvars="xmlURL=/bitc/static/front/xml/carte.xml"
		           pluginspage="http://www.macromedia.com/go/getflashplayer">
	       		</embed>
	   		</object>
		</div>
		 -->

     
      
    
<script language='javascript'>

function changeDisplay(){
	if($("#advanced_search").css('display')=="block"){
		$("#advanced_search").slideUp(200);
		$(".btn_form2").hide(200, function(){$(".btn_form").show(200)})
    }else{
		$("#advanced_search").slideDown(200)
		$(".btn_form").hide(200, function(){$(".btn_form2").show(200)})
    }
	$("a.advanced_search").toggleClass("advanced_search_active");
}

function allowSearchEitherDateOrLanguage() {
	var fromDate = document.getElementById("s_periodFromDate").value;
	var toDate = document.getElementById("s_periodToDate").value;
	if(fromDate.length >0 || toDate.length > 0) {
		document.getElementsByName("s_guided_tour_valueId_language")[0].value = null;
		document.getElementsByName("s_guided_tour_valueId_language")[0].disabled = true;			
	} else {
		document.getElementsByName("s_guided_tour_valueId_language")[0].disabled = false;
	}
	if(document.getElementsByName("s_guided_tour_valueId_language")[0].value.length > 0) {
		document.getElementById("s_periodFromDate").disabled = true;
		document.getElementById("s_periodToDate").disabled = true;
	} else {
		document.getElementById("s_periodFromDate").disabled = false;
		document.getElementById("s_periodToDate").disabled = false;
	}
	
}
</script>
