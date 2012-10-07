<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField_shop.css" media="screen, projection" />
<div id="mainContent">
	<div id="toolBox">
		<div class="content" id="actions">
			<a href="javascript:void(0);" id="back_btn"><wa:mls>Back to List</wa:mls></a>
			<c:if test="${legend != null}">
				<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
			</c:if>
			<div class="clr"></div>
		</div>
	</div>
	<h2>
		<wa:mls>Catalog Promo</wa:mls>
		&nbsp;-&nbsp;
		<c:if test="${bean==null || bean.id<=0}">
			<wa:mls>(Add)</wa:mls>
		</c:if>
		<c:if test="${bean!=null && bean.id>0}">
			<wa:mls>(Edit)</wa:mls>
		</c:if>
	</h2>
	<div id="list">
		<div id="mask">
			<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" name="detailForm">
				<fieldset>
					<legend>&nbsp;</legend>
					<c:if test="${bean!=null && bean.id>0}">
						<div class="bgWhite">
							<label for="f_id"><wa:mls>id</wa:mls></label> <span>${bean.id}</span> <input name="id" type="hidden" value="${bean.id}" />
						</div>
					</c:if>

					<div class="bgWhite">
						<label for="f_catalogPrice_id"><wa:mls>catalog Price</wa:mls></label>

						<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.bitc.catalog.hdata.CatalogPrice" />
							<wa:param name="manager" value="com.bitc.catalog.hdata.manager.CatalogPriceManager" />
							<wa:param name="method" value="listAll" />
							<wa:param name="identity" value="id" />
							<wa:param name="display" value="nameForAdmin" />
							<wa:param name="choiceMsg" value="Choose the product's Price" />
							<wa:param name="name" value="f_catalogPrice_id" />
							<wa:param name="selectedValues" value="${bean.catalogPrice.id}" />
						</wa:include>
					</div>


					<div class="bgGrey">
						<label for="f_catalogPromoType_id"><wa:mls>catalog Promo</wa:mls></label>

						<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.bitc.catalog.hdata.CatalogPromoType" />
							<wa:param name="manager" value="com.bitc.catalog.hdata.manager.CatalogPromoTypeManager" />
							<wa:param name="method" value="listAll" />
							<wa:param name="identity" value="id" />
							<wa:param name="display" value="titleDefault" />
							<wa:param name="choiceMsg" value="Choose the Promo type" />
							<wa:param name="name" value="f_catalogPromoType_id" />
							<wa:param name="selectedValues" value="${bean.catalogPromoType.id}" />
						</wa:include>
					</div>

					<div class="bgWhite">
						<label for="f_promoValue"><wa:mls>Discount</wa:mls></label> <input type="text" id="f_promoValue" name="f_promoValue" value="${bean.promoValue}" />
					</div>
					
										
					<div id="tf_code">
						<label for="f_code"><wa:mls>Promo Code</wa:mls></label>
						<input type="text" id="f_code" name="f_code" value="${bean.promoCode}" />
					</div>
					
				</fieldset>
				<div class="clr"></div>
				<div id="ajaxProperties"></div>
				<div id="errorMessage">
					<c:if test="${waParam.msgError != null}">
						<img src="${static}/${site}/img/stop.png" alt="<wa:mls>Error</wa:mls>" />
						<wa:mls>${waParam.msgError}</wa:mls>
					</c:if>
				</div>
				<div id="containerButton">
					<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>" /> 
					<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script type="text/javascript" src="${static}/${site}/fckeditor/fckeditor.js"></script>

<script>
	path = '${context}/${site}/${module}';
	idName = '${bean.id}';
</script>
<script type="text/javascript">
	var TP1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
