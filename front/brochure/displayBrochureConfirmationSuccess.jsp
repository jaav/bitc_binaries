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
      <li><b>3. <wa:mls>Récapitulatif</wa:mls></b></li>
      <li class="select"><b>4. <wa:mls>Confirmation</wa:mls></b></li>
    </ul>
    <!--nav_eshop:end-->
    <br clear="all" />
    <div class="clr"></div>
    <hr class="dashed" />
     <p><wa:mls>Ceci est le code de votre commande, conservez-le pour retrouver votre commande plus tard (après paiement)</wa:mls>: <strong class="txt_orange">${waParam.cid}</strong></p>
    <hr class="m17"/>
    <h3><wa:mls>Vos achats</wa:mls></h3>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
      <tr>
        <td><h4 class="no_margin"><wa:mls>Articles dans votre panier</wa:mls></h4></td>
        <td >&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Date prévue</wa:mls></h4></td>
        <td>&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Prix</wa:mls></h4></td>
        <td>&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Quantité</wa:mls></h4></td>
        <td >&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Total</wa:mls></h4></td>
      </tr>
      <c:forEach var="item" items="${listLine}" varStatus="loop">
	      <c:if test="${loop.count>1}">
	      <hr / class="m17">
	      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="basket">
	      </c:if>
	      <tr>
	        <td  class="article">
	        	${item.catalogPrice.catalogProduct.mainTitle}<br />
	        </td>
	        <td class="space">&nbsp;</td>
	        <td class="date"><fmt:formatDate value="${item.selectedDate}" pattern="dd/MM/yyyy" /></td>
	        
	        <td  class="space">&nbsp;</td>
	        
	        <td class="price">${item.catalogPrice.mainTitle}<br />
		        		<strong>${item.catalogPrice.value} &euro;</strong>  
	        </td>         
	        <td class="space">&nbsp;</td>
	        <td class="quantity"><fmt:formatNumber value="${item.quantity}" pattern="#" /></td>
	        <td class="space">&nbsp;</td>
	        <td class="total">${item.quantity * item.unitPrice} &euro;</td>
        </tr>
		    
        <c:if test="${loop.count < fn:length(listLine)}">
        </table>
        </c:if>
      </c:forEach>
    </table>
    <div class="clr"></div>
    <div class="box_total">    
 <div class="group">
 <span><wa:mls>PRIX NORMAL :</wa:mls> 
 	<c:choose>
		 <c:when test="${orderBrochure.totalBeforeDiscount >0 }" >${orderBrochure.totalBeforeDiscount}</c:when>
		 <c:otherwise>0</c:otherwise>
	 </c:choose> &euro;</span>
 	<c:if test="${orderBrochure.discountValue >0}">
    <span class="promo"><wa:mls>PROMO :</wa:mls> -${orderBrochure.discountValue} &euro;</span>
    </c:if>
    <span><wa:mls>TOTAL ARTICLES TTC :</wa:mls> 
     <c:choose>
		 <c:when test="${orderBrochure.total >0 }" >${orderBrochure.total}</c:when>
		 <c:otherwise>0</c:otherwise>
	 </c:choose>
    &euro;</span> 
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
          <td class="label_reply"><strong>${wa:nullFree(orderBrochure.invoiceCompanyName)}</strong></td>
        </tr>
        <tr>
          <td class="label"><wa:mls>Nom :</wa:mls></td>
          <td>&nbsp;</td>
          <td class="label_reply"><strong>${wa:nullFree(orderBrochure.invoiceLastname)}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Prénom :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree(orderBrochure.invoiceFirstname)}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Date de naissance :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong><fmt:formatDate value="${orderBrochure.invoiceBirthdate}" pattern="dd/MM/yyyy" /></strong></td>
        </tr>
        <tr>
          <td><wa:mls>Street :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree(orderBrochure.invoiceStreet)}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Num :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree(orderBrochure.invoiceNum)}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Box :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree(orderBrochure.invoiceBox)}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Zipcode :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree(orderBrochure.invoiceZipcode)}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>City :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree(orderBrochure.invoiceCity)}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Pays :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree(orderBrochure.invoiceCountry)}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Email :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree(orderBrochure.invoiceEmail)}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Phone :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree(orderBrochure.invoicePhone)}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Fax :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${wa:nullFree(orderBrochure.invoiceFax)}</strong></td>
        </tr>
      </table></td>
    </tr>
    </table>
    <hr class="m17"/>
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

	

