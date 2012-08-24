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
						<label ><wa:mls>orderId</wa:mls></label>
						<span>${bean.orderId}</span>
						<input name="id" type="hidden" value="${bean.orderId}"/>
						<input name="f_orderId" type="hidden" value="${bean.orderId}"/>
					</div>
					<div class="bgWhite">
						<label ><wa:mls>Deals.id</wa:mls></label>
						<span>${bean.contentDeals.id}</span>
						
					</div>
					<div class="bgGrey">
						<label for="f_orderOn"><wa:mls>orderStatus</wa:mls></label>
						<span>${bean.orderStatus}</span>
					</div>
					
				</fieldset>
				<div class="clr"></div>
			<fieldset>
				<legend><wa:mls>Order informations</wa:mls></legend>
				
				
				<div class="bgWhite">
					<label for="f_total"><wa:mls>total</wa:mls> </label>
					<span>${bean.total}</span>
				</div>
				
			</fieldset>
	<div class="clr"></div>
			<fieldset>
				<legend><wa:mls>Ogone informations</wa:mls></legend>
				<div class="bgGrey">
					<label for="f_ogonePayid"><wa:mls>ogonePayid</wa:mls> </label>
					<span>${bean.ogonePayid}</span>
				</div>	
				<div class="bgWhite">
					<label for="f_ogoneAcceptanceFlag"><wa:mls>ogoneAcceptanceFlag</wa:mls> </label>
					<span>${bean.ogoneAcceptanceFlag}</span>
				</div>	
				<div class="bgGrey">
					<label for="f_ogoneStatus"><wa:mls>ogoneStatus</wa:mls> </label>
					<span>${bean.ogoneStatus}</span>
				</div>
				<div class="bgWhite">
					<label for="f_ogoneNcerror"><wa:mls>ogoneNcerror</wa:mls> </label>
					<span>${bean.ogoneNcerror}</span>
				</div>
				<div class="bgGrey">
					<label for="f_ogonePmFlag"><wa:mls>ogonePmFlag</wa:mls> </label>
					<span>${bean.ogonePmFlag}</span>
				</div>
				<div class="bgWhite">
					<label for="f_ogoneCvcCheck"><wa:mls>ogoneCvcCheck</wa:mls> </label>
					<span>${bean.ogoneCvcCheck}</span>
				</div>
				<div class="bgGrey">
					<label for="f_ogoneAvvCheck"><wa:mls>ogoneAvvCheck</wa:mls> </label>
					<span>${bean.ogoneAvvCheck}</span>
				</div>
				<div class="bgWhite">
					<label for="f_ogoneIp"><wa:mls>ogoneIp</wa:mls> </label>
					<span>${bean.ogoneIp}</span>
				</div>
				
			</fieldset>	
		<div class="clr"></div>	
			<fieldset>	
				<legend><wa:mls>Date informations</wa:mls></legend>
				<div class="bgGrey">
					<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.createdOn}"/></span>
				</div>
				<div class="bgWhite">
					<label for="f_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.modifiedOn}"/></span>
				</div>
				<div class="bgGrey">
					<label for="f_orderStatusPayingOn"><wa:mls>statusPayingOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.orderStatusPayingOn}"/></span>
				</div>
				<div class="bgWhite">
					<label for="f_orderStatusCheckOn"><wa:mls>orderStatusCheckOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.orderStatusCheckOn}"/></span>
				</div>
				<div class="bgGrey">
					<label for="f_orderStatusDubiousOn"><wa:mls>orderStatusDubiousOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.orderStatusDubiousOn}"/></span>
				</div>
				<div class="bgWhite">
					<label for="f_orderStatusTimeoutOn"><wa:mls>orderStatusTimeoutOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.orderStatusTimeoutOn}"/></span>
				</div>
				<div class="bgGrey">
					<label for="f_orderStatusCanceledOn"><wa:mls>orderStatusCanceledOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.orderStatusCanceledOn}"/></span>
				</div>
				<div class="bgWhite">
					<label for="f_orderStatusRefusedOn"><wa:mls>orderStatusRefusedOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.orderStatusRefusedOn}"/></span>
				</div>
				<div class="bgGrey">
					<label for="f_orderStatusPaidOn"><wa:mls>orderStatusPaidOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.orderStatusPaidOn}"/></span>
				</div>
				<div class="bgWhite">
					<label for="f_orderStatusSentOn"><wa:mls>orderStatusSentOn</wa:mls></label>
					<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.orderStatusSentOn}"/></span>
				</div>
			</fieldset>	
	
			
			<div id="errorMessage">
				<c:if test="${waParam.msgError != null}">
					<img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
					<wa:mls>${waParam.msgError}</wa:mls>
				</c:if>
			</div>
			
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
