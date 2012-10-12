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
<h2><wa:mls>contentImage</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.contentImageId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.contentImageId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" enctype="multipart/form-data">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.contentImageId>0}">
					<div class="bgGrey"> 
						<label for="f_id"><wa:mls>contentImageId</wa:mls></label>
						<span>${bean.contentImageId}</span>
						<input name="id" type="hidden" value="${bean.contentImageId}"/>
					</div>
				</c:if>
					<div class="bgWhite">
						<label for="f_name"><wa:mls>name</wa:mls></label>
						<textarea name="f_name" class="textfield" >${bean.name}</textarea>
					</div>
					
					<div class="bgGrey">
						<label for="f_type"><wa:mls>type</wa:mls></label>
						<select name="f_type">
							<option value="db" <c:if test="${bean.type eq 'db'}">selected="selected"</c:if>><wa:mls>DB</wa:mls></option>
                            <option value="pdf" <c:if test="${bean.type eq 'pdf'}">selected="selected"</c:if>>PDF</option>
							<!-- <option value="gamme" <c:if test="${bean.type eq 'gamme'}">selected="selected"</c:if>><wa:mls>Gamme</wa:mls></option>
							<option value="product" <c:if test="${bean.type eq 'product'}">selected="selected"</c:if>><wa:mls>Product</wa:mls></option>
							<option value="content" <c:if test="${bean.type eq 'content'}">selected="selected"</c:if>><wa:mls>Content</wa:mls></option> -->
						</select>
					</div>
					<div class="bgWhite">
						<label for="image"><wa:mls>upload</wa:mls></label>
						<input name="image" type="file" value=""/>
					</div>
					<div class="bgGrey">
						<label for="f_folderCible" style="float:left;"><wa:mls>Dossier Cible</wa:mls></label>
						<span id ="folderCible" style="float:left; margin-left:3px; width:58%;">/<c:if test="${not empty waParam.contentType}">${waParam.contentType}_${waParam.contentId}</c:if></span>
						<a onClick="clearFolder()" style="cursor:pointer;"><wa:mls>Clear</wa:mls></a>
					</div>
					<div class="bgWhite">
						<label for="f_keywords"><wa:mls>keywords</wa:mls></label>
						<textarea name="f_keywords" class="textfield" >${bean.keywords}</textarea>
					</div>
					<c:if test="${bean!=null && bean.contentImageId>0}">
					<div class="bgGrey">
						<label for="f_width"><wa:mls>width</wa:mls></label>
						<span>${bean.width}</span>
					</div>
					<div class="bgWhite">
						<label for="f_length"><wa:mls>length</wa:mls></label>
						<span>${bean.length}</span>
					</div>
					<c:if test="${bean!=null && bean.url!=null}">
						<div class="bgGrey">
						<label for="f_url"><wa:mls>url</wa:mls></label>
						<span>${bean.url}</span>
						<input type ="hidden" id ="url" name ="url" value ="${bean.url}"></input>
					</div>
					</c:if>		
					</c:if>
				</fieldset>
					<c:if test="${bean!=null && bean.contentImageId>0}">
					<div class="clr"></div>
					<fieldset>
					<legend>&nbsp;</legend>
					<div class="bgGrey">
						<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
						<span>${bean.createdOn}</span>
					</div>
					<div class="bgWhite">
						<label for="f_lastModifiedOn"><wa:mls>lastModifiedOn</wa:mls></label>
						<span>${bean.lastModifiedOn}</span>
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
					<input type ="hidden" id ="contentType" name ="contentType" value ="${waParam.contentType}"></input>
					<input type ="hidden" id ="contentId" name ="contentId" value ="${waParam.contentId}"></input>
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
idName='${bean.contentImageId}';
function clearFolder()
{
	$("folderCible").set('text', '/');
	$("contentType").value='';
	$("contentId").value='';
}
</script>
<!--tool boxes:end-->
