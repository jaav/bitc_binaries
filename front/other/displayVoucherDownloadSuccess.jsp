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
      <p><wa:mls>Nom :</wa:mls> <strong>${order.invoiceFirstname} ${order.invoiceLastname}</strong></p>
      <p><wa:mls>Date de naissance :</wa:mls> <strong><fmt:formatDate value="${order.invoiceBirthdate}" pattern="dd/MM/yyyy" /></strong></p>
      <p><wa:mls>e-mail :</wa:mls> <strong>${order.invoiceEmail}</strong></p>
      <p><wa:mls>Pays :</wa:mls> <strong>${order.invoiceCountry}</strong></p>
    </div>
    <div id="description_info">
      <h2><wa:mls>Description du produit</wa:mls></h2>
      <p>${price.catalogProduct.mainTitle} </p>
      <h2><wa:mls>Date prévue</wa:mls></h2>
      <p><fmt:formatDate value="${price.selectedDate}" pattern="dd/MM/yyyy" /></p>
      
      <h2><wa:mls>Valeur</wa:mls></h2>
      <p>${price.mainTitle} ${price.quantity} x ${price.value}&euro; = <strong>${price.quantity * price.value} &euro;</strong></p>
    </div>
    <div class="clr"></div>
    <hr noshade="noshade" size="1"/>
    <h2><wa:mls>Conditions générales de vente</wa:mls></h2>
    ${price.catalogProduct.mainSalesCondition}
    <p><strong><wa:mls>Conditions de vente :</wa:mls></strong></p>
    <p><wa:mls>Ce voucher est valable uniquement pour la(les) personne(s) nommée(s) ci-dessus. Il n'est pas transférable, n'a pas de valeur financière et ne peut être échangé qu'une seule fois.
      BI-TC ne remboursera aucune activité ou service non utilisée ou partiellement utilisée.</wa:mls></p>
    <hr noshade="noshade" size="1"/>
    <p><wa:mls>Ce bon de réservation ne sera valable que si il est signé par la personne reprise en haut de page.</wa:mls></p>
    <img src="${static}/front/img/ml/barcode_voucher.jpg" alt="code barre" id="barcode"/>
    &nbsp;&nbsp;${order.orderCid}
    <div id="signature">
      <p><wa:mls>Signature</wa:mls></p>
      <span id="signature_box"></span> </div>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>