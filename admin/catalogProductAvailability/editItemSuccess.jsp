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
				<label for="f_catalogProduct_catalogProductId"><wa:mls>catalog Product</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.bitc.catalog.hdata.CatalogProduct" />
						<wa:param name="manager" value="com.bitc.catalog.hdata.manager.CatalogProductManager" />
						<wa:param name="identity" value="id" />
						<wa:param name="display" value="name" />
						<wa:param name="choiceMsg" value="Choose the Product" />
						<wa:param name="name" value="f_catalogProduct_id" />
						<wa:param name="selectedValues" value="${bean.catalogProduct.id}" />
					</wa:include>
				</div>
				<div class="bgGrey">
					<label for="f_typeOfDate"><wa:mls>Type of date</wa:mls></label>
					<select name="f_typeOfDate">
						<option value="">Choose the typeOfDate</option>
						<option value="1" <c:if test="${bean.typeOfDate eq 1}">selected="selected"</c:if>><wa:mls>jours d'ouverture</wa:mls></option>
						<option value="2" <c:if test="${bean.typeOfDate eq 2}">selected="selected"</c:if>><wa:mls>jours de fermeture</wa:mls></option>
					</select>
				</div>
				<div class="bgGrey">
					<label for="f_fromDate"><wa:mls>FromDate</wa:mls></label>
					<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_fromDate" name="f_fromDate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.fromDate}"/>" maxlength="10" />
				</div>
				<div class="bgWhite">	
					<label for="f_toDate"><wa:mls>ToDate</wa:mls></label>
					<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_toDate" name="f_toDate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.toDate}"/>" maxlength="10" />
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
