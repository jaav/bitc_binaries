<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"
	%>
<%@ taglib prefix="wa" uri="WanabeTags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="${static}/front/js/SpryValidationTextField.js"></script>

<link rel="stylesheet" type="text/css" href="${static}/front/css/SpryValidationTextField.css"
      media="screen, projection"/>
<link href="${static}/${site}/css/datepicker.css" rel="stylesheet" type="text/css" media="screen"/>
<!-- javascripts -->
<script type="text/javascript" src="${static}/front/js/datepicker.js"></script>

<div class="form_search">
	<div>
		<h3 class="no_margin"><wa:mls>Recherchez</wa:mls></h3>

		<div class="arrow"></div>
		<form action="<wa:url URI="${site}/${module}/display/all/${waParam.all}"/>" method="get" class="search">

			<input type="hidden" name="group" value="${waParam.group}"/>
			<input type="hidden" name="contentType" value="${contentType}"/>
			<input type="hidden" name="name" value="${waParam.name}">

			<input type="text" name="f_search_query" value="${waParam.f_search_query}"/>
			<input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form"/>

			<div class="arrow"></div>
			<c:if
				test="${group eq 'SHOPPING' || group eq 'RESTO_1' || group eq 'CULTURE_1'|| group eq 'GO_OUT' or group eq 'BFOSPOT' or group eq 'BFOCOMPANY' or group eq 'GUIDED_TOUR'}">
				<a onClick="changeDisplay()"
				   class="<c:if test="${ind == '0'}">advanced_search </c:if> <c:if test="${ind == '1'}">advanced_search_active </c:if>"
				   id="advanced_search_id"><wa:mls>Advanced search</wa:mls></a>


				<div class="clr"></div>

				<div style="
				<c:if test="${ind == '0'}">display:none</c:if> <c:if test="${ind == '1'}">display:block</c:if>"
				     id="advanced_search">

					<c:if test="${group eq 'CULTURE_1'|| group eq 'GO_OUT' || showAllFixDateGuide}">
						<input type="hidden" name="tours_type" value="fixed"/>
						<div class="align_left">
							<label for="s_periodFromDate"><wa:mls>Du: </wa:mls></label>
							<script>
								$(function () {
									$("#s_periodFromDate").datepicker({
										showOn: 'button',
										buttonImage: '${static}/front/img/ml/calendar.gif',
										buttonImageOnly: true,
										minDate: '+0D',
										maxDate: '+2Y',
										onSelect: function (dateText, inst) {
											var day = dateText.substr(0, 2);
											var month = dateText.substr(3, 2);
											var year = dateText.substr(6, 4);
											var monthYear = year + "-" + month;
										}
									})
								});
							</script>

							<input name="s_periodFromDate" type="text" id="s_periodFromDate" class="datepicker"
							       value="${s_periodFromDate}"/>
						</div>

						<div class="align_right">
							<label for="s_periodToDate"><wa:mls>Au: </wa:mls></label>
							<script>
								$(function () {
									$("#s_periodToDate").datepicker({
										showOn: 'button',
										buttonImage: '${static}/front/img/ml/calendar.gif',
										buttonImageOnly: true,
										minDate: '+0D',
										maxDate: '+2Y',
										onSelect: function (dateText, inst) {
											var day = dateText.substr(0, 2);
											var month = dateText.substr(3, 2);
											var year = dateText.substr(6, 4);
											var monthYear = year + "-" + month;
										}
									})
								});
							</script>
							<input name="s_periodToDate" type="text" id="s_periodToDate" class="datepicker"
							       value="${s_periodToDate}"/>
						</div>
					</c:if>
					<c:if test="${showAllOnRequestGuide}">
						<input type="hidden" name="tours_type" value="onrequest"/>
					</c:if>


					<c:if test="${group eq 'RESTO_1' or group eq 'RESTO_NIGHT' or group eq 'BREAKFAST'}">
						<div class="clr"></div>
						<div id="ListTypeCuisine" class="align_left">
							<label for="s_ContentPropertyValue_valueId_Cuisine"><wa:mls>Type de cuisine</wa:mls></label>
							<wa:include URI="front/dropdown/dropList">
								<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue"/>
								<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager"/>
								<wa:param name="method" value="listCuisinesTypes"/>
								<wa:param name="identity" value="valueId"/>
								<wa:param name="display" value="mainTitle"/>
								<wa:param name="name" value="s_ContentPropertyValue_valueId_Cuisine"/>
								<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValue_valueId_Cuisine}"/>
							</wa:include>
						</div>
						<div id="ListQuartiers" class="align_right">
							<label for="s_ContentPropertyValueManager_valueId_Quartier"><wa:mls>Quartiers</wa:mls></label>
							<wa:include URI="front/dropdown/dropList">
								<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue"/>
								<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager"/>
								<wa:param name="method" value="listQuartiers"/>
								<wa:param name="identity" value="valueId"/>
								<wa:param name="display" value="mainTitle"/>
								<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Quartier"/>
								<wa:param name="selectedValues" value="${waParam.s_ContentPropertyValueManager_valueId_Quartier}"/>
							</wa:include>
						</div>
					</c:if>

					<c:if test="${group eq 'SHOPPING'}">
						<div class="clr"></div>
						<div id="ListShoppingCategory">
							<label
								for="s_ContentPropertyValueManager_valueId_ShoppingCategory"><wa:mls>Shopping Category</wa:mls></label>
							<wa:include URI="front/dropdown/dropList">
								<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue"/>
								<wa:param name="manager" value="com.bitc.cms.hdata.manager.ContentPropertyValueManager"/>
								<wa:param name="method" value="listShoppingCategory"/>
								<wa:param name="identity" value="valueId"/>
								<wa:param name="display" value="mainTitle"/>
								<wa:param name="name" value="s_ContentPropertyValueManager_valueId_ShoppingCategory"/>
								<wa:param name="selectedValues"
								          value="${waParam.s_ContentPropertyValueManager_valueId_ShoppingCategory}"/>
							</wa:include>
						</div>
					</c:if>

					<c:if test="${fn:toLowerCase(group) eq 'bfospot'}">
						<div id="ListSpotProfile">
							<label for="s_spotProfile"><wa:mls>Spot Profile</wa:mls></label>
							<select style=" width: 150px;" name="s_spotProfile">
								<option value=""><wa:mls>Select spot profile</wa:mls></option>
								<c:if test="${listDropdown!=null}">
									<c:forEach var="itemDropdown" items="${listDropdown}">
										<option value="${itemDropdown.id}" title="${itemDropdown.value}"
										        <c:if test="${itemDropdown.id==selectedId}">selected="selected"</c:if>>
												${itemDropdown.value}
										</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</c:if>
					<c:if test="${fn:toLowerCase(group) eq 'bfocompany'}">
						<label for="s_bfoService"><wa:mls>Service</wa:mls></label>
						<select style=" width: 150px;" name="s_bfoService">
							<option value=""><wa:mls>Select service</wa:mls></option>
							<c:if test="${listDropdown!=null}">
								<c:forEach var="itemDropdown" items="${listDropdown}">
									<option value="${itemDropdown.id}" title="${itemDropdown.value}"
									        <c:if test="${itemDropdown.id==selectedId}">selected="selected"</c:if>>
											${itemDropdown.value}
									</option>
								</c:forEach>
							</c:if>
						</select>
					</c:if>

					<c:if test="${group eq 'GUIDED_TOUR'}">
						<div id="ListCategory" class="align_left">
							<label for="s_ContentPropertyValueManager_valueId_Category"><wa:mls>Category</wa:mls></label>
							<wa:include URI="front/dropdown/dropList">
								<wa:param name="class" value="com.wanabe.cms.hdata.ContentPropertyValue"/>
								<wa:param name="manager"
								          value="com.bitc.cms.hdata.manager.ContentPropertyValueManager"/>
								<wa:param name="method" value="listCategory"/>
								<wa:param name="identity" value="valueId"/>
								<wa:param name="display" value="mainTitle"/>
								<wa:param name="name" value="s_ContentPropertyValueManager_valueId_Category"/>
								<wa:param name="selectedValues"
								          value="${waParam.s_ContentPropertyValueManager_valueId_Category}"/>
							</wa:include>
						</div>
						<div id="ListLanguage" class="align_right">
							<label for="s_ContentPropertyValueManager_valueId_Language"><wa:mls>Language</wa:mls></label>
							<wa:include URI="front/dropdown/dropList">
								<wa:param name="class" value="com.bitc.utils.ISOLanguageDropdownBean"/>
								<wa:param name="manager" value="com.bitc.utils.Utils"/>
								<wa:param name="method" value="getISOLanguages"/>
								<wa:param name="identity" value="id"/>
								<wa:param name="display" value="name"/>
								<wa:param name="name" value="s_guided_tour_valueId_language"/>
								<wa:param name="onChangeEvent" value="allowSearchEitherDateOrLanguage()"/>
								<wa:param name="selectedValues" value="${waParam.s_guided_tour_valueId_language}"/>
							</wa:include>
						</div>
					</c:if>

				</div>
				<div class="clr"></div>
			</c:if>
			<input type="submit" value="<wa:mls>Recherche</wa:mls>" class="btn_form2"/>

			<div class="clr"></div>

		</form>
	</div>
</div>
<script language='javascript'>
	function changeDisplay() {
		if ($("#advanced_search").css('display') == "block") {
			$("#advanced_search").slideUp(200);
			$(".btn_form2").hide(200, function () {
				$(".btn_form").show(200)
			})
			$("a#advanced_search_id").addClass("advanced_search");
		} else {
			$("#advanced_search").slideDown(200)
			$(".btn_form").hide(200, function () {
				$(".btn_form2").show(200)
			})
			$("a#advanced_search_id").addClass("advanced_search_active");
		}

	}
	$(document).ready(function () {
		//changeDisplay();
		//alert($("#advanced_search").css('display'));
		if ($("#advanced_search").css('display') == "block") {
			$(".btn_form").hide(200, function () {
				$(".btn_form2").show(200)
			})
			$("a#advanced_search_id").addClass("advanced_search_active");
		}
	});

</script>
<script language='javascript'>
	var spryDebut = new Spry.Widget.ValidationTextField("tfv_debut", "none", {validateOn: ["blur"]});
	var spryFin = new Spry.Widget.ValidationTextField("tfv_fin", "none", {validateOn: ["blur"]});
</script>
