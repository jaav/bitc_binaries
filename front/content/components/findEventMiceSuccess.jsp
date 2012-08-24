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
        <form action="<wa:url URI="${site}/${module }/displaySearchMice"/>" method="get" class="search">
             <input class="first_input" type="text" name="f_search_query" value="${waParam.f_search_query}"/>
		     <input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form"/>
		     <div class="arrow"></div>
	 <a onClick="changeDisplay()" class="advanced_search"><wa:mls>Advanced search</wa:mls></a>
	     	<div class="clr"></div>
           	
           	<div style="display:none" id="advanced_search">
       
        ${listMonth}

            <input type ="hidden" name ="contentType" value="${contentType}">
            <input type ="hidden" name ="group" value="MICE">

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
	           	<input name="s_periodFromDate" type="text" id="s_periodFromDate" class="datepicker" value="${waParam.s_periodFromDate}" />
           	</div>
           	
           	<div class="align_right">
	            <label for="f_page"><wa:mls>Au: </wa:mls></label>
	            <script>
	           	$(function() {
						  		$("#s_periodToDate").datepicker({
								showOn: 'button',
								buttonImage: '${static}/front/img/ml/calendar.gif',
								buttonImageOnly: true,		
								minDate: '+1D', 
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
	           	<input name="s_periodToDate" type="text" id="s_periodToDate" class="datepicker" value="${waParam.s_periodToDate}" />
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
		$("#advanced_search").slideUp(200)
		$(".btn_form2").hide(200, function(){$(".btn_form").show(200)})
    }else{
		$("#advanced_search").slideDown(200)
		$(".btn_form").hide(200, function(){$(".btn_form2").show(200)})
    }
	$("a.advanced_search").toggleClass("advanced_search_active");
}
<c:if test="${not empty waParam.s_periodFromDate or not empty waParam.s_periodToDate}">
changeDisplay()
</c:if>
</script> 