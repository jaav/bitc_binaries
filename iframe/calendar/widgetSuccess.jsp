<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<wa:slot id='slotHead'>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/screen.css" media="screen, projection"/>
<script type="text/javascript" src="${staticSite}/js/jquery-1.4.2.min.js"></script>

<!-- Ede -->
<link rel="stylesheet" type="text/css" href="${staticSite}/css/jquery-ui-datepicker.css" media="screen, projection"/>

<script type="text/javascript" src="${staticSite}/js/jquery-ui-datepick.js"></script>
<script type="text/javascript" src="${staticSite}/js/jquery.ui.datepicker-${culture.language}.js"></script>
<script type="text/javascript" src="${staticSite}/js/jquery-functions.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#cal").datepicker({
		minDate: '+0D', 
		maxDate: '+2Y',
		dateFormat: 'yy-mm-dd',
		onSelect: function(dateText, inst) { 			 	
				getParamAndSend(dateText)
		}
	})
	
});

function getParamAndSend(dateText)
{
	var idCateg = $("#categoriesSelect").val()
	var uri = '${widget.url}';
	var idCode = '${waParam.code}';
	
	if(uri.indexOf('?') >= 0)
		document.forms[0].action=uri+"&"+"vb_code="+idCode+"&"+"vb_date="+dateText+"&"+"vb_categ="+idCateg;	
	else 
		document.forms[0].action=uri+"?"+"vb_code="+idCode+"&"+"vb_date="+dateText+"&"+"vb_categ="+idCateg;
	window.parent.location.href= document.forms[0].action;
}
</script>
<!-- End Ede -->

</wa:slot>

<wa:slot id='slotBody'>

<div id="widget">
	<h1 class="title"><wa:mls>VisitBrussels</wa:mls></h1>

	<div class="padding_10_px">
		<form name="widgetCalendar">
			<div id="categories">
				<select id="categoriesSelect" name="categ">
					<option value=""><wa:mls>Liste des catégories</wa:mls></option>
					<option value="0"><wa:mls>All</wa:mls></option>
					<c:forEach items="${categories}" var="item">
						<option value="${item.valueid}"><wa:mls>${item.valueName}</wa:mls></option>
					</c:forEach>
				</select>
			</div>
			<div type="text" id="cal"></div>
		</form>
		
		<div id="copyright">&copy; ${currentYear} <a href="http://visitbrussels.be" target="_blank">Visitbrussels.be</a></div>
	</div>
</div>
</wa:slot>

