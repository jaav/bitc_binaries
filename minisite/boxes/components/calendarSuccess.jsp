<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.datepicker-events.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.theme-events.css" media="screen, projection"/>


<script type="text/javascript">
$(function() {
	$("#cal").datepicker({
		minDate: '+0D', 
		maxDate: '+2Y',
		onSelect: function(dateText, inst) { 			 	
				getDateAndSend(dateText)
		}
	})
});
</script>
<div id="agenda">
	<img src="${static}/front/img/ml/title_agenda.gif" alt="Agenda" />
	<div id="cal"></div>
</div>
<script type="text/javascript">
function getDateAndSend(dateText)
{
	<c:choose>
		<c:when test="${displayAllContents}">
			var uri = '<wa:url URI="${site}/content/displayList/group/CULTURE/name/${waParam.name}/all/1"></wa:url>';
		</c:when>
		<c:otherwise>
			var uri = '<wa:url URI="${site}/content/displayList/group/CULTURE/name/${waParam.name}"></wa:url>';
		</c:otherwise>
	</c:choose>
		
	
	if(uri.indexOf('?') >= 0)
		document.forms[0].action=uri+"&"+"caldate="+dateText;
	else 
		document.forms[0].action=uri+"?"+"caldate="+dateText;
	window.location.href= document.forms[0].action;
}
</script>
