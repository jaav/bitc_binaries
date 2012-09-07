<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="wa" uri="WanabeTags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="${static}/front/css/nyroModal.css" media="screen, projection" />
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.datepicker.css" media="screen, projection" />
<link rel="stylesheet" type="text/css" href="${static}/front/css/jquery.ui.theme.css" media="screen, projection" />
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationSelect_search.css" media="screen, projection" />
<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationSelect.css" media="screen, projection" />
<script type="text/javascript" src="${staticSite}/js/SpryValidationTextField.js"></script>



<script type="text/javascript" src="${static}/front/js/jquery.nyroModal-1.6.2.min.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${static}/front/js/jquery.ui.datepicker-${culture.language}.js"></script>
<link rel="stylesheet" type="text/css" href="${staticSite}/css/SpryValidationTextField_shop.css" media="screen, projection" />
<script type="text/javascript" src="${static}/front/js/SpryValidationSelect.js"></script>


<script type="text/javascript">

var numProductWithDate = 0;

function formRecalculate(){
	var errorFlag=false;
	
	//
	$("#submitType").attr("value","recalculate");
	//
	for(i=1; i<=numProductWithDate; i++){
		
		if(!eval("spry" +i+ ".validate()" )){
			errorFlag=true;
		}
	}
	//
	for(i=1; i<=${fn:length(listBrochProduct)}; i++){
		eval("var sprySelect" +i+ " = new Spry.Widget.ValidationSelect(\"spry_language_product_"+i+"\")" );
			
		if(!eval("sprySelect" +i+ ".validate()" )){
			errorFlag=true;
		}
	}
	if(!errorFlag){
		$("#basketForm").submit();
	}
}

function formNext(){
	var errorFlag=false;
	//
	$("#submitType").attr("value","next");
	// Validate Eshop product
	for(i=1; i<=numProductWithDate; i++){
		if(!eval("spry" +i+ ".validate()" )){
			errorFlag=true;
		}
	}
	// Validate the Brochure products
	for(i=1; i<=${fn:length(listBrochProduct)}; i++){
		eval("var sprySelect" +i+ " = new Spry.Widget.ValidationSelect(\"spry_language_product_"+i+"\")" );
			
		if(!eval("sprySelect" +i+ ".validate()" )){
			errorFlag=true;
		}
	}
	
	// Check if exist errors
	if(!errorFlag){
		$("#basketForm").submit();
	}
}


/*CALCULATOR*/		
$(document).ready(function(){
						   
	$(".operator_add, .operator_minus").click( function() {
										
		var valueNum = $(this).parent().parent().children("input").val();	
		
		if($(this).hasClass("operator_add")){
			valueNum ++
		}
		if($(this).hasClass("operator_minus")){
			valueNum --
		}

		if(valueNum < 0){
			valueNum=0;
		}else if(  valueNum > 999){
			valueNum=999;	
		}
		
		$(this).parent().parent().children("input").val(valueNum)
		return false;
	} );
	//AVOID NEGATIVE VALUE
	$('input').blur(function() {
		var valueNum = $(this).val();
		if(valueNum < 0){
			valueNum=0;
		}else if(  valueNum > 999){
			valueNum=999;	
		}
		$(this).val(valueNum)
	});
	
    $('a.modalopener').nyroModal();
	
})
</script>

<!--contentMain:start-->
<div id="content_main">
	<h1 class="line_pink">
		<wa:mls>ACHETER EN LIGNE</wa:mls>
	</h1>
	<!--nav_eshop:start-->
	<ul id="nav_eshop">
		<li class="select"><b>1. <wa:mls>Mon panier</wa:mls></b></li>
		<li><b>2. <wa:mls>Coordonnées</wa:mls></b></li>
		<li><b>3. <wa:mls>Récapitulatif</wa:mls></b></li>
		<li><b>4. <wa:mls>Paiement</wa:mls></b></li>
		<li><b>5. <wa:mls>Impression des vouchers</wa:mls></b></li>
	</ul>
	<!--nav_eshop:end-->
	<br clear="all" />
	<div class="clr"></div>
	<hr class="dashed" />

	<c:choose>
		<c:when test="${empty listEshopProduct and empty listBrochProduct}">
			<p>
				<wa:mls>votre panier est vide</wa:mls>
		</c:when>
		<c:otherwise>
			<form id="basketForm" action="${context}/${site}/${module}/fillPrices.do" method="get">

				<input id="submitType" name="submitType" type="hidden" value="none" />

				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="basket">
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
								<wa:mls>Remise</wa:mls>
							</h4></td>
						<td>&nbsp;</td>
						<td><h4 class="no_margin">
								<wa:mls>Coupon Code</wa:mls>
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
						<td>&nbsp;</td>
					</tr>

					<%-- ${item.key.value*item.value}?--%>
					<c:set var="numProductWithDate" value="0" />
					<c:forEach var="item" items="${listEshopProduct}" varStatus="loop">
						<c:if test="${loop.count>1}">
							<tr>
								<td colspan="9">
									<hr / class="m17">
								</td>
							</tr>
						</c:if>
						<tr>
							<td class="article">${item.mainTitle}</td>
							<td class="space">&nbsp;</td>

							<c:choose>
								<%-- date for ES_VOUCHER --%>
								<c:when test="${item.group == 'ES_VOUCHER'}">
									<c:choose>
										<c:when test="${item.listEnableDate==null}">
											<!-- => disable Date || disableDayOfWeek -->
											<script>
			        	var enableDate_${loop.count}=[];
			        	var disableDayOfWeek_${loop.count}=${item.disableDayOfWeek};
			        	<c:choose>
			        	
				        	<c:when test="${item.listDisableDate != null && fn:length(item.listDisableDate)>0}">
			        		var disableDate_${loop.count} = [<c:forEach var="date" items="${item.listDisableDate}" varStatus="loopDates">
			        			<fmt:formatDate value="${date}" pattern="[dd,MM,yyyy]" />
			        		</c:forEach>];
			        		</c:when>
		        			<c:otherwise>
		        				var disableDate_${loop.count} =[];
		        			</c:otherwise>
		        		</c:choose>
			        	<c:set var="numProductWithDate" value="${numProductWithDate+1}" />
			        	/*Date Picker Available Days*/
			        	function isCheckable_${loop.count}(day){
			        		/*
			        			Force Enable Day
			        		*/
			        		for(var k=0;k<enableDate_${loop.count}.length;k++){
			        			if(enableDate_${loop.count}[k][2]==0 && day.getDate() ==enableDate_${loop.count}[k][0] && day.getMonth() ==(enableDate_${loop.count}[k][1]-1) ){
			        				return [1,""];	
			        			}else	if(day.getDate() ==enableDate_${loop.count}[k][0] && day.getMonth() ==(enableDate_${loop.count}[k][1]-1)  &&  day.getFullYear() == enableDate_${loop.count}[k][2]){
			        				
			        				 return [1,""];	
			        			}	
			        		}
			        		/*
			        			Disable date & day
			        		*/
			        		
			        		/*Day of week*/
			        		for(var j=0;j<disableDayOfWeek_${loop.count}.length;j++){
			        				if(day.getDay()==disableDayOfWeek_${loop.count}[j]){
			        					return [0,""];	
			        				}
			        		}
			        		for(var i=0;i<disableDate_${loop.count}.length;i++){
			        			/*Bloc from weeks day*/
			        			 if(disableDate_${loop.count}[i][2]==0 && day.getDate() ==disableDate_${loop.count}[i][0] && day.getMonth() ==(disableDate_${loop.count}[i][1]-1) ){
			        				return [0,""];	
			        			}else	if(day.getDate() ==disableDate_${loop.count}[i][0] && day.getMonth() ==(disableDate_${loop.count}[i][1]-1)  &&  day.getFullYear() == disableDate_${loop.count}[i][2]){
			        				
			        				 return [0,""];	
			        			}	
			        		}
			        		return [1,""];			
			        	}

						$(function() {
					  		$("#datePicker_${loop.count}").datepicker({
							showOn: 'button',
							buttonImage: '${static}/front/img/ml/calendar.gif',
							buttonImageOnly: true,		
							minDate: '+${daysBeforePrestation}D', 
							maxDate: '+1Y',
							beforeShowDay: isCheckable_${loop.count},
							onSelect: function(dateText, inst) { 			 	
								var day=dateText.substr(0,2);
								var month=dateText.substr(3,2);
								var year=dateText.substr(6,4);
								var monthYear=year+"-"+month;
								//alert(day +" "+monthYear)
							}
							})
					  	  });
			  			</script>
											<td class="date" valign="top"><span id="tfv_date_product_${item.id}"> <input name="date_product_${item.id}" type="text" id="datePicker_${loop.count}" class="datepicker"
													value="<fmt:formatDate value="${item.selectedDate}" pattern="dd/MM/yyyy" />" />
													<div class="textfieldRequiredMsg clr">
														<wa:mls>Ce champ est obligatoire</wa:mls>
													</div>
													<div class="textfieldInvalidFormatMsg clr">
														<wa:mls>Veuillez entrer une date au format JJ/MM/AAAA</wa:mls>
													</div>
											</span></td>
											<script>
		          			var spry${numProductWithDate} = new Spry.Widget.ValidationTextField("tfv_date_product_${item.id}", "date", {format:"dd/mm/yyyy", pattern:"00/00/0000", validateOn:["blur"], useCharacterMasking:true, isRequired:true});
		          			numProductWithDate = ${numProductWithDate}; 
		          		</script>
										</c:when>
										<c:when test="${item.listEnableDate != null && fn:length(item.listEnableDate) == 1}">
											<!-- only one date -->
											<td class="date"><input name="date_product_${item.id}" type="text" class="datepicker" value="<fmt:formatDate value="${item.listEnableDate[0]}" pattern="dd/MM/yyyy" />"
												readonly="readonly" /></td>
										</c:when>
										<c:when test="${item.listEnableDate != null && fn:length(item.listEnableDate) >= 1}">

											<td class="date"><span id="tfv_date_product_${item.id}"> <select id="date_product_${item.id}" name="date_product_${item.id}">
														<option value="">
															<wa:mls>Choisissez</wa:mls>
														</option>
														<c:forEach var="date" items="${item.listEnableDate}" varStatus="loopDates">
															<option value="<fmt:formatDate value="${date}" pattern="dd/MM/yyyy" />">
																<fmt:formatDate value="${date}" pattern="dd/MM/yyyy" />
															</option>
														</c:forEach>
												</select>
													<div class="selectRequiredMsg clr">
														<wa:mls>Veuillez faire un choix</wa:mls>
													</div>
											</span></td>
											<script>
				      	 var spry${numProductWithDate} = new Spry.Widget.ValidationSelect("tfv_date_product_${item.id}", {validateOn:["blur, change"]});
				      	 numProductWithDate = ${numProductWithDate}; 
				        </script>
										</c:when>
									</c:choose>
								</c:when>
								<c:otherwise>
									<td class="date"></td>
								</c:otherwise>
							</c:choose>
							<td class="space">&nbsp;</td>


							<td class="promos"><c:if test="${not empty item.catalogPromos}">
									<a href="#discountinfo_${item.id}" class="modalopener"><wa:mls>Yes</wa:mls></a>
								</c:if></td>
							<td class="space">&nbsp;</td>

							<div style="display: none; width: 600px;" id="discountinfo_${item.id}">
								<!-- sizeof list prices ${fn:length(item.catalogPrices)} -->
								<ul>
									<c:forEach var="promo" items="${item.catalogPromos}" varStatus="loopPrices">
										<li class="catalogPromo"><span style="font-weight: bold;"><wa:mls>Promotion</wa:mls> "${promo.catalogPromoType.titleDefault}":</span>
											${promo.catalogPromoType.catalogPromoTypeClts[culture.culture].description}<br />
											<ul style="margin-left: 20px; margin-bottom: 12px;">
												<li><wa:mls>Discount</wa:mls>: <strong>${promo.promoValue} &euro;</strong></li>
											</ul></li>
									</c:forEach>
								</ul>
							</div>

							<td class="promoCode"><input type="text" name="promoCode_product_${item.id}" size="12" class="float_right" value="${item.givenPromo.promoCode}" /></td>
							<td class="space">&nbsp;</td>

							<!-- sizeof list prices ${fn:length(item.catalogPrices)} -->
							<c:forEach var="price" items="${item.catalogPrices}" varStatus="loopPrices">
								<c:if test="${price.isActive}">
									<c:if test="${loopPrices.count != 1}">
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
									</c:if>
									<td class="price">${price.mainTitle}<br /> <strong>${price.value} &euro;</strong>
									</td>
									<td class="space">&nbsp;</td>
									<td class="quantity"><div class="float_left">
											<a href="javascript:void(0)" class="operator_add" alt="+"><img src="${static}/front/img/ml/addition.jpg" alt="+" /></a><br /> <a href="javascript:void(0)" class="operator_minus" alt="-"><img
												src="${static}/front/img/ml/minus.gif" alt="-" /></a>
										</div> <input name="quantity_product_${item.id}_price_${price.id}" type="text" id="quantity_product_${item.id}_price_${price.id}" value="${price.quantity}" size="4" class="float_right" /></td>
									<td class="space">&nbsp;</td>
									<td class="dustbin"><a href="${context}/${site}/${module}/deleteProduct/productId/${item.id}.do"><img src="${static}/front/img/ml/visu_dustbin.jpg" alt="delete" /></a></td>
						</tr>

						</c:if>
					</c:forEach>

					</c:forEach>
				</table>
				<!-- Segment for Brochure products -->
				<c:if test="${not empty listBrochProduct}">
					<br clear="all" />
					<div class="clr"></div>
					<hr class="dashed" />
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="basket">
						<tr>
							<td><h4 class="no_margin">
									<wa:mls>Articles dans votre panier</wa:mls>
								</h4></td>
							<td>&nbsp;</td>
							<td><h4 class="no_margin">
									<wa:mls>Langue</wa:mls>
								</h4></td>
							<td>&nbsp;</td>
							<td><h4 class="no_margin">
									<wa:mls>Coupon Code</wa:mls>
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
							<td>&nbsp;</td>
						</tr>

						<c:forEach var="item" items="${listBrochProduct}" varStatus="loop">
							<c:if test="${loop.count>1}">
								<hr / class="m17">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="basket">
									</c:if>
									<tr>
										<td class="article">${item.mainTitle}</td>
										<td class="space">&nbsp;</td>

										<td class="date"><span id="spry_language_product_${loop.count}"> <select id="language_product_${item.id}" name="language_product_${item.id}">
													<option>
														<wa:mls>Choisissez</wa:mls>
													</option>
													<c:forEach var="language" items="${item.listLinkPropertyValueLanguage}">
														<option value="${language.valueName}" <c:if test="${item.language == language.valueName}"> selected="selected" </c:if>>${language.valueName}</option>
													</c:forEach>
											</select>
												<div class="clr"></div>
												<div class="selectRequiredMsg clr" style="margin-left: 0; width: auto; color: #fa869b;">
													<wa:mls>Veuillez faire un choix</wa:mls>
												</div>
										</span></td>
										<td class="space">&nbsp;</td>
										<td class="promoCode"><input type="text" name="promoCode_product_${item.id}" size="12" class="float_right" value="${item.givenPromo.promoCode}" /></td>
										<td class="space">&nbsp;</td>
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
												<td class="price">${price.mainTitle}<br /> <strong>${price.value} &euro;</strong>
												</td>
												<td class="space">&nbsp;</td>
												<td class="quantity"><div class="float_left">
														<a href="javascript:void(0)" class="operator_add" alt="+"><img src="${static}/front/img/ml/addition.jpg" alt="+" /></a><br /> <a href="javascript:void(0)" class="operator_minus"
															alt="-"><img src="${static}/front/img/ml/minus.gif" alt="-" /></a>
													</div> <input name="quantity_product_${item.id}_price_${price.id}" type="text" id="quantity_product_${item.id}_price_${price.id}" value="${price.quantity}" size="4" class="float_right" /></td>
												<td class="space">&nbsp;</td>
												<td class="dustbin"><a href="${context}/${site}/${module}/deleteProduct/productId/${item.id}.do"><img src="${static}/front/img/ml/visu_dustbin.jpg" alt="delete" /></a></td>
									</tr>
									</c:if>
									</c:forEach>
									<c:if test="${loop.count < fn:length(listBrochProduct)}">
								</table>
							</c:if>
						</c:forEach>
					</table>
				</c:if>
			</form>
			<div class="clr"></div>
			<c:if test="${errorEshop != null}">
				<div class="error_eshop">
					<wa:mls>${errorEshop}</wa:mls>
				</div>
			</c:if>
			<div class="box_total">
				<a href="javascript:formRecalculate();" class="btn_update"><wa:mls>Recalculer</wa:mls></a> <a href="${context}/${site}/${module}/emptyBasket.do" class="btn_update"><wa:mls>Vider le panier</wa:mls></a>
				<div class="group">
					<span><wa:mls>PRIX NORMAL</wa:mls> : ${totalBeforePromo} &euro;</span>
					<c:if test="${promo >0}">
						<span class="promo"><wa:mls>PROMO</wa:mls> : -${promo} &euro;</span>
					</c:if>
					<span><wa:mls>TOTAL ARTICLES TTC</wa:mls> : ${total} &euro;</span>
				</div>
				<div class="clr"></div>
			</div>
			<a href="javascript:history.back();" class="btn_previous_eshop float_left"><wa:mls>Précédent</wa:mls></a>
			<a href="javascript:formNext();" class="btn_next_eshop_arrow float_right"><wa:mls>Suivant</wa:mls></a>
			<div class="clr"></div>

		</c:otherwise>
	</c:choose>
</div>
<!--contentMain:end-->
