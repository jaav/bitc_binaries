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
		<c:if test="${legend != null}">
			<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<div class="clr"></div>
	</div>
</div>
<h2><wa:mls>MLRS</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
					<div class="bgGrey">
						<label for="f_id"><wa:mls>Id</wa:mls></label> 
						<span>${bean.id}</span>
						<input name="id" type="hidden" value="${bean.id}" />
					</div>
					<div class="bgWhite">
						<label for="f_urlInternal"><wa:mls>Url Internal</wa:mls></label>
						<span>${bean.urlInternal}</span>
					</div>
					<div class="bgGrey">
						<label for="f_urlExternal"><wa:mls>Url External</wa:mls></label>
						<textarea name="f_urlExternal" class="textfield" >${bean.urlExternal}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_discriminant"><wa:mls>Discriminant</wa:mls></label> 
						<span>${bean.discriminant}</span>
					</div>
				</fieldset>
			<div id="errorMessage">
				<c:if test="${message != null}">
					<wa:mls>${message}</wa:mls>
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
