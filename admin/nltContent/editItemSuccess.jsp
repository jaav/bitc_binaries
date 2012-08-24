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
<h2><wa:mls>User</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.nltContentId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.nltContentId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend align="top"><wa:mls>Basic informations</wa:mls></legend>
					<input name="oldAllowEmail" type="hidden" />
					<c:if test="${bean!=null && bean.nltContentId>0}">
					<div class="bgWhite">
						<label for="f_nltContentId"><wa:mls>Nlt Content ID</wa:mls></label>
						<span>${bean.nltContentId}</span>
						<input name="id" type="hidden" value="${bean.nltContentId}"/>
					</div>
					</c:if>
					<div class="bgWhite">
						<label for="f_contentType"><wa:mls>Content Type</wa:mls></label>
						<span>${bean.contentType}</span>
					</div>
					<div class="bgWhite">
						<label for="f_contentId"><wa:mls>Content Id</wa:mls></label>
						<span>${bean.contentId}</span>
					</div>
					<div class="bgGrey">
						<label for="f_culture"><wa:mls>Culture</wa:mls> </label>
						<span>${bean.culture}</span>
					</div>
					
					<div class="bgWhite">
						<label for="f_title"><wa:mls>title</wa:mls></label>
						<textarea name="f_title" class="textfield" >${bean.title}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_listHtml" style="float:left;"><wa:mls>List Html</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_listHtml" id="f_listHtml"  class="textarea2" >${bean.listHtml}</textarea>
						</div>
						<div class="clr"></div>	
					</div>
					<div class="bgWhite">
						<label for="f_detailHtml" style="float:left;"><wa:mls>detail Html</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_detailHtml" id="f_detailHtml"  class="textarea2" >${bean.detailHtml}</textarea>
						</div>
						<div class="clr"></div>	
					</div>
					<div class="bgGrey">
						<label for="f_listText" style="float:left;"><wa:mls>list Text</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_listText" id="f_listText"  class="textarea2" >${bean.listText}</textarea>
						</div>
						<div class="clr"></div>	
					</div>
					<div class="bgWhite">
						<label for="f_detailText" style="float:left;"><wa:mls>detail Text</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_detailText" id="f_detailText"  class="textarea2" >${bean.detailText}</textarea>
						</div>
						<div class="clr"></div>	
					</div>
					<div class="bgGrey">
						<label for="f_image"><wa:mls>image</wa:mls></label>
						<textarea name="f_image" class="textfield" >${bean.image}</textarea>
					</div>		
					<div class="bgWhite">
						<label for="f_url"><wa:mls>url</wa:mls></label>
						<textarea name="f_url" class="textfield" >${bean.url}</textarea>
					</div>			
					
				</fieldset>
				<div class="clr"></div>	

				<div class="clr"></div>	
				<c:if test="${bean!=null && bean.nltContentId>0}">
					<fieldset>
						<legend align="top"><wa:mls>Status date informations</wa:mls></legend>
						<div class="bgGrey">
							<label for="f_createdOn"><wa:mls>Created on</wa:mls></label>
							<span><fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.createdOn}"/></span>
						</div>
						<div class="bgWhite">
							<label for="f_createdBy"><wa:mls>Created by</wa:mls></label>
							<span>${bean.createdBy}</span>
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
<script type="text/javascript" src="${static}/${site}/fckeditor/fckeditor.js"></script>
<script type="text/javascript">
window.onload = function()
{
	var rootPath = '${static}/${site}/';
	var oFCKeditor = new FCKeditor('f_listHtml','100%','500px');
	oFCKeditor.BasePath = 'fckeditor/';
	oFCKeditor.EditorPath = rootPath;
	oFCKeditor.LocationPath = window.location.href;
	oFCKeditor.ToolbarSet = 'Custom' ;
	oFCKeditor.ReplaceTextarea();
	var oFCKeditor1 = new FCKeditor('f_detailHtml','100%','500px');
	oFCKeditor1.BasePath = 'fckeditor/';
	oFCKeditor1.EditorPath = rootPath;
	oFCKeditor1.LocationPath = window.location.href;
	oFCKeditor1.ToolbarSet = 'Custom' ;
	oFCKeditor1.ReplaceTextarea();
	var oFCKeditor2 = new FCKeditor('f_listText','100%','500px');
	oFCKeditor2.BasePath = 'fckeditor/';
	oFCKeditor2.EditorPath = rootPath;
	oFCKeditor2.LocationPath = window.location.href;
	oFCKeditor2.ToolbarSet = 'Custom' ;
	oFCKeditor2.ReplaceTextarea();
	var oFCKeditor3 = new FCKeditor('f_detailText','100%','500px');
	oFCKeditor3.BasePath = 'fckeditor/';
	oFCKeditor3.EditorPath = rootPath;
	oFCKeditor3.LocationPath = window.location.href;
	oFCKeditor3.ToolbarSet = 'Custom' ;
	oFCKeditor3.ReplaceTextarea();
} 
</script>
<script>
path='${context}/${site}/${module}';
idName='${bean.nltContentId}';
</script>
<!--tool boxes:end-->
	