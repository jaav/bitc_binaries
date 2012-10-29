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
<h2><wa:mls>ContentPress</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.id<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.id>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">

	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm" name="detailForm" >
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.id>0 && duplicate eq null}">
					<div class="bgGrey">
						<label for="f_id"><wa:mls>id</wa:mls></label>
						<span>${bean.id}</span>
						<input name="id" type="hidden" value="${bean.id}"/>
					</div>
					<div class="bgWhite">
						<label for="f_culture"><wa:mls>Default culture</wa:mls> </label>
						<span>${bean.culture}</span>
					</div>
				</c:if>
					<div class="bgGrey" id="v_name">
						<label for="f_name"><wa:mls>name</wa:mls></label>
						<textarea name="f_name" class="textfield" >${bean.name}</textarea>
	            		<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            		<script type="text/javascript">
							var v_name = new Spry.Widget.ValidationTextarea("v_name", {minChars:1, maxChars:100,validateOn:["blur","change"]});
						</script> 
					</div>
                    <div class="bgWhite" id="v_pressDocDate" >
                        <label for="f_pressDocDate"><wa:mls>pressDocDate</wa:mls></label>
                        <input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_pressDocDate" name="f_pressDocDate" value="<c:choose><c:when test="${bean.pressDocDate == null }"><fmt:formatDate pattern="dd/MM/yyyy" value="${dateSys}"/></c:when><c:when test="${bean.pressDocDate != null }"><fmt:formatDate pattern="dd/MM/yyyy" value="${bean.pressDocDate}"/></c:when></c:choose>" maxlength="10" />
                        <script type="text/javascript">
                            var v_pressDocDate = new Spry.Widget.ValidationTextarea("v_pressDocDate", {isRequired:true,maxChars:200,validateOn:["blur","change"]});
                        </script>
                    </div>
					<div class="bgGrey" id="v_group">
						<label for="f_group"><wa:mls>group</wa:mls></label>
						<c:if test="${bean.group==null || bean.group ==''}">
							<wa:include URI="${site}/dropdown/dropList">
								<wa:param name="class" value="com.wanabe.cms.hdata.ContentGroup" />
								<wa:param name="manager" value="com.wanabe.cms.manager.ContentGroupManager" />
								<wa:param name="method" value="listByTypeContentPress" />
								<wa:param name="identity" value="name" />
								<wa:param name="display" value="name" />
								<wa:param name="name" value="f_group" />
								<wa:param name="selectedValues" value="${bean.group}" />
							</wa:include>
							<div class="selectRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
	            			<script type="text/javascript">
								var v_group = new Spry.Widget.ValidationSelect("v_group", {isRequired:true,validateOn:["blur","change"]});
							</script>
						</c:if>
						
						<c:if test="${bean.group != null && bean.group !=''}">
							<span>${bean.group}</span>
							<input name="f_group" type="hidden" value="${bean.group}"/>
						</c:if>
					</div>
					
					<div class="bgWhite" id="v_author">
						<label for="f_author"><wa:mls>author</wa:mls></label>
						<textarea name="f_author" class="textfield" >${bean.author}</textarea>
						<script type="text/javascript">
							var v_author = new Spry.Widget.ValidationTextarea("v_author", {isRequired:false,maxChars:100});
						</script> 
					</div>
					<c:if test="${bean!=null && bean.source!=null}">
					<div class="bgGrey">
						<label for="f_source"><wa:mls>Source</wa:mls></label>
						<span>${bean.source}</span>
					</div>
					<div class="bgWhite">
						<label for="f_sourceId"><wa:mls>SourceId</wa:mls></label>
						<span>${bean.sourceId}</span> 
					</div>
					</c:if>
					</fieldset>
					<div class="clr"></div>
					<div class="TabbedPanels" id="TabbedPanels1">
						<ul class="TabbedPanelsTabGroup">
							<c:forEach var="clt" items="${culture.allCultures}" varStatus="loop">
								<li class="TabbedPanelsTab">${clt}</li>
							</c:forEach>
						</ul>
						<div class="TabbedPanelsContentGroup">
						<c:forEach var="clt" items="${culture.allCultures}" varStatus="loop">
						<div class="TabbedPanelsContent">
					<c:if test="${bean!=null && bean.source!=null && bean.contentPressClts[clt].sourceTitle!=null}">
					<div class="bgGrey">
						<label for="f_${clt}_sourceTitle"><wa:mls>title </wa:mls> (source)</label>
						<span>${bean.contentPressClts[clt].sourceTitle}</span>
					</div>
					</c:if>		
					<div class="bgGrey" style="height:50px;" id="v_${clt}_title">
						<label for="f_${clt}_title" style="float:left;"><wa:mls>title</wa:mls></label>
						<textarea name="f_${clt}_title" style="float:left;" id="f_${clt}_title" class="textfield textForAll" >${bean.contentPressClts[clt].title}</textarea>
						<div class="textareaRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls> </div>
	            		<script type="text/javascript">
							var v_${clt}_title = new Spry.Widget.ValidationTextarea("v_${clt}_title", {isRequired:true,minChars:1, maxChars:200,validateOn:["blur","change"]});
						</script>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('textForAll','f_${clt}_title')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						
					</div>
					<c:if test="${bean!=null && bean.source!=null && bean.contentPressClts[clt].sourceAbstract!=null}">
					<div class="bgWhite">
						<label for="f_${clt}_sourceAbstract_Not" style="float:left;"><wa:mls>abstract_ (source) - Not editable</wa:mls></label>
						<textarea name="f_${clt}_sourceAbstractNot" id="f_${clt}_sourceAbstractNot" class="textarea2" style="float:left; margin-left:3px;">${bean.contentPressClts[clt].sourceAbstract}</textarea>
						<div class="clr"></div>	
					</div>
					</c:if>
					<input type="checkbox"  class="check_abstract"  /><span class="text_check_block_abstract" style="display:none;"><wa:mls>afficher zone abstract</wa:mls></span><span class="text_check_none_abstract"  style="display:none;"><wa:mls>masquer zone abstract</wa:mls></span>
					<div class="bgWhite abstract">
						<label for="f_${clt}_abstract_" style="float:left;"><wa:mls>abstract_</wa:mls></label>
						<div style="float:left; margin-left:3px; width:95%">
						<textarea name="f_${clt}_abstract_" id="f_${clt}_abstract_" class="textarea2 " style="float:left; margin-left:3px;">${bean.contentPressClts[clt].abstract_}</textarea>
						</div>
						<div class="clr"></div>
					</div>
	
					<c:if test="${bean!=null && bean.source!=null && bean.contentPressClts[clt].sourceBody!=null}">
					<div class="bgGrey">
						<label for="f_${clt}_sourceBodyNot" style="float:left;"><wa:mls>body (source) - Not editable</wa:mls></label>
						<textarea name="f_${clt}_sourceBodyNot" id="f_${clt}_sourceBodyNot" class="textarea2" style="float:left; margin-left:3px;">${bean.contentPressClts[clt].sourceBody}</textarea>
						<div class="clr"></div>	
					</div>
					</c:if> 
					<input type="checkbox"  class="check_body"  /><span class="text_check_block_body" style="display:none;"><wa:mls>afficher zone body</wa:mls></span><span class="text_check_none_body" style="display:none;"><wa:mls>masquer zone body</wa:mls></span>
					<div class="bgGrey body">
						<label for="f_${clt}_body" style="float:left;"><wa:mls>body</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_${clt}_body" id="f_${clt}_body"  class="textarea2" >${bean.contentPressClts[clt].body}</textarea>
						</div>
						<div class="clr"></div>	
					</div>
		
					<c:if test="${bean!=null && bean.source!=null && bean.contentPressClts[clt].sourceInfo!=null}">
					<div class="bgGrey">
						<label for="f_${clt}_sourceInfoNot" style="float:left;"><wa:mls>info (source) - Not editable</wa:mls></label>
						<textarea name="f_${clt}_sourceInfoNot" id="f_${clt}_sourceBodyNot" class="textarea2" style="float:left; margin-left:3px;">${bean.contentPressClts[clt].sourceInfo}</textarea>
						<div class="clr"></div>	
					</div>
					</c:if>
					<input type="checkbox"  class="check_info"  /><span class="text_check_block_info" style="display:none;"><wa:mls>afficher zone info</wa:mls></span><span class="text_check_none_info" style="display:none;"><wa:mls>masquer zone info</wa:mls></span>
					<div class="bgWhite info">
						<label for="f_${clt}_info" style="float:left;"><wa:mls>info</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_${clt}_info" id="f_${clt}_info"  class="textarea2" >${bean.contentPressClts[clt].info}</textarea>
						</div>
						<div class="clr"></div>	
						
					</div>
					<div class="bgGrey" id="v_${clt}_bigImage">
						<label for="f_${clt}_bigImage" style="float:left;" ><wa:mls>bigImage</wa:mls></label>
						<textarea name="f_${clt}_bigImage" id="f_${clt}_bigImage" class="textfield bigImageForAll" style="float:left; margin-left:3px">${bean.contentPressClts[clt].bigImage}</textarea>
						<a href="${context}/${site}/contentImage/contentImageList.do?openerField=f_${clt}_bigImage" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('bigImageForAll','f_${clt}_bigImage')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						<div class="clr"></div>	
	            		<script type="text/javascript">
							var v_${clt}_bigImage = new Spry.Widget.ValidationTextarea("v_${clt}_bigImage", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
						</script>
						
					</div>
					<div class="bgWhite" id="v_${clt}_smallImage">
						<label for="f_${clt}_smallImage" style="float:left;" ><wa:mls>smallImage</wa:mls></label>
						<textarea name="f_${clt}_smallImage" id="f_${clt}_smallImage" class="textfield smallImageForAll" style="float:left; margin-left:3px">${bean.contentPressClts[clt].smallImage}</textarea>
						<a href="${context}/${site}/contentImage/contentImageList.do?openerField=f_${clt}_smallImage" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('smallImageForAll','f_${clt}_smallImage')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						<div class="clr"></div>
						<script type="text/javascript">
							var v_${clt}_smallImage = new Spry.Widget.ValidationTextarea("v_${clt}_smallImage", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
						</script>
					
					</div>
					<div class="bgGrey" id="v_${clt}_url">
						<label for="f_${clt}_url" style="float:left;"><wa:mls>url</wa:mls></label>
						<textarea name="f_${clt}_url"  id="f_${clt}_url" class="textfield urlForAll"  style="float:left; margin-left:3px">${bean.contentPressClts[clt].url}</textarea>
						<a href="${context}/${site}/contentLink/contentLinkList.do?openerField=f_${clt}_url" target="link" class="track_link_btn" title="<wa:mls>Track a link</wa:mls>">&nbsp;</a>
						<a href="#null"  class="image_btn_apply" onclick="applyValueForAll('urlForAll','f_${clt}_url')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
						<div class="clr"></div>
						<script type="text/javascript">
							var v_${clt}_url = new Spry.Widget.ValidationTextarea("v_${clt}_url", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
						</script>
					</div>
					<div class="bgWhite" id="v_${clt}_urlLabel">
						<label for="f_${clt}_urlLabel"><wa:mls>urlLabel</wa:mls></label>
						<textarea name="f_${clt}_urlLabel" class="textfield" >${bean.contentPressClts[clt].urlLabel}</textarea>
						<script type="text/javascript">
							var v_${clt}_urlLabel = new Spry.Widget.ValidationTextarea("v_${clt}_urlLabel", {isRequired:false,maxChars:200,validateOn:["blur","change"]});
						</script>
					</div>
					<%--div class="bgGrey" id="v_${clt}_pressDoc">
						<label for="f_${clt}_pressDoc" style="float:left;" ><wa:mls>pressDoc</wa:mls></label>
						<input name="${clt}_pressDoc" type="file"/>
						<div class="clr"></div>
						<script type="text/javascript">
							var v_${clt}_pressDoc = new Spry.Widget.ValidationTextarea("v_${clt}_pressDoc", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
						</script>
					</div--%>
					<%--div class="bgGrey" id="v_${clt}_pressDocUrl">
						<label for="f_${clt}_pressDocUrl" style="float:left;" ><wa:mls>pressDocUrl</wa:mls></label>
						<span>${bean.contentPressClts[clt].pressDoc}</span> 
						<div class="clr"></div>
					</div--%>
                    
                    <div class="bgGrey" id="v_${clt}_pressDoc">
                        <label for="f_${clt}_pressDoc" style="float:left;" ><wa:mls>pressDoc</wa:mls></label>
                        <textarea name="f_${clt}_pressDoc" id="f_${clt}_pressDoc" class="textfield pressDocForAll" style="float:left; margin-left:3px">${bean.contentPressClts[clt].pressDoc}</textarea>
                        <a href="${context}/${site}/contentImage/contentImageList.do?openerField=f_${clt}_pressDoc" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
                        <a href="#null"  class="image_btn_apply" onclick="applyValueForAll('pressDocForAll','f_${clt}_pressDoc')" title="<wa:mls>Appliquer pour toutes les langues</wa:mls>">&nbsp;</a>
                        <div class="clr"></div>	
                        <script type="text/javascript">
                            var v_${clt}_pressDoc = new Spry.Widget.ValidationTextarea("v_${clt}_pressDoc", {isRequired:false,maxChars:300,validateOn:["blur","change"]});
                        </script>
                        
                    </div>
                            
					<%--div class="bgWhite" id="v_${clt}_pressDocTitle">
						<label for="f_${clt}_pressDocTitle"><wa:mls>pressDocTitle</wa:mls></label>
						<textarea name="f_${clt}_pressDocTitle" class="textfield" >${bean.contentPressClts[clt].pressDocTitle}</textarea>
						<script type="text/javascript">
							var v_${clt}_pressDocTitle = new Spry.Widget.ValidationTextarea("v_${clt}_pressDocTitle", {isRequired:false,maxChars:200,validateOn:["blur","change"]});
						</script>
					</div--%>
					<%--<div class="bgWhite" id="v_${clt}_pressDocDate">
						<label for="f_${clt}_pressDocDate"><wa:mls>pressDocDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_${clt}_pressDocDate" name="f_${clt}_pressDocDate" value="<c:choose><c:when test="${bean.contentPressClts[clt].pressDocDate == null }"><fmt:formatDate pattern="dd/MM/yyyy" value="${dateSys}"/></c:when><c:when test="${bean.contentPressClts[clt].pressDocDate != null }"><fmt:formatDate pattern="dd/MM/yyyy" value="${bean.contentPressClts[clt].pressDocDate}"/></c:when></c:choose>" maxlength="10" />
						<script type="text/javascript">
							var v_${clt}_pressDocDate =PRESS RELEASES new Spry.Widget.ValidationTextarea("v_${clt}_pressDocDate", {isRequired:false,maxChars:200,validateOn:["blur","change"]});
						</script>
					</div>--%>
					<c:if test="${bean!=null && bean.id>0 && duplicate eq null}">		
					<div class="bgGrey">
						<label for="f_${clt}_openCount"><wa:mls>openCount</wa:mls></label>
						<span><c:if test="${bean.contentPressClts[clt].openCount==null}">0</c:if>${bean.contentPressClts[clt].openCount}</span>
					</div>
					<div class="bgWhite">
						<label for="f_${clt}_commentCount"><wa:mls>commentCount</wa:mls></label>
						<span><c:if test="${bean.contentPressClts[clt].commentCount==null}">0</c:if>${bean.contentPressClts[clt].commentCount}</span>
					</div>
					</c:if>
						</div>
						</c:forEach>
					</div>
					<div class="clr"></div>
					<fieldset>	
					<legend><wa:mls>Accessibility information</wa:mls></legend>
					<div class="bgGrey" id="v_fromDate">
						<label for="f_fromDate"><wa:mls>fromDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_fromDate" name="f_fromDate" value="<c:choose><c:when test="${bean.fromDate == null }"><fmt:formatDate pattern="dd/MM/yyyy" value="${dateSys}"/></c:when><c:when test="${bean.fromDate != null }"><fmt:formatDate pattern="dd/MM/yyyy" value="${bean.fromDate}"/></c:when></c:choose>" maxlength="10" />
						<div class="textfieldRequiredMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Ce champ est obligatoire</wa:mls></div>
						<div class="textfieldInvalidFormatMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Valeur invalide  : dd/MM/yyyy</wa:mls></div>
	            		
	            		<script type="text/javascript">
							var v_fromDate = new Spry.Widget.ValidationTextField("v_fromDate","date", {format:"dd/mm/yyyy",isRequired:true,validateOn:["blur","change"]});
						</script>
					</div>
					<div class="bgWhite" id="v_toDate">	
						<label for="f_toDate"><wa:mls>toDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash  no-transparency" id="f_toDate" name="f_toDate" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${bean.toDate}"/>" maxlength="10" />
						<div class="textfieldInvalidFormatMsg"><img src="${context}/static/admin/img/erreur.gif"/><wa:mls>Valeur invalide  : dd/MM/yyyy</wa:mls></div>
						<script type="text/javascript">
							var v_toDate = new Spry.Widget.ValidationTextField("v_toDate","date", {format:"dd/mm/yyyy",isRequired:false,validateOn:["blur","change"]});
						</script>
					</div>
					<div class="bgGrey">
						<label for="f_visible"><wa:mls>visible</wa:mls></label>
						<input type="radio"<c:if test="${bean.visible=='0'}"> checked="checked"</c:if> value="0" name="f_visible"/><wa:mls>visible_0</wa:mls>
						<input type="radio"<c:if test="${bean.visible ==  null || bean.visible=='1'}"> checked="checked"</c:if> value="1" name="f_visible"/><wa:mls>visible_1</wa:mls>
					</div>
					<div class="bgWhite">
						<label for="f_status"><wa:mls>status</wa:mls></label>
						<c:if test="${bean.status=='0'}"><wa:mls>DRAFT</wa:mls></c:if> 
						<c:if test="${bean.status=='1'}"><wa:mls>PUBLISH</wa:mls></c:if>
						<c:if test="${bean.status=='2'}"><wa:mls>ARCHIVED</wa:mls>&nbsp;${bean.versionId}</c:if>
						<c:if test="${bean.status=='3'}"><wa:mls>DELETED</wa:mls></c:if>	
					</div>
					<div class="bgWhite">
						<label for="f_position" style="float:left;"><wa:mls>position</wa:mls></label>
						<input type="text" name="f_position" id="f_position" value="<c:choose><c:when test="${bean.position  eq null}">0</c:when><c:otherwise>${bean.position}</c:otherwise></c:choose>" maxlength="3"  style="float:left; margin-left:3px;width:35px" onkeyup="javascript:wa_validateNum('f_position')"/>
						<a href="javascript:wa_addOne('f_position');" class="more" title="<wa:mls>Add one</wa:mls>">+</a>
						<a href="javascript:wa_removeOne('f_position');" class="minus" title="<wa:mls>Remove one</wa:mls>">-</a>
						<div class="clr"></div>
					</div>
					</fieldset>
					<c:if test="${bean!=null && bean.id>0 && duplicate eq null}">
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
						<div class="clr"></div>
					</c:if>
					<!-- DISPLAY PROPERTIES -->
				<c:choose>
					<c:when test="${bean.id !=0 && duplicate eq null}">
						<c:forEach var="property" items="${listProperties}">
							<div>
								<wa:include URI="admin/dropdown/dropListProperty">
									<wa:param name="propertyName" value="${property.name}" />
									<wa:param name="contentType" value="ContentArticle"/>
									<wa:param name="contentId" value="${bean.id}" />
								</wa:include>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="property" items="${listProperties}">
							<div>
								<wa:include URI="admin/dropdown/dropListProperty">
									<wa:param name="propertyName" value="${property.name}" />
									<wa:param name="contentType" value="ContentArticle"/>
									<wa:param name="contentId" value="${oldId}" />
								</wa:include>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
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
    <c:forEach var="clt" items="${culture.allCultures}" varStatus="loop">
	var oFCKeditor = new FCKeditor('f_${clt}_body','100%','500px');
	oFCKeditor.BasePath = 'fckeditor/';
	oFCKeditor.EditorPath = rootPath;
	oFCKeditor.LocationPath = window.location.href;
	oFCKeditor.ToolbarSet = 'Custom' ;
	oFCKeditor.ReplaceTextarea();
	var oFCKeditor2 = new FCKeditor('f_${clt}_abstract_','100%','500px');
	oFCKeditor2.BasePath = 'fckeditor/';
	oFCKeditor2.EditorPath = rootPath;
	oFCKeditor2.LocationPath = window.location.href;
	oFCKeditor2.ToolbarSet = 'Custom' ;
	oFCKeditor2.ReplaceTextarea();
	var oFCKeditor3 = new FCKeditor('f_${clt}_info','100%','500px');
	oFCKeditor3.BasePath = 'fckeditor/';
	oFCKeditor3.EditorPath = rootPath;
	oFCKeditor3.LocationPath = window.location.href;
	oFCKeditor3.ToolbarSet = 'Custom' ;
	oFCKeditor3.ReplaceTextarea();
	<c:if test="${bean!=null && bean.source!=null && bean.contentPressClts[clt].sourceBody!=null}">
	var oFCKeditor4 = new FCKeditor('f_${clt}_sourceBodyNot','100%','500px');
	oFCKeditor4.BasePath = 'fckeditor/';
	oFCKeditor4.EditorPath = rootPath;
	oFCKeditor4.LocationPath = window.location.href;
	oFCKeditor4.ToolbarSet = 'Import' ;
	oFCKeditor4.ReplaceTextarea();
	</c:if>
	<c:if test="${bean!=null && bean.source!=null && bean.contentPressClts[clt].sourceAbstract!=null}">
	var oFCKeditor5 = new FCKeditor('f_${clt}_sourceAbstractNot','100%','500px');
	oFCKeditor5.BasePath = 'fckeditor/';
	oFCKeditor5.EditorPath = rootPath;
	oFCKeditor5.LocationPath = window.location.href;
	oFCKeditor5.ToolbarSet = 'Import' ;
	oFCKeditor5.ReplaceTextarea(); 
	
	</c:if>
	
	<c:if test="${bean!=null && bean.source!=null && bean.contentPressClts[clt].sourceInfo!=null}">
	var oFCKeditor6 = new FCKeditor('f_${clt}_sourceInfoNot','100%','500px');
	oFCKeditor6.BasePath = 'fckeditor/';
	oFCKeditor6.EditorPath = rootPath;
	oFCKeditor6.LocationPath = window.location.href;
	oFCKeditor6.ToolbarSet = 'Import' ;
	oFCKeditor6.ReplaceTextarea();
	</c:if>

</c:forEach>
}
 
</script>
<script> 
path='${context}/${site}/${module}';
idName='${bean.id}';

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
<script type="text/javascript">
	var TP1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script> 

<!--tool boxes:end-->
