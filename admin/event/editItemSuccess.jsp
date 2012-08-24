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
<h2><wa:mls>Event</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.eventId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.eventId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
				<c:if test="${bean!=null && bean.eventId>0}">
					<div class="bgGrey">
						<label for="f_eventId"><wa:mls>eventId</wa:mls></label>
						<span>${bean.eventId}</span>
						<input name="id" type="hidden" value="${bean.eventId}"/>
					</div>
				</c:if>
				<div class="bgWhite">
					<label for="f_group"><wa:mls>group</wa:mls></label>
					<span>${bean.group}</span>
					<input name="f_group" type="hidden" value="${bean.group}"/>
				</div>				
				<div class="bgGrey">
						<label for="f_culture"><wa:mls>Culture</wa:mls></label>
						<wa:include URI="${site}/dropdown/dropListCulture">
							<wa:param name="name" value="f_culture" />
							<wa:param name="choiceMsg" value="Select the culture" />
							<wa:param name="selectedValues" value="${bean.culture}" />
						</wa:include>
					</div>
					<div class="bgWhite">
						<label for="f_eventCategoryByEventCategoryId_eventCategoryId"><wa:mls>Category</wa:mls></label>
						<c:if test="${bean.eventCategoryByEventCategoryId==null || bean.eventCategoryByEventCategoryId.eventCategoryId<=0}">
						<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.wanabe.event.hdata.EventCategory" />
							<wa:param name="manager" value="com.wanabe.event.hdata.manager.EventCategoryManager" />
							<wa:param name="method" value="listNotMain" />
							<wa:param name="identity" value="eventCategoryId" />
							<wa:param name="display" value="name" />
							<wa:param name="name" value="f_eventCategoryByEventCategoryId_eventCategoryId" />
							<wa:param name="selectedValues" value="${bean.eventCategoryByEventCategoryId.eventCategoryId}" />
							<wa:param name="choiceMsg" value="Choose" />
						</wa:include>
						</c:if>
						<c:if test="${bean.eventCategoryByEventCategoryId!=null && bean.eventCategoryByEventCategoryId.eventCategoryId>0}">
							<span>${bean.eventCategoryByEventCategoryId.name}</span>
							<input name="f_eventCategoryByEventCategoryId_eventCategoryId" type="hidden" value="${bean.eventCategoryByEventCategoryId.eventCategoryId}"/>
						</c:if>												
					</div>
					<div class="bgGrey">
						<label for="f_eventCategoryByEventMainCategoryId_eventCategoryId"><wa:mls>Main Category</wa:mls></label>
						<c:if test="${bean.eventCategoryByEventMainCategoryId==null || bean.eventCategoryByEventMainCategoryId.eventCategoryId<=0}">
						<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.wanabe.event.hdata.EventCategory" />
							<wa:param name="manager" value="com.wanabe.event.hdata.manager.EventCategoryManager" />
							<wa:param name="method" value="listMain" />
							<wa:param name="identity" value="eventCategoryId" />
							<wa:param name="display" value="name" />
							<wa:param name="name" value="f_eventCategoryByEventMainCategoryId_eventCategoryId" />
							<wa:param name="selectedValues" value="${bean.eventCategoryByEventMainCategoryId.eventCategoryId}" />
							<wa:param name="choiceMsg" value="Choose" />
						</wa:include>
						</c:if>
						<c:if test="${bean.eventCategoryByEventMainCategoryId!=null && bean.eventCategoryByEventMainCategoryId.eventCategoryId>0}">
							<span>${bean.eventCategoryByEventMainCategoryId.name}</span>
							<input name="f_eventCategoryByEventMainCategoryId_eventCategoryId" type="hidden" value="${bean.eventCategoryByEventMainCategoryId.eventCategoryId}"/>
						</c:if>															
					</div>					
					
																					
					
							
					<div class="bgWhite">
						<label for="f_name"><wa:mls>Name</wa:mls></label>
						<textarea name="f_name" class="textfield" >${bean.name}</textarea>
					</div>
					
					<div class="bgGrey">
						<label for="f_title"><wa:mls>Title</wa:mls></label>
						<textarea name="f_title" class="textfield" >${bean.title}</textarea>
					</div>
					<div class="bgWhite">						
						<label for="f_description" style="float:left;"><wa:mls>Description</wa:mls></label>
						<div  style="float:left; margin-left:3px; width:95%">
							<textarea name="f_description" id="f_description"  class="textarea2" >${bean.description}</textarea>
						</div>	
						<a href="${context}/${site}/contentImage/contentImageList.do" target="image" class="image_btn" title="<wa:mls>Upload an image</wa:mls>">&nbsp;</a>
						<a href="${context}/${site}/contentLink/contentLinkList.do" target="link" class="track_link_btn" title="<wa:mls>Track a link</wa:mls>">&nbsp;</a>
						<div class="clr"></div>						
					</div>
					<div class="bgGrey">
						<label for="f_periodFromDate"><wa:mls>periodFromDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_periodFromDate" name="f_periodFromDate" value="${bean.displayPeriodFromDate}" maxlength="19" />
						<input type="hidden" name="f_periodFromDate_pattern" value="dd/MM/yyyy HH:mm:ss" />
					</div>
					<div class="bgWhite">	
						<label for="f_periodToDate"><wa:mls>periodToDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_periodToDate" name="f_periodToDate" value="${bean.displayPeriodToDate}" maxlength="19" />
						<input type="hidden" name="f_periodToDate_pattern" value="dd/MM/yyyy HH:mm:ss" />
					</div>
					<div class="bgGrey">
						<label for="f_eventType"><wa:mls>eventType</wa:mls></label>
						<select name="f_eventType">
							<option value="">Choose</option>
							<option value="EVENT" <c:if test="${bean.eventType eq 'EVENT'}">selected="selected"</c:if>>EVENT</option>
							<option value="WORKSHOP" <c:if test="${bean.eventType eq 'WORKSHOP'}">selected="selected"</c:if>>WORKSHOP</option>												
						</select>
					</div>
					<div class="bgWhite">
						<label for="f_place"><wa:mls>Place</wa:mls></label>
						<textarea name="f_place" class="textfield" >${bean.place}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_url" style="float:left;"><wa:mls>Url</wa:mls></label>
						<textarea name="f_url" class="textfield" style="float:left; margin-left:3px">${bean.url}</textarea> 
						<a href="/wasyb/admin/contentLink/contentLinkList.do" target="link" class="track_link_btn" title="<wa:mls>Track a link</wa:mls>">&nbsp;</a>
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
						<label for="f_visible"><wa:mls>Visible</wa:mls></label>
						<input type="radio"<c:if test="${bean.visible=='0'}"> checked="checked"</c:if> value="0" name="f_visible"/><wa:mls>visible_0</wa:mls>
						<input type="radio"<c:if test="${bean.visible=='1'}"> checked="checked"</c:if> value="1" name="f_visible"/><wa:mls>visible_1</wa:mls>
					</div>
					<div class="bgGrey">
						<label for="f_status"><wa:mls>Status</wa:mls></label>
						<c:if test="${bean.status=='0'}"><wa:mls>DRAFT</wa:mls></c:if> 
						<c:if test="${bean.status=='1'}"><wa:mls>PUBLISH</wa:mls></c:if>
						<c:if test="${bean.status=='2'}"><wa:mls>ARCHIVED</wa:mls>&nbsp;${bean.versionId}</c:if>
						<c:if test="${bean.status=='3'}"><wa:mls>DELETED</wa:mls></c:if>	
					</div>
			</fieldset>
			<div class="clr"></div>
			<fieldset>	
					<legend><wa:mls>Notification information</wa:mls></legend>
					<div class="bgWhite">
						<label for="f_notification"><wa:mls>Notification</wa:mls></label>
						<input type="radio"<c:if test="${bean.notification=='false'}"> checked="checked"</c:if> value="0" name="f_notification"/><wa:mls>notification_0</wa:mls>
						<input type="radio"<c:if test="${bean.notification=='true'}"> checked="checked"</c:if> value="1" name="f_notification"/><wa:mls>notification_1</wa:mls>
					</div>
					<div class="bgGrey">
						<label for="f_notificationFromDate"><wa:mls>notificationFromDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_notificationFromDate" name="f_notificationFromDate" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bean.notificationFromDate}"/>" maxlength="10" />						
					</div>
					<div class="bgWhite">	
						<label for="f_notificationToDate"><wa:mls>notificationToDate</wa:mls></label>
						<input type="text" class="w8em format-d-m-y divider-slash highlight-days-12 no-transparency" id="f_notificationToDate" name="f_notificationToDate" value="<fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${bean.notificationToDate}"/>" maxlength="10" />						
					</div>
			</fieldset>
				<c:if test="${bean!=null && bean.eventId>0}">
			<div class="clr"></div>
			<fieldset>	
					<legend><wa:mls>Google information</wa:mls></legend>
					<div class="bgGrey">
						<label for="f_eventGoogleCalendar"><wa:mls>eventGoogleCalendar</wa:mls></label>
						<span>${bean.eventGoogleCalendar}</span>
					</div>
					<div class="bgWhite">
						<label for="f_eventMainGoogleCalendar"><wa:mls>eventMainGoogleCalendar</wa:mls></label>
						<span>${bean.eventMainGoogleCalendar}</span>
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
					<c:if test="${bean.eventId !=0}">
						<c:forEach var="property" items="${listProperties}">
							<div>
								<wa:include URI="admin/dropdown/dropListProperty">
									<wa:param name="propertyName" value="${property.name}" />
									<wa:param name="contentType" value="event"/>
									<wa:param name="contentId" value="${bean.eventId}" />
								</wa:include>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${bean.eventId ==0}">
						<c:forEach var="property" items="${listProperties}">
							<div>
								<wa:include URI="admin/dropdown/dropListProperty">
									<wa:param name="propertyName" value="${property.name}" />
									<wa:param name="contentType" value="event"/>
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
	var oFCKeditor = new FCKeditor('f_description','100%','500px');
	oFCKeditor.BasePath = 'fckeditor/';
	oFCKeditor.EditorPath = rootPath;
	oFCKeditor.LocationPath = window.location.href;
	oFCKeditor.ToolbarSet = 'Custom' ;
	oFCKeditor.ReplaceTextarea();
}
</script>
<script>
path='${context}/${site}/${module}';
idName='${bean.eventId}';
</script>
<!--tool boxes:end-->
	