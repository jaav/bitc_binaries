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


<!--contentMain:start-->
  <div id="content_main">
    <h1 class="line_pink"><wa:mls>ACHETER EN LIGNE</wa:mls></h1>
    <!--nav_eshop:start-->
    <ul id="nav_eshop">
      <li><b>1. <wa:mls>Mon panier</wa:mls></b></li>
      <li><b>2. <wa:mls>Coordonnées</wa:mls></b></li>
      <li class="select"><b>3. <wa:mls>Récapitulatif</wa:mls></b></li>
      <li><b>4. <wa:mls>Confirmation</wa:mls></b></li>
    </ul>
    <!--nav_eshop:end-->
    <br clear="all" />
    <div class="clr"></div>
    <hr class="dashed" />
    <h3><wa:mls>Vos achats</wa:mls></h3>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
      <tr>
        <td><h4 class="no_margin"><wa:mls>Articles dans votre panier</wa:mls></h4></td>
        <td >&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Langue</wa:mls></h4></td>
        <td>&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Prix</wa:mls></h4></td>
        <td>&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Quantité</wa:mls></h4></td>
        <td >&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Total</wa:mls></h4></td>
      </tr>
      <c:forEach var="item" items="${basketVoucher}" varStatus="loop">
	      <c:if test="${loop.count>1}">
	      <hr / class="m17">
	      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="basket">
	      </c:if>
	      <tr>
	        <td  class="article">${item.mainTitle}
	        </td>
	        <td class="space">&nbsp;</td>
	        <td class="date">${item.language}</td>
	        
	        <td  class="space">&nbsp;</td>
	        <!-- sizeof list prices ${fn:length(item.catalogPrices)} -->
	        <c:forEach var="price" items="${item.catalogPrices}" varStatus="loopPrices">
	        	<c:if test="${price.isActive}">
			        <c:if test="${loopPrices.count != 1}">
				        <tr>
					        <td>&nbsp;</td>
					        <td>&nbsp;</td>
					        <td>&nbsp;</td>
					        <td>&nbsp;</td>
			        </c:if>
			        <td class="price">${price.mainTitle}<br />
				        		<strong>${price.value} &euro;</strong>  
			        </td>         
			        <td  class="space">&nbsp;</td>
			        <td class="quantity">${price.quantity}</td>
			        <td class="space">&nbsp;</td>
			        <td class="total">${price.quantity * price.value}</td>
		        </tr>
		        </c:if>
	        </c:forEach>
	        <c:if test="${loop.count < fn:length(basket)}">
	        </table>
	        </c:if>
      </c:forEach>
    </table>
<div class="clr"></div>
    <div class="box_total">    
 <div class="group">
 <span><wa:mls>PRIX NORMAL :</wa:mls> ${orderBrochure.totalBeforeDiscount} &euro;</span>
 	<c:if test="${orderBrochure.discountValue >0}">
    <span class="promo"><wa:mls>PROMO :</wa:mls> -${orderBrochure.discountValue} &euro;</span>
    </c:if>
    <span><wa:mls>TOTAL ARTICLES TTC :</wa:mls> ${orderBrochure.total} &euro;</span> 
    </div>

      <div class="clr"></div>
    </div>
    <h3><wa:mls>Vos Coordonnées</wa:mls></h3>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
    <tr>
      <td class="label_reply"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
        <tr>
          <td class="label"><wa:mls>Company Name :</wa:mls></td>
          <td>&nbsp;</td>
          <td class="label_reply"><strong>${wa:nullFree2(orderBrochure.invoiceCompanyName,'-')}</strong></td>
        </tr>
        <tr>
          <td class="label"><wa:mls>Nom :</wa:mls></td>
          <td>&nbsp;</td>
          <td class="label_reply"><strong>${wa:nullFree2(orderBrochure.invoiceLastname,'-')}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Prénom :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree2(orderBrochure.invoiceFirstname,'-')}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Date de naissance :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong><fmt:formatDate value="${orderBrochure.invoiceBirthdate}" pattern="dd/MM/yyyy" /></strong></td>
        </tr>
        <tr>
          <td><wa:mls>Street :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree2(orderBrochure.invoiceStreet,'-')}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Num :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree2(orderBrochure.invoiceNum,'-')}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Box :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree2(orderBrochure.invoiceBox,'-')}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Zipcode :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree2(orderBrochure.invoiceZipcode,'-')}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>City :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree2(orderBrochure.invoiceCity,'-')}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Pays :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree2(orderBrochure.invoiceCountry,'-')}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Email :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree2(orderBrochure.invoiceEmail,'-')}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Phone :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree2(orderBrochure.invoicePhone,'-')}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Fax :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree2(orderBrochure.invoiceFax,'-')}</strong></td>
        </tr>
      </table></td>
    </tr>
    </table>
    <hr class="m17"/>


    <a href="${context}/${site}/${module}/displayFillInfos.do" class="btn_previous_eshop float_left"><wa:mls>Précédent</wa:mls></a> <a href="${context}/${site}/${module}/confirmOrder.do" class="btn_next_eshop float_right"><wa:mls>Payer</wa:mls></a>
    <div class="clr"></div>
  </div>
  <!--contentMain:end-->
  <!--contentSub:start-->
  <div id="content_sub"> 
   <!-- component book_stay:start -->
    
  <!--contentSub:end-->
  <div class="clr"></div>
</div>
<!--content:end-->

	

