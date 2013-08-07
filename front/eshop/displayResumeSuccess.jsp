<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!--contentMain:start-->
<div id="content_main">
	<h1 class="line_pink">
		<wa:mls>ACHETER EN LIGNE</wa:mls>
	</h1>
	<!--nav_eshop:start-->
	<ul id="nav_eshop">
		<li><b>1. <wa:mls>Mon panier</wa:mls></b></li>
		<li><b>2. <wa:mls>Coordonnées</wa:mls></b></li>
		<li class="select"><b>3. <wa:mls>Récapitulatif</wa:mls></b></li>
		<li><b>4. <wa:mls>Paiement</wa:mls></b></li>
		<li><b>5. <wa:mls>Impression des vouchers</wa:mls></b></li>
	</ul>
	<!--nav_eshop:end-->
	<br clear="all" />
	<div class="clr"></div>
	<hr class="dashed" />
	<h3>
		<wa:mls>Vos achats</wa:mls>
	</h3>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
		<tr>
			<td><h4 class="no_margin">
					<wa:mls>Articles dans votre panier</wa:mls>
				</h4></td>
			<td>&nbsp;</td>
			<td><h4 class="no_margin">
					<wa:mls>Date prévue</wa:mls>
				</h4></td>
			<td>&nbsp;</td>
			<td><h4 class="no_margin">
					<wa:mls>Prix</wa:mls>
				</h4></td>
			<td>&nbsp;</td>
			<td><h4 class="no_margin">
					<wa:mls>Quantité</wa:mls>
				</h4></td>
			<td>&nbsp;</td>
			<td><h4 class="no_margin">
					<wa:mls>Total</wa:mls>
				</h4></td>
		</tr>
		<c:forEach var="item" items="${basket}" varStatus="loop">
			<c:if test="${loop.count>1}">
				<hr class="m17" />
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
					</c:if>
					<tr>
						<td class="article">${item.mainTitle}</td>
						<td class="space">&nbsp;</td>
						<td class="date"><fmt:formatDate value="${item.selectedDate}" pattern="dd/MM/yyyy" /></td>

						<td class="space">&nbsp;</td>
						<!-- sizeof list prices ${fn:length(item.catalogPrices)} -->
						<c:forEach var="price" items="${item.catalogPrices}" varStatus="loopPrices">
							<c:if test="${(price.isActive) && (price.quantity>0)}">
								<c:if test="${loopPrices.count != 1}">
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
								</c:if>
								<td class="price">${price.mainTitle}<br /> <strong>${price.value} &euro;</strong>
								</td>
								<td class="space">&nbsp;</td>
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
	<br clear="all" />
    <div class="clr"></div>
    <hr class="dashed" />
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
      <tr>
      	<td><h4 class="no_margin">
					<wa:mls>Articles dans votre panier</wa:mls>
				</h4></td>
			<td>&nbsp;</td>
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
	        	<c:if test="${(price.isActive) && (price.quantity>0)}">
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
			<span><wa:mls>PRIX NORMAL :</wa:mls> ${order.totalBeforeDiscount} &euro;</span>
			<c:if test="${order.discountValue >0}">
				<span class="promo"><wa:mls>PROMO :</wa:mls> -${order.discountValue} &euro;</span>
			</c:if>
			<span><wa:mls>TOTAL ARTICLES TTC :</wa:mls> ${order.total} &euro;</span>
		</div>

		<div class="clr"></div>
	</div>
	<h3>
		<wa:mls>Vos Coordonnées</wa:mls>
	</h3>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
		<tr>
			<td class="label_reply"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
                <tr>
                          <td class="label"><wa:mls>Company Name :</wa:mls></td>
                          <td>&nbsp;</td>
                          <td class="label_reply"><strong>${wa:nullFree2(order.invoiceCompanyName,'-')}</strong></td>
                        </tr>	
                <tr>
						<td class="label"><wa:mls>Nom :</wa:mls></td>
						<td>&nbsp;</td>
						<td class="label_reply"><strong>${order.invoiceLastname}</strong></td>
					</tr>
					<tr>
						<td><wa:mls>Prénom :</wa:mls></td>
						<td>&nbsp;</td>
						<td><strong>${order.invoiceFirstname}</strong></td>
					</tr>
					<tr>
						<td><wa:mls>Date de naissance :</wa:mls></td>
						<td>&nbsp;</td>
						<td><strong><fmt:formatDate value="${order.invoiceBirthdate}" pattern="dd/MM/yyyy" /></strong></td>
					</tr>
					<tr>
						<td><wa:mls>Pays :</wa:mls></td>
						<td>&nbsp;</td>
						<td><strong>${order.invoiceCountry}</strong></td>
					</tr>
					<tr>
						<td><wa:mls>Email :</wa:mls></td>
						<td>&nbsp;</td>
						<td><strong>${order.invoiceEmail}</strong></td>
					</tr> 
                <tr>
                  <td><wa:mls>Street :</wa:mls></td>
                  <td>&nbsp;</td>
                  <td><strong>${wa:nullFree2(order.invoiceStreet,'-')}</strong></td>
                </tr>
                <tr>
                  <td><wa:mls>Num :</wa:mls></td>
                  <td>&nbsp;</td>
                  <td><strong>${wa:nullFree2(order.invoiceNum,'-')}</strong></td>
                </tr>
                <tr>
                  <td><wa:mls>Box :</wa:mls></td>
                  <td>&nbsp;</td>
                  <td><strong>${wa:nullFree2(order.invoiceBox,'-')}</strong></td>
                </tr>
                <tr>
                  <td><wa:mls>Zipcode :</wa:mls></td>
                  <td>&nbsp;</td>
                  <td><strong>${wa:nullFree2(order.invoiceZipcode,'-')}</strong></td>
                </tr>
                <tr>
                  <td><wa:mls>City :</wa:mls></td>
                  <td>&nbsp;</td>
                  <td><strong>${wa:nullFree2(order.invoiceCity,'-')}</strong></td>
                </tr>
				</table></td>
		</tr>
	</table>
	<hr class="m17" />

	<!-- OGONE form -->
	<script>
		function sendOgoneForm() {
			$("#ogoneForm").submit();
		}
	</script>

	<FORM METHOD="post" ACTION="/bitc/front/eshop/ogoneRedirect.do" id="ogoneForm" name="ogoneForm">
		<INPUT type="hidden" NAME="PSPID" value="${pspid}"> <INPUT type="hidden" NAME="orderID" value="${order.orderId}"> <INPUT type="hidden" NAME="amount" value="${ogoneTotal}"> <INPUT
			type="hidden" NAME="currency" value="EUR"> <INPUT type="hidden" NAME="language" value="${ogoneLg}">
		<!-- lay out information -->

		<INPUT type="hidden" NAME="TITLE" value="<wa:mls>Bitc : eShop</wa:mls>"> <INPUT type="hidden" NAME="BGCOLOR" value="#4D4CB4"> <INPUT type="hidden" NAME="TXTCOLOR" value="#b7bdc1">
		<INPUT type="hidden" NAME="TBLBGCOLOR" value="#171717"> <INPUT type="hidden" NAME="TBLTXTCOLOR" value="#b7bdc1"> <INPUT type="hidden" NAME="BUTTONBGCOLOR" value="#435864"> <INPUT
			type="hidden" NAME="BUTTONTXTCOLOR" value="#85b9ce"> <INPUT type="hidden" NAME="FONTTYPE" value="Verdana"> <INPUT type="hidden" NAME="LOGO" value="">
		<!-- or dynamic template page -->
		<INPUT type="hidden" NAME="TP" value="">
		<!-- post-payment redirection -->
		<INPUT type="hidden" NAME="accepturl" VALUE="${URL}${context}/${site}/${module}/ogoneAccept/cid/${order.orderCid}.do"> <INPUT type="hidden" NAME="declineurl"
			VALUE="${URL}${context}/${site}/${module}/ogoneDecline/cid/${order.orderCid}.do"> <INPUT type="hidden" NAME="exceptionurl"
			VALUE="${URL}${context}/${site}/${module}/ogoneException/cid/${order.orderCid}.do"> <INPUT type="hidden" NAME="cancelurl"
			VALUE="${URL}${context}/${site}/${module}/ogoneCancel/cid/${order.orderCid}.do">
		<!-- miscellanous -->
		<INPUT type="hidden" NAME="homeurl" VALUE="${URL}${context}/${site}/splash/display.do"> <INPUT type="hidden" NAME="catalogurl" VALUE="${URL}${context}/${site}/${module}/displayEsCategory.do">
		<INPUT type="hidden" NAME="CN" value="${order.invoiceLastname} ${order.invoiceFirstname}"> <INPUT type="hidden" name="EMAIL" value="${order.invoiceEmail}"> <INPUT type="hidden"
			NAME="PM" VALUE=""> <INPUT type="hidden" NAME="BRAND" VALUE=""> <INPUT type="hidden" NAME="ownerZIP" VALUE=""> <INPUT type="hidden" NAME="owneraddress"
			VALUE="${order.invoiceCountry}"> <INPUT type="hidden" NAME="SHASign" value=""> <INPUT type="hidden" NAME="Alias" VALUE=""> <INPUT type="hidden" NAME="AliasUsage" VALUE="">
		<INPUT type="hidden" NAME="AliasOperation" VALUE=""> <INPUT type="hidden" NAME="COM" VALUE=""> <INPUT type="hidden" NAME="COMPLUS" VALUE=""> <INPUT type="hidden"
			NAME="PARAMPLUS" VALUE=""> <INPUT type="hidden" NAME="USERID" VALUE=""> <INPUT type="hidden" NAME="CreditCode" VALUE="">
	</FORM>


	<a href="${context}/${site}/${module}/displayFillInfos.do" class="btn_previous_eshop float_left"><wa:mls>Précédent</wa:mls></a> <a href="javascript:sendOgoneForm();"
		class="btn_next_eshop float_right"><wa:mls>Payer</wa:mls></a>
	<div class="clr"></div>
</div>
<!--contentMain:end-->




