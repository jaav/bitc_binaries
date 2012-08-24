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
<h2><wa:mls>EsOrderLine - Edit</wa:mls></h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend><wa:mls>OrderLine informations</wa:mls></legend>
				<div class="bgWhite">
					<label for="f_orderLineId"><wa:mls>orderLineId</wa:mls></label>
					<span>${bean.orderLineId}</span>
					<input name="id" type="hidden" value="${bean.orderLineId}"/>
					<input name="f_orderLineId" type="hidden" value="${bean.orderLineId}"/>
				</div>
				<div class="bgGrey">
					<label for="f_esOrder_orderId"><wa:mls>orderId</wa:mls></label>
					<span>${bean.esOrder.orderId}</span>
					<input name="f_esOrder_orderId" type="hidden" value="${bean.esOrder.orderId}"/>
				</div>
				<div class="bgWhite">
					<label for="f_reference"><wa:mls>reference</wa:mls></label>
					<span>${bean.reference}</span>
				</div>
				<div class="bgGrey">
					<label for="f_productId"><wa:mls>catalogProduct</wa:mls></label>
					<span>${productTitle}</span>
				</div>
				<c:if test="${not empty priceTitle}">
					<div class="bgWhite">
						<label for="f_priceId"><wa:mls>catalogPrice</wa:mls></label>
						<span>${priceTitle}</span>
					</div>
				</c:if>
				<div class="bgWhite">
					<label for="f_unitPrice"><wa:mls>unitPrice</wa:mls></label>
					<span>${bean.unitPrice}</span>
				</div>
				<div class="bgGrey">
					<label for="f_quantity"><wa:mls>quantity</wa:mls></label>
					<span>${bean.quantity}</span>
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
			</fieldset>
			<div id="errorMessage">
				<c:if test="${waParam.msgError != null}">
					<img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
					<wa:mls>${waParam.msgError}</wa:mls>
				</c:if>
			</div>
			<div id="containerButton">
				<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
			
			</div>
		</form>
	</div>
</div>
</div>	
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.orderLineId}';
</script>
<!--tool boxes:end-->
