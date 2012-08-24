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
<h2><wa:mls>contentExternalImage</wa:mls>&nbsp;-&nbsp;
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
						<input name="id" type="hidden" value="${bean.id}"/>
					</div>
				</c:if>
					<div class="bgWhite">
						<label for="f_contentType"><wa:mls>contentType</wa:mls></label>
						<textarea name="f_contentType" class="textfield" >${bean.contentType}</textarea>
					</div>
					
					<div class="bgGrey">
						<label for="f_contentId"><wa:mls>contentId</wa:mls></label>
						<textarea name="f_contentId" class="textfield" >${bean.contentId}</textarea>
					</div>
					<c:if test="${bean!=null && bean.source!=null && bean.sourceUrl!=null}">
					<div class="bgWhite">
						<label for="f_sourceUrl"><wa:mls>URL </wa:mls> (source)</label>
						<span>${bean.sourceUrl}</span>
					</div>
					</c:if>
					<div class="bgWhite">
						<label for="f_url"><wa:mls>URL</wa:mls></label>
						<textarea name="f_url" class="textfield" >${bean.url}</textarea>
					</div>
					<c:if test="${bean!=null && bean.source!=null && bean.sourceDescription!=null}">
					<div class="bgGrey">
						<label for="f_sourceDescription"><wa:mls>Description </wa:mls> (source)</label>
						<span>${bean.sourceDescription}</span>
					</div>
					</c:if>
					<div class="bgGrey">
						<label for="f_description"><wa:mls>Description</wa:mls></label>
						<textarea name="f_description" class="textfield" >${bean.description}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_source"><wa:mls>source</wa:mls></label>
						<textarea name="f_source" class="textfield" >${bean.source}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_sourceId"><wa:mls>sourceId</wa:mls></label>
						<textarea name="f_sourceId" class="textfield" >${bean.sourceId}</textarea>
					</div>
				</fieldset>
				
				<c:if test="${bean!=null && bean.id>0}">
					<div class="clr"></div>
					<fieldset>
					<legend>&nbsp;</legend>
					<div class="bgGrey">
						<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
						<span>${bean.createdOn}</span>
					</div>
					<div class="bgWhite">
						<label for="f_modifiedOn"><wa:mls>modifiedOn</wa:mls></label>
						<span>${bean.modifiedOn}</span>
					</div>
					</fieldset>
				</c:if>
				<c:if test="${bean!=null && bean.url!=null}">
					<div class="clr"></div>
					<fieldset>
						<legend>&nbsp;</legend>
							<div class="bgGrey">
								<label ><wa:mls>image</wa:mls></label>
								<span><img src="${bean.url}" /></span>
							</div>
					</fieldset>
				</c:if>
								
					
			
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
