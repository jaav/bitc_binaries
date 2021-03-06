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
<h2><wa:mls>URI Authorization </wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.id<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
					<c:if test="${bean!=null && bean.id>0}">
					<div class="bgGrey">
						<label for="f_id"><wa:mls>id</wa:mls></label> 
						<span>${bean.id}</span>
						<input name="id" type="hidden" value="${bean.id}" />
					</div>
					</c:if>
					<div class="bgWhite">
						<label for="f_ressource"><wa:mls>ressource</wa:mls></label> 
						<!-- $attribute.findTaggedValue("activeidea.attribute.alias") -->
						<wa:include URI="${site}/acxRessource/dropList">
							<wa:param name="def" value="${bean.ressource}" />
							<wa:param name="selectName" value="f_ressource" />
						</wa:include>
					</div>
					<div class="bgGrey">
						<label for="f_right"><wa:mls>right</wa:mls></label>
						 <!-- $attribute.findTaggedValue("activeidea.attribute.alias") -->
						<wa:include URI="${site}/acxRight/dropList">
							<wa:param name="def" value="${bean.right}" />
							<wa:param name="selectName" value="f_right" />
						</wa:include>
					</div>
					<div class="bgWhite">
						<label for="f_uri"><wa:mls>uri</wa:mls></label> 
						<textarea name="f_uri" class="textfield">${bean.uri}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_loginpage"><wa:mls>loginpage</wa:mls></label> 
						<textarea name="f_loginpage" class="textfield">${bean.loginpage}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_accessDeniedPage"><wa:mls>accessDeniedPage</wa:mls></label>
						<textarea name="f_accessDeniedPage" class="textfield">${bean.accessDeniedPage}</textarea>
					</div>


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
idName='${bean.id}';
</script>
<!--tool boxes:end-->
