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
<h2><wa:mls>Event Category Alert</wa:mls> &nbsp;-&nbsp;
	<c:if test="${bean==null || bean.eventCategoryAlertId<=0}"><wa:mls>(Add)</wa:mls></c:if>
	<c:if test="${bean!=null && bean.eventCategoryAlertId>0}"><wa:mls>(Edit)</wa:mls></c:if>
</h2>
<div id="list">
	<div id="mask">
		<form action="${context}/${site}/${module}/saveItem.do" method="post" id="detailForm">
			<fieldset>
				<legend>&nbsp;</legend>
					<c:if test="${bean!=null && bean.eventCategoryAlertId>0}">
					<div class="bgGrey">
						<label for="f_eventCategoryAlertId"><wa:mls>EventCategoryAlertId</wa:mls></label>
						<span>${bean.eventCategoryAlertId}</span>
						<input name="id" type="hidden" value="${bean.eventCategoryAlertId}"/>
					</div>
					</c:if>
					<div class="bgWhite">
						<label for="f_name"><wa:mls>Name</wa:mls></label>
						<textarea name="f_name" class="textfield" >${bean.name}</textarea>
					</div>	
					<div class="bgGrey">
						<label for="f_position"><wa:mls>Position</wa:mls></label>
						<textarea name="f_position" class="textfield" >${bean.position}</textarea>
					</div>
			</fieldset>
			<c:if test="${bean!=null && bean.eventCategoryAlertId>0}">
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
idName='${bean.eventCategoryAlertId}';
</script>
<!--tool boxes:end-->
	