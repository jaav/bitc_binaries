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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="KEYWORDS" content="" />
<meta name="DESCRIPTION" content="" />
<link rel="stylesheet" type="text/css" href="${static}/front/css/screen.css" media="screen, projection"/>
<link rel="stylesheet" type="text/css" href="${static}/front/css/print.css" media="print"/>
<title><wa:mls>Visitbrussels</wa:mls></title>
</head>
<body id="voucher">
<div id="voucher_container"> <img src="${static}/front/img/ml/top_city.jpg" alt="Brussels Official website for tourism & congress" />
  <div id="voucher_content">
    <h1><wa:mls>Voucher</wa:mls></h1>
    <div id="name_info">
      <h2><wa:mls>Valable pour</wa:mls> ${price.quantity}</h2>
      <p><wa:mls>Nom :</wa:mls> <strong>${order.invoiceFirstname} ${order.invoiceLastname}</strong></p>
      <p><wa:mls>Date de naissance :</wa:mls> <strong><fmt:formatDate value="${order.invoiceBirthdate}" pattern="dd/MM/yyyy" /></strong></p>
      <p><wa:mls>e-mail :</wa:mls> <strong>${order.invoiceEmail}</strong></p>
      <p><wa:mls>Pays :</wa:mls> <strong>${order.invoiceCountry}</strong></p>
    </div>
    <div id="description_info">
      <h2><wa:mls>Description du produit</wa:mls></h2>
      <p>${price.catalogProduct.mainTitle} </p>
      <h2><wa:mls>Valeur</wa:mls></h2>
      <p>${price.quantity} ${price.mainTitle} ${price.quantity} x ${price.value}&euro; = <strong>${price.quantity * price.value} &euro;</strong></p>
    </div>
    <div class="clr"></div>
    <hr noshade="noshade" size="1"/>
    <h2><wa:mls>Téléchargement du fichier</wa:mls></h2>
    <p><wa:mls>Pour télécharger le fichier cliquez sur ce lien :</wa:mls></p>
    <a href="/bitc/front/eshop/mp3.do?lid=${lid}" target="_blank"><img src="${static}/front/img/ml/btn_download_voucher.jpg" alt="Download"/></a>
    <hr noshade="noshade" size="1"/>
    <h2><wa:mls>Conditions générales de vente</wa:mls></h2>
    ${price.catalogProduct.mainSalesCondition}
    <h2><wa:mls>Remarque :</wa:mls> </h2>
    <ul>
      <li><wa:mls>A partir de 2 D*Tours téléchargés, vous bénéficiez de 20 % de réduction sur le total (ex : 2 téléchargements = 8 &euro;)</wa:mls> </li>
      <li><wa:mls>Le D*Tours sera ouvert après paiement en fichier zip (MP3 : 95 Mo)</wa:mls></li>
    </ul>
    
    <hr noshade="noshade" size="1"/>
    <img src="${static}/front/img/ml/barcode_voucher.jpg" alt="code barre" id="barcode"/>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>