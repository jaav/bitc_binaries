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

<wa:slot id='slotHead'>
<link rel="stylesheet" type="text/css" href="${calList.cssFile}" media="screen, projection"/>
<script type="text/javascript" src="${staticSite}/js/jquery-1.4.2.min.js"></script>

<!-- Ede -->
<link rel="stylesheet" type="text/css" href="${staticSite}/css/jquery-ui-datepicker.css" media="screen, projection"/>

<script type="text/javascript" src="${staticSite}/js/jquery-ui-datepick.js"></script>
<script type="text/javascript" src="${staticSite}/js/jquery.ui.datepicker-${culture.language}.js"></script>
<script type="text/javascript" src="${staticSite}/js/jquery-functions.js"></script>
<script type="text/javascript">
var dateFromGet="${waParam.date}";
if(dateFromGet!=""){
	var dateToHighlight = new Date(dateFromGet.substr(0,4), dateFromGet.substr(5,2), dateFromGet.substr(8,2));
	
}
$(document).ready(function(){

	$("#cal").datepicker({
		minDate: '+0D', 
		maxDate: '+2Y',
		dateFormat: 'yy-mm-dd',
		onSelect: function(dateText, inst) { 			 	
				getParamAndSend(dateText);
				return [true, "highlighted",""];		
		},
		beforeShowDay: function (date){
										if(dateFromGet!=""){  
													            if (date.getMonth() == dateToHighlight.getMonth() -1
													            && date.getDate() == dateToHighlight.getDate()
													            && date.getFullYear() == dateToHighlight.getFullYear() ) {
													          
													            	return [true, "highlighted",""];
													            	//return [true, ""];
													            
													            }else{
														            
													         		return [true, ""];//enable all other days
													            }
										}else{
											return [true, ""];//enable all other days
										}
	      }
	})
	$("#list ul li:nth-child(even)").css("background-color", "#eaeef2");
	
	
});

function getParamAndSend(dateText)
{
	var idCateg = $("#categoriesSelect").val()
	var uri = '${widget.url}';
	var idCode = '${waParam.code}';
	
	if(uri.indexOf('?') >= 0)
		document.forms[0].action=uri+"&"+"code="+idCode+"&"+"date="+dateText+"&"+"categ="+idCateg;	
	else 
		document.forms[0].action=uri+"?"+"code="+idCode+"&"+"date="+dateText+"&"+"categ="+idCateg;
	window.location.href= document.forms[0].action;
}
</script>
<!-- End Ede -->


</wa:slot>

<wa:slot id='slotBody'>

<div id="calendar_list">
	<h1 class="title"><a href="visitbrussels.be" target="_blank" title="<wa:mls>VisitBrussels</wa:mls>"><img src="/bitc/static/iframe/img/ml/header.jpg" alt="<wa:mls>VisitBrussels</wa:mls>"/></a></h1>
	
		<div id="form" class="padding_10_px">
			<form name="search" action="${context}/${site}/${module}/${action}.do">
			<input type="hidden" name="code" value="${waParam.code}" />
			<input type="hidden" name="type" value="<c:choose><c:when test="${not empty waParam.type}">${waParam.type}</c:when><c:otherwise>highlight</c:otherwise></c:choose>" />
			<input type="hidden" name="date" value="${waParam.date}" />
				<div id="text">
					<label for="txt"><wa:mls>Recherche :</wa:mls></label>
					<br clear="all" />
					<input type="text" name="txt" value="${txt}" />
				</div>
				<div id="categories">
					<select id="categoriesSelect" name="categ">
						<option value="0" <c:if test="${waParam.categ eq 0}">selected="selected"</c:if>><wa:mls>Liste des catégories</wa:mls></option>
						<c:forEach items="${categories}" var="item">
							<option value="${item.valueid}" <c:if test="${waParam.categ eq item.valueid}">selected="selected"</c:if>><wa:mls>${item.valueName}</wa:mls></option>
						</c:forEach>
					</select>
				</div>
				<div id="cal" class="padding_10_px"></div>
					<div class="clr"></div>
				<a href="${context}/${URI}.do?code=${waParam.code}" id="reset" ><wa:mls>reset</wa:mls></a>
				<input id="f_search_submit" name="f_search_submit" value="<wa:mls>Rechercher</wa:mls>" type="submit" />
			</form>
			<div class="clr"></div>
			
			
			
		</div>
		
		<div class="tab">
			<a href="?code=${waParam.code}&type=highlight<c:if test="${not empty waParam.date}">&date=${waParam.date}</c:if><c:if test="${not empty waParam.clt}">&clt=${clt}</c:if><c:if test="${not empty waParam.txt}">&txt=${txt}</c:if><c:if test="${not empty waParam.categ}">&categ=${waParam.categ}</c:if><c:if test="${not empty waParam.f_search_submit}">&f_search_submit=${f_search_submit}</c:if>" <c:if test="${empty waParam.type or waParam.type eq 'highlight'}">class="active"</c:if>><wa:mls>Highlight</wa:mls></a>
			<a href="?code=${waParam.code}&type=all<c:if test="${not empty waParam.date}">&date=${waParam.date}</c:if><c:if test="${not empty waParam.clt}">&clt=${clt}</c:if><c:if test="${not empty waParam.txt}">&txt=${txt}</c:if><c:if test="${not empty waParam.categ}">&categ=${waParam.categ}</c:if><c:if test="${not empty waParam.f_search_submit}">&f_search_submit=${f_search_submit}</c:if>" <c:if test="${ waParam.type eq 'all'}">class="active"</c:if>><wa:mls>All</wa:mls></a>
		</div>
		<div class="clr"></div>
			
					<wa:include URI="${site}/${module}/list" /> 
			
		
		<div id="copyright" class="padding_10_px">&copy; ${currentYear} <wa:mls>Découvrez toute l'info sur Bruxelles sur </wa:mls><a href="http://visitbrussels.be" target="_blank">www.visitbrussels.be</a></div>
	</div>

</wa:slot>
