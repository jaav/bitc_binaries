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
		<div class="clr"></div>
	</div>
</div>
<h2><wa:mls>ContentPropertyValue</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.valueId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.valueId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<input name="f_parent" type="hidden" value="${bean.parent.valueId}"/>
			<input name="f_property" type="hidden" value="${bean.contentProperty.propertyid}"/>
			<input name="f_oldName" type="hidden"/>
			<fieldset>
				<legend>&nbsp;</legend> 
				<c:if test="${bean!=null && bean.valueId>0}">
				<div class="bgGrey">
					<label for="f_id"><wa:mls>valueId</wa:mls></label>
					<span>${bean.valueId}</span>
					<input name="id" type="hidden" value="${bean.valueId}"/>
				</div>
				</c:if>
				<div class="bgWhite">
					<label for="f_name"><wa:mls>Name</wa:mls></label>
					<textarea name="f_name" class="textfield" >${bean.name}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_logo"><wa:mls>logo</wa:mls></label>
					<textarea name="f_logo" class="textfield" >${bean.logo}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_mainColor"><wa:mls>mainColor</wa:mls></label>
					<textarea name="f_mainColor" class="textfield" >${bean.mainColor}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_secondaryColor"><wa:mls>secondaryColor</wa:mls></label>
					<textarea name="f_secondaryColor" class="textfield" >${bean.secondaryColor}</textarea>
				</div>
				
				<div class="bgGrey">
					<label for="f_contentProperty_propertyid">Property</label>
					<span>${bean.contentProperty.name}</span>
				</div>
				<div class="bgGrey" id="v_fromDate">
					<label for="f_fromDate"><wa:mls>fromDate</wa:mls></label>
					<input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_fromDate" name="f_fromDate" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.fromDate}"/>" maxlength="10" />
					<div class="textfieldRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
					<div class="textfieldInvalidFormatMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Valeur invalide  : dd/MM/yyyy</wa:mls></div>
            		
            		<script type="text/javascript">
						var v_fromDate = new Spry.Widget.ValidationTextField("v_fromDate","date", {format:"dd/mm/yyyy",isRequired:false,validateOn:["blur","change"]});
					</script>
				</div>
				<div class="bgWhite" id="v_toDate">	
					<label for="f_toDate"><wa:mls>toDate</wa:mls></label>
					<input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_toDate" name="f_toDate" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.toDate}"/>" maxlength="10" />
					<div class="textfieldInvalidFormatMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Valeur invalide  : dd/MM/yyyy</wa:mls></div>
					<script type="text/javascript">
						var v_toDate = new Spry.Widget.ValidationTextField("v_toDate","date", {format:"dd/mm/yyyy",isRequired:false,validateOn:["blur","change"]});
					</script>
				</div>
				<div class="bgGrey">
					<label for="f_visible"><wa:mls>visible</wa:mls></label>
					<input type="radio"<c:if test="${bean.visible ==  null || bean.visible=='0'}"> checked="checked"</c:if> value="0" name="f_visible"/><wa:mls>visible_0</wa:mls>
					<input type="radio"<c:if test="${bean.visible=='1'}"> checked="checked"</c:if> value="1" name="f_visible"/><wa:mls>visible_1</wa:mls>
				</div>
			</fieldset>
			<c:if test="${bean!=null && bean.valueId>0}">
			<div class="clr"></div>	
			<fieldset>
				<legend><wa:mls>TREE informations</wa:mls></legend>
				<div class="bgGrey">
					<label for="f_level"><wa:mls>level</wa:mls></label>
					<span>${bean.level}</span>
					<input type="hidden" name="f_level" class="textfield" value="${bean.level}"/>
				</div>					
				<div class="bgWhite">
					<label for="f_position"><wa:mls>position</wa:mls></label>
					<span>${bean.pos}</span>
					<input type="hidden" name="f_pos" class="textfield" value="${bean.pos}"/>
				</div>
				<div class="bgGrey">
					<label for="f_left"><wa:mls>leftSibling</wa:mls></label>
					<span>${bean.left}</span>
					<input type="hidden" name="f_left" class="textfield" value="${bean.left}"/>
				</div>
				<div class="bgWhite">
					<label for="f_right"><wa:mls>rightSibling</wa:mls></label>
					<span>${bean.right}</span>
					<input type="hidden" name="f_right" class="textfield" value="${bean.right}"/>
				</div>
			</fieldset>
			</c:if>
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
						<div class="bgGrey" id="v_${clt}_title">
							<label for="f_${clt}_title"><wa:mls>title</wa:mls></label>
							<textarea name="f_${clt}_title" class="textfield" >${bean.contentPropertyValueClts[clt].title}</textarea>
							<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
		            		<script type="text/javascript">
								var v_${clt}_title = new Spry.Widget.ValidationTextarea("v_${clt}_title", {isRequired:false, maxChars:200,validateOn:["blur","change"]});
							</script>
						</div>
						<div class="bgWhite">
						<label for="f_${clt}_description" style="float:left;"><wa:mls>description</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
						<textarea name="f_${clt}_description" id="f_${clt}_description" class="textarea2" style="float:left; margin-left:3px;">${bean.contentPropertyValueClts[clt].description}</textarea>
						</div>
						<div class="clr"></div>
					</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<c:if test="${bean!=null && bean.valueId>0 && duplicate eq null}">
				<div class="clr"></div>
				<fieldset>	
				<legend><wa:mls>Creation/Modification informations</wa:mls></legend>
				<div class="bgGrey">
					<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
					<span><fmt:formatDate value="${bean.createdOn}" pattern="dd/MM/yyyy HH:mm"/></span>
				</div>
				<div class="bgGrey">
					<label for="f_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
					<span><fmt:formatDate value="${bean.modifiedOn}" pattern="dd/MM/yyyy HH:mm"/></span>
				</div>
				</fieldset> 
				<div class="clr"></div>
			
			</c:if>
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
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script type="text/javascript" src="${static}/${site}/fckeditor/fckeditor.js"></script>
<script type="text/javascript">
window.onload = function()
{
	var rootPath = '${static}/${site}/';
<c:forEach var="clt" items="${culture.allCultures}" varStatus="loop">
	var oFCKeditor = new FCKeditor('f_${clt}_description','100%','500px');
	oFCKeditor.BasePath = 'fckeditor/';
	oFCKeditor.EditorPath = rootPath;
	oFCKeditor.LocationPath = window.location.href;
	oFCKeditor.ToolbarSet = 'Custom' ;
	oFCKeditor.ReplaceTextarea();
</c:forEach>
}
</script>
<script>
path='${context}/${site}/${module}';
idName='${bean.valueId}';
</script>
<script type="text/javascript">
	var TP1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script> 
<!--tool boxes:end-->
