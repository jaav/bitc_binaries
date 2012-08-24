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
<h2><wa:mls>templateAlgorithmlink</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.templateAlgorithmLinkId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.templateAlgorithmLinkId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:choose>
				<c:when test="${bean!=null && bean.templateAlgorithmLinkId>0}">
				<div class="bgGrey">
					<label for="f_templateAlgorithmLinkId"><wa:mls>templateAlgorithmLinkId</wa:mls></label>
					<span>${bean.templateAlgorithmLinkId}</span>
					<input name=templateAlgorithmLinkId type="hidden" value="${bean.templateAlgorithmLinkId}"/>
				</div>
				 <div class="bgWhite">
					<label for="f_template"><wa:mls>template</wa:mls></label> 
					 <span><wa:link URI="${site}/template/editItem/id/${bean.template.templateId}"> ${bean.template.name}&nbsp;</wa:link></span>
				</div>
				<div class="bgGrey">
					<label for="f_templateAlgorithm"><wa:mls>templateAlgorithm</wa:mls></label> 
					 <span><wa:link URI="${site}/templateAlgorithm/editItem/id/${bean.templateAlgorithm.algorithmId}"> ${bean.templateAlgorithm.name}&nbsp;</wa:link></span>
				</div>
				</c:when>
					<c:otherwise>
					<div class="bgWhite">
					<label for="f_template_templateId"><wa:mls>template</wa:mls></label> 
					<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.wanabe.template.hdata.Template" />
							<wa:param name="manager" value="com.wanabe.template.manager.TemplateManager" />
							<wa:param name="method" value="listAll" />
							<wa:param name="identity" value="templateId" />
							<wa:param name="display" value="name" />
							<wa:param name="name" value="f_template_templateId" />
						</wa:include>
				    </div>
				    <div class="bgGrey">
					<label for="f_templateAlgorithm_algorithmId"><wa:mls>templateAlgorithm</wa:mls></label> 
					<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.wanabe.template.hdata.TemplateAlgorithm" />
							<wa:param name="manager" value="com.wanabe.template.manager.TemplateAlgorithmManager" />
							<wa:param name="method" value="listAll" />
							<wa:param name="identity" value="algorithmId" />
							<wa:param name="display" value="name" />
							<wa:param name="name" value="f_templateAlgorithm_algorithmId" />
						</wa:include>
				    </div>
					</c:otherwise>
			</c:choose>
				
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
idName='${bean.templateAlgorithmLinkId}';
</script>
<!--tool boxes:end-->
