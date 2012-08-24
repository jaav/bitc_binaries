<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="KEYWORDS" content="" />
<meta name="DESCRIPTION" content="" />
<link rel="stylesheet" type="text/css" href="${static}/front/css/screen.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/print.css" media="print"/>
<title>Visitbrussels</title>
</head>
<body>
<div class="popin_eshop">
<c:choose>
	<c:when test="${status == 'ok'}">
			<p>${article.mainAbstract_}</p>
			<div class="box"> 
			<img src="${article.mainBigImage}" class="float_left"/>
			<div class="txt_popin">
			
					<p><wa:mls>Vous avez ajouté ce contenu dans votre base :</wa:mls> </p>
				  	<h2>${article.mainTitle}</h2></div> 
		</c:when>
	<c:when test="${status == 'already'}">
		<p>${article.mainAbstract_}</p>
			<div class="box"> 
			<img src="${article.mainBigImage}" class="float_left"/>
			<div class="txt_popin">
			
					<p><wa:mls>Ce contenu  était déjà ajouté dans votre base:</wa:mls> </p>
				  	<h2>${article.mainTitle}</h2></div> 
		
	</c:when>
	<c:when test="${status == 'okDelete'}">
		<p>${article.mainAbstract_}</p>
			<div class="box"> 
			<img src="${article.mainBigImage}" class="float_left"/>
			<div class="txt_popin">
			
					<p><wa:mls>vous venez de supprimer ce contenu de votre base:</wa:mls> </p>
				  	<h2>${article.mainTitle}</h2></div> 
		
	</c:when>
	<c:otherwise>
		<div class="txt_popin">
		<wa:mls>error</wa:mls>
		</div>
	</c:otherwise>
</c:choose>

<div class="clr"></div>
</div>
<a href="<wa:url URI="${site}/tripPlanner/display/panelContentType/${panelContentType}/panelGroup/${panelGroup}"/>" target="_parent" class="nyroModalClose" id="closeBut"><img src="${static}/front/img/ml/close.gif" alt="close" /></a><br />
</body>
</html>
