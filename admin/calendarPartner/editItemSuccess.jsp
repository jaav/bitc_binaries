
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
	<h2><wa:mls>CalendarPartner</wa:mls>&nbsp;-&nbsp;
		<c:if test="${bean==null || bean.partnerId<=0}"><wa:mls>(Add)</wa:mls></c:if>
		<c:if test="${bean!=null && bean.partnerId>0}"><wa:mls>(Edit)</wa:mls></c:if>
	</h2>
	<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">

		<input name="partnerId" type="hidden"/>
		<c:if test="${bean.partnerId != null && bean.partnerId != 0}">
			<div class="">
					<label for="f_partnerId"><wa:mls>ID</wa:mls></label>
					<span>${bean.partnerId}</span>
					<input name="id" type="hidden" value="${bean.partnerId}"/>
			</div>
			<div class="bgWhite" id="v_cryptedId">
					<div class="">
						<label for="f_cryptedId"><wa:mls>cryptedId</wa:mls></label>
						<span>${bean.cryptedId}</span>			
					</div>
					
			</div>
		</c:if>
		<div class="bgGrey" id="v_name">
				<div class="">
					<label for="f_name"><wa:mls>name</wa:mls></label>
					<textarea name="f_name" class="textfield">${bean.name}</textarea>
					<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
					
				</div>
				<script type="text/javascript">
							var v_name = new Spry.Widget.ValidationTextarea("v_name", {minChars:1, maxChars:50,validateOn:["blur","change"]});
				</script> 
				
		</div>
		<div class="bgWhite">
				<div class="">
					<label for="f_description"><wa:mls>description</wa:mls></label>
					
						<textarea name="f_description" id="f_description" class="textfield">${bean.description}</textarea>
				</div>
				
		</div>
		<div class="bgGrey">
				<div class="">
					<label for="f_contactEmail"><wa:mls>contactEmail</wa:mls></label>
					<textarea name="f_contactEmail" class="textfield">${bean.contactEmail}</textarea>
					
				</div>
				
		</div>
		<c:if test="${bean.partnerId != null && bean.partnerId != 0}">
			<div class="bgWhite">
					<div class="">
						<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
						<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.createdOn}"/></span>
						</div>
					
			</div>
			<div class="bgGrey">
					<div class="">
						<label for="f_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
						<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.modifiedOn}"/></span>
					</div>
					
			</div>
		</c:if>
		<div class="bgWhite">
				<label for="f_valid"><wa:mls>valid</wa:mls></label>
				<input type="radio"<c:if test="${ bean.valid==false}"> checked="checked"</c:if> value="0" name="f_valid"/><wa:mls>no</wa:mls>
				<input type="radio"<c:if test="${bean.valid==null || bean.valid==true}"> checked="checked"</c:if> value="1" name="f_valid"/><wa:mls>yes</wa:mls>
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
	<script type="text/javascript" src="${static}/admin/fckeditor/fckeditor.js"></script>
	<script>
	path='${context}/${site}/${module}';
	idName='${bean.partnerId}';
	</script>
