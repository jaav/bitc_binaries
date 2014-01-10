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
      <div>
        <h3 class="no_margin"><wa:mls>Recherchez</wa:mls></h3>
        <div class="arrow"></div>
        <form action="<wa:url URI="${site}/search/display"/>" method="get" class="search">
        ${listMonth}
		   	<input type="text" name="f_search_query"/>
        	<input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form" />
        	<div class="arrow"></div>
        	<a onClick="changeDisplay()" class="advanced_search"><wa:mls>Advanced search</wa:mls></a>
            
            <div class="clr"></div>

            <input type ="hidden" name ="contentType" value="${contentType}">
            <input type ="hidden" name ="group" value="${group}">
			<input type ="hidden" name ="boxOfficeEvent" value="${true}">
           
           	<div class="clr"></div>
           	
           	<div style="display:none" id="advanced_search">
           	 <div class="align_left">
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
	           	<input name="s_periodFromDate" type="text" id="s_periodFromDate" class="datepicker" value="${waParam.caldate}" />
           	</div>
             
            <div class="align_right">
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
	           	<input name="s_periodToDate" type="text" id="s_periodToDate" class="datepicker" value="${waParam.caldate}" />
           	</div>
           	
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
			
			<div id="ListQuartiers">
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
</script> 