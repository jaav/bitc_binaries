<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.datepicker.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.theme.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField.css" media="screen, projection"/>

<script type="text/javascript" src="${static}/front/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker-${culture.language}.js"></script>
<script type="text/javascript" src="${staticSite}/js/SpryValidationTextField.js"></script>
<div class="form_search" >
      <div>
        <h3 class="no_margin"><wa:mls>Recherchez</wa:mls></h3>
        <div class="arrow"></div>
        <form action="<wa:url URI="${site}/${module}/searchHotel"/>" method="get" class="search">
        

		        <input type="text" name="f_search_query" value="${f_search_query}"/>
		        <input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form"/>
		        <div class="arrow"></div>
		        <a onClick="changeDisplay()" class="advanced_search"><wa:mls>Advanced search</wa:mls></a>
		        


            <!--   End modif        -->

            <input type ="hidden" name ="group" value="${group}">
            
           	<div class="clr"></div>
           	
           	<div style="<c:choose><c:when test="${s_ContentPropertyValueManager_valueId_Experience > 0 or s_ContentPropertyValueManager_valueId_Profil > 0 or  s_ContentPropertyValueManager_valueId_Quartier > 0}">display:block</c:when> <c:otherwise>display:none</c:otherwise></c:choose>" id="advanced_search">
           	
				<div id="ListExperience" class="align_left">
					<label for="s_ContentPropertyValueManager_valueId_Experience"><wa:mls>Experience</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
					<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
					<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
					<wa:param name="method" value="listExperience" />
					<wa:param name="identity" value="valueId" />
					<wa:param name="display" value="mainTitle" />
					<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Experience" />
					<wa:param name="selectedValues" value="${s_ContentPropertyValueManager_valueId_Experience}" />
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
						<wa:param name="selectedValues" value="${s_ContentPropertyValueManager_valueId_Profil}" />
					</wa:include>
				</div>
			
			<div class="clr"></div>
			
			<div id="ListQuartiers">
				<label for="s_ContentPropertyValueManager_valueId_Quartier"><wa:mls>Quartiers</wa:mls></label>
				<wa:include URI="${site}/dropdown/dropList">
					<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
					<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
					<wa:param name="method" value="listQuartiers" />
					<wa:param name="identity" value="valueId" />
					<wa:param name="display" value="mainTitle" />
					<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Quartier" />
					<wa:param name="selectedValues" value="${s_ContentPropertyValueManager_valueId_Quartier}" />
				</wa:include>
			</div>
			
			</div>
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
    }else{
		$("#advanced_search").slideDown(200)
		$(".btn_form").hide(200, function(){$(".btn_form2").show(200)})
    }
	$("a.advanced_search").toggleClass("advanced_search_active");
}
var spryDepartureDate = new Spry.Widget.ValidationTextField("tfv_departure_date", "date", {format:"dd/mm/yyyy", pattern:"00/00/0000", validateOn:["blur", "change"], useCharacterMasking:true, isRequired:true});
var spryArrivalDate = new Spry.Widget.ValidationTextField("tfv_arrival_date", "date", {format:"dd/mm/yyyy", pattern:"00/00/0000", validateOn:["blur", "change"], useCharacterMasking:true, isRequired:true});
</script> 