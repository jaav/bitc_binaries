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
		<a href="javascript:void(0);" id ="back_btn" ><wa:mls>Back to List</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<div class="clr"></div>
	</div>
</div>
<h2><wa:mls>Catalog Price</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.id<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" name="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.id>0}">
					<div class="bgWhite">
						<label for="f_id"><wa:mls>id</wa:mls></label>
						<span>${bean.id}</span>
						<input name="id" type="hidden" value="${bean.id}"/>
					</div>
				</c:if>
					
				<div class="bgWhite">
				<label for="f_catalogProduct_id"><wa:mls>catalog Product</wa:mls></label>
				
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.bitc.catalog.hdata.CatalogProduct" />
						<wa:param name="manager" value="com.bitc.catalog.hdata.manager.CatalogProductManager" />
						<wa:param name="method" value="listAllValid" />
						<wa:param name="identity" value="id" />
						<wa:param name="display" value="name" />
						<wa:param name="choiceMsg" value="Choose the Product" />
						<wa:param name="name" value="f_catalogProduct_id" />
						<wa:param name="selectedValues" value="${bean.catalogProduct.id}" />
					</wa:include>
				</div>
				<div class="bgGrey">
					<label for="f_value"><wa:mls>Value</wa:mls></label>
					<input type="text"  id="f_value" name="f_value" value="${bean.value}" />
				</div>
			</fieldset>
				<div class="clr"></div>
				<div class="TabbedPanels" id="TabbedPanels1">
					<ul class="TabbedPanelsTabGroup">
						<c:forEach var="clt" items="${culture.allCultures}" varStatus="loop">
							<li class="TabbedPanelsTab">${clt}</li>
						</c:forEach>
					</ul>
					<div class="TabbedPanelsContentGroup">
					<c:forEach var="clt" items="${culture.allCultures}" varStatus="loop">
						<div class="TabbedPanelsContent">
							<div class="bgGrey" style="height:50px;" id="v_${clt}_title">
								<label for="f_${clt}_title" style="float:left;"><wa:mls>title</wa:mls></label>
								<textarea name="f_${clt}_title" style="float:left;" id="f_${clt}_title" class="textfield textForAll" >${bean.catalogPriceClts[clt].title}</textarea>
								<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
			            		<script type="text/javascript">
									var v_${clt}_title = new Spry.Widget.ValidationTextarea("v_${clt}_title", {isRequired:true,minChars:1, maxChars:200,validateOn:["blur","change"]});
								</script>
								<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('textForAll','f_${clt}_title')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
							</div>
							<div class="bgWhite" style="height:50px;" id="v_${clt}_description">
								<label for="f_${clt}_description" style="float:left;"><wa:mls>description</wa:mls></label>
								<textarea name="f_${clt}_description" style="float:left;" id="f_${clt}_description" class="textfield descriptionForAll" >${bean.catalogPriceClts[clt].description}</textarea>
								<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
			            		<script type="text/javascript">
									var v_${clt}_description = new Spry.Widget.ValidationTextarea("v_${clt}_description", {isRequired:true,minChars:1, maxChars:200,validateOn:["blur","change"]});
								</script>
								<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('descriptionForAll','f_${clt}_description')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			<fieldset>	
				<legend><wa:mls>Accessibility information</wa:mls></legend>
				<div class="bgGrey">
					<label for="f_fromDate"><wa:mls>FromDate</wa:mls></label>
					<input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_fromDate" name="f_fromDate" value="<c:choose><c:when test="${bean.fromDate == null }"><fmt:formatDate pattern="dd/MM/yyyy" value="${dateSys}"/></c:when><c:when test="${bean.fromDate != null }"><fmt:formatDate pattern="dd/MM/yyyy" value="${bean.fromDate}"/></c:when></c:choose>" maxlength="10" />
				</div>
				<div class="bgWhite">	
					<label for="f_toDate"><wa:mls>ToDate</wa:mls></label>
					<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_toDate" name="f_toDate" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.toDate}"/>" maxlength="10" />
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
				<input type="button" name="cancel" id="cancel" class="cancel" value="<wa:mls>Cancel</wa:mls>"/>
				<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
			</div>
		</form>
	</div>
</div>
</div>	

<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script type="text/javascript" src="${static}/${site}/fckeditor/fckeditor.js"></script>

<script>
path='${context}/${site}/${module}';
idName='${bean.id}';

</script>
<script type="text/javascript">
	var TP1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script> 
<!--tool boxes:end-->
