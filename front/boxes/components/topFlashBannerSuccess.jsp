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

<link href="${static}/${site}/css/datepicker.css" rel="stylesheet" type="text/css" media="screen" />
<!-- javascripts -->
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.datepicker.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.theme.css" media="screen, projection"/>

<script type="text/javascript" src="${static}/front/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker-${culture.language}.js"></script>

<c:choose>
	<c:when test="${culture.language eq 'en'}">
	<fmt:setLocale value="en_US" />	
	</c:when>
	<c:otherwise>
	<fmt:setLocale value="${culture.language}" />
	</c:otherwise>
</c:choose>

 
 <div>
    	<div class="book_stay">
    	 <img src="${staticSite}/img/en/title_book_stay.gif" alt="Book your stay" />
    	 
	           
			<form action ="${context}/${site}/content/forwardSearch.do" method="get" id="book_stay_form_${waCompParam.zone}" target="_blank">
            <fieldset>   
                 
            <span id="tfv_room_type_${waCompParam.zone}">
	              <label for="f_page"><wa:mls>Type de chambre :</wa:mls></label>            
	              
	              <select name="f_room_type" id="f_room_type_${waCompParam.zone}" class="select_room_type">
	                <option value=""><wa:mls>Choisissez</wa:mls></option>
	                <option value="hotel" selected><wa:mls>Hotel</wa:mls></option>
	                <option value="bnb" ><wa:mls>Bed & Breakfast</wa:mls></option>
	              </select>
	              <img src="${staticSite}/img/ml/ok.png" class="validMsg" alt="ok icon" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" alt="error icon" />
 
	              <!--  <div class="selectRequiredMsg">Veuillez faire un choix</div> -->
              </span>

              <div class="clr"></div>
			  <script type="text/javascript">
			       	$(function() {
				  		$("#begin_datepicker").datepicker({
						showOn: 'button',
						buttonImage: '${static}/front/img/ml/calendar.gif',
						buttonImageOnly: true,		
						minDate: '+0D', 
						maxDate: '+2Y',
						defaultDate: 0,
						onSelect: function(dateText) { 
							$('#f_day_begin_${waCompParam.zone}').val(dateText.substring(0, 2)); 
							$('#f_month_begin_${waCompParam.zone}').val(dateText.substring(3, 10));
						}
						})
				  	  });
			  </script>
              <label for="f_page"><wa:mls>Date d'arrivée :</wa:mls></label><br />
              <div class="clr"></div>
              <select name="f_day_begin" id="f_day_begin_${waCompParam.zone}" class="select_days">
                <option value=""><wa:mls>Jours</wa:mls></option>
                <c:forEach var="day" begin="1" end="31">
			  		<option value="${wa:padL(day,2,'0')}" <c:if test="${wa:padL(day,2,'0') eq firstDay}">selected="selected"</c:if>>${wa:padL(day,2,'0')}</option>
			  	</c:forEach>
              </select>
              
              <span id="tfv_date_begin_${waCompParam.zone}">
	              <select name="f_month_begin" id="f_month_begin_${waCompParam.zone}" class="select_month">
	                <option value=""><wa:mls>Mois</wa:mls></option>
	                <c:forEach var="item" items="${dates}" varStatus="loop">
	                
	                	<fmt:formatDate var="monthYear" pattern="MM/yyyy" value="${item}"/>
	                	
	              		<option value="${monthYear}" <c:if test="${monthYear eq firstMonthYear}">selected="selected"</c:if>><fmt:formatDate pattern="MMM" value="${item}"/>&nbsp;<fmt:formatDate pattern="yyyy" value="${item}"/></option>
	              	</c:forEach>
	              </select>
	              <input type="hidden" disabled="disabled" id="begin_datepicker" size="10" />
	              <img src="${staticSite}/img/ml/ok.png" class="validMsg" style="border: 0;" alt="ok icon" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" style="border: 0;" alt="error icon" />
				  <!-- <div class="selectRequiredMsg">Veuillez faire un choix</div>-->
              </span>

              <div class="clr"></div> 
              
              <script type="text/javascript">
			       	$(function() {
				  		$("#end_datepicker").datepicker({
						showOn: 'button',
						buttonImage: '${static}/front/img/ml/calendar.gif',
						buttonImageOnly: true,		
						minDate: '+1D', 
						maxDate: '+2Y',
						defaultDate: +1,
						onSelect: function(dateText) { 
							$('#f_day_end_${waCompParam.zone}').val(dateText.substring(0, 2)); 
							$('#f_month_end_${waCompParam.zone}').val(dateText.substring(3, 10));
						}
						})
				  	  });
			  </script>
              <label for="f_page"><wa:mls>Date de départ :</wa:mls></label><br />
              <div class="clr"></div>
              <select name="f_day_end" id="f_day_end_${waCompParam.zone}" class="select_days">
                <option value=""><wa:mls>Jours</wa:mls></option>
                <c:forEach var="day" begin="1" end="31">
			  		<option value="${wa:padL(day,2,'0')}" <c:if test="${wa:padL(day,2,'0') eq secondDay}">selected="selected"</c:if>>${wa:padL(day,2,'0')} </option>
			  	</c:forEach>
              </select>
              <span id="tfv_date_end_${waCompParam.zone}">
	              <select name="f_month_end" id="f_month_end_${waCompParam.zone}" class="select_month">
	                <option value=""><wa:mls>Mois</wa:mls></option>
	                <c:forEach var="item" items="${dates}" varStatus="loop">
	                	<fmt:formatDate var="monthYear" pattern="MM/yyyy" value="${item}"/>
	                
	              		<option value="${monthYear}" <c:if test="${monthYear eq secondMonthYear}">selected="selected"</c:if> ><fmt:formatDate pattern="MMM" value="${item}"/>&nbsp;<fmt:formatDate pattern="yyyy" value="${item}"/></option>
	              	</c:forEach>
	              </select>
	              <input type="hidden" disabled="disabled" id="end_datepicker" size="10" />
	              <img src="${staticSite}/img/ml/ok.png" class="validMsg" style="margin:4px 0 0 5px; border: 0;" alt="ok icon" /> <img src="${staticSite}/img/ml/erreur.png" class="errorMsg" style="margin:4px 0 0 5px; border: 0;" alt="error icon" />
				  <!--<div class="selectRequiredMsg">Veuillez faire un choix</div>-->
              </span>
              <div class="clr"></div>
              <input type="button" value="<wa:mls>Recherche</wa:mls>" class="btn_search" id="book_stay_form_submit_${waCompParam.zone}" />
              <div class="clr"></div>
            </fieldset>
          </form>
     
        </div>
        <!-- component book_stay:end -->
        <div class="clr"></div>
        <div class="trip_planner">
        <c:choose>
    		<c:when test="${waParam.section == 'meetings' || waParam.section == 'trade' || module == 'meeting' || nodeFirstLevel.contentMenuId == 977  || nodeFirstLevel.contentMenuId == 978   || (refererMeeting eq '1' && waParam.section ne 'visiteur')}">
    			<a href="<wa:url URI="${site}/meetingPlanner/display" />" title="<wa:mls>Meeting Planner</wa:mls>"><img src="${staticSite}/img/en/banner_meeting_planner.png" alt="<wa:mls>Meeting Planner</wa:mls>"/></a>
    		</c:when>
    		<c:otherwise>
				<a href="<wa:url URI="${site}/tripPlanner/display" />" title="<wa:mls>Trip Planner</wa:mls>"><img src="${staticSite}/img/${culture.language}/banner_trip_planner.png" alt="<wa:mls>Trip Planner</wa:mls>"/></a>    		
    		</c:otherwise>
    	</c:choose> </div><div class="clr"></div>
    </div>
    
<script type="text/javascript">
function decomposeDate(LeParam1){ 
	// Sépare les jours, les mois et les années dans une date de type "22/05/1981"
	// Renvoye le tout dans un tableau de taille 3
	LeRetour = new Array(3);
	LeJour="";
	LeMois="";
	LeAnnee="";
	// Extraction du jour
	i=0;
	while((LeParam1.charAt(i)!="/")&&(i<10)){
		LeJour+=LeParam1.charAt(i);
	i++;
	}
	if(LeJour.charAt(0)=="0"){
		LeJour=LeJour.charAt(1);
	}
	LeParam1=LeParam1.substring(i+1,LeParam1.length);
	// Extraction du mois
	i=0;
	while((LeParam1.charAt(i)!="/")&&(i<10)){
		LeMois+=LeParam1.charAt(i);
		i++;
	}
	if(LeMois.charAt(0)=="0"){
		LeMois=LeMois.charAt(1);
	}
	LeParam1=LeParam1.substring(i+1,LeParam1.length);
	// Extraction de l'année
	LeAnnee=LeParam1;
	LeRetour[0]=LeJour;
	LeRetour[1]=LeMois;
	LeRetour[2]=LeAnnee;
	return LeRetour;
}
function dateAnglaise(LeParam1,LeParam2){
	LaDate = new Array(3);
	LaDate = decomposeDate(LeParam1);
	LeRetour = LaDate[2]+LeParam2+LaDate[1]+LeParam2+LaDate[0];
	return LeRetour;
}

function compareDates_right(LeParam1,LeParam2){
	// Compare 2 dates au format jj/mm/aaaa
	var LeParam1 = dateAnglaise(LeParam1,"/");
	var LeParam2 = dateAnglaise(LeParam2,"/");
	LeParam1 = Date.parse(LeParam1);
	LeParam2 = Date.parse(LeParam2);
	if (LeParam1 == LeParam2) { 
		$("#tfv_date_end_right .errorMsg").show()
		$("#tfv_date_end_right .validMsg").hide()
		return false;
	}
	if (LeParam1 > LeParam2){
		$("#tfv_date_end_right .errorMsg").show()
		$("#tfv_date_end_right .validMsg").hide()
		return false;
	}else{
		$("#tfv_date_end_right .errorMsg").hide()
		$("#tfv_date_end_right .validMsg").show()
		return true;
	}
}

function checkDate_right(){
	var day_begin = $('#f_day_begin_right').val();
	var month_begin = $('#f_month_begin_right').val();
	var day_end = $('#f_day_end_right').val();
	var month_end = $('#f_month_end_right').val();
	var begindate = day_begin+"/"+month_begin;
	var enddate = day_end+"/"+month_end;
	//alert('begin : '+begindate +' | '+ 'end : '+enddate)
    if(day_begin != '' && month_begin != '' && day_end != '' && month_end != ''){
		//alert('fill')
		if(!compareDates_right(begindate,enddate)){
			return true;		
		}
    } else {
    	//alert('not fill')
		return false;
    }	
}
$('#book_stay_form_submit_${waCompParam.zone}').click(function() {
	var errorFlag = false;
	if(checkDate_${waCompParam.zone}()){
		errorFlag=true			
	}
	if(!spryRoomType_${waCompParam.zone}.validate()){
		errorFlag=true
	}
	//alert('error : '+errorFlag)
	if(!errorFlag){
		$('#book_stay_form_${waCompParam.zone}').submit();
	}
});

//var spryDateBegin_${waCompParam.zone} = new Spry.Widget.ValidationSelect("tfv_date_begin_${waCompParam.zone}", {validateOn:["blur, change"]});
//var spryDateEnd_${waCompParam.zone} = new Spry.Widget.ValidationSelect("tfv_date_end_${waCompParam.zone}", {validateOn:["blur, change"]});
var spryRoomType_${waCompParam.zone} = new Spry.Widget.ValidationSelect("tfv_room_type_${waCompParam.zone}", {validateOn:["change"]});
function affichage_popup(nom_de_la_page, nom_interne_de_la_fenetre)
{

window.open (nom_de_la_page, nom_interne_de_la_fenetre, config='height=750, width=950, toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, directories=no, status=no');
}
</script>
