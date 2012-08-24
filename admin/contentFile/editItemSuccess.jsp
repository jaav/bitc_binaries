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
<h2><wa:mls>ContentFile</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.contentFileId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.contentFileId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" enctype="multipart/form-data">
			<fieldset>
				<legend>&nbsp;</legend>
					<c:if test="${bean!=null && bean.contentFileId>0}">
					<div class="bgGrey"> 
						<label for="f_id"><wa:mls>contentFileId</wa:mls></label>
						<span>${bean.contentFileId}</span>
						<input name="id" type="hidden" value="${bean.contentFileId}"/>
					</div>
					</c:if>
					<div class="bgWhite">
						<label for="f_name"><wa:mls>name</wa:mls></label>
						<textarea name="f_name" class="textfield" >${bean.name}</textarea>
					</div>
					
					<div class="bgGrey">
						<label for="group"><wa:mls>group</wa:mls></label>
						<select name="group">
							<option value="db"><wa:mls>db</wa:mls></option>
						</select>
					</div>
					<div class="bgWhite">
						<label for="file"><wa:mls>upload</wa:mls></label>
						<input name="file" type="file" value=""/>
					</div>
					<c:if test="${bean!=null && bean.contentFileId>0}">
					<div class="bgGrey">
						<label for="f_url"><wa:mls>url</wa:mls></label>
						<span>${bean.url}</span>
					</div>
					<div class="bgWhite">
						<label for="f_clicksCount"><wa:mls>ClicksCount</wa:mls></label>
						<span>${bean.clicksCount}</span>
					</div>
					<div class="bgGrey">
						<label for="f_size"><wa:mls>Size</wa:mls></label>
						<span>${bean.size}</span>
					</div>
					</c:if>
					</fieldset>
					<c:if test="${bean!=null && bean.contentFileId>0}">
					<fieldset>
					<legend>&nbsp;</legend>		
					<div class="bgWhite">
						<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
						<span>${bean.createdOn}</span>
					</div>
					<div class="bgGrey">
						<label for="f_lastModifiedOn"><wa:mls>lastModifiedOn</wa:mls></label>
						<span>${bean.lastModifiedOn}</span>
					</div>
					</fieldset>
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
<script>
path='${context}/${site}/${module}';
idName='${bean.contentFileId}';
</script>
<!--tool boxes:end-->
