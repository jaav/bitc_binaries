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
      <li><b>4. <wa:mls>Paiement</wa:mls></b></li>
      <li class="select"><b>5. <wa:mls>Impression des vouchers</wa:mls></b></li>
    </ul>
    <!--nav_eshop:end-->
    <br clear="all" />
    <div class="clr"></div>
    <hr class="dashed" />
      <h3><wa:mls>dear</wa:mls> ${order.invoiceFirstname},<br/> <wa:mls>thanks_for_buying</wa:mls></h3>
      <p><wa:mls>info_on_brochres_and_plans_delivery</wa:mls></p>
     <p><wa:mls>Ceci est le code de votre commande, conservez-le pour retrouver votre commande plus tard (après paiement)</wa:mls>: <strong class="txt_orange">${order.orderCid}</strong></p>
    <hr class="m17"/>
    <h3><wa:mls>Vos achats</wa:mls></h3>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
      <tr>
        <td width="30%"><h4 class="no_margin"><wa:mls>Articles dans votre panier</wa:mls></h4></td>
      <td >&nbsp;</td>
      <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td ><h4 class="no_margin"><wa:mls>extra_info</wa:mls></h4></td>
        <td>&nbsp;</td>
        <td width="20%"><h4 class="no_margin"><wa:mls>Prix</wa:mls></h4></td>
        <td>&nbsp;</td>
        <td width="5%"><h4 class="no_margin"><wa:mls>Quantité</wa:mls></h4></td>
        <td >&nbsp;</td>
        <td ><h4 class="no_margin"><wa:mls>Total</wa:mls></h4></td>
      </tr>
      <c:forEach var="item" items="${listLine}" varStatus="loop">
	      <c:if test="${loop.count>1}">
	      <tr><td colspan="9"><hr class="m17"></td></tr>
	      </c:if>
	      <tr>
	        <td  class="article">
	        	${item.catalogPrice.catalogProduct.mainTitle}
	        </td>
              <td  class="space">&nbsp;</td>
            <td>
                <c:choose>
                    <c:when test="${item.catalogPrice.catalogProduct.group eq 'ES_BALLADE'}">
                        <a href="${context}/${site}/other/displayMp3Download/cid/${order.orderCid}/pcid/${item.catalogPrice.cid}.do" target="_blank" class="btn_print"><wa:mls>TELECHARGER</wa:mls></a>
                    </c:when>
                    <c:when test="${item.catalogPrice.catalogProduct.group eq 'ES_VOUCHER'}">
                        <a href="${context}/${site}/other/displayVoucherDownload/cid/${order.orderCid}/pcid/${item.catalogPrice.cid}.do" target="_blank" class="btn_print"><wa:mls>IMPRIMER</wa:mls></a>
                    </c:when>
                </c:choose></td>
            </td>
              <td class="space">&nbsp;</td>
     	        <td class="date"><fmt:formatDate value="${item.selectedDate}" pattern="dd/MM/yyyy" /></td>
              <td class="space">&nbsp;</td>
	        
	        <td class="price">${item.catalogPrice.mainTitle}<br />
		        		<strong>${item.catalogPrice.value} &euro;</strong>  
	        </td>         
	        <td class="space">&nbsp;</td>
	        <td class="quantity"><fmt:formatNumber value="${item.quantity}" pattern="#" /></td>
	        <td class="space">&nbsp;</td>
	        <td class="total">${item.quantity * item.unitPrice} &euro;</td>
        </tr>
        <c:if test="${loop.count == fn:length(listLine)}">
        </table>
        </c:if>
      </c:forEach>
    </table>
          <div class="clr"></div>
    
    <div class="box_total">    
 <div class="group">
 <span><wa:mls>PRIX NORMAL :</wa:mls> ${order.totalBeforeDiscount} &euro;</span>
 	<c:if test="${order.discountValue >0}">
    <span class="promo"><wa:mls>PROMO :</wa:mls> -${order.discountValue} &euro;</span>
    </c:if>
    <span><wa:mls>TOTAL ARTICLES TTC :</wa:mls> ${order.total} &euro;</span> 
    </div>

      <div class="clr"></div>
    </div>
    <h3><wa:mls>Vos Coordonnées</wa:mls></h3>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
    <tr>
      <td class="label_reply">
          ${order.invoiceFirstname} ${order.invoiceLastname}<br />
          ${order.invoiceStreet} ${order.invoiceNum}<c:if test="${order.invoiceBox!=''}">/${order.invoiceBox}</c:if><br />
          ${order.invoiceZipcode} ${order.invoiceCity}
          ${order.invoiceEmail}
      </td>
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

	

