<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored ="false" 
%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="mainContent">
<div id="toolBox">
	<div class="content" id="actions">
		<a href="javascript:void(0);" id ="back_btn"><wa:mls>Back to List</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
	</div>
</div>
<h2><wa:mls>EsOrder - Edit</wa:mls></h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
				<fieldset>
					<legend>&nbsp;</legend>
					<div class="bgGrey">
						<label for="f_esOrderId"><wa:mls>orderId</wa:mls></label>
						<span>${bean.orderId}</span>
						<input name="id" type="hidden" value="${bean.orderId}"/>
						<input name="f_orderId" type="hidden" value="${bean.orderId}"/>
					</div>
					<div>
						<label for="f_orderStatus"><wa:mls>orderStatus</wa:mls></label>
						<select name="f_orderStatus" onchange="">
							<option value=""  <c:if test="${bean.orderStatus eq '' || bean.orderStatus eq null}">selected="selected"</c:if>><wa:mls>Choisissez le statut</wa:mls></option>
							<option value="CREATED" <c:if test="${bean.orderStatus eq 'CREATED'}">selected="selected"</c:if>><wa:mls>CREATED</wa:mls></option>
							<option value="SUMMARY" <c:if test="${bean.orderStatus eq 'SUMMARY'}">selected="selected"</c:if>><wa:mls>SUMMARY</wa:mls></option>
							<option value="PAYING" <c:if test="${bean.orderStatus eq 'PAYING'}">selected="selected"</c:if>><wa:mls>PAYING</wa:mls></option>
							<option value="DUBIOUS" <c:if test="${bean.orderStatus eq 'DUBIOUS'}">selected="selected"</c:if>><wa:mls>DUBIOUS</wa:mls></option>
							<option value="TIMEOUT" <c:if test="${bean.orderStatus eq 'TIMEOUT'}">selected="selected"</c:if>><wa:mls>TIMEOUT</wa:mls></option>
							<option value="CANCELED" <c:if test="${bean.orderStatus eq 'CANCELED'}">selected="selected"</c:if>><wa:mls>CANCELED</wa:mls></option>
							<option value="REFUSED" <c:if test="${bean.orderStatus eq 'REFUSED'}">selected="selected"</c:if>><wa:mls>REFUSED</wa:mls></option>
							<option value="PAID" <c:if test="${bean.orderStatus eq 'PAID'}">selected="selected"</c:if>><wa:mls>PAID</wa:mls></option>
							<option value="SENT" <c:if test="${bean.orderStatus eq 'SENT'}">selected="selected"</c:if>><wa:mls>SENT</wa:mls></option>
							<option value="WAITING" <c:if test="${bean.orderStatus eq 'WAITING'}">selected="selected"</c:if>><wa:mls>WAITING</wa:mls></option>
						</select>
					</div>
					<c:forEach items="${esOrderLines}" var="line">
						${line.reference} - ${line.productId} - ${line.unitPrice} - ${line.quantity} <br/>
					</c:forEach>
				</fieldset>
				<fieldset>
					<legend><wa:mls>Invoice informations</wa:mls></legend>
					<div class="bgGrey">
						<label for="f_invoiceCulture"><wa:mls>invoiceCulture</wa:mls> </label>
						<wa:include URI="${site}/dropdown/dropListCulture">
							<wa:param name="name" value="f_invoiceCulture" />
							<wa:param name="choiceMsg" value="Select the culture" />
							<wa:param name="selectedValues" value="${bean.invoiceCulture}" />
						</wa:include>
					</div>
					<div class="bgWhite">
						<label for="f_invoiceGreeting"><wa:mls>invoiceGreeting</wa:mls></label>
						<input type="radio" value="Mr" name="f_invoiceGreeting" <c:if test="${bean.invoiceGreeting eq 'Mr'}">checked="checked"</c:if>/> <wa:mls>Mr</wa:mls>
						<input type="radio" value="Mrs" name="f_invoiceGreeting" <c:if test="${bean.invoiceGreeting eq 'Mrs'}">checked="checked"</c:if>/>	<wa:mls>Mrs</wa:mls>
						<input type="radio" value="Miss" name="f_invoiceGreeting" <c:if test="${bean.invoiceGreeting eq 'Miss'}">checked="checked"</c:if>/>	<wa:mls>Miss</wa:mls>					
					</div>
					<div class="bgGrey">
						<label for="f_invoiceGender"><wa:mls>invoiceGender</wa:mls></label>
						<input type="radio" value="M" name="f_invoiceGender" <c:if test="${bean.invoiceGender eq 'M'}">checked="checked"</c:if>/> <wa:mls>M</wa:mls>
						<input type="radio" value="W" name="f_invoiceGender" <c:if test="${bean.invoiceGender eq 'W'}">checked="checked"</c:if>/>	<wa:mls>W</wa:mls>					
					</div>
					<div class="bgWhite">
						<label for="f_invoiceFirstname"><wa:mls>invoiceFirstname</wa:mls></label>
						<textarea name="f_invoiceFirstname" class="textfield" >${bean.invoiceFirstname}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_invoiceLastname"><wa:mls>invoiceLastname</wa:mls></label>
						<textarea name="f_invoiceLastname" class="textfield" >${bean.invoiceLastname}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_invoiceStreet"><wa:mls>invoiceStreet</wa:mls></label>
						<textarea name="f_invoiceStreet" class="textfield" >${bean.invoiceStreet}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_invoiceNum"><wa:mls>invoiceNumber</wa:mls></label>
						<textarea name="f_invoiceNum" class="textfield" >${bean.invoiceNum}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_invoiceBox"><wa:mls>invoiceBox</wa:mls></label>
						<textarea name="f_invoiceBox" class="textfield" >${bean.invoiceBox}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_invoiceZipcode"><wa:mls>invoiceZipcode</wa:mls></label>
						<textarea name="f_invoiceZipcode" class="textfield" >${bean.invoiceZipcode}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_invoiceCity"><wa:mls>invoiceCity</wa:mls></label>
						<textarea name="f_invoiceCity" class="textfield" >${bean.invoiceCity}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_invoiceEmail"><wa:mls>invoiceEmail</wa:mls></label>
						<textarea name="f_invoiceEmail" class="textfield" >${bean.invoiceEmail}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_invoicePhone"><wa:mls>invoicePhone</wa:mls></label>
						<textarea name="f_invoicePhone" class="textfield" >${bean.invoicePhone}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_invoiceMobile"><wa:mls>invoiceMobile</wa:mls></label>
						<textarea name="f_invoiceMobile" class="textfield" >${bean.invoiceMobile}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_invoiceFax"><wa:mls>invoiceFax</wa:mls></label>
						<textarea name="f_invoiceFax" class="textfield">${bean.invoiceFax}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_invoiceBirthdate"><wa:mls>invoiceBirthdate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_invoiceBirthdate" name="f_invoiceBirthdate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.invoiceBirthdate}"/>" maxlength="10" />
					</div>
					<div class="bgWhite">
						<label for="f_invoiceCompanyName"><wa:mls>invoiceCompanyName</wa:mls></label>
						<textarea name="f_invoiceCompanyName" class="textfield">${bean.invoiceCompanyName}</textarea>
					</div>
			</fieldset>
			<%--<fieldset>
					<legend><wa:mls>Delivery informations</wa:mls></legend>
					<div class="bgGrey">
						<label for="f_deliveryCulture"><wa:mls>deliveryCulture</wa:mls> </label>
						<wa:include URI="${site}/dropdown/dropListCulture">
							<wa:param name="name" value="f_deliveryCulture" />
							<wa:param name="choiceMsg" value="Select the culture" />
							<wa:param name="selectedValues" value="${bean.deliveryCulture}" />
						</wa:include>
					</div>
					<div class="bgWhite">
						<label for="f_deliveryGreeting"><wa:mls>deliveryGreeting</wa:mls></label>
						<input type="radio" value="Mr" name="f_deliveryGreeting" <c:if test="${bean.deliveryGreeting eq 'Mr'}">checked="checked"</c:if>/> <wa:mls>Mr</wa:mls>
						<input type="radio" value="Mrs" name="f_deliveryGreeting" <c:if test="${bean.deliveryGreeting eq 'Mrs'}">checked="checked"</c:if>/>	<wa:mls>Mrs</wa:mls>
						<input type="radio" value="Miss" name="f_deliveryGreeting" <c:if test="${bean.deliveryGreeting eq 'Miss'}">checked="checked"</c:if>/>	<wa:mls>Miss</wa:mls>					
					</div>
					<div class="bgGrey">
						<label for="f_deliveryGender"><wa:mls>deliveryGender</wa:mls></label>
						<input type="radio" value="M" name="f_deliveryGender" <c:if test="${bean.deliveryGender eq 'M'}">checked="checked"</c:if>/> <wa:mls>M</wa:mls>
						<input type="radio" value="W" name="f_deliveryGender" <c:if test="${bean.deliveryGender eq 'W'}">checked="checked"</c:if>/>	<wa:mls>W</wa:mls>					
					</div>
					<div class="bgWhite">
						<label for="f_deliveryFirstname"><wa:mls>deliveryFirstname</wa:mls></label>
						<textarea name="f_deliveryFirstname" class="textfield" >${bean.deliveryFirstname}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_deliveryLastname"><wa:mls>deliveryLastname</wa:mls></label>
						<textarea name="f_deliveryLastname" class="textfield" >${bean.deliveryLastname}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_deliveryStreet"><wa:mls>deliveryStreet</wa:mls></label>
						<textarea name="f_deliveryStreet" class="textfield" >${bean.deliveryStreet}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_deliveryNum"><wa:mls>deliveryNumber</wa:mls></label>
						<textarea name="f_deliveryNum" class="textfield" >${bean.deliveryNum}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_deliveryBox"><wa:mls>deliveryBox</wa:mls></label>
						<textarea name="f_deliveryBox" class="textfield" >${bean.deliveryBox}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_deliveryZipcode"><wa:mls>deliveryZipcode</wa:mls></label>
						<textarea name="f_deliveryZipcode" class="textfield" >${bean.deliveryZipcode}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_deliveryCity"><wa:mls>deliveryCity</wa:mls></label>
						<textarea name="f_deliveryCity" class="textfield" >${bean.deliveryCity}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_deliveryEmail"><wa:mls>deliveryEmail</wa:mls></label>
						<textarea name="f_deliveryEmail" class="textfield" >${bean.deliveryEmail}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_deliveryPhone"><wa:mls>deliveryPhone</wa:mls></label>
						<textarea name="f_deliveryPhone" class="textfield" >${bean.deliveryPhone}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_deliveryMobile"><wa:mls>deliveryMobile</wa:mls></label>
						<textarea name="f_deliveryMobile" class="textfield" >${bean.deliveryMobile}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_deliveryFax"><wa:mls>deliveryFax</wa:mls></label>
						<textarea name="f_deliveryFax" class="textfield">${bean.deliveryFax}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_deliveryBirthdate"><wa:mls>deliveryBirthdate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_deliveryBirthdate" name="f_deliveryBirthdate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.deliveryBirthdate}"/>" maxlength="10" />
					</div>
					<div class="bgWhite">
						<label for="f_deliveryCompanyName"><wa:mls>deliveryCompanyName</wa:mls></label>
						<textarea name="f_deliveryCompanyName" class="textfield">${bean.deliveryCompanyName}</textarea>
					</div>
			</fieldset>--%>
			<fieldset>
				<legend><wa:mls>Order informations</wa:mls></legend>
				<div class="bgGrey">
					<label for="f_deliveryComment"><wa:mls>deliveryComment</wa:mls> </label>
					<textarea name="f_deliveryComment" class="textfield">${bean.deliveryComment}</textarea>
				</div>	
				<div class="bgWhite">
					<label for="f_orderComment"><wa:mls>orderComment</wa:mls> </label>
					<textarea name="f_orderComment" class="textfield">${bean.orderComment}</textarea>
				</div>	
				<div class="bgGrey">
					<label for="f_tvaNumber"><wa:mls>tvaNumber</wa:mls> </label>
					<textarea name="f_tvaNumber" class="textfield">${bean.tvaNumber}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_totalBeforeDiscount"><wa:mls>totalBeforeDiscount</wa:mls> </label>
					<textarea name="f_totalBeforeDiscount" class="textfield">${bean.totalBeforeDiscount}</textarea>
				</div>
				<div class="bgGrey">
					<label for="f_discountValue"><wa:mls>discountValue</wa:mls> </label>
					<textarea name="f_discountValue" class="textfield">${bean.discountValue}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_total"><wa:mls>total</wa:mls> </label>
					<textarea name="f_total" class="textfield">${bean.total}</textarea>
				</div>
				<div class="bgGrey">
				<center>	<a href="${context}/admin/esOrderLine/esOrderLineList.do?s_esOrder_orderId=${bean.orderId}&s_submit=Search"><wa:mls>Voir les lignes de commandes</wa:mls></a></center>
				</div>
				<!-- <div class="bgGrey">
					<label for="f_shippingCost"><wa:mls>shippingCost</wa:mls> </label>
					<textarea name="f_shippingCost" class="textfield">${bean.shippingCost}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_wishedDeliveryDate"><wa:mls>wishedDeliveryDate</wa:mls></label>
					<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_wishedDeliveryDate" name="f_wishedDeliveryDate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.wishedDeliveryDate}"/>" maxlength="10" />
				</div>
				<div class="bgGrey">
					<label for="f_realDeliveryDate"><wa:mls>realDeliveryDate</wa:mls></label>
					<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_realDeliveryDate" name="f_realDeliveryDate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.realDeliveryDate}"/>" maxlength="10" />
				</div> -->
			</fieldset>
			<c:if test="${bean.type != 'BROCHURE'}">
			<fieldset>
				<legend><wa:mls>Ogone informations</wa:mls></legend>
				<div class="bgGrey">
					<label for="f_ogonePayid"><wa:mls>ogonePayid</wa:mls> </label>
					<textarea name="f_ogonePayid" class="textfield">${bean.ogonePayid}</textarea>
				</div>	
				<div class="bgWhite">
					<label for="f_ogoneAcceptanceFlag"><wa:mls>ogoneAcceptanceFlag</wa:mls> </label>
					<textarea name="f_ogoneAcceptanceFlag" class="textfield">${bean.ogoneAcceptanceFlag}</textarea>
				</div>	
				<div class="bgGrey">
					<label for="f_ogoneStatus"><wa:mls>ogoneStatus</wa:mls> </label>
					<textarea name="f_ogoneStatus" class="textfield">${bean.ogoneStatus}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_ogoneNcerror"><wa:mls>ogoneNcerror</wa:mls> </label>
					<textarea name="f_ogoneNcerror" class="textfield">${bean.ogoneNcerror}</textarea>
				</div>
				<div class="bgGrey">
					<label for="f_ogonePmFlag"><wa:mls>ogonePmFlag</wa:mls> </label>
					<textarea name="f_ogonePmFlag" class="textfield">${bean.ogonePmFlag}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_ogoneBrandName"><wa:mls>ogoneBrandName</wa:mls> </label>
					<textarea name="f_ogoneBrandName" class="textfield">${bean.ogoneBrandName}</textarea>
				</div>
				<div class="bgGrey">
					<label for="f_ogoneCvcCheck"><wa:mls>ogoneCvcCheck</wa:mls> </label>
					<textarea name="f_ogoneCvcCheck" class="textfield">${bean.ogoneCvcCheck}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_ogoneAvvCheck"><wa:mls>ogoneAvvCheck</wa:mls> </label>
					<textarea name="f_ogoneAvvCheck" class="textfield">${bean.ogoneAvvCheck}</textarea>
				</div>
				<div class="bgGrey">
					<label for="f_ogoneIp"><wa:mls>ogoneIp</wa:mls> </label>
					<textarea name="f_ogoneIp" class="textfield">${bean.ogoneIp}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_generalConditionFlag"><wa:mls>generalConditionFlag</wa:mls> </label>
					<textarea name="f_generalConditionFlag" class="textfield">${bean.generalConditionFlag}</textarea>
				</div>
				<div class="bgGrey">
					<label for="f_orderIdAfterPayment"><wa:mls>orderIdAfterPayment</wa:mls> </label>
					<textarea name="f_orderIdAfterPayment" class="textfield">${bean.orderIdAfterPayment}</textarea>
				</div>
			</fieldset>	
			
			<fieldset>	
				<legend><wa:mls>Dates informations</wa:mls></legend>
				<div class="bgGrey">
					<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.createdOn}"/></span>
				</div>
				<div class="bgWhite">
					<label for="f_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.modifiedOn}"/></span>
				</div>
				<div class="bgGrey">
					<label for="f_statusPayingDate"><wa:mls>statusPayingDate</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.statusPayingDate}"/></span>
				</div>
				<div class="bgWhite">
					<label for="f_statusCheckDate"><wa:mls>statusCheckDate</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.statusCheckDate}"/></span>
				</div>
				<div class="bgGrey">
					<label for="f_statusDubiousDate"><wa:mls>statusDubiousDate</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.statusDubiousDate}"/></span>
				</div>
				<div class="bgWhite">
					<label for="f_statusTimeoutDate"><wa:mls>statusTimeoutDate</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.statusTimeoutDate}"/></span>
				</div>
				<div class="bgGrey">
					<label for="f_statusCanceledDate"><wa:mls>statusCanceledDate</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.statusCanceledDate}"/></span>
				</div>
				<div class="bgWhite">
					<label for="f_statusRefusedDate"><wa:mls>statusRefusedDate</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.statusRefusedDate}"/></span>
				</div>
				<div class="bgGrey">
					<label for="f_statusPaidDate"><wa:mls>statusPaidDate</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.statusPaidDate}"/></span>
				</div>
				<div class="bgWhite">
					<label for="f_statusSendDate"><wa:mls>statusSendDate</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.statusSendDate}"/></span>
				</div>
			</fieldset>	
			</c:if>
			
			<div id="errorMessage">
				<c:if test="${waParam.msgError != null}">
					<img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
					<wa:mls>${waParam.msgError}</wa:mls>
				</c:if>
			</div>
			<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
		</form>
	</div>
</div>
</div>	
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.orderId}';
</script>
<!--tool boxes:end-->
