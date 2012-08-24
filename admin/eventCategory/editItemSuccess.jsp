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
<h2><wa:mls>Event Category</wa:mls>&nbsp;-&nbsp;
	<c:if test="${bean==null || bean.eventCategoryId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.eventCategoryId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>

<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
					<c:if test="${bean!=null && bean.eventCategoryId>0}">
					<div class="bgWhite">
						<label for="f_eventCategoryId"><wa:mls>EventCategoryId</wa:mls></label>
						<span>${bean.eventCategoryId}</span>
						<input name="id" type="hidden" value="${bean.eventCategoryId}"/>
					</div>
					</c:if>
					<div class="bgGrey">
						<label for="f_eventCategoryAlert_eventCategoryAlertId"><wa:mls>Category Alert</wa:mls></label>
						<wa:include URI="${site}/dropdown/dropList">
							<wa:param name="class" value="com.wanabe.event.hdata.EventCategoryAlert" />
							<wa:param name="manager" value="com.wanabe.event.hdata.manager.EventCategoryAlertManager" />
							<wa:param name="method" value="listAll" />
							<wa:param name="identity" value="eventCategoryAlertId" />
							<wa:param name="display" value="name" />
							<wa:param name="name" value="f_eventCategoryAlert_eventCategoryAlertId" />
							<wa:param name="selectedValues" value="${bean.eventCategoryAlert.eventCategoryAlertId}" />
							<wa:param name="choiceMsg" value="Choose the alert category" />
						</wa:include>												
					</div>					
					<div class="bgWhite">
						<label for="f_category"><wa:mls>Category</wa:mls></label>
						<textarea name="f_category" class="textfield" >${bean.category}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_publicGoogleCalendar"><wa:mls>PublicGoogleCalendar</wa:mls></label>
						<textarea name="f_publicGoogleCalendar" class="textfield" >${bean.publicGoogleCalendar}</textarea>
					</div>
					<div class="bgWhite">
						<label for="f_login"><wa:mls>Login</wa:mls></label>
						<textarea name="f_login" class="textfield" >${bean.login}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_password"><wa:mls>Password</wa:mls></label>
						<textarea name="f_password" class="textfield" >${bean.password}</textarea>
					</div>											
					<div class="bgWhite">
						<label for="f_name"><wa:mls>Name</wa:mls></label>
						<textarea name="f_name" class="textfield" >${bean.name}</textarea>
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
						<label for="f_picture"><wa:mls>Picture</wa:mls></label>
						<textarea name="f_picture" class="textfield" >${bean.picture}</textarea>
					</div>
					<div class="bgGrey">
						<label for="f_mainCategory"><wa:mls>MainCategory</wa:mls></label>
						<input type="radio"<c:if test="${bean.mainCategory == null || bean.mainCategory=='false'}"> checked="checked"</c:if> value="0" name="f_mainCategory"/><wa:mls>mainCategory_0</wa:mls>
						<input type="radio"<c:if test="${bean.mainCategory=='true'}"> checked="checked"</c:if> value="1" name="f_mainCategory"/><wa:mls>mainCategory_1</wa:mls>
					</div>
				</fieldset>
				<c:if test="${bean!=null && bean.eventCategoryId>0}">
				<div class="clr"></div>
				<fieldset>
				<legend>&nbsp;</legend>
				<div class="bgWhite">
					<label for="f_createdOn"><wa:mls>createdOn</wa:mls></label>
					<span>${bean.createdOn}</span>
				</div>
				<div class="bgGrey">
					<label for="f_createdBy"><wa:mls>createdBy</wa:mls></label>
					<span>
						<wa:include URI="${site}/acxAdminusers/lookup">
						<wa:param name="login" value="${bean.createdBy}"/>
						</wa:include>
					</span>
				</div>
				<div class="bgWhite">
					<label for="f_lastModifiedOn"><wa:mls>lastModifiedOn</wa:mls></label>
					<span>${bean.lastModifiedOn}</span>
				</div>
				<div class="bgGrey">
					<label for="f_lastModifiedBy"><wa:mls>lastModifiedBy</wa:mls></label>
					<span>
						<wa:include URI="${site}/acxAdminusers/lookup">
						<wa:param name="login" value="${bean.lastModifiedBy}"/>
						</wa:include>
					</span>
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
idName='${bean.eventCategoryId}';
</script>
<!--tool boxes:end-->
	