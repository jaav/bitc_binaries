<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${staticSite}/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="${staticSite}/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${staticSite}/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${staticSite}/js/jquery.ui.datepicker-${culture.language}.js"></script>
<script type="text/javascript">
/*
Array Disabled/enabled Date
diableDayOfWeek:[day];/!\ 0 is Sunday.
		
disabledDate/enableDate:[dateDay,Month,Year] 		
If Year == 0 all day/month will be disabled every Year
*/
	var enableDate=[[20,6,0]];
	var diableDayOfWeek=[];	
	var disabledDate=[];
	/*DATEPICKER*/	
	$(function() {			   
		$("#datePickerBegin").datepicker({
			showOn: 'button',
			buttonImage: '${staticSite}/img/ml/calendar.gif',
			buttonImageOnly: true,		
			minDate: '+0D',
			maxDate: '+1Y',
			defaultDate: 0,
			onSelect: function(dateText, inst) { 			 	
				var day=dateText.substr(0,2);
				var month=dateText.substr(3,2);
				var year=dateText.substr(6,4);
				var monthYear=year+"-"+month;
				//alert(day +" "+monthYear)
				$("#f_day_begin option").each(function(){
							$(this).removeAttr("selected");						   
							if(parseInt($(this).val())==parseInt(day)){
								$(this).attr("selected","selected");	
							}
				})
				
				$("#f_month_begin option").each(function(){
							$(this).removeAttr("selected");						   
							if($(this).val()==monthYear){
								$(this).attr("selected","selected");	
							}
				})
				//sprytextfield1.validate()
				
			}
		})
		$("#datePickerEnd").datepicker({
			showOn: 'button',
			buttonImage: '${staticSite}/img/ml/calendar.gif',
			buttonImageOnly: true,		
			minDate: '+1D',
			maxDate: '+1Y',
			defaultDate: +1,
			onSelect: function(dateText, inst) { 			 	
				var day=dateText.substr(0,2);
				var month=dateText.substr(3,2);
				var year=dateText.substr(6,4);
				var monthYear=year+"-"+month;
				//alert(day +" "+monthYear)
				$("#f_day_end option").each(function(){
							$(this).removeAttr("selected");						   
							if(parseInt($(this).val())==parseInt(day)){
								$(this).attr("selected","selected");	
							}
				})
				
				$("#f_month_end option").each(function(){
							$(this).removeAttr("selected");						   
							if($(this).val()==monthYear){
								$(this).attr("selected","selected");	
							}
				})
				//sprytextfield2.validate()
				
			}
		})
		$("#datepicker").datepicker({
			showOn: 'button',
			buttonImage: '${staticSite}/img/ml/calendar.gif',
			buttonImageOnly: true,
			beforeShowDay: isCheckable,
			 onSelect: function(dateText, inst) { 
			 }		  
		});
	});
	
/*Date Picker Available Days*/
function isCheckable(day){
		/*
			Force Enable Day
		*/
		for(var k=0;k<enableDate.length;k++){
			if(enableDate[k][2]==0 && day.getDate() ==enableDate[k][0] && day.getMonth() ==(enableDate[k][1]-1) ){
				return [1,""];	
			}else	if(day.getDate() ==enableDate[k][0] && day.getMonth() ==(enableDate[k][1]-1)  &&  day.getFullYear() == enableDate[k][2]){
				
				 return [1,""];	
			}	
		}
		/*
			Disable date & day
		*/
		
		/*Day of week*/
		for(var j=0;j<diableDayOfWeek.length;j++){
				if(day.getDay()==diableDayOfWeek[j]){
					return [0,""];	
				}
		}
		for(var i=0;i<disabledDate.length;i++){
			/*Bloc from weeks day*/
			 if(disabledDate[i][2]==0 && day.getDate() ==disabledDate[i][0] && day.getMonth() ==(disabledDate[i][1]-1) ){
				return [0,""];	
			}else	if(day.getDate() ==disabledDate[i][0] && day.getMonth() ==(disabledDate[i][1]-1)  &&  day.getFullYear() == disabledDate[i][2]){
				
				 return [0,""];	
			}	
		}
		return [1,""];			
	}
</script>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/jquery.ui.datepicker.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/jquery.ui.theme.css" media="screen, projection"/>
<c:choose>
	<c:when test="${culture.language eq 'en'}">
	<fmt:setLocale value="en_US" />	
	</c:when>
	<c:otherwise>
	<fmt:setLocale value="${culture.language}" />
	</c:otherwise>
</c:choose>
<div class="box_grey_meeting_planner">

      <form action="<wa:url URI="${site}/${module}/display"/>?panelContentType=${contentType}&panelGroup=${group}" method="get" name="search">
      	<input type="hidden" name="panelContentType" value ="${contentType}" />
      	<input type="hidden" name="panelGroup" value ="${group}" />
      	<div class="align_left">
		           	<span id="tfv_room_type">
			            <label for="title"><wa:mls>Recherche </wa:mls></label>
			    	</span>
			    	<input type="text" name="title" value="${waParam.title}"/>
		    	</div>
      	 <c:if test="${contentType eq 'ContentVenue'}">
			     	<div class="clr"></div>
			     	<div class="align_left">
			     		<span>
		            		<label for="f_config"><wa:mls>Config: </wa:mls></label>
		            	    <select name="f_config" id="f_config" >
			                <option value=""><wa:mls>Choisissez</wa:mls></option>
			                <option value="theater" <c:if test="${waParam.f_config == 'theater'}">SELECTED</c:if>><wa:mls>Theater</wa:mls></option>
			                <option value="school" <c:if test="${waParam.f_config == 'school'}">SELECTED</c:if>><wa:mls>School</wa:mls></option>
			                <option value="cocktail" <c:if test="${waParam.f_config == 'cocktail'}">SELECTED</c:if>><wa:mls>Cocktail</wa:mls></option>
			                <option value="auditorium" <c:if test="${waParam.f_config == 'auditorium'}">SELECTED</c:if>><wa:mls>Auditorium</wa:mls></option>
			                <option value="banque" <c:if test="${waParam.f_config == 'banque'}">SELECTED</c:if>><wa:mls>Banque</wa:mls></option>
			             	</select>
			            </span>
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
            		 <div id ="typeVenue">
			            <div class="align_right">
			            	<label for="f_typeVenue"><wa:mls>Type venue: </wa:mls></label>	        
			            	<select id="f_typeVenue" name="f_typeVenue" onchange="changeDisplayselect()">
			            		<option value=""><wa:mls>Choisissez</wa:mls></option>
			            		<c:forEach var="venueType" items="${listVenueType}">
			            			<option value="${venueType}"  <c:if test="${venueType eq waParam.f_typeVenue}">selected="selected"</c:if>>${venueType}</option>
			            		</c:forEach>
			            	</select>    
			            </div>
		            </div>
		            <div id ="categoryVenue" <c:if test="${waParam.f_typeVenue ne 'VENUE'}">style="display:none;"</c:if>>
	            	<div class="align_right">
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
		            <div class="clr"></div>
            		<div id ="nbr_salles">
			            <div class="align_left">
			            	<label for="f_nbrSalles"><wa:mls>Nbr salles: </wa:mls></label>	
			            	   
				        	<input type="text" id="f_nbrSalles" name="f_nbrSalles" value="${waParam.f_nbrSalles}" />
			            </div>
		            </div>
		           
		            <div id ="nbr_rooms">
			            <div class="align_right">
			            	<label for="f_nbrBedrooms"><wa:mls>Nbr bedrooms: </wa:mls></label>	        
				        	<input type="text" id="f_nbrBedrooms" name="f_nbrBedrooms" value="${waParam.f_nbrBedrooms}" />
			            </div>
		            </div>
	    </c:if>
	    <div class="clr"></div>
	    <c:if test="${group ne 'HOTEL' && group ne 'RESTO'}">
	    <div id="ListQuartiers">
				<label for="s_ContentPropertyValueManager_valueId_Quartier"><wa:mls>Quartiers : </wa:mls></label>
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
		<div class="clr"></div>
		</c:if>
	    <c:if test="${group eq 'HOTEL'}">
	    <div class="clr"></div>
		    <span id="tfv_room_type">
		    	<label for="f_page"><wa:mls>Nombre de chambres: </wa:mls></label>
		    </span>
		    <input type="text" name="room" value="${waParam.room}"/>
		    <div class="clr"></div>
	    </c:if>
	    <div class="clr"></div>
	    <c:if test="${contentType eq 'ContentRestaurant'}">
		    <span id="tfv_room_type">
		            <label for="f_page"><wa:mls>Capacity: </wa:mls></label>
		    </span>
		    <input type="text" name="capacity" value="${waParam.capacity}"/>
	    </c:if>
	    
	 
	     
         <div class="clr"></div>
           	
           	<div  id="advanced_search">
	           	
		    	
		    	<c:if test="${group eq 'HOTEL'}">
		    		<div class="align_right">
					    <span id="tfv_room_type">
					            <label for="f_page"><wa:mls>Nombre de ranking: </wa:mls></label>
					    </span>
					    <input type="text" name="ranking" value="${waParam.ranking}"/>
				    </div>
			    </c:if>
			    
		    	<c:if test="${contentType eq 'ContentRestaurant'}">
				    <div class="clr"></div>
				    <span id="tfv_room_type"></span>
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
			    
			    
	     		
           	</div>
           	<div class="clr"></div>
        	<input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form" />
        	<div class="clr"></div>
        	
      </form>
     
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
</script>