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
<div class="fan_box">
	<div id="bg_box_top"></div>
	<div id="fan_box_content">
	<c:choose>
	<c:when test="${article != null}">		
		<div class="txt_popin">			
			<p><wa:mls>Vous aimez ce contenu :</wa:mls></p>
		  	<h2>${article.mainTitle}</h2>		
		  	<p><wa:mls>Découvrez les contenus similaires que les visiteurs aiment aussi.</wa:mls></p>        
		</div> 
	</c:when>
	<c:otherwise>
		<div class="txt_popin">
			<wa:mls>error</wa:mls>
		</div>
	</c:otherwise>
	</c:choose>
	
	<div class="clr"></div>
	<a href="JavaScript:void(0)" class="btn_close"><img src="${static}/front/img/ml/btn_close_fanBox.jpg" alt="close"/></a>
	<c:choose>
		<c:when test="${not empty waParam.ms}">
			<a href="<wa:url URI="minisite/content/displayDetail/group/${waParam.group}/id/${waParam.contentId}/name/${waParam.ms}"/>?tabbedPanelsTab=UserAlsoLiked&#associatedContent" target="_parent" class="btn_fanBox_goto"><wa:mls>go to user also liked</wa:mls></a>
		</c:when>
		<c:otherwise>
			<a href="<wa:url URI="${site}/content/displayDetail/group/${waParam.group}/id/${waParam.contentId}"/>?tabbedPanelsTab=UserAlsoLiked&#associatedContent" target="_parent" class="btn_fanBox_goto"><wa:mls>go to user also liked</wa:mls></a>
		</c:otherwise>
	</c:choose>
	</div>
	<div id="bg_box_bottom"></div>
</div>
</body>
</html>