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
   
    		<div class="clr"></div>	    
    
 
    <h3><wa:mls>Information</wa:mls></h3>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
    <tr>
      <td class="label_reply"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="resume">
        <tr>
          <td class="label"><wa:mls>type de Deals* :</wa:mls></td>
          <td>&nbsp;</td>
          <td class="label_reply"><strong>${deals.type}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>price TVAC* :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${deals.price}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Nom de lieu* :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${deals.name}</strong></td>
        </tr>
        <tr>
          <td><wa:mls>Résumé du deal* :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${deals.abstract_}</strong></td>
        </tr>
         <tr>
          <td><wa:mls>website :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${deals.url}</strong></td>
        </tr>
         <tr>
          <td><wa:mls>Periode de validité du* :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong><fmt:formatDate pattern="dd/MM/yyyy" value="${deals.periodFromDate}" /></strong></td>
        </tr>
         <tr>
          <td><wa:mls>Au* : </wa:mls></td>
          <td>&nbsp;</td>
          <td><strong><fmt:formatDate pattern="dd/MM/yyyy" value="${deals.periodToDate}" /></strong></td>
        </tr>
         <tr>
          <td><wa:mls>personne de contact* :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${deals.author}</strong></td>
        </tr>
         <tr>
          <td><wa:mls>phone* :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${deals.phone}</strong></td>
        </tr>
         <tr>
          <td><wa:mls>E-mail* :</wa:mls></td>
          <td>&nbsp;</td>
          <td><strong>${deals.email}</strong></td>
        </tr>
      </table></td>
    </tr>
    </table>
    <hr class="m17"/>
    
    
<c:choose>
	<c:when test="${deals.currentOrderStatus eq 'SENT' or deals.currentOrderStatus eq 'PAID' or deals.currentOrderStatus eq 'PAID_ADMIN' or deals.currentOrderStatus eq 'DUBIOUS'}">
		<div class="error"><wa:mls>Deals already Paid</wa:mls></div>
	</c:when>
	<c:otherwise>
	 
	<div><span><wa:mls>PRICE HTVA:</wa:mls><strong>${order.pricehtv} &euro;</strong></span></div>
<div class="clr"></div>	  
   
<div>	<span><wa:mls>TVA:</wa:mls><strong>${order.tva} &euro; </strong></span></div>	 
<div class="clr"></div>	 
   
<div>	<span><wa:mls>PRICE TTC:</wa:mls>  <strong>${order.total} &euro;</strong></span></div>
<div class="clr"></div>	    
	<!-- OGONE form -->
<script>
	function sendOgoneForm(){
		$("#ogoneForm").submit();
	}
</script>

	<FORM METHOD="post" ACTION="/bitc/front/contentDeals/ogoneRedirect.do" id="ogoneForm" name="ogoneForm">
	<INPUT type="hidden" NAME="PSPID" value="${pspid}">
	<INPUT type="hidden" NAME="orderID" value="${order.orderId}">
	<INPUT type="hidden" NAME="amount" value="${ogoneTotal}">
	<INPUT type="hidden" NAME="currency" value="EUR">
	<INPUT type="hidden" NAME="language" value="${ogoneLg}">
	<!-- lay out information -->
	
	<INPUT type="hidden" NAME="TITLE" value="<wa:mls>Visitbrussels : Deals</wa:mls>">
	
	<INPUT type="hidden" NAME="BGCOLOR" value="#4D4CB4">
	<INPUT type="hidden" NAME="TXTCOLOR" value="#b7bdc1">
	<INPUT type="hidden" NAME="TBLBGCOLOR" value="#171717">
	<INPUT type="hidden" NAME="TBLTXTCOLOR" value="#b7bdc1">
	<INPUT type="hidden" NAME="BUTTONBGCOLOR" value="#435864">
	<INPUT type="hidden" NAME="BUTTONTXTCOLOR" value="#85b9ce">
	<INPUT type="hidden" NAME="FONTTYPE" value="Verdana">
	
	<INPUT type="hidden" NAME="LOGO" value="">
	<!-- or dynamic template page -->
	<INPUT type="hidden" NAME="TP" value="">
	<!-- post-payment redirection -->
	<INPUT type="hidden" NAME="accepturl" VALUE="${URL}${context}/${site}/${module}/ogoneAccept/cid/${order.orderCid}.do">
	<INPUT type="hidden" NAME="declineurl" VALUE="${URL}${context}/${site}/${module}/ogoneDecline/cid/${order.orderCid}.do">
	<INPUT type="hidden" NAME="exceptionurl" VALUE="${URL}${context}/${site}/${module}/ogoneException/cid/${order.orderCid}.do">
	<INPUT type="hidden" NAME="cancelurl" VALUE="${URL}${context}/${site}/${module}/ogoneCancel/cid/${order.orderCid}.do">
	<!-- miscellanous -->
	<INPUT type="hidden" NAME="homeurl" VALUE="${URL}${context}/${site}/home/display.do">
	<INPUT type="hidden" NAME="catalogurl" VALUE="${URL}${context}/${site}/content/displayDeals.do">
	<INPUT type="hidden" NAME="CN" value="${deals.author}">
	<INPUT type="hidden" name="EMAIL" value="${deals.email}">
	<INPUT type="hidden" NAME="PM" VALUE="">
	<INPUT type="hidden" NAME="BRAND" VALUE="">
	<INPUT type="hidden" NAME="ownerZIP" VALUE="">
	<INPUT type="hidden" NAME="owneraddress" VALUE="">
	<INPUT type="hidden" NAME="SHASign" value="">
	<INPUT type="hidden" NAME="Alias" VALUE="">
	<INPUT type="hidden" NAME="AliasUsage" VALUE="">
	<INPUT type="hidden" NAME="AliasOperation" VALUE="">
	<INPUT type="hidden" NAME="COM" VALUE="">
	<INPUT type="hidden" NAME="COMPLUS" VALUE="">
	<INPUT type="hidden" NAME="PARAMPLUS" VALUE="">
	<INPUT type="hidden" NAME="USERID" VALUE="">
	<INPUT type="hidden" NAME="CreditCode" VALUE="">
	</FORM>
	

   <a href="javascript:sendOgoneForm();" class="btn_next_eshop float_right"><wa:mls>Payer</wa:mls></a>
   </c:otherwise>
   </c:choose>
    <div class="clr"></div>
  </div>
  <!--contentMain:end-->


	

