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
<h2><wa:mls>TemplateZone</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.templateZoneId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.templateZoneId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.templateZoneId>0}">
				<div class="bgGrey">
					<label for="f_id"><wa:mls>TemplateZoneId</wa:mls></label>
					<span>${bean.templateZoneId}</span>
					<input name=id type="hidden" value="${bean.templateZoneId}"/>
				</div>
				</c:if>
				<div class="bgGrey">
					<label for="f_templatePage_templatePageId"><wa:mls>TemplatePageId</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.template.hdata.TemplatePage" />
						<wa:param name="manager" value="com.wanabe.template.manager.TemplatePageManager" />
						<wa:param name="identity" value="templatePageId" />
						<wa:param name="display" value="templatePageName" />
						<wa:param name="name" value="f_templatePage_templatePageId" />
						<wa:param name="choiceMsg" value="<wa:mls>Select the TemplatePage</wa:mls>" />
						<wa:param name="selectedValues" value="${bean.templatePage.templatePageId}" />
						<wa:param name="onChangeEvent" value="updateTemplateAlgorithm('f_algorithm',this.value)" />
					</wa:include>
				</div>
				<div class="bgWhite">
					<label for="f_position"><wa:mls>Position</wa:mls></label>
					<textarea name="f_position" class="textfield" >${bean.position}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_algorithm"><wa:mls>Algorithm</wa:mls></label>
					<select name="f_algorithm" id="f_algorithm" >
						<option value="">Select your Algorithm</option>
					</select>			
				</div>
				<div class="bgGrey">
					<label for="f_paramValues"><wa:mls>ParamValues</wa:mls></label>
					<textarea name="f_paramValues" class="textfield" >${bean.paramValues}</textarea>
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
				<input type="submit" name="submit" class="submit" value="<wa:mls>Enregistrer</wa:mls>"/>
			</div>
		</form>
	</div>
</div>
</div>	
<script type="text/javascript" src="${static}/${site}/js/actionsEdit.js"></script>
<script>
path='${context}/${site}/${module}';
idName='${bean.templateZoneId}';
</script>
<!--tool boxes:end-->

<script type="text/javascript">
function updateTemplateAlgorithm(res,templatePageId){
	var optObj = $(res);
	var url = '${context}/${site}/templatePage/loadTemplateAlgorithm/templatePageId/'+templatePageId+'.do';
	wa_ask(url,optObj);
}
</script>
<c:if test="${bean!=null && bean.templatePage != null && bean.templatePage.templatePageId >0 }">
<script type="text/javascript">
	window.addEvent('load', function(e){
		var optObj = $('f_algorithm');
		var url = '${context}/${site}/templatePage/loadTemplateAlgorithm/templatePageId/'+${bean.templatePage.templatePageId}+'.do';
		wa_ask_selected(url,optObj,'${bean.algorithm}');
	});
</script>
</c:if>
