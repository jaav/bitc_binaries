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
<h2><wa:mls>ContentForum</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean!=null && bean.contentForumId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" name="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean.group =='COMMENT'}">
				<div class="bgGrey">
					<label for="f_id"><wa:mls>contentArticle</wa:mls></label>
					<wa:include URI="${site}/contentLinkPropertyvalueContent/lookup">
						<wa:param name="id" value="${bean.contentArticle.contentArticleId}"/>
						<wa:param name="type" value="article"/>
					</wa:include>
				</div>
				</c:if>
				
				<div class="bgWhite">
					<label for="f_id"><wa:mls>contentForumId</wa:mls></label>
					<span>${bean.contentForumId}</span>
					<input name="id" type="hidden" value="${bean.contentForumId}"/>
				</div>
				
				<div class="bgGrey">
					<label for="f_culture"><wa:mls>culture</wa:mls> </label>
					<wa:include URI="${site}/dropdown/dropListCulture">
						<wa:param name="name" value="f_culture" />
						<wa:param name="choiceMsg" value="Select the culture" />
						<wa:param name="selectedValues" value="${bean.culture}" />
					</wa:include>
				</div>
			<!--  	<div class="bgWhite">
					<label for="f_name"><wa:mls>Name</wa:mls></label>
					<textarea name="f_name" class="textfield" >${bean.name}</textarea>
				</div> -->
				<div class="bgWhite">
					<label for="f_author"><wa:mls>Author</wa:mls></label>
					<wa:include URI="${site}/user/lookup">
						<wa:param name="login" value="${bean.createdBy}"/>
					</wa:include>
				</div>
				<div class="bgGrey">
					<label for="f_title"><wa:mls>Title</wa:mls></label>
					<textarea name="f_title" class="textfield" >${bean.title}</textarea>
				</div>
				<div class="bgWhite">
					<label for="f_group"><wa:mls>Group</wa:mls></label>
					<c:if test="${bean.group==null || bean.group ==''}">
					<wa:include URI="${site}/dropdown/dropList">
						<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroup" />
						<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupManager" />
						<wa:param name="method" value="listByTypeContentForum" />
						<wa:param name="identity" value="name" />
						<wa:param name="display" value="name" />
						<wa:param name="name" value="f_group" />
						<wa:param name="selectedValues" value="${bean.group}" />
					</wa:include>
					</c:if>
						<c:if test="${bean.group != null && bean.group !=''}">
							<span>${bean.group}</span>
							<input name="f_group" type="hidden" value="${bean.group}"/>
						</c:if>
				</div>
				<div class="bgGrey">
					<label for="f_body" style="float:left;"><wa:mls>body</wa:mls></label>
					<div  style="float:left; margin-left:3px; width:95%">
						<textarea name="f_body" id="f_body"  class="textarea2" >${bean.body}</textarea>
					</div>
					<div class="clr"></div>
				</div>
				
			</fieldset>
			
			<div class="clr"></div>
			<fieldset>
				<legend>Accessibility information</legend>
				<div class="bgGrey">
					<label for="f_visible"><wa:mls>Visible</wa:mls></label>
					<input type="radio" value="0" name="f_visible" <c:if test="${bean.visible == null || bean.visible=='0'}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
					<input type="radio" value="1" name="f_visible" <c:if test="${bean.visible=='1'}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
				</div>
				<div class="bgWhite">
					<label for="f_selected"><wa:mls>Selected</wa:mls></label>
					<input type="radio" value="0" name="f_selected" <c:if test="${bean.selected ==  null || bean.selected}">checked="checked"</c:if>/><wa:mls>No</wa:mls>
					<input type="radio" value="1" name="f_selected" <c:if test="${bean.selected}">checked="checked"</c:if>/><wa:mls>Yes</wa:mls>
				</div>
				<div class="bgGrey">
					<label for="f_status"><wa:mls>Status</wa:mls></label>
					<input type="radio" value="0" name="f_status" <c:if test="${bean.status ==  null || bean.status == '0'}">checked="checked"</c:if>/><wa:mls>Refused</wa:mls>
					<input type="radio" value="1" name="f_status" <c:if test="${bean.status == '1'}">checked="checked"</c:if>/><wa:mls>Waiting</wa:mls>
					<input type="radio" value="2" name="f_status" <c:if test="${bean.status == '2'}">checked="checked"</c:if>/><wa:mls>Accepted</wa:mls>
				</div>
			</fieldset>
			
			<div class="clr"></div>
			<fieldset>
				<legend><wa:mls>Creation/Modification informations</wa:mls></legend>
				<div class="bgGrey">
					<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
					<span>${bean.createdOn}</span>
				</div>
				<div class="bgWhite">
					<label for="f_createdBy"><wa:mls>createdBy</wa:mls></label>
					<span>${bean.createdBy}</span>
					<input name="id" type="hidden" value="${bean.createdBy}"/>
				</div>
				<div class="bgGrey">
					<label for="f_lastModifiedOn"><wa:mls>lastModifiedOn</wa:mls></label>
					<span>${bean.lastModifiedOn}</span>
				</div>
				<div class="bgWhite">
					<label for="f_lastModifiedBy"><wa:mls>lastModifiedBy</wa:mls></label>
					<span>${bean.lastModifiedBy}</span>
					<input name="id" type="hidden" value="${bean.lastModifiedBy}"/>
				</div>
			</fieldset>
			
			
			<c:if test="${bean.right != null && bean.left != null}">
			<div class="clr"></div>
				<fieldset>
					<legend><wa:mls>TREE informations</wa:mls></legend>
					<div class="bgGrey">
						<label for="f_level"><wa:mls>level</wa:mls></label>
						<span>${bean.level}</span>
						<input type="hidden" name="f_level" class="textfield" value="${bean.level}"/>
					</div>					
					<div class="bgWhite">
						<label for="f_position"><wa:mls>position</wa:mls></label>
						<span>${bean.pos}</span>
						<input type="hidden" name="f_position" class="textfield" value="${bean.pos}"/>
					</div>
					<div class="bgGrey">
						<label for="f_leftSibling"><wa:mls>leftSibling</wa:mls></label>
						<span>${bean.left}</span>
						<input type="hidden" name="f_leftSibling" class="textfield" value="${bean.left}"/>
					</div>
					<div>
						<label for="f_rightSibling"><wa:mls>rightSibling</wa:mls></label>
						<span>${bean.right}</span>
						<input type="hidden" name="f_rightSibling" class="textfield" value="${bean.right}"/>
					</div>
				</fieldset>
			</c:if>
			<!-- DISPLAY PROPERTIES  -->
			<c:forEach var="property" items="${listProperties}">
				<div>
						<c:if test="${bean.tree.contentForumId != bean.contentForumId}">
							<wa:include URI="${site}/dropdown/dropListProperty">
								<wa:param name="propertyName" value="${property.name}" />
								<wa:param name="contentType" value="forum"/>
								<wa:param name="contentId" value="${property.name eq 'FORUM_CATEGORIES' ? bean.tree.contentForumId : bean.contentForumId}" />
								<wa:param name="readonly" value="yes" />
							</wa:include>	
						</c:if>
						
						<c:if test="${bean.tree.contentForumId eq bean.contentForumId}">
							<wa:include URI="${site}/dropdown/dropListProperty">
								<wa:param name="propertyName" value="${property.name}" />
								<wa:param name="contentType" value="forum"/>
								<wa:param name="contentId" value="${property.name eq 'FORUM_CATEGORIES' ? bean.tree.contentForumId : bean.contentForumId}" />
							</wa:include>	
						</c:if>
				</div>
			</c:forEach>

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
}
</script>
<script>
path='${context}/${site}/${module}';
idName='${bean.contentForumId}';µ


</script>
<!--tool boxes:end-->
