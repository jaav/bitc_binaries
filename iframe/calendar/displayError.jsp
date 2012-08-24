<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false"
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>

<wa:slot id='slotHead'>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/screen.css" media="screen, projection"/>
</wa:slot>

<wa:slot id='slotBody'>
	<div id="errorMsg"><wa:mls>Page not valid !</wa:mls></div>
</wa:slot>
