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
<h2><wa:mls>TemplatePage</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.templatePageId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.templatePageId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.templatePageId>0}">
				<div class="bgGrey">
					<label for="f_id"><wa:mls>TemplatePageId</wa:mls></label>
					<span>${bean.templatePageId}</span>
					<input name=id type="hidden" value="${bean.templatePageId}"/>
				</div>
				</c:if>
				<div class="bgWhite">
					<label for="f_template"><wa:mls>Template</wa:mls></label>
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.template.hdata.Template" />
						<wa:param name="manager" value="com.wanabe.template.manager.TemplateManager" />
						<wa:param name="identity" value="name" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="f_template" />
						<wa:param name="choiceMsg" value="Select the Template" />
						<wa:param name="selectedValues" value="${bean.template}" />
					</wa:include>
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
idName='${bean.paramValues}';
</script>
<!--tool boxes:end-->
