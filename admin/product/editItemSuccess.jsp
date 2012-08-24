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
		<a href="javascript:void(0);" id ="back_btn" ><wa:mls>Back to List</wa:mls></a>
		<c:if test="${legend != null}">
			<a href="" id="legend_btn" class="allways"><wa:mls>legend</wa:mls></a>
		</c:if>
		<div class="clr"></div>
	</div>
</div>
<h2><wa:mls>ContentArticle</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.contentArticleId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.contentArticleId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" name="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.contentArticleId>0}">
					<div class="bgGrey">
						<label for="f_id"><wa:mls>contentArticleId</wa:mls></label>
						<span>${bean.contentArticleId}</span>
						<input name="id" type="hidden" value="${bean.contentArticleId}"/>
					</div>
				</c:if>
					<div class="bgWhite">
						<label for="f_culture"><wa:mls>culture</wa:mls> </label>
						<wa:include URI="${site}/dropdown/dropListCulture">
								<wa:param name="name" value="f_culture" />
								<wa:param name="choiceMsg" value="Select the culture" />
								<wa:param name="selectedValues" value="${bean.culture}" />
						</wa:include>
					</div>

					<div class="bgWhite">
						<label for="f_group"><wa:mls>group</wa:mls></label>
						<c:if test="${bean.group==null || bean.group ==''}">
							<select name="f_group">
								<option value=""><wa:mls>Select your product type</wa:mls></option>
								
							</select>
						</c:if>
						
						<c:if test="${bean.group != null && bean.group !=''}">
							<span>${bean.group}</span>
							<input name="f_group" type="hidden" value="${bean.group}"/>
						</c:if>
					</div>
					<div class="bgGrey">
						<label for="f_title"><wa:mls>title</wa:mls></label>
						<textarea name="f_title" class="textfield" >${bean.title}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_abstract_" style="float:left;"><wa:mls>abstract_</wa:mls></label>
						<textarea name="f_abstract_" id="f_abstract_" class="textarea2" style="float:left; margin-left:3px;">${bean.abstract_}</textarea>
						<a href="${context}/${site}/contentImage/contentImageList.do" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<a href="${context}/${site}/contentLink/contentLinkList.do" target="link" class="track_link_btn" title="<wa:mls>Track a link</wa:mls>">&nbsp;</a>
						<div class="clr"></div>	
					</div>
					
					<div class="bgWhite">
						<label for="f_body" style="float:left;"><wa:mls>body</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_body" id="f_body"  class="textarea2" >${bean.body}</textarea>
						</div>
						<a href="${context}/${site}/contentImage/contentImageList.do" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<a href="${context}/${site}/contentLink/contentLinkList.do" target="link" class="track_link_btn" title="<wa:mls>Track a link</wa:mls>">&nbsp;</a>
						<div class="clr"></div>	
						
					</div>
					<div class="bgWhite">
						<label for="f_image" style="float:left;" ><wa:mls>image</wa:mls></label>
						<textarea name="f_image" class="textfield" style="float:left; margin-left:3px">${bean.image}</textarea>
						<a href="${context}/${site}/contentImage/contentImageList.do" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<div class="clr"></div>	
					</div>
					<div class="bgGrey">
						<label for="f_url" style="float:left;"><wa:mls>url</wa:mls></label>
						<textarea name="f_url" class="textfield"  style="float:left; margin-left:3px">${bean.url}</textarea>
						<a href="${context}/${site}/contentLink/contentLinkList.do" target="link" class="track_link_btn" title="<wa:mls>Track a link</wa:mls>">&nbsp;</a>
						<div class="clr"></div>
					</div>
					<!--  
					<div class="bgWhite">
						<label for="f_position" style="float:left;"><wa:mls>position</wa:mls></label>
						<input type="text" name="f_position" id="f_position" value="${bean.position}" maxlength="3"  style="float:left; margin-left:3px;width:35px" onkeyup="javascript:wa_validateNum('f_position')"/>
						<a href="javascript:wa_addOne('f_position');" class="more" title="<wa:mls>Add one</wa:mls>">+</a>
						<a href="javascript:wa_removeOne('f_position');" class="minus" title="<wa:mls>Remove one</wa:mls>">-</a>
						<div class="clr"></div>
					</div> -->
					</fieldset>
					<div class="clr"></div>
					<fieldset>	
					<legend><wa:mls>Accessibility information</wa:mls></legend>
					<div class="bgGrey">
						<label for="f_fromDate"><wa:mls>fromDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_fromDate" name="f_fromDate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.fromDate}"/>" maxlength="10" />
					</div>
					<div class="bgWhite">	
						<label for="f_toDate"><wa:mls>toDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_toDate" name="f_toDate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.toDate}"/>" maxlength="10" />
					</div>
					<div class="bgGrey">
						<label for="f_visible"><wa:mls>visible</wa:mls></label>
						<input type="radio"<c:if test="${bean.visible ==  null || bean.visible=='0'}"> checked="checked"</c:if> value="0" name="f_visible"/><wa:mls>visible_0</wa:mls>
						<input type="radio"<c:if test="${bean.visible=='1'}"> checked="checked"</c:if> value="1" name="f_visible"/><wa:mls>visible_1</wa:mls>
					</div>
					<div class="bgWhite">
						<label for="f_status"><wa:mls>status</wa:mls></label>
						<c:if test="${bean.status=='0'}"><wa:mls>DRAFT</wa:mls></c:if> 
						<c:if test="${bean.status=='1'}"><wa:mls>PUBLISH</wa:mls></c:if>
						<c:if test="${bean.status=='2'}"><wa:mls>ARCHIVED</wa:mls>&nbsp;${bean.versionId}</c:if>
						<c:if test="${bean.status=='3'}"><wa:mls>DELETED</wa:mls></c:if>	
					</div>
					</fieldset>
					<c:if test="${bean!=null && bean.contentArticleId>0}">
						<div class="clr"></div>
						<fieldset>	
						<legend><wa:mls>Creation/Modification informations</wa:mls></legend>
						<div class="bgGrey">
							<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
							<span>${bean.createdOn}</span>
						</div>
						<div class="bgWhite">
							<label for="f_createdBy"><wa:mls>created By</wa:mls></label>
							<span>
								<wa:include URI="${site}/acxAdminusers/lookup">
									<wa:param name="login" value="${bean.createdBy}"/>
								</wa:include>
							</span>
						</div>
						<div class="bgGrey">
							<label for="f_lastModifiedOn"><wa:mls>lastModifiedOn</wa:mls></label>
							<span>${bean.lastModifiedOn}</span>
						</div>
						<div class="bgWhite">
							<label for="f_lastModifiedBy"><wa:mls>lastModifiedBy</wa:mls></label>
							<span>
								<wa:include URI="${site}/acxAdminusers/lookup">
								<wa:param name="login" value="${bean.lastModifiedBy}"/>
								</wa:include>
							</span>
						</div>
						</fieldset> 
						
					</c:if>
				
					
					
					
					
					<!-- DISPLAY PROPERTIES -->
					<c:if test="${bean.contentArticleId !=0}">
						<c:forEach var="property" items="${listProperties}">
							<div>
								<wa:include URI="admin/dropdown/dropListProperty">
									<wa:param name="propertyName" value="${property.name}" />
									<wa:param name="contentType" value="article"/>
									<wa:param name="contentId" value="${bean.contentArticleId}" />
								</wa:include>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${bean.contentArticleId ==0}">
						<c:forEach var="property" items="${listProperties}">
							<div>
								<wa:include URI="admin/dropdown/dropListProperty">
									<wa:param name="propertyName" value="${property.name}" />
									<wa:param name="contentType" value="article"/>
									<wa:param name="contentId" value="${oldId}" />
								</wa:include>
							</div>
						</c:forEach>
					</c:if>
					<div id="ajaxProperties"></div>

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
	var oFCKeditor = new FCKeditor('f_body','100%','500px');
	oFCKeditor.BasePath = 'fckeditor/';
	oFCKeditor.EditorPath = rootPath;
	oFCKeditor.LocationPath = window.location.href;
	oFCKeditor.ToolbarSet = 'Custom' ;
	oFCKeditor.ReplaceTextarea();
	//var oFCKeditor2 = new FCKeditor('f_abstract_','100%','500px');
	//oFCKeditor2.BasePath = 'fckeditor/';
	//oFCKeditor2.EditorPath = rootPath;
	//oFCKeditor2.LocationPath = window.location.href;
	//oFCKeditor2.ToolbarSet = 'Custom' ;
	//oFCKeditor2.ReplaceTextarea();
}
</script>
<script>
path='${context}/${site}/${module}';
idName='${bean.contentArticleId}';

document.detailForm.f_group.id='f_group';
$('f_group').addEvent('change',function(){ 
	var myRequest = new Request({
		url : '${context}/${site}/ajax/properties.do?type=article&realType=ContentArticle',
		method :'get',
		onSuccess:function(responseText,responseXML){
			$('ajaxProperties').set('html',responseText);
		}
	});
	myRequest.send('group='+$('f_group').value);
	
});
</script>
<!--tool boxes:end-->
