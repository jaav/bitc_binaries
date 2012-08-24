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
<h2><wa:mls>ContentMenu</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.contentMenuId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.contentMenuId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
					<input type="hidden" name="f_parent" value="${bean.parent.contentMenuId}" />
					<c:if test="${bean!=null && bean.contentMenuId>0}" >
					<div class="bgGrey">
						<label for="f_id"><wa:mls>contentMenuId</wa:mls></label>
						<span>${bean.contentMenuId}</span>
						<input name="id" type="hidden" value="${bean.contentMenuId}"/>
					</div>
					</c:if>
					<div class="bgWhite">
						<label for="f_culture"><wa:mls>culture</wa:mls> </label>
						<wa:include URI="admin/dropdown/dropListCulture">
								<wa:param name="name" value="f_culture" />
								<wa:param name="choiceMsg" value="Select the culture" />
								<wa:param name="selectedValues" value="${bean.culture}" />
						</wa:include>
					</div>
					<div class="bgGrey">
						<label for="f_title"><wa:mls>title</wa:mls></label>
						<textarea name="f_title" class="textfield" >${bean.title}</textarea>
					</div>
					<c:forEach items="${culture.allLanguages}" var="language">
						<div class="bgGrey">
							<label for="f_dispalyTitle${wa:upperFirst(language)}"><wa:mls>display title ${language}</wa:mls></label>
							<textarea name="f_displayTitle${wa:upperFirst(language)}" class="textfield" >${bean.displayTitles[language]}</textarea>
						</div>
					
					</c:forEach>
					<div class="bgGrey">
						<label for="f_url"  style="float:left;"><wa:mls>url</wa:mls></label>
						<textarea name="f_url" class="textfield"  style="float:left; margin-left:3px">${bean.url}</textarea>
						<a href="${context}/${site}/contentLink/contentLinkList.do?openerField=f_url" target="link" class="track_link_btn" title="<wa:mls>Track a link</wa:mls>">&nbsp;</a>
						<div class="clr"></div>
					</div>
					<div class="bgWhite">
						<label for="f_image" style="float:left;" ><wa:mls>image</wa:mls></label>
						<textarea name="f_image" class="textfield" style="float:left; margin-left:3px">${bean.image}</textarea>
						<a href="${context}/${site}/contentImage/contentImageList.do?openerField=f_image" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<div class="clr"></div>	
					</div>
					<div class="bgGrey">
						<label for="f_author"><wa:mls>Style (class)</wa:mls></label>
						<textarea name="f_author" class="textfield" >${bean.author}</textarea>
					</div>
					</fieldset>
				<div class="clr"></div>
				<fieldset>	
				<legend><wa:mls>Accessibility information</wa:mls></legend>
					<div class="bgWhite">
						<label for="f_fromDate"><wa:mls>fromDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_fromDate" name="f_fromDate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.fromDate}"/>" maxlength="10" />
					</div>
					<div class="bgGrey">	
						<label for="f_toDate"><wa:mls>toDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_toDate" name="f_toDate" value="<fmt:formatDate pattern="dd/MM/yyyy hh:mm" value="${bean.toDate}"/>" maxlength="10" />
					</div>
					
					<div class="bgWhite">
						<label for="f_visible"><wa:mls>visible</wa:mls></label>
						<input type="radio"<c:if test="${bean.visible==null ||!bean.visible}"> checked="checked"</c:if> value="false" name="f_visible"/><wa:mls>no</wa:mls>
						<input type="radio"<c:if test="${bean.visible}"> checked="checked"</c:if> value="true" name="f_visible"/><wa:mls>yes</wa:mls>
					</div>
					<div class="bgGrey">
						<label for="f_status"><wa:mls>status</wa:mls></label>
						<input type="radio"<c:if test="${bean.status==null ||bean.status=='0'}"> checked="checked"</c:if> value="0" name="f_status"/><wa:mls>no activated</wa:mls>
						<input type="radio"<c:if test="${bean.status=='1'}"> checked="checked"</c:if> value="1" name="f_status"/><wa:mls>activated</wa:mls>	
					</div>
					<div class="bgWhite">
						<label for="f_isNav"><wa:mls>isNav</wa:mls></label>
						<input type="radio"<c:if test="${bean.isNav==null || !bean.isNav}"> checked="checked"</c:if> value="0" name="f_isNav"/><wa:mls>no</wa:mls>
						<input type="radio"<c:if test="${bean.isNav}"> checked="checked"</c:if> value="1" name="f_isNav"/><wa:mls>yes</wa:mls>	
					</div>
					<div class="bgGrey">
						<label for="f_isExtenal"><wa:mls>isExtenal</wa:mls></label>
						<input type="radio"<c:if test="${bean.isExtenal==null || !bean.isExtenal}"> checked="checked"</c:if> value="0" name="f_isExtenal"/><wa:mls>no</wa:mls>
						<input type="radio"<c:if test="${bean.isExtenal}"> checked="checked"</c:if> value="1" name="f_isExtenal"/><wa:mls>yes</wa:mls>	
					</div>
				</fieldset>
				<c:if test="${bean == null || bean.contentMenuId<=0}">	
					<input type="hidden" name="f_pos" class="textfield" value="${bean.pos}"/>
				</c:if>
				<c:if test="${bean!=null && bean.contentMenuId>0}">	
				<div class="clr"></div>
				
				<fieldset>
					<legend align="top"><wa:mls>CREATE/UPDATE informations</wa:mls></legend>
					<div  class="bgGrey">
						<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
						<span>${bean.createdOn}</span>
					</div>
					<div class="bgWhite">
						<label for="f_createdBy"><wa:mls>createdBy</wa:mls></label>
						<span>
							<wa:include URI="${site}/acxAdminusers/lookup">
							<wa:param name="login" value="${bean.createdBy}"/>
							</wa:include>
						</span>
					</div>
					<div  class="bgGrey">
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
				<div class="clr" ></div>	
				<fieldset>
					<legend align="top"><wa:mls>TREE informations</wa:mls></legend>
					<div class="bgGrey">
						<label for="f_level"><wa:mls>level</wa:mls></label>
						<span>${bean.level}</span>
						<input type="hidden" name="f_level" class="textfield" value="${bean.level}"/>
					</div>					
					<div class="bgWhite">
						<label for="f_pos"><wa:mls>position</wa:mls></label>
						<span>${bean.pos}</span>
						<input type="hidden" name="f_pos" class="textfield" value="${bean.pos}"/>
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
idName='${bean.contentMenuId}';
</script>
<!--tool boxes:end-->
