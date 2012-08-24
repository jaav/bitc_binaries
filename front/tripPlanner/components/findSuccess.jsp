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
<script type="text/javascript" src="${staticSite}/js/SpryValidationSelect.js"></script>
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
<div class="box_grey">

      <form action="<wa:url URI="${site}/${module}/searchTrip/origin/${group}"/>" method="get">
          
          <div class="float_left" style=" margin-top:-10px;">
			<label for="f_page"><strong><wa:mls>Start :</wa:mls></strong></label>
            <select name="f_day_begin" id="f_day_begin" class="select_days">
              <option value=""><wa:mls>Jours</wa:mls></option>
			  <c:forEach var="day" begin="1" end="31">
			  	<option value="${wa:padL(day,2,'0')}" <c:if test="${day eq day_begin}">selected="selected"</c:if>>${wa:padL(day,2,'0')}</option>
			  </c:forEach>
              
            </select>
            <select name="f_month_begin" id="f_month_begin" class="select_month">
              <option value=""><wa:mls>Mois</wa:mls></option>
              <c:forEach var="item" items="${dates}" varStatus="loop">
              <option <c:if test="${month_begin eq wa:formatDate(item,'yyyy-MM')}">selected="selected"</c:if> value="<fmt:formatDate pattern="yyyy-MM" value="${item}" />" ><fmt:formatDate pattern="MMM" value="${item}"/>&nbsp;<fmt:formatDate pattern="yyyy" value="${item}"/></option>
              </c:forEach>
            </select>
            <input type="hidden" id="datePickerBegin"  name="datePickerBegin"/>
          </div>
          
          <div class="float_left date_end" style="margin-top:-10px">
            <label for="f_page"><strong>End :</strong></label>
            <select name="f_day_end" id="f_day_end" class="select_days">
              <option value=""><wa:mls>Jours</wa:mls></option>
               <c:forEach var="day" begin="1" end="31">
			  	<option value="${wa:padL(day,2,'0')}" <c:if test="${day eq day_end}">selected="selected"</c:if>>${wa:padL(day,2,'0')}</option>
			  </c:forEach>
            </select>

            <select name="f_month_end" id="f_month_end" class="select_month">
             <option value=""><wa:mls>Mois</wa:mls></option>
              <c:forEach var="item" items="${dates}" varStatus="loop">
              <option <c:if test="${month_end eq wa:formatDate(item,'yyyy-MM')}">selected="selected"</c:if> value="<fmt:formatDate pattern="yyyy-MM" value="${item}" />" ><fmt:formatDate pattern="MMM" value="${item}"/>&nbsp;<fmt:formatDate pattern="yyyy" value="${item}"/></option>
              </c:forEach>
            </select>
            <input type="hidden" id="datePickerEnd" name="datePickerEnd"/>
          </div>
        <input type="submit" value="GO" class="btn_go" />
        <div class="clr"></div>
      </form>
       
    </div> 