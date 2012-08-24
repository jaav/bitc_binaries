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
		<p>${product.mainAbstract_}</p>
		<div class="box"> 
		<img src="${product.mainBigImage}" class="float_left"/>
		<div class="txt_popin">
				<p><wa:mls>Vous avez ajouté ce produit dans votre panier :</wa:mls> </p>
			  	<h2>${product.mainTitle}</h2></div> 
	</c:when>
	<c:otherwise>
		<div class="txt_popin">
		<wa:mls>error</wa:mls>
		</div>
	</c:otherwise>
</c:choose>

  <div class="clr"></div></div>
<a href="javascript:parent.$.nyroModalRemove()" class="btn_previous_eshop_big float_left" id="closeBut2"><wa:mls>Continuer</wa:mls><br /><wa:mls>mes achats</wa:mls></a> 
<c:choose>
	<c:when test="${typeBasket == 'BROCHURE'}">
	<a href="${context}/${site}/brochure/displayBasket.do" target="_parent" class="btn_add_basket float_right"><wa:mls>Voir</wa:mls><br /><wa:mls>le panier</wa:mls></a>
	</c:when>
	<c:otherwise>
	<a href="${context}/${site}/eshop/displayBasket.do" target="_parent" class="btn_add_basket float_right"><wa:mls>Voir</wa:mls><br /><wa:mls>le panier</wa:mls></a>
	</c:otherwise>
</c:choose>
</div>
</body>
</html>