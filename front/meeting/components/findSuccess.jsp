<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if
	test="${group eq 'GUIDED_TOUR' && group ne 'CULTURE' && group ne 'GO_OUT' && group ne 'HIGHLIGHT'}">
	<link rel="stylesheet" type="text/css"
		href="${static}/front/css/jquery.ui.datepicker.css"
		media="screen, projection" />
	<link rel="stylesheet" type="text/css"
		href="${static}/front/css/jquery.ui.theme.css"
		media="screen, projection" />
	<script type="text/javascript"
		src="${static}/front/js/jquery.ui.core.js"></script>
	<script type="text/javascript"
		src="${static}/front/js/jquery.ui.widget.js"></script>
	<script type="text/javascript"
		src="${static}/front/js/jquery.ui.datepicker.js"></script>
	<script type="text/javascript"
		src="${static}/front/js/jquery.ui.datepicker-${culture.language}.js"></script>
</c:if>
<div class="form_search">
<div>
<h3 class="no_margin"><wa:mls>Recherchez</wa:mls></h3>
<div class="arrow"></div>
<form action="<wa:url URI="${URI}"/>" method="get" class="search">

    <input class="first_input" type="text" name="f_search_query" value="${waParam.f_search_query}"/>
		        <input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form"/>
		        <div class="arrow"></div>
<c:if test="${group ne 'ATTRACTIONS'}">	
<a onClick="changeDisplay()" class="advanced_search"><wa:mls>Advanced search</wa:mls></a> 

<div class="clr"></div><div class="clr"></div>
 <div style="display:none" id="advanced_search">
<%--<div style="display:block" id="advanced_search"> --%>
<c:if test="${group eq 'RESTO'}">
	<div id="ListQuartiers">
	<label for="s_ContentPropertyValueManager_valueId_Quartier"><wa:mls>Quartiers : </wa:mls></label>
	<wa:include URI="${site}/dropdown/dropList">
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
	</wa:include></div>
	<div class="clr"></div>
</c:if>
<c:if test="${group eq 'GUIDED_TOUR' && group ne 'CULTURE' && group ne 'GO_OUT' && group ne 'HIGHLIGHT'}">
<c:if test="${group ne 'HOTEL' && group ne 'RESTO'}">
	<div id="ListQuartiers">
	<label for="s_ContentPropertyValueManager_valueId_Quartier"><wa:mls>Quartiers : </wa:mls></label>
	<wa:include URI="${site}/dropdown/dropList">
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
	</wa:include></div>
	<div class="clr"></div>

</c:if>
	<div class="align_left">
	<span> <label for="f_page"><wa:mls>Du: </wa:mls></label></span> 
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
				</script> <input name="s_periodFromDate" type="text" id="s_periodFromDate"
		class="datepicker" value="<c:choose><c:when test="${!empty waParam.s_periodFromDate}">${waParam.s_periodFromDate}</c:when><c:otherwise>${firstDate}</c:otherwise></c:choose>"
		class="first_input" /></div>

	<div class="align_right">
	<span> <label for="f_page"><wa:mls>Au: </wa:mls></label></span>
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
	<input name="s_periodToDate" type="text" id="s_periodToDate" class="datepicker" value="<c:choose><c:when test="${!empty waParam.s_periodToDate}">${waParam.s_periodToDate}</c:when><c:otherwise>${secondDate}</c:otherwise></c:choose>" />
	</div>	
</c:if> 



<c:if test="${group eq 'HOTEL'}">
	<div class="align_right">
		<span id="tfv_room_type"><label for="f_page"><wa:mls>Nombre d'étoile: </wa:mls></label></span> 
		<input type="text" name="ranking" value="${waParam.ranking}" />
	</div>
</c:if> 

<c:if test="${group eq 'RESTO'}">
	<div class="clr"></div>

	<span><label for="f_page"><wa:mls>Type de cuisine: </wa:mls></label></span>
	<div id="ListTypeCuisine"><wa:include
		URI="${site}/dropdown/dropList">
		<wa:param name="class"
			value="com.wanabe.cms.hdata.ContentPropertyValue" />
		<wa:param name="manager"
			value="com.bitc.cms.hdata.manager.ContentPropertyValueManager" />
		<wa:param name="method" value="listCuisinesTypes" />
		<wa:param name="identity" value="valueId" />
		<wa:param name="display" value="mainTitle" />
		<wa:param name="name" value="s_ContentPropertyValue_valueId_Cuisine" />
		<wa:param name="selectedValues"
			value="${waParam.s_ContentPropertyValue_valueId_Cuisine}" />
	</wa:include>
	</div>
</c:if> 

<c:if test="${contentType eq 'ContentVenue'}">
	<div class="clr"></div>
	<div class="align_left"><span> <label for="f_page"><wa:mls>Config: </wa:mls></label>
	<select name="f_config" id="f_config">
		<option value=""><wa:mls>Choisissez</wa:mls></option>
		<option value="theater"
			<c:if test="${waParam.f_config == 'theater'}">SELECTED</c:if>><wa:mls>Theater</wa:mls></option>
		<option value="school"
			<c:if test="${waParam.f_config == 'school'}">SELECTED</c:if>><wa:mls>School</wa:mls></option>
		<option value="cocktail"
			<c:if test="${waParam.f_config == 'cocktail'}">SELECTED</c:if>><wa:mls>Cocktail</wa:mls></option>
		<option value="auditorium"
			<c:if test="${waParam.f_config == 'auditorium'}">SELECTED</c:if>><wa:mls>Auditorium</wa:mls></option>
		<option value="banque"
			<c:if test="${waParam.f_config == 'theater'}">SELECTED</c:if>><wa:mls>Banque</wa:mls></option>
	</select> </span></div>
	<div class="align_right"><span> <label for="f_page"><wa:mls>Nb de personne: </wa:mls></label>
	<input type="text" name="f_persons" value="${waParam.f_persons}" /> </span></div>
	<div class="clr"></div>
</c:if>

<c:if test="${group eq 'HOTEL'}">
<div class="align_left">
	<span><label for="f_page"><wa:mls>Nombre de chambres </wa:mls></label></span> 
	<input type="text" name="room" value="${waParam.room}" class="first_input" title="" />
</div>
</c:if> 

<c:if test="${group eq 'RESTO'}">
<div class="align_left">
	<span><label for="f_page"><wa:mls>Capacité  </wa:mls></label></span> 
	<input type="text" name="capacity" value="${waParam.capacity}" class="first_input" title="" />
</div>
</c:if> 
</div>
</c:if>
<div class="clr"></div>
			<input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form2" />
<div class="clr"></div>

</form>
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
<c:if test="${AdvancedSearch eq '1'}">
changeDisplay()
</c:if>
</script> 
</div>
</div>
