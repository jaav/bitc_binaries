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

<script type="text/javascript" src="${static}/front/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker-${culture.language}.js"></script>
<div class="form_search" >
      <div class="bg_picto_${picto}">
<h3 class="no_margin"><wa:mls>Recherchez</wa:mls></h3>
<div class="arrow"></div>
        <form action="<wa:url URI="${site}/${module}/displayVenue/cmid/676"/>" method="get" class="search" name="search">
         
	        	<input type="text" name="f_title" value="${waParam.f_title}" title="<wa:mls>Nom</wa:mls>" />
		        
		
			<div class="clr"></div>
			<div class="clr"></div>
           	<div style="display:block" id="advanced_search">

            <div class="align_left">
            	<label for="f_config"><wa:mls>Config: </wa:mls></label>
            	    <select name="f_config" id="f_config" >
	                <option value=""><wa:mls>Choisissez</wa:mls></option>
	                <option value="theater" <c:if test="${waParam.f_config == 'theater'}">SELECTED</c:if>><wa:mls>Theater</wa:mls></option>
	                <option value="school" <c:if test="${waParam.f_config == 'school'}">SELECTED</c:if>><wa:mls>School</wa:mls></option>
	                <option value="cocktail" <c:if test="${waParam.f_config == 'cocktail'}">SELECTED</c:if>><wa:mls>Cocktail</wa:mls></option>
	                <option value="auditorium" <c:if test="${waParam.f_config == 'auditorium'}">SELECTED</c:if>><wa:mls>Auditorium</wa:mls></option>
	                <option value="banque" <c:if test="${waParam.f_config == 'banque'}">SELECTED</c:if>><wa:mls>Banque</wa:mls></option>
	              </select>
            </div>
            <div id ="nbr_persons">
	            <div class="align_right">
	            	<label for="f_persons"><wa:mls>Nb de personne: </wa:mls></label>	        
		        	<select name="f_persons" id="f_persons" >
	                <option value=""><wa:mls>Choisissez</wa:mls></option>
	                <option value="6" <c:if test="${waParam.f_persons == '6'}">SELECTED</c:if>><wa:mls>>1000</wa:mls></option>
	                <option value="5" <c:if test="${waParam.f_persons == '5'}">SELECTED</c:if>><wa:mls>Entre 501 et 1000</wa:mls></option>
	                <option value="4" <c:if test="${waParam.f_persons == '4'}">SELECTED</c:if>><wa:mls>Entre 251 et 500 </wa:mls></option>
	                <option value="3" <c:if test="${waParam.f_persons == '3'}">SELECTED</c:if>><wa:mls>Entre 101 et 250</wa:mls></option>
	                <option value="2" <c:if test="${waParam.f_persons == '2'}">SELECTED</c:if>><wa:mls>Entre 51 et 100</wa:mls></option>
	                <option value="1" <c:if test="${waParam.f_persons == '1'}">SELECTED</c:if>><wa:mls><50</wa:mls></option>
	              </select>
	            </div>
            </div>
            <div class="clr"></div>
            <div class="align_left" id="ListQuartiers" >
				<label for="s_ContentPropertyValueManager_valueId_Quartier"><wa:mls>Quartiers : </wa:mls></label>
				<wa:include URI="${site}/dropdown/dropList" >
					<wa:param name="class"
						value="com.wanabe.cms.hdata.ContentPropertyValue" />
					<wa:param name="manager"
						value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
					<wa:param name="method" value="listQuartiers" />
					<wa:param name="identity" value="valueId" />
					<wa:param name="display" value="mainTitle" />
					<wa:param name="name"
						value="s_ContentPropertyValueManager_valueId_Quartier" />
					<wa:param name="selectedValues"
						value="${waParam.s_ContentPropertyValueManager_valueId_Quartier}" />
				</wa:include>
			</div>
        
            <div id ="nbr_salles">
	            <div class="align_right">
	            	<label for="f_nbrSalles"><wa:mls>Nbr salles: </wa:mls></label>	
	            	   
		        	<input type="text" id="f_nbrSalles" name="f_nbrSalles" value="${waParam.f_nbrSalles}" />
	            </div>
            </div>
            <div class="clr"></div>
            <div id ="typeVenue">
	            <div class="align_left">
	            	<label for="f_typeVenue"><wa:mls>Type venue: </wa:mls></label>	        
	            	<select id="f_typeVenue" name="f_typeVenue" onchange="changeDisplayselect()">
	            		<option value=""><wa:mls>Choisissez</wa:mls></option>
	            		<c:forEach var="venueType" items="${listVenueType}">
	            			<option value="${venueType}" <c:if test="${venueType eq waParam.f_typeVenue}">selected="selected"</c:if>>${venueType}</option>
	            		</c:forEach>
	            	</select>    
	            </div>
            </div>
            <div id ="nbr_rooms">
	            <div class="align_right">
	            	<label for="f_nbrBedrooms"><wa:mls>Nbr bedrooms: </wa:mls></label>	        
		        	<input type="text" id="f_nbrBedrooms" name="f_nbrBedrooms" value="${waParam.f_nbrBedrooms}" />
	            </div>
            </div>
            
             <div class="clr"></div>
            <div id ="categoryVenue" <c:if test="${waParam.f_typeVenue ne 'VENUE'}">style="display:none;"</c:if>>
	            <div class="align_left">
	            	<label for="f_categoryVenue"><wa:mls>Sous-type: </wa:mls></label>	        
	            	 
	            	<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue" />
						<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
						<wa:param name="method" value="listVenueCategories" />
						<wa:param name="identity" value="valueId" />
						<wa:param name="display" value="mainTitle" />
						<wa:param name="name" value="f_categoryVenue" />
						<wa:param name="selectedValues" value="${waParam.f_categoryVenue}" />
					</wa:include>   
	            </div>
            </div>
			<input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form2" style="display:block" />
            <div class="clr"></div>
            </div>
        </form>
      </div>
    </div>
<script language='javascript'>
function changeDisplayselect()
{
	if($("#f_typeVenue").val() != 'VENUE'){
    	$("#categoryVenue").css("display", "none");   	
    }
	else{
		$("#categoryVenue").css("display", "block");
      }
	document.search.f_categoryVenue[0].selected = true; 
}
<%-- 
<c:if test="${waParam.s_ContentPropertyValueManager_valueId_Quartier ne null or waParam.f_config ne null}">
$(document).ready(function() {
	changeDisplay();
})
</c:if>
	
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
--%>

</script> 